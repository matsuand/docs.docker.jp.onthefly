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
This page guides you through the process of setting up a GitHub Action CI/CD
pipeline with Docker. Before setting up a new pipeline, we recommend that you
take that you take a look at [Ben's blog](https://www.docker.com/blog/best-practices-for-using-docker-hub-for-ci-cd/){:target="_blank" rel="noopener" class="_"}
on CI/CD best practices.
@y
本ページでは Docker において CI/CD と連携させるための GitHub アクションの設定手順を示します。
新たな連携を設定するにあたっては、CI/CD のベストプラクティスとして [Ben のブログ](https://www.docker.com/blog/best-practices-for-using-docker-hub-for-ci-cd/){:target="_blank" rel="noopener" class="_"} を一読してください。
@z

@x
This guide contains instructions on how to:
@y
ここに説明する手順は以下のものです。
@z

@x
1. Use a sample Docker project as an example to configure GitHub Actions.
2. Set up the GitHub Actions workflow.
3. Optimize your workflow to reduce build time.
4. Push only specific versions to Docker Hub.
@y
1. GitHub アクションを設定する Docker プロジェクトを例として用います。
2. GitHub アクションのワークフローを設定します。
3. ワークフローの最適化を行って、ビルド時間を軽減します。
4. 特定バージョンのみを Docker Hub にプッシュします。
@z

@x
## Set up a Docker project
@y
{: #set-up-a-docker-project }
## Docker プロジェクトの設定
@z

@x
Let's get started. This guide uses a simple Docker project as an example. The
[SimpleWhaleDemo](https://github.com/usha-mandya/SimpleWhaleDemo){:target="_blank" rel="noopener" class="_"}
repository contains a Nginx alpine image. You can either clone this repository,
or use your own Docker project.
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
Before we start, ensure you can access [Docker Hub](https://hub.docker.com/)
from any workflows you create. To do this:
@y
はじめるにあたっては、生成するどのワークフローからも [Docker Hub](https://hub.docker.com/) にアクセスできることが必要です。
これを実現するには以下を行います。
@z

@x
1. Add your Docker ID as a secret to GitHub. Navigate to your GitHub repository
and click **Settings** > **Secrets** > **New secret**.
@y
1. Docker ID を GitHub の secret 情報として追加します。
   GitHub リポジトリにアクセスして **Settings** > **Secrets** > **New secret** をクリックします。
@z

@x
2. Create a new secret with the name `DOCKER_HUB_USERNAME` and your Docker ID
as value.
@y
2. 新たな secret を生成します。
   名前を`DOCKER_HUB_USERNAME`とし、その値を Docker ID とします。
@z

@x
3. Create a new Personal Access Token (PAT). To create a new token, go to
[Docker Hub Settings](https://hub.docker.com/settings/security) and then click
**New Access Token**.
@y
3. 新規に個人用アクセストークン（Personal Access Token; PAT）を生成します。
   新規トークンの生成は [Docker Hub Settings](https://hub.docker.com/settings/security) にアクセスして **New Access Token** をクリックします。
@z

@x
4. Let's call this token **simplewhaleci**.
@y
4. このトークンを **simplewhaleci** （simple whale ci; 単純なクジラの CI） と命名することにします。
@z

@x
    ![New access token](images/github-access-token.png){:width="500px"}
@y
    ![新たなアクセストークン](images/github-access-token.png){:width="500px"}
@z

@x
5. Now, add this Personal Access Token (PAT) as a second secret into the GitHub
secrets UI with the name `DOCKER_HUB_ACCESS_TOKEN`.
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
In the previous section, we created a PAT and added it to GitHub to ensure we
can access Docker Hub from any workflow. Now, let's set up our GitHub Actions
workflow to build and store our images in Hub.
@y
前節において PAT を生成し GitHub に追加しました。
これによってどのワークフローからでも Docker Hub にアクセスできるようになりました。
そこで GitHub アクションワークフローを設定して、GitHub 上のイメージのビルドと保存を行ってみます。
@z

@x
In this example, let us set the push flag to `true` as we also want to push.
We'll then add a tag to specify to always go to the latest version. Lastly,
we'll echo the image digest to see what was pushed.
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
{% raw %}
```yaml
name: ci
```
{% endraw %}
@y
{% raw %}
```yaml
name: ci
```
{% endraw %}
@z

@x
Then, we will choose when we run this workflow. In our example, we are going to
do it for every push against the main branch of our project:
@y
そしてこのワークフローをいつ実行するかを決めます。
この例では、プロジェクトの main ブランチへのプッシュが行われるたびに実行されるものとします。
@z

@x
{% raw %}
```yaml
on:
  push:
    branches:
      - 'main'
```
{% endraw %}
@y
{% raw %}
```yaml
on:
  push:
    branches:
      - 'main'
```
{% endraw %}
@z

@x
Now, we need to specify what we actually want to happen within our workflow
(what jobs), we are going to add our build one and select that it runs on the
latest Ubuntu instances available:
@y
次にこのワークフロー内において、どのようなことを行いたいか（どんなジョブ（jobs）とするか）を指定します。
ここではビルド処理を指定し、入手可能な最新の Ubuntu インスタンス上で実行するようにします。
@z

@x
{% raw %}
```yaml
jobs:
  build:
    runs-on: ubuntu-latest
```
{% endraw %}
@y
{% raw %}
```yaml
jobs:
  build:
    runs-on: ubuntu-latest
```
{% endraw %}
@z

@x
Now, we can add the steps required:
* The first one checks-out our repository under `$GITHUB_WORKSPACE`, so our workflow
can access it.
* The second one will use our PAT and username to log into Docker Hub.
* The third will setup Docker Buildx to create the builder instance using a
BuildKit container under the hood.
@y
そして必要となる手順を追加します。
* まず`$GITHUB_WORKSPACE`にあるリポジトリをチェックアウトして、ワークフローからアクセスできるようにします。
* 2 つめとして、PAT とユーザー名を使って Docker Hub にログインします。
* 3 つめはビルダーです。
  このアクションは Docker Buildx を設定するものであり、BuildKit コンテナーを内部で利用するビルダーインスタンスを生成します。
@z

@x
{% raw %}
```yaml
    steps:
      -
        name: Checkout 
        uses: actions/checkout@v2
      -
        name: Login to Docker Hub
        uses: docker/login-action@v1
        with:
          username: ${{ secrets.DOCKER_HUB_USERNAME }}
          password: ${{ secrets.DOCKER_HUB_ACCESS_TOKEN }}
      -
        name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v1
      -
        name: Build and push
        uses: docker/build-push-action@v2
        with:
          context: .
          file: ./Dockerfile
          push: true
          tags: ${{ secrets.DOCKER_HUB_USERNAME }}/simplewhale:latest
```
{% endraw %}
@y
{% raw %}
```yaml
    steps:
      -
        name: Checkout 
        uses: actions/checkout@v2
      -
        name: Login to Docker Hub
        uses: docker/login-action@v1
        with:
          username: ${{ secrets.DOCKER_HUB_USERNAME }}
          password: ${{ secrets.DOCKER_HUB_ACCESS_TOKEN }}
      -
        name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v1
      -
        name: Build and push
        uses: docker/build-push-action@v2
        with:
          context: .
          file: ./Dockerfile
          push: true
          tags: ${{ secrets.DOCKER_HUB_USERNAME }}/simplewhale:latest
```
{% endraw %}
@z

@x
Now, let the workflow run for the first time and then tweak the Dockerfile to
make sure the CI is running and pushing the new image changes:
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
Next, let's look at how we can optimize the GitHub Actions workflow through
build cache using the registry. This allows to reduce the build time as it
will not have to run instructions that have not been impacted by changes in
your Dockerfile or source code and also reduce number of pulls we complete
against Docker Hub.
@y
ここからは、レジストリを利用したビルドキャッシュを通じて、GitHub アクションワークフローを最適化する方法について見ていきます。
Dockerfile やソースコードの中で、変更が発生していない命令は実行する必要がなくなるため、ビルド時間の削減につながります。
また Docker Hub に対して実施するプル総数も減らすことができます。
@z

@x
In this example, we need to add some extra attributes to the build and push
step:
@y
この例では、ビルドおよびプッシュの手順に向けて、さらなる属性追加が必要になります。
@z

@x
{% raw %}
```yaml
      -
        name: Login to Docker Hub
        uses: docker/login-action@v1
        with:
          username: ${{ secrets.DOCKER_HUB_USERNAME }}
          password: ${{ secrets.DOCKER_HUB_ACCESS_TOKEN }}
      -
        name: Build and push
        uses: docker/build-push-action@v2
        with:
          context: ./
          file: ./Dockerfile
          builder: ${{ steps.buildx.outputs.name }}
          push: true
          tags: ${{ secrets.DOCKER_HUB_USERNAME }}/simplewhale:latest
          cache-from: type=registry,ref=${{ secrets.DOCKER_HUB_USERNAME }}/simplewhale:buildcache
          cache-to: type=registry,ref=${{ secrets.DOCKER_HUB_USERNAME }}/simplewhale:buildcache,mode=max
```
{% endraw %}
@y
{% raw %}
```yaml
      -
        name: Login to Docker Hub
        uses: docker/login-action@v1
        with:
          username: ${{ secrets.DOCKER_HUB_USERNAME }}
          password: ${{ secrets.DOCKER_HUB_ACCESS_TOKEN }}
      -
        name: Build and push
        uses: docker/build-push-action@v2
        with:
          context: ./
          file: ./Dockerfile
          builder: ${{ steps.buildx.outputs.name }}
          push: true
          tags: ${{ secrets.DOCKER_HUB_USERNAME }}/simplewhale:latest
          cache-from: type=registry,ref=${{ secrets.DOCKER_HUB_USERNAME }}/simplewhale:buildcache
          cache-to: type=registry,ref=${{ secrets.DOCKER_HUB_USERNAME }}/simplewhale:buildcache,mode=max
```
{% endraw %}
@z

@x
As you can see, we are using the `type=registry` cache exporter to import/export
cache from a cache manifest or (special) image configuration. Here it will be
pushed as a specific tag named `buildcache` for our image build.
@y
As you can see, we are using the `type=registry` cache exporter to import/export
cache from a cache manifest or (special) image configuration. Here it will be
pushed as a specific tag named `buildcache` for our image build.
@z

@x
Now, run the workflow again and verify that it uses the build cache.
@y
Now, run the workflow again and verify that it uses the build cache.
@z

@x
## Push tagged versions and handle pull requests
@y
## Push tagged versions and handle pull requests
@z

@x
Earlier, we learnt how to set up a GitHub Actions workflow to a Docker project,
how to optimize the workflow by setting up cache. Let's now look at how we can
improve it further. We can do this by adding the ability to have tagged versions
behave differently to all commits to master. This means, only specific versions
are pushed, instead of every commit updating the latest version on Docker Hub.
@y
Earlier, we learnt how to set up a GitHub Actions workflow to a Docker project,
how to optimize the workflow by setting up cache. Let's now look at how we can
improve it further. We can do this by adding the ability to have tagged versions
behave differently to all commits to master. This means, only specific versions
are pushed, instead of every commit updating the latest version on Docker Hub.
@z

@x
You can consider this approach to have your commits pushed as an edge tag to
then use it in nightly tests. By doing this, you can always test the last
changes of your active branch while reserving your tagged versions for release
to Docker Hub.
@y
You can consider this approach to have your commits pushed as an edge tag to
then use it in nightly tests. By doing this, you can always test the last
changes of your active branch while reserving your tagged versions for release
to Docker Hub.
@z

@x
First, let us modify our existing GitHub workflow to take into account pushed
tags and pull requests:
@y
First, let us modify our existing GitHub workflow to take into account pushed
tags and pull requests:
@z

@x
{% raw %}
```yaml
on:
  push:
    branches:
      - 'main'
    tags:
      - 'v*'
```
{% endraw %}
@y
{% raw %}
```yaml
on:
  push:
    branches:
      - 'main'
    tags:
      - 'v*'
```
{% endraw %}
@z

@x
This ensures that the CI will trigger your workflow on push events
(branch and tags). If we tag our commit with something like `v1.0.2`:
@y
This ensures that the CI will trigger your workflow on push events
(branch and tags). If we tag our commit with something like `v1.0.2`:
@z

@x
{% raw %}
```console
$ git tag -a v1.0.2
$ git push origin v1.0.2
```
{% endraw %}
@y
{% raw %}
```console
$ git tag -a v1.0.2
$ git push origin v1.0.2
```
{% endraw %}
@z

@x
Now, go to GitHub and check your Actions
@y
Now, go to GitHub and check your Actions
@z

@x
![Push tagged version](images/push-tagged-version.png){:width="500px"}
@y
![Push tagged version](images/push-tagged-version.png){:width="500px"}
@z

@x
Let's reuse our current workflow to also handle pull requests for testing
purpose but also push our image in the GitHub Container Registry.
@y
Let's reuse our current workflow to also handle pull requests for testing
purpose but also push our image in the GitHub Container Registry.
@z

@x
First we have to handle pull request events:
@y
First we have to handle pull request events:
@z

@x
{% raw %}
```yaml
on:
  push:
    branches:
      - 'main'
    tags:
      - 'v*'
  pull_request:
    branches:
      - 'main'
```
{% endraw %}
@y
{% raw %}
```yaml
on:
  push:
    branches:
      - 'main'
    tags:
      - 'v*'
  pull_request:
    branches:
      - 'main'
```
{% endraw %}
@z

@x
To authenticate against the [GitHub Container Registry](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry){:target="_blank" rel="noopener" class="_"},
use the [`GITHUB_TOKEN`](https://docs.github.com/en/actions/reference/authentication-in-a-workflow){:target="_blank" rel="noopener" class="_"}
for the best security and experience.
@y
To authenticate against the [GitHub Container Registry](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry){:target="_blank" rel="noopener" class="_"},
use the [`GITHUB_TOKEN`](https://docs.github.com/en/actions/reference/authentication-in-a-workflow){:target="_blank" rel="noopener" class="_"}
for the best security and experience.
@z

@x
Now let's change the Docker Hub login with the GitHub Container Registry one:
@y
Now let's change the Docker Hub login with the GitHub Container Registry one:
@z

@x
{% raw %}
```yaml
        if: github.event_name != 'pull_request'
        uses: docker/login-action@v1
        with:
          registry: ghcr.io
          username: ${{ github.actor }}
          password: ${{ secrets.GITHUB_TOKEN }}
```
{% endraw %}
@y
{% raw %}
```yaml
        if: github.event_name != 'pull_request'
        uses: docker/login-action@v1
        with:
          registry: ghcr.io
          username: ${{ github.actor }}
          password: ${{ secrets.GITHUB_TOKEN }}
```
{% endraw %}
@z

@x
Remember to change how the image is tagged. The following example keeps ‘latest'
as the only tag. However, you can add any logic to this if you prefer:
@y
Remember to change how the image is tagged. The following example keeps ‘latest'
as the only tag. However, you can add any logic to this if you prefer:
@z

@x
{% raw %}
```yaml
  tags: ghcr.io/<username>/simplewhale:latest
```
{% endraw %}
@y
{% raw %}
```yaml
  tags: ghcr.io/<username>/simplewhale:latest
```
{% endraw %}
@z

@x
> **Note**: Replace `<username>` with the repository owner. We could use
> {% raw %}`${{ github.repository_owner }}`{% endraw %} but this value can be mixed-case, so it could
> fail as [repository name must be lowercase](https://github.com/docker/build-push-action/blob/master/TROUBLESHOOTING.md#repository-name-must-be-lowercase){:target="_blank" rel="noopener" class="_"}.
@y
> **Note**: Replace `<username>` with the repository owner. We could use
> {% raw %}`${{ github.repository_owner }}`{% endraw %} but this value can be mixed-case, so it could
> fail as [repository name must be lowercase](https://github.com/docker/build-push-action/blob/master/TROUBLESHOOTING.md#repository-name-must-be-lowercase){:target="_blank" rel="noopener" class="_"}.
@z

@x
![Update tagged images](images/ghcr-logic.png){:width="500px"}
@y
![Update tagged images](images/ghcr-logic.png){:width="500px"}
@z

@x
Now, we will have two different flows: one for our changes to master, and one
for our pushed tags. Next, we need to modify what we had before to ensure we are
pushing our PRs to the GitHub registry rather than to Docker Hub.
@y
Now, we will have two different flows: one for our changes to master, and one
for our pushed tags. Next, we need to modify what we had before to ensure we are
pushing our PRs to the GitHub registry rather than to Docker Hub.
@z

@x
## Conclusion
@y
{: #conclusion }
## まとめ
@z

@x
In this guide, you have learnt how to set up GitHub Actions workflow to an
existing Docker project, optimize your workflow to improve build times and
reduce the number of pull requests, and finally, we learnt how to push only
specific versions to Docker Hub.
@y
In this guide, you have learnt how to set up GitHub Actions workflow to an
existing Docker project, optimize your workflow to improve build times and
reduce the number of pull requests, and finally, we learnt how to push only
specific versions to Docker Hub.
@z

@x
## Next steps
@y
{: #next-steps }
## 次のステップ
@z

@x
You can now consider setting up nightly builds, test your image before pushing
it, setting up secrets, share images between jobs or automatically handle
tags and OCI Image Format Specification labels generation.
@y
You can now consider setting up nightly builds, test your image before pushing
it, setting up secrets, share images between jobs or automatically handle
tags and OCI Image Format Specification labels generation.
@z

@x
To look at how you can do one of these, or to get a full example on how to set
up what we have accomplished today, check out [our advanced examples](https://github.com/docker/build-push-action/tree/master/docs/advanced){:target="_blank" rel="noopener" class="_"}
which runs you through this and more details.
@y
To look at how you can do one of these, or to get a full example on how to set
up what we have accomplished today, check out [our advanced examples](https://github.com/docker/build-push-action/tree/master/docs/advanced){:target="_blank" rel="noopener" class="_"}
which runs you through this and more details.
@z
