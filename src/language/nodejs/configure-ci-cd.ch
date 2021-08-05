%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: "Configure CI/CD for your application"
keywords: CI/CD, GitHub Actions, NodeJS, local, development
description: Learn how to develop your application locally.
---
@y
---
title: "アプリケーションにおける CI/CD 設定"
keywords: CI/CD, GitHub Actions, NodeJS, local, development
description: Learn how to develop your application locally.
---
@z

@x
{% include_relative nav.html selected="5" %}
@y
{% include_relative nav.html selected="5" %}
@z

@x
This page guides you through the process of setting up a GitHub Action CI/CD pipeline with Docker containers. Before setting up a new pipeline, we recommend that you take a look at [Ben's blog](https://www.docker.com/blog/best-practices-for-using-docker-hub-for-ci-cd/){:target="_blank" rel="noopener" class="_"} on CI/CD best practices .
@y
本ページでは Docker コンテナーを利用した GitHub アクションの CI/CD パイプライン（pipeline）の設定について説明します。
新たなパイプラインを設定する前に、CI/CD のベストプラクティスとして [Ben のブログ](https://www.docker.com/blog/best-practices-for-using-docker-hub-for-ci-cd/){:target="_blank" rel="noopener" class="_"} を読んでおくことをお勧めします。
@z

@x
This guide contains instructions on how to:
@y
本ガイドでは以下の手順を説明します。
@z

@x
1. Use a sample Docker project as an example to configure GitHub Actions
2. Set up the GitHub Actions workflow
3. Optimize your workflow to reduce the number of pull requests and the total build time, and finally,
4. Push only specific versions to Docker Hub.
@y
1. 例としてサンプルの Docker プロジェクトを用いて GitHub アクションの設定を行います。
2. GitHub アクションのワークフローを設定します。
3. ワークフローを最適化してプルリクエスト数と総ビルド時間を減らします。
4. 指定したバージョンのみを Docker Hub にプッシュします。
@z

@x
## Set up a Docker project
@y
{: #set-up-a-docker-project }
## Docker プロジェクトの設定
@z

@x
Let’s get started. This guide uses a simple Docker project as an example. The [SimpleWhaleDemo](https://github.com/usha-mandya/SimpleWhaleDemo){:target="_blank" rel="noopener" class="_"} repository contains an Nginx alpine image. You can either clone this repository, or use your own Docker project.
@y
でははじめていきます。
本ガイドでは例として簡単な Docker プロジェクトを使います。
[SimpleWhaleDemo](https://github.com/usha-mandya/SimpleWhaleDemo){:target="_blank" rel="noopener" class="_"} リポジトリに Nginx の alpine イメージがあります。
このリポジトリをクローンして利用するか、あるいは独自の Docker プロジェクトを利用してください。
@z

@x
![SimpleWhaleDemo](../../ci-cd/images/simplewhaledemo.png){:width="500px"}
@y
![SimpleWhaleDemo](../../ci-cd/images/simplewhaledemo.png){:width="500px"}
@z

@x
Before we start, ensure you can access [Docker Hub](https://hub.docker.com/) from any workflows you create. To do this:
@y
作業を進める前の確認として、生成したワークフローからは必ず [Docker Hub](https://hub.docker.com/) に接続できることを、以下のようにして確認します。
@z

@x
1. Add your Docker ID as a secret to GitHub. Navigate to your GitHub repository and click **Settings** > **Secrets** > **New secret**.
@y
1. Docker ID を Secret として GitHub に追加します。
   自分の GitHub リポジトリにアクセスして **Settings** > **Secrets** > **New secret** をクリックします。
@z

@x
2. Create a new secret with the name `DOCKER_HUB_USERNAME` and your Docker ID as value.
@y
2. `DOCKER_HUB_USERNAME`という名前の Secret を新規生成します。
   そして値には自分の Docker ID を設定します。
@z

@x
3. Create a new Personal Access Token (PAT). To create a new token, go to [Docker Hub Settings](https://hub.docker.com/settings/security) and then click **New Access Token**.
@y
3. 新たにパーソナルアクセストークン（Personal Access Token; PAT）を生成します。
   新たなトークン生成は [Docker Hub Settings](https://hub.docker.com/settings/security) にアクセスして、**New Access Token** をクリックします。
@z

@x
4. Let’s call this token **simplewhaleci**.
@y
4. このトークンを **simplewhaleci**（simple whale ci＝簡単なクジラの CI）と命名することにします。
@z

@x
    ![New access token](../../ci-cd/images/github-access-token.png){:width="500px"}
@y
    ![新規のアクセストークン](../../ci-cd/images/github-access-token.png){:width="500px"}
@z

@x
5. Now, add this Personal Access Token (PAT) as a second secret into the GitHub secrets UI with the name `DOCKER_HUB_ACCESS_TOKEN`.
@y
5. そこでこのパーソナルアクセストークン（PAT）を 2 つめの Secret として GitHub Secrets 画面に追加します。
   名称は`DOCKER_HUB_ACCESS_TOKEN`とします。
@z

@x
    ![GitHub Secrets](../../ci-cd/images/github-secrets.png){:width="500px"}
@y
    ![GitHub Secrets](../../ci-cd/images/github-secrets.png){:width="500px"}
@z

@x
## Set up the GitHub Actions workflow
@y
{: #set-up-the-github-actions-workflow }
## GitHub アクションワークフローの設定
@z

@x
In the previous section, we created a PAT and added it to GitHub to ensure we can access Docker Hub from any workflow. Now, let’s set up our GitHub Actions workflow to build and store our images in Hub. We can achieve this by creating two Docker actions:
@y
前節において PAT を生成し GitHub に追加しました。
こうすることでどのワークフローからでも Docker Hub にアクセスできるようになりました。
そこで GitHub アクションワークフローを設定して、Docker Hub 内においてイメージビルドと保存を行うようにします。
これを実施するために、以下の Docker 操作を行います。
@z

@x
1. The first action enables us to log in to Docker Hub using the secrets we stored in the GitHub Repository.
2. The second one is the build and push action.
@y
1. 1 つめの操作は、Docker Hub に Secret を使ってログインできるようにします。
   その Secret は、上で GitHub リポジトリに保存したものを用います。
2. 2 つめの操作は、ビルドアクションとプッシュアクションです。
@z

@x
In this example, let us set the push flag to `true` as we also want to push. We’ll then add a tag to specify to always go to the latest version. Lastly, we’ll echo the image digest to see what was pushed.
@y
この例ではプッシュも行いたいため、プッシュフラグを`true`に設定します。
そしてタグを追加して、常に最新バージョンへアクセスするように設定します。
またイメージダイジェスト値を表示することで、何がプッシュされたかがわかるようにします。
@z

@x
To set up the workflow:
@y
ワークフローは以下のようにして設定します。
@z

@x
1. Go to your repository in GitHub and then click **Actions** > **New workflow**.
2. Click **set up a workflow yourself** and add the following content:
@y
1. 自分の GitHub リポジトリにアクセスして **Actions** > **New workflow** をクリックします。
2. **set up a workflow yourself**（ワークフローの独自設定）をクリックして、これ以降の手順で進めていきます。
@z

@x
First, we will name this workflow:
@y
まずはこのワークフローを以下のように命名します。
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
そしてこのワークフローをいつ動作させるかを選びます。
本例では、プロジェクトの main ブランチに対してプッシュが行われるたびに動作させるものとします。
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
アクションの中では具体的にどのようなことを実現したいか（何のジョブとするか）を定めることが必要です。
そこでビルドアクションを追加して、利用可能な最新の Ubuntu インスタンス上で実行するようにします。
@z

@x
```yaml
jobs:

  build:
    runs-on: ubuntu-latest
```
@y
```yaml
jobs:

  build:
    runs-on: ubuntu-latest
```
@z

@x
Now, we can add the steps required. The first one checks-out our repository under `$GITHUB_WORKSPACE`, so our workflow can access it. The second is to use our PAT and username to log into Docker Hub. The third is the Builder, the action  uses BuildKit under the hood through a simple Buildx action which we will also setup
@y
必要となる steps を追加することにします。
1 つめは`$GITHUB_WORKSPACE`配下にあるリポジトリからチェックアウトを行うことです。
これによってワークフローからのアクセスが可能になります。
2 つめは Docker Hub にログインする際の PAT とユーザー名を指定することです。
3 つめはビルド処理です。
このアクションでは、Buildx アクションの設定を通じて内部的に BuildKit を利用します。
@z

@x
{% raw %}
```yaml
    steps:
@y
{% raw %}
```yaml
    steps:
@z

@x
      - name: Check Out Repo 
        uses: actions/checkout@v2
@y
      - name: Check Out Repo 
        uses: actions/checkout@v2
@z

@x
      - name: Login to Docker Hub
        uses: docker/login-action@v1
        with:
          username: ${{ secrets.DOCKER_HUB_USERNAME }}
          password: ${{ secrets.DOCKER_HUB_ACCESS_TOKEN }}
@y
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
では一度このワークフローを実行してみます。
その後に Dockerfile を調整して、CI が実行されていること、新たなイメージの変更がプッシュされていることを確認します。
@z

@x
![CI to Docker Hub](../../ci-cd/images/ci-to-hub.png){:width="500px"}
@y
![CI to Docker Hub](../../ci-cd/images/ci-to-hub.png){:width="500px"}
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
次に行うのは、ビルドキャッシュを通じて GitHub アクションワークフローの最適化を行っていきます。
ここには以下の 2 つの利点があります。
@z

@x
1. Build cache reduces the build time as it will not have to re-download all of the images, and
2. It also reduces the number of pulls we complete against Docker Hub. We need to make use of GitHub cache to make use of this.
@y
1. ビルドキャッシュがあるとビルド時間が短縮されます。
   つまりイメージすべてを毎回ダウンロードする必要がなくなります。
2. また Docker Hub に対して行うプルの数を減らすことができます。
   ただしこれを活用するためには GitHub キャッシュを有効にしておく必要があります。
@z

@x
Let us set up a Builder with a build cache. First, we need to set up cache for the builder.  In this example, let us add the path and keys to store this under using GitHub cache for this.
@y
そこでビルドキャッシュを使ったビルダーを設定します。
まずはビルダーに対してキャッシュ設定が必要です。
本例ではパスと鍵を指定して、GitHub キャッシュを用いるものとして保存します。
@z

@x
{% raw %}
```yaml

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
{% raw %}
```yaml
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
そしてビルダーとビルドキャッシュをアクションファイルの冒頭に加えたら、ビルドおよびプッシュの手順に必要な属性を追加します。
それは以下のものです。
@z

@x
Setting up the builder to use the output of the buildx step, and then
Using the cache we set up earlier for it to store to and to retrieve
@y
buildx 処理の出力をビルダーにおいて利用するように設定します。
そして上で設定したキャッシュを用いて、保存と抽出を行うようにします。
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
          tags: ${{ secrets.DOCKER_HUB_USERNAME }}/simplewhale:latest
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
          tags: ${{ secrets.DOCKER_HUB_USERNAME }}/simplewhale:latest
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
そしてワークフローを再度実行して、ビルドキャッシュが利用されていることを確認してください。
@z

@x
## Push tagged versions to Docker Hub
@y
{: #push-tagged-versions-to-docker-hub }
## Docker Hub へのタグつきバージョンのプッシュ
@z

@x
Earlier, we learnt how to set up a GitHub Actions workflow to a  Docker project, how to optimize the workflow by setting up a builder with build cache. Let’s now look at how we can improve it further. We can do this by adding the ability to have tagged versions behave differently to all commits to master. This means, only specific versions are pushed, instead of every commit updating the latest version on Docker Hub.
@y
前節においては Docker プロジェクトに対して GitHub アクションワークフローを設定する方法を見てきました。
そしてビルダーがビルドキャッシュを利用するように設定することで、このワークフローの最適化を行いました。
ここからさらに改善していきます。
具体的にはタグつきバージョンを利用するものであり、これを用いて master へのコミットにおいて異なる処理を実現します。
つまり Docker Hub に対して最新バージョンがコミット対象となるのではなく、特定バージョンだけをプッシュするようにします。
@z

@x
You can consider this approach to have your commits go to a local registry to then use in nightly tests. By doing this, you can always test what is latest while reserving your tagged versions for release to Docker Hub.
@y
この方法を活用して、たとえばコミットがローカルレジストリに向くようにして、毎日のテスト用として利用することが考えられます。
こうしておくと、Docker Hub に対してリリースするタグつきバージョンは温存しつつ、テストを続行していくことができます。
@z

@x
This involves two steps:
@y
これを実現するには以下の 2 つの手順で進めます。
@z

@x
1. Modifying the GitHub workflow to only push commits with specific tags to Docker Hub
2. Setting up a GitHub Actions file to store the latest commit as an image in the GitHub registry
@y
1. GitHub ワークフローを修正して、Docker Hub において特定タグに対するコミットのみをプッシュするようにします。
2. 最新コミットを GitHub レジストリ内のイメージとして保存するように GitHub アクションファイルを設定します。
@z

@x
First, let us modify our existing GitHub workflow to only push to Hub if there’s a particular tag. For example:
@y
まず特定のタグが存在しているものとして、それまでの GitHub ワークフローにおいて Docker Hub へのプッシュだけを行うように修正します。
たとえば以下のようになります。
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
上のようにすると CI コマンドからは`V.n.n.n.`というタグづけを行っているコミットのみが処理されます。
確認してみましょう。
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
![Push tagged version](../../ci-cd/images/push-tagged-version.png){:width="500px"}
@y
![タグづきバージョンのプッシュ](../../ci-cd/images/push-tagged-version.png){:width="500px"}
@z

@x
Now, let’s set up a second GitHub action file to store our latest commit as an image in the GitHub registry. You may want to do this to:
@y
では次に 2 つめの GitHub アクションファイルを設定します。
これは最新コミットを、 GitHub レジストリ内のイメージとして保存するようにします。
こういった状況を利用したくなるのは、以下のような状況です。
@z

@x
1. Run your nightly tests or recurring tests, or
2. To share work in progress images with colleagues.
@y
1. 日々のテストあるいは定期的なテストを実行する場合。
2. 開発者間で開発途上イメージを共有する場合。
@z

@x
Let’s clone our previous GitHub action and add back in our previous logic for all pushes. This will mean we have two workflow files, our previous one and our new one we will now work on.
Next, change your Docker Hub login to a GitHub container registry login:
@y
では 1 つめの GitHub アクションをコピーして、すべてのプッシュに対するロジックを追加し直します。
ここでワークフローファイルが 2 つになりました。
それまでのワークフローと、今から設定していく新しいワークフローです。
そこで今回は Docker Hub ログインを変更して、GitHub コンテナーレジストリログインとします。
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
イメージへのタグづけを変更することを忘れないでください。
以下の例においては「latest」のまま、これを唯一のタグとします。
必要に応じてタグ追加を行ってください。
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
![Update tagged images](../../ci-cd/images/ghcr-logic.png){:width="500px"}
@y
![タグつきイメージの更新](../../ci-cd/images/ghcr-logic.png){:width="500px"}
@z

@x
Now, we will have two different flows: one for our changes to master, and one for our pull requests. Next, we need to modify what we had before to ensure we are pushing our PRs to the GitHub registry rather than to Docker Hub.
@y
ここまでに 2 つの異なるフローを作り出しました。
1 つは master への変更用、もう 1 つはプルリクエスト用です。
次はこれまで生成してきたフローを変更して、プルリクエストのプッシュ先を Docker Hub ではなく GitHub レジストリにすることが必要です。
@z

@x
## Next steps
@y
{: #next-steps }
## 次のステップ
@z

@x
In this module, you have learnt how to set up GitHub Actions workflow to an existing Docker project, optimize your workflow to improve build times and reduce the number of pull requests, and finally, we learnt how to push only specific versions to Docker Hub. You can also set up nightly tests against the latest tag, test each PR, or do something more elegant with the tags we are using and make use of the Git tag for the same tag in our image.
@y
本節では、既存の Docker プロジェクトに対しての GitHub アクションワークフローの設定方法を学びました。
次にワークフローを最適化して、ビルド時間の改善とプルリクエスト数の削減を行いました。
そして特定のバージョンのみを Docker Hub にプッシュするようにしました。
これにより最新タグに対しての日々のテストを設定したり、各 PR を確認したりすることができます。
あるいはそのタグを利用して、何かの手順に活用することもできます。
イメージ内のタグを Git のタグとして利用することもできます。
@z

@x
You can also consider deploying your application. For detailed instructions, see:
@y
そこでこのアプリケーションをデプロイすることにしましょう。
詳しい手順は以下です。
@z

@x
[Deploy your app](/deploy.md){: .button .primary-btn}
@y
[アプリのデプロイ](/deploy.md){: .button .primary-btn}
@z

@x
## Feedback
@y
{: #feedback } 
## フィードバック
@z

@x
Help us improve this topic by providing your feedback. Let us know what you think by creating an issue in the [Docker Docs ](https://github.com/docker/docker.github.io/issues/new?title=[Node.js%20docs%20feedback]){:target="_blank" rel="noopener" class="_"} GitHub repository. Alternatively, [create a PR](https://github.com/docker/docker.github.io/pulls){:target="_blank" rel="noopener" class="_"} to suggest updates.
@y
本トピック改善のためにフィードバックをお寄せください。
お気づきの点があれば [Docker Docs](https://github.com/docker/docker.github.io/issues/new?title=[Node.js%20docs%20feedback]){:target="_blank" rel="noopener" class="_"} の GitHub リポジトリに issue をあげてください。
あるいは [PR の生成](https://github.com/docker/docker.github.io/pulls){:target="_blank" rel="noopener" class="_"} により変更の提案を行ってください。
@z

@x
<br />
@y
<br />
@z
