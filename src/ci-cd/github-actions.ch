%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Configure GitHub Actions
keywords: CI/CD, GitHub Actions,
title: Configure GitHub Actions
---
@y
---
description: GitHub Actions の設定。
keywords: CI/CD, GitHub Actions,
title: GitHub アクションの設定
---
@z

@x
This page guides you through the process of setting up a GitHub Action CI/CD pipeline with Docker containers. Before setting up a new pipeline, we recommend that you take a look at [Ben's blog](https://www.docker.com/blog/best-practices-for-using-docker-hub-for-ci-cd/){:target="_blank" rel="noopener" class="_"} on CI/CD best practices .
@y
本ページでは Docker コンテナーにおいて CI/CD と連携させるための GitHub アクションの設定手順を示します。
新たな連携を設定するにあたっては、CI/CD のベストプラクティスとして [Ben のブログ](https://www.docker.com/blog/best-practices-for-using-docker-hub-for-ci-cd/){:target="_blank" rel="noopener" class="_"} を一読してください。
@z

@x
This guide contains instructions on how to:
@y
ここに説明する手順は以下のものです。
@z

@x
1. Use a sample Docker project as an example to configure GitHub Actions
2. Set up the GitHub Actions workflow
3. Optimize your workflow to reduce the number of pull requests and the total build time, and finally,
4. Push only specific versions to Docker Hub.
@y
1. GitHub アクションを設定する Docker プロジェクトを例として用います。
2. GitHub アクションのワークフローを設定します。
3. ワークフローの最適化を行って、プルリクエスト数と総ビルド時間を軽減します。
4. 特定バージョンのみを Docker Hub にプッシュします。
@z

@x
## Set up a Docker project
@y
{: #set-up-a-docker-project }
## Docker プロジェクトの設定
@z

@x
Let’s get started. This guide uses a simple Docker project as an example. The [SimpleWhaleDemo](https://github.com/usha-mandya/SimpleWhaleDemo){:target="_blank" rel="noopener" class="_"} repository contains an Ngnix alpine image. You can either clone this repository, or use your own Docker project.
@y
ここからはじめていきます。
本ガイドでは、例となる簡単な Docker プロジェクトを利用します。
リポジトリ [SimpleWhaleDemo](https://github.com/usha-mandya/SimpleWhaleDemo){:target="_blank" rel="noopener" class="_"} に Nginx alpine イメージがあります。
このリポジトリをクローンして利用するか、あるいは独自の Docker プロジェクトを用意して利用してください。
@z

@x
![SimpleWhaleDemo](images/simplewhaledemo.png){:width="500px"}
@y
![SimpleWhaleDemo](images/simplewhaledemo.png){:width="500px"}
@z

@x
Before we start, ensure you can access [Docker Hub](https://hub.docker.com/) from any workflows you create. To do this:
@y
はじめるにあたっては、生成するどのワークフローからも [Docker Hub](https://hub.docker.com/) にアクセスできることが必要です。
これを実現するには以下を行います。
@z

@x
1. Add your Docker ID as a secret to GitHub. Navigate to your GitHub repository and click **Settings** > **Secrets** > **New secret**.
@y
1. Docker ID を GitHub の secret 情報として追加します。
   GitHub リポジトリにアクセスして **Settings** > **Secrets** > **New secret** をクリックします。
@z

@x
2. Create a new secret with the name `DOCKER_HUB_USERNAME` and your Docker ID as value.
@y
2. 新たな secret を生成します。
   名前を`DOCKER_HUB_USERNAME`とし、その値を Docker ID とします。
@z

@x
3. Create a new Personal Access Token (PAT). To create a new token, go to [Docker Hub Settings](https://hub.docker.com/settings/security) and then click **New Access Token**.
@y
3. 新規に個人用アクセストークン（Personal Access Token; PAT）を生成します。
   新規トークンの生成は [Docker Hub Settings](https://hub.docker.com/settings/security) にアクセスして **New Access Token** をクリックします。
@z

@x
4. Let’s call this token **simplewhaleci**.
@y
4. このトークンを **simplewhaleci** （simple whale ci; 単純なクジラの CI） と命名することにします。
@z

@x
    ![New access token](images/github-access-token.png){:width="500px"}
@y
    ![新たなアクセストークン](images/github-access-token.png){:width="500px"}
@z

@x
5. Now, add this Personal Access Token (PAT) as a second secret into the GitHub secrets UI with the name `DOCKER_HUB_ACCESS_TOKEN`.
@y
5. そしてこの個人用アクセストークン（PAT）を GitHub の 2 つめの secret として追加します。
   名前を`DOCKER_HUB_ACCESS_TOKEN`とします。
@z

@x
    ![GitHub Secrets](images/github-secrets.png){:width="500px"}
@y
    ![GitHub Secrets](images/github-secrets.png){:width="500px"}
@z

@x
## Set up the GitHub Actions workflow
@y
{: #set-up-the-gitHub-actions-workflow }
## GitHub アクションワークフローの設定
@z

@x
In the previous section, we created a PAT and added it to GitHub to ensure we can access Docker Hub from any workflow. Now, let’s set up our GitHub Actions workflow to build and store our images in Hub. We can achieve this by creating two Docker actions:
@y
前節において PAT を生成し GitHub に追加しました。
これによってどのワークフローからでも Docker Hub にアクセスできるようになりました。
そこで GitHub アクションワークフローを設定して、GitHub 上のイメージのビルドと保存を行ってみます。
これを行うには以下の 2 つの Docker アクションを生成します。
@z

@x
1. The first action enables us to log in to Docker Hub using the secrets we stored in the GitHub Repository.
2. The second one is the build and push action.
@y
1. 1 つめのアクションは、GitHub リポジトリに保存した secret を利用して Docker Hub へのログインを行います。
2. 2 つめのアクションはビルドとプッシュを行います。
@z

@x
In this example, let us set the push flag to `true` as we also want to push. We’ll then add a tag to specify to always go to the latest version. Lastly, we’ll echo the image digest to see what was pushed.
@y
この例においては push フラグを`true`に設定し、プッシュができるようにします。
さらにタグを 1 つ追加して、常に最新版にアクセスするようにします。
そして最後にイメージダイジェストを echo して、何がプッシュされたかを確認します。
@z

@x
To set up the workflow:
@y
ワークフローの設定は以下のように行います。
@z

@x
1. Go to your repository in GitHub and then click **Actions** > **New workflow**.
2. Click **set up a workflow yourself** and add the following content:
@y
1. GitHub 上のリポジトリにアクセスします。
   そして **Actions** > **New workflow** をクリックします。
2. **set up a workflow yourself** をクリックし、以下に示す内容を追加します。
@z

@x
First, we will name this workflow:
@y
まずはワークフローに名前をつけます。
@z

@x
```yaml
name: CI to Docker Hub
 ```
@y
```yaml
name: CI to Docker Hub
 ```
@z

@x
Then, we will choose when we run this workflow. In our example, we are going to do it for every push against the main branch of our project:
@y
そしてこのワークフローをいつ実行するかを決めます。
この例では、プロジェクトの main ブランチへのプッシュが行われるたびに実行されるものとします。
@z

@x
```yaml
on:
  push:
    branches: [ main ]
```
@y
```yaml
on:
  push:
    branches: [ main ]
```
@z

@x
Now, we need to specify what we actually want to happen within our action (what jobs), we are going to add our build one and select that it runs on the latest Ubuntu instances available:
@y
次にこのアクション内において、どのようなことを行いたいか（どんなジョブ（jobs）とするか）を指定します。
ここではビルド処理を指定し、入手可能な最新の Ubuntu インスタンス上で実行するようにします。
@z

@x
```yaml
jobs:
@y
```yaml
jobs:
@z

@x
  build:
    runs-on: ubuntu-latest
```
@y
  build:
    runs-on: ubuntu-latest
```
@z

@x
Now, we can add the steps required. The first one checks-out our repository under $GITHUB_WORKSPACE, so our workflow can access it. The second is to use our PAT and username to log into Docker Hub. The third is the Builder, the action  uses BuildKit under the hood through a simple Buildx action which we will also setup
@y
そして必要となる手順を追加します。
まず $GITHUB_WORKSPACE にあるリポジトリをチェックアウトして、ワークフローからアクセスできるようにします。
2 つめとして、PAT とユーザー名を使って Docker Hub にログインします。
3 つめはビルダーです。
このアクションは BuildKit を利用するものであり、さらに設定する単純な Buildx アクションを実行します。
@z

@x
{% raw %}
```yaml
    steps:
    
      - name: Check Out Repo 
        uses: actions/checkout@v2

      - name: Login to Docker Hub
        uses: docker/login-action@v1
        with:
          username: ${{ secrets.DOCKER_HUB_USERNAME }}
          password: ${{ secrets.DOCKER_HUB_ACCESS_TOKEN }}
@y
{% raw %}
```yaml
    steps:
    
      - name: Check Out Repo 
        uses: actions/checkout@v2

      - name: Login to Docker Hub
        uses: docker/login-action@v1
        with:
          username: ${{ secrets.DOCKER_HUB_USERNAME }}
          password: ${{ secrets.DOCKER_HUB_ACCESS_TOKEN }}
@z

@x
      - name: Set up Docker Buildx
        id: buildx
        uses: docker/setup-buildx-action@v1
@y
      - name: Set up Docker Buildx
        id: buildx
        uses: docker/setup-buildx-action@v1
@z

@x
      - name: Build and push
        id: docker_build
        uses: docker/build-push-action@v2
        with:
          context: ./
          file: ./Dockerfile
          push: true
          tags: ${{ secrets.DOCKER_HUB_USERNAME }}/simplewhale:latest
@y
      - name: Build and push
        id: docker_build
        uses: docker/build-push-action@v2
        with:
          context: ./
          file: ./Dockerfile
          push: true
          tags: ${{ secrets.DOCKER_HUB_USERNAME }}/simplewhale:latest
@z

@x
      - name: Image digest
        run: echo ${{ steps.docker_build.outputs.digest }}
```
{% endraw %}
@y
      - name: Image digest
        run: echo ${{ steps.docker_build.outputs.digest }}
```
{% endraw %}
@z

@x
Now, let the workflow run for the first time and then tweak the Dockerfile to make sure the CI is running and pushing the new image changes:
@y
ではとりあえずワークフローを動かしてみましょう。
その後に Dockerfile を調整していきます。
CI が実行され、イメージに対する新たな変更がプッシュされるようにします。
@z

@x
![CI to Docker Hub](images/ci-to-hub.png){:width="500px"}
@y
![CI から Docker Hub へ](images/ci-to-hub.png){:width="500px"}
@z

@x
## Optimizing the workflow
@y
{: #optimizing-the-workflow }
## ワークフローの最適化
@z

@x
Next, let’s look at how we can optimize the GitHub Actions workflow through build cache. This has two main advantages:
@y
ここからは、ビルドキャッシュを利用して GitHub アクションワークフローを最適化する方法について見ていきます。
最適化には主に 2 つの利点があります。
@z

@x
1. Build cache reduces the build time as it will not have to re-download all of the images, and
2. It also reduces the number of pulls we complete against Docker Hub. We need to make use of GitHub cache to make use of this.
@y
1. ビルドキャッシュはビルド時間を減らすためのものです。
   イメージのダウンロードをすべて行わなくても済みます。
2. また Docker Hub に対して実施するプル数を減らします。
   これを利用するためには GitHub キャッシュの利用を必要とします。
@z

@x
Let us set up a Builder with a build cache. First, we need to set up cache for the builder.  In this example, let us add the path and keys to store this under using GitHub cache for this.
@y
そこでビルドキャッシュを用いる Builder の設定を行います。
まずビルダーに対するキャッシュを設定します。
本例においては、GitHub キャッシュを利用して、パスや鍵の保存先として追加することにします。
@z

@x
{% raw %}
```yaml
@y
{% raw %}
```yaml
@z

@x
      - name: Cache Docker layers
        uses: actions/cache@v2
        with:
          path: /tmp/.buildx-cache
          key: ${{ runner.os }}-buildx-${{ github.sha }}
          restore-keys: |
            ${{ runner.os }}-buildx-
```
{% endraw %}
@y
      - name: Cache Docker layers
        uses: actions/cache@v2
        with:
          path: /tmp/.buildx-cache
          key: ${{ runner.os }}-buildx-${{ github.sha }}
          restore-keys: |
            ${{ runner.os }}-buildx-
```
{% endraw %}
@z

@x
And lastly, after adding the builder and build cache snippets to the top of the Actions file, we need to add some extra attributes to the build and push step. This involves:
@y
ビルダーとビルドキャッシュの記述をアクションファイルの上位に加えたら、ビルドとプッシュの処理ステップにおいて必要となる属性をさらに追加していきます。
@z

@x
Setting up the builder to use the output of the buildx step, and then
Using the cache we set up earlier for it to store to and to retrieve
@y
buildx の処理ステップの出力をビルダーで利用する設定を行います。
そして上で設定したビルダー用のキャッシュを利用した保存とデータ抽出を行います。
@z

@x
{% raw %}
```yaml
      - name: Login to Docker Hub
        uses: docker/login-action@v1
        with:
          username: ${{ secrets.DOCKER_HUB_USERNAME }}
          password: ${{ secrets.DOCKER_HUB_ACCESS_TOKEN }}
      - name: Build and push
        id: docker_build
        uses: docker/build-push-action@v2
        with:
          context: ./
          file: ./Dockerfile
          builder: ${{ steps.buildx.outputs.name }}
          push: true
          tags:  ${{ secrets.DOCKER_HUB_USERNAME }}/simplewhale:latest
          cache-from: type=local,src=/tmp/.buildx-cache
          cache-to: type=local,dest=/tmp/.buildx-cache
      - name: Image digest
        run: echo ${{ steps.docker_build.outputs.digest }}
```
{% endraw %}
@y
{% raw %}
```yaml
      - name: Login to Docker Hub
        uses: docker/login-action@v1
        with:
          username: ${{ secrets.DOCKER_HUB_USERNAME }}
          password: ${{ secrets.DOCKER_HUB_ACCESS_TOKEN }}
      - name: Build and push
        id: docker_build
        uses: docker/build-push-action@v2
        with:
          context: ./
          file: ./Dockerfile
          builder: ${{ steps.buildx.outputs.name }}
          push: true
          tags:  ${{ secrets.DOCKER_HUB_USERNAME }}/simplewhale:latest
          cache-from: type=local,src=/tmp/.buildx-cache
          cache-to: type=local,dest=/tmp/.buildx-cache
      - name: Image digest
        run: echo ${{ steps.docker_build.outputs.digest }}
```
{% endraw %}
@z

@x
Now, run the workflow again and verify that it uses the build cache.
@y
そこで再びワークフローを実行して、ビルドキャッシュが利用されていることを確認します。
@z

@x
## Push tagged versions to Docker Hub
@y
{: #push-tagged-versions-to-docker-hub }
## タグづけしたバージョンのプッシュ
@z

@x
Earlier, we learnt how to set up a GitHub Actions workflow to a  Docker project, how to optimize the workflow by setting up a builder with build cache. Let’s now look at how we can improve it further. We can do this by adding the ability to have tagged versions behave differently to all commits to master. This means, only specific versions are pushed, instead of every commit updating the latest version on Docker Hub.
@y
ここまで Docker プロジェクトに対して GitHub アクションワークフローの設定方法と、そのワークフローの最適化を行うためにビルドキャッシュを利用したビルダーの設定方法を見てきました。
そこでここからは、それをさらに改善していく方法を見ていきます。
この改善というのはタグづけされたバージョンを利用するものであり、master へのコミットに対して異なる動作となる機能を追加することで実現します。
つまり Docker Hub 上において全コミットが最新版を更新するのではなく、特定バージョンのみをプッシュするようにします。
@z

@x
You can consider this approach to have your commits go to a local registry to then use in nightly tests. By doing this, you can always test what is latest while reserving your tagged versions for release to Docker Hub.
@y
この方法を使えば、コミット先をローカルレジストリとして、最新版のテストに利用することができます。
こうすることで、リリース向けとするタグつきバージョンを保持しつつ、常に最新版をテストしていくことができます。
@z

@x
This involves two steps:
@y
その際には以下の 2 つの手順を行います。
@z

@x
1. Modifying the GitHub workflow to only push commits with specific tags to Docker Hub
2. Setting up a GitHub Actions file to store the latest commit as an image in the GitHub registry
@y
1. GitHub ワークフローを修正して、Docker Hub の特定タグに対するコミットのみをプッシュするようにします。
2. GitHub アクションファイルを設定します。
   最新のコミットを GitHub レジストリ内のイメージとして保存します。
@z

@x
First, let us modify our existing GitHub workflow to only push to Hub if there’s a particular tag. For example:
@y
まず既存の GitHub ワークフローを修正して、特定のタグがある場合にのみ Docker Hub へのプッシュを行うようにします。
たとえば以下のとおりです。
@z

@x
{% raw %}
```yaml
on:
  push:
    tags:
      - "v*.*.*"
```
{% endraw %}
@y
{% raw %}
```yaml
on:
  push:
    tags:
      - "v*.*.*"
```
{% endraw %}
@z

@x
This ensures that the main CI will only trigger if we tag our commits with `V.n.n.n.` Let’s test this. For example, run the following command:
@y
これにより、コミットに`Vn.n.n`というタグをつけた場合にのみ、主要な CI が起動されるようになります。
テストしてみます。
たとえば以下のようなコマンドを実行します。
@z

@x
```bash
git tag -a v1.0.2
git push origin v1.0.2
```
@y
```bash
git tag -a v1.0.2
git push origin v1.0.2
```
@z

@x
Now, go to GitHub and check your Actions
@y
GitHub にアクセスしてアクションを確認します。
@z

@x
![Push tagged version](images/push-tagged-version.png){:width="500px"}
@y
![タグづけバージョンのプッシュ](images/push-tagged-version.png){:width="500px"}
@z

@x
Now, let’s set up a second GitHub action file to store our latest commit as an image in the GitHub registry. You may want to do this to:
@y
次に 2 つめの GitHub アクションファイルを生成し、最新のコミットを GitHub レポジトリ内にイメージとして保存するようにします。
これはたとえば以下のような場合に利用できます。
@z

@x
1. Run your nightly tests or recurring tests, or
2. To share work in progress images with colleagues.
@y
1. 最新版のテストを実施したり、定期的なテストを実施したりする場合。
2. 開発者間において作業中のイメージを共有したい場合。
@z

@x
Let’s clone our previous GitHub action and add back in our previous logic for all pushes. This will mean we have two workflow files, our previous one and our new one we will now work on.
Next, change your Docker Hub login to a GitHub container registry login:
@y
そこで上の GitHub アクションをクローンして、すべてのプッシュに関する前回のロジックを再度追加します。
つまりここで 2 つのワークフローファイルを作り出し、前回のものと今回のものがともに動くということです。
そして Docker Hub ログインは GitHub コンテナーのレジストリログインに切り替えます。
@z

@x
{% raw %}
```yaml
        if: github.event_name != 'pull_request'
        uses: docker/login-action@v1
        with:
          registry: ghcr.io
          username: ${{ github.repository_owner }}
          password: ${{ secrets.GHCR_TOKEN }}
```
{% endraw %}
@y
{% raw %}
```yaml
        if: github.event_name != 'pull_request'
        uses: docker/login-action@v1
        with:
          registry: ghcr.io
          username: ${{ github.repository_owner }}
          password: ${{ secrets.GHCR_TOKEN }}
```
{% endraw %}
@z

@x
Remember to change how the image is tagged. The following example keeps ‘latest’ as the only tag. However, you can add any logic to this if you prefer:
@y
タグづけしたイメージをどのように変更するかをよく見ておいてください。
以下の例では‘latest’というタグだけを引き継いでいます。
ここに加えるロジックは必要に応じて書き換えてください。
@z

@x
{% raw %}
```yaml
  tags: ghcr.io/${{ github.repository_owner }}/simplewhale:latest
```
{% endraw %}
@y
{% raw %}
```yaml
  tags: ghcr.io/${{ github.repository_owner }}/simplewhale:latest
```
{% endraw %}
@z

@x
![Update tagged images](images/ghcr-logic.png){:width="500px"}
@y
![タグづけイメージの更新](images/ghcr-logic.png){:width="500px"}
@z

@x
Now, we will have two different flows: one for our changes to master, and one for our pull requests. Next, we need to modify what we had before to ensure we are pushing our PRs to the GitHub registry rather than to Docker Hub.
@y
このように 2 つのフローを作ってみました。
1 つは master へ変更を適用するものであり、もう 1 つはプルリクエストに対応するものです。
次に必要になってくるのは、これを修正して、Docker Hub に向けてではなく GitHub リポジトリに対して PR をプッシュすることでしょう。
@z

@x
## Conclusion
@y
{: #conclusion }
## まとめ
@z

@x
In this guide, you have learnt how to set up GitHub Actions workflow to an existing Docker project, optimize your workflow to improve build times and reduce the number of pull requests, and finally, we learnt how to push only specific versions to Docker Hub.
@y
本ガイドを通じて、Docker プロジェクトに対する GitHub アクションワークフローの設定方法を説明しました。
またそのワークフローを最適化して、ビルド時間とプルリクエスト数の削減を行いました。
そして Docker Hub に対して特定バージョンのみをプッシュする方法を実現しました。
@z

@x
## Next steps
@y
{: #next-steps }
## 次のステップ
@z

@x
You can now consider setting up nightly tests against the latest tag, test each PR, or do something more elegant with the tags we are using and make use of the Git tag for the same tag in our image.
@y
次に設定してみる内容としては、最新タグに対する最新テストの設定、各 PR の確認などがあります。
また利用しているタグを賢く利用する方法や、Git 上のタグをイメージ内のタグとして活用する方法などもあります。
@z

@x
To look at how you can do one of these, or to get a full example on how to set up what we have accomplished today, check out [Chad’s repo](https://github.com/metcalfc/docker-action-examples){:target="_blank" rel="noopener" class="_"} which runs you through this and more details on our latest GitHub action.
@y
上に示したような作業を実現するために、あるいはここで実現してきた内容の完全な例を確認するために、[Chad のリポジトリ](https://github.com/metcalfc/docker-action-examples){:target="_blank" rel="noopener" class="_"} の説明を参照してください。
さらに最新の GitHub アクションに関しての詳細も説明しています。
@z
