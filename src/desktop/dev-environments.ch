%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Dev Environments
keywords: Dev Environments, share, collaborate, local
title: Development Environments Preview
toc_min: 1
toc_max: 2
---
@y
---
description: Dev 環境
keywords: Dev Environments, share, collaborate, local
title: Dev 環境プレビュー
toc_min: 1
toc_max: 2
---
@z

@x
Dev Environments enable you to collaborate easily by allowing you to share work-in-progress code with your team members. When using Dev Environments, you can easily set up repeatable development environments, keeping the environment details versioned along with your code. You can also share your work-in-progress code with your team members in just one click and without having to deal with any merge conflicts while moving between Git branches to get your code on to their machine.
@y
Dev 環境 (Dev Environments) を利用すると、開発中のコードをチームメンバー間で共有できるので、共同作業がしやすくなります。
Dev 環境を利用すれば、継続して利用する開発環境を簡単に用意できます。
そして環境の詳細な状況を、コードとともにバージョン管理できます。
また開発中のコードをチームメンバーと共有できます。
それも 1 クリックです。
Git ブランチを移動して目的のコードを取り替えたり、マージコンフリクトに悩まされるようなこともありません。
@z

@x
Dev Environments also allow you to switch between your developer environments or your team members' environments, move between branches to look at changes that are in progress, without moving off your current Git branch.
@y
Dev 環境では、自分の開発環境とチームメンバーの開発環境を簡単に切り替えられます。
それも現時点での Git ブランチを移動することなく、ブランチに含まれている開発中コードの変更内容を確認することができます。
@z

@x
> **Preview**
>
> The Dev Environments feature is currently offered as a Preview. We recommend that you do not use this in production environments.
@y
> **プレビュー**
>
> Dev 環境機能は、現在プレビュー目的で提供されています。
> この機能を本番環境において利用することはお勧めしません。
@z

@x
To access Dev Environments, from the Docker menu, select **Dashboard** > **Dev Environments**.
@y
Dev 環境にアクセスするには、Docker メニューから **Dashboard** > **Dev Environments** を選びます。
@z

@x
![Dev environment intro](images/dev-env-create.png){:width="700px"}
@y
![Dev 環境の導入](/images/dev-env-create.png){:width="700px"}
@z

@x
## Prerequisites
@y
{: #prerequisites }
## 前提条件
@z

@x
Dev Environments are available as part of Docker Desktop 3.5.0 release. Download and install **Docker Desktop 3.5.0** or higher:
@y
Dev 環境は Docker Desktop 3.5.0 リリースの一部として提供されています。
**Docker Desktop 3.5.0** またはそれ以降をダウンロードしてインストールしてください。
@z

@x
- [Mac](mac/release-notes/index.md)
- [Windows](windows/release-notes/index.md)
@y
- [Mac](mac/release-notes/index.md)
- [Windows](windows/release-notes/index.md)
@z

@x
To get started with Dev Environments, you must have the following tools and extension installed on your machine:
@y
Dev 環境を使うには、以下に示すツールまたは拡張機能をインストールしておく必要があります。
@z

@x
- [Git](https://git-scm.com){:target="_blank" rel="noopener" class="_"}
- [Visual Studio Code](https://code.visualstudio.com/){:target="_blank" rel="noopener" class="_"}
- [Visual Studio Code Remote Containers Extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers){:target="_blank" rel="noopener" class="_"}
@y
- [Git](https://git-scm.com){:target="_blank" rel="noopener" class="_"}
- [Visual Studio Code](https://code.visualstudio.com/){:target="_blank" rel="noopener" class="_"}
- [Visual Studio Code Remote Containers Extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers){:target="_blank" rel="noopener" class="_"}
@z

@x
Click **Install** to download and install any missing tools.
@y
未入手のものがあれば **Install** をクリックして、ダウンロードおよびインストールを行ってください。
@z

@x
### Add Git to your PATH on Windows
@y
{: #add-git-to-your-path-on-windows }
### Windows での Git のパス追加
@z

@x
If you have already installed Git, and it's not detected properly, run the following command to check whether you can use Git with the CLI or PowerShell:
@y
すでに Git のインストールを行ったにもかかわらず、Git が正しく認識できていない場合は、以下のコマンドを実行して、CLI または PowerShell から Git が利用できるかどうかを確認してください。
@z

@x
`$ git --version`
@y
`$ git --version`
@z

@x
If it doesn't detect Git as a valid command, you must reinstall Git and ensure you choose the option  **Git from the command line...** or the **Use Git and optional Unix tools...**  on the **Adjusting your PATH environment**  step.
@y
適正なコマンドとして Git が認識されない場合、Git の再インストールが必要です。
そして **Adjusting your PATH environment** の手順において、**Git from the command line...** または **Use Git and optional Unix tools...** を選択してください。
@z

@x
![Windows add Git to path](images/dev-env-gitbash.png){:width="300px"}
@y
![Windows 上での Git のパス追加](/images/dev-env-gitbash.png){:width="300px"}
@z

@x
> **Note**
>
> After you have installed Git, you must quit and then start Docker Desktop. From the Docker menu, select **Quit Docker Desktop**, and then start it again.
@y
> **メモ**
>
> Git をインストールした後は、Docker Desktop をいったん停止して再起動する必要があります。
> Docker メニューから **Quit Docker Desktop**（Docker Desktop の停止）を実行してから、もう一度起動してください。
@z

@x
## Start a single container Dev Environment
@y
{: #start-a-single-container-dev-environment }
## 単一コンテナーからなる Dev 環境の利用
@z

@x
The simplest way to get started with Dev Environments is to create a new environment by cloning the Git repository of the project you are working on. For example, let us create a new Dev Environment using a simple `single-dev-env` project from the [Docker Samples](https://github.com/dockersamples/single-dev-env){:target="_blank" rel="noopener" class="_"} GitHub repository.
@y
Dev 環境を利用する一番簡単な方法は、作業プロジェクトの Git リポジトリをクローンして、新たな環境を生成することです。
たとえば、GitHub リポジトリ [Docker Samples](https://github.com/dockersamples/single-dev-env){:target="_blank" rel="noopener" class="_"} から単純な`single-dev-env`プロジェクトを使って、新たな Dev 環境を構築していくことにします。
@z

@x
> **Note**
>
> When cloning a Git repository using SSH, ensure you've added your SSH key to the ssh-agent. To do this, open a terminal and run `ssh-add <path to your private ssh key>`.
@y
> **メモ**
>
> SSH を経由して Git リポジトリをクローンする場合は、ssh-agent に対して SSH 鍵を追加しておくのを忘れないでください。
> これを行うには、ターミナルを開いて`ssh-add <秘密鍵へのパス>`を実行します。
@z

@x
1. Click **Create New Environment**. This opens the **Create a Dev Environment** dialog. Copy `https://github.com/dockersamples/single-dev-env.git` and add it to the **Repository URL** field on the **Remote Git Repository** tab.
2. Now, click **Create**.
@y
1. **Create New Environment** (新規環境の生成) をクリックします。
   **Create a Dev Environment** (Dev 環境の生成) ダイアログ画面が開きます。
   `https://github.com/dockersamples/single-dev-env.git`をコピーして、**Remote Git Repository** タブ内の **Repository URL** 欄に貼り付けます。
2. そして **Create** (生成) をクリックします。
@z

@x
    This clones the Git code inside a volume, determines the best image for your Dev Environment, and finally, opens VS Code inside the Dev Environment container.
@y
    クローンされる Git コード内には、ボリュームが含まれます。
    また Dev 環境に最適なイメージが選択されます。
    そして最終的に Dev 環境コンテナー内部において VS Code が開きます。
@z

@x
![Single container Dev environment](images/dev-env-container.png){:width="700px"}
@y
![単一コンテナーによる Dev 環境](/images/dev-env-container.png){:width="700px"}
@z

@x
In the above example, the names `wizardly_ellis` and `relaxed_maclaren` are randomly generated. You'll most likely see different names when you create your Dev Environment.
@y
上に示した例において`wizardly_ellis`や`relaxed_maclaren`はランダムに作り出された名前です。
実際に作り出した Dev 環境では、おそらく異なる名前になっているはずです。
@z

@x
Hover over the container and click **Open in VS Code** to start working in VS Code as usual. You can also open a terminal in VS Code, and use Git to push or pull code to your repository, or switch between branches and work as you would normally.
@y
コンテナーの上にマウス移動させて **Open in VS Code** をクリックして、いつものとおり VS Code による作業を始めます。
VS Code 内においてターミナルを開くこともできます。
そうすれば Git リポジトリに対するプッシュやプルの操作ができ、ふだん行っているようにブランチ間を切り替える操作もできるようになります。
@z

@x
You can launch the application by running the command `make run` in your VS Code terminal. This opens an http server on port 8080. Open [http://localhost:8080](http://localhost:8080) in your browser to see the running application.
@y
アプリケーションを実行するには、VS Code のターミナル内において、コマンド`make run`を実行します。
これにより HTTP サーバーがポート 8080 で開きます。
ブラウザー上から [http://localhost:8080](http://localhost:8080) にアクセスして、アプリケーションが起動していることを確認してください。
@z

@x
![Single container Dev environment](images/dev-env-localhost.png){:width="700px"}
@y
![単一コンテナーによる Dev 環境](/images/dev-env-localhost.png){:width="700px"}
@z

@x
### Create a Dev Environment from a specific branch or tag
@y
{: #create-a-dev-environment-from-a-specific-branch-or-tag }
### 特定ブランチまたはタグからの Dev 環境生成
@z

@x
You can create a dev environment from a specific branch (for example, a branch corresponding to a Pull Request) or a tag by adding `@mybranch` or `@tag` as a suffix to your Git URL:
@y
Dev 環境は、特定のブランチから生成することができます （たとえばプルリクエストに対応したブランチなど）。
あるいは Git URL に対するサフィックスとして`@mybranch`や`@tag`をつけたタグからも生成することができます。
@z

@x
 `https://github.com/dockersamples/single-dev-env@mybranch`
@y
 `https://github.com/dockersamples/single-dev-env@mybranch`
@z

@x
 or
@y
 または
@z

@x
 `git@github.com:dockersamples/single-dev-env.git@mybranch`
@y
 `git@github.com:dockersamples/single-dev-env.git@mybranch`
@z

@x
Docker then clones the repository with your specified branch or tag.
@y
Docker はこうすることで、特定のブランチやタグからリポジトリをクローンします。
@z

@x
### Recap
@y
{: #recap }
### まとめ
@z

@x
Let's summarize the tasks we performed so far to start a single container Dev Environment.
@y
単一のコンテナーからなる Dev 環境を起動するための手順を、ここでまとめます。
@z

@x
1. First, we cloned a Git repository in a container using Git credentials. Note that this did not conflict with any of the local files on your host.
2. The Go tools required for our sample project was set up automatically for us. Also, this did not cause any friction with our local tooling setup.
3. Finally, we were able to run the application server inside a container using the VS Code terminal and access it automatically from the host.
@y
1. はじめに Git の資格情報を利用して、コンテナー内に Git リポジトリをクローンしました。
   ここにおいては、ホスト上のファイルと衝突するようなことは起こりません。
2. このサンプルにおいて必要となる Go 言語ツールは、自動的にセットアップされています。
   この際にも、ローカル環境内にあるツールとの間で衝突するような状況は起きません。
3. 最後に VS Code のターミナルを使って、アプリケーションサーバーが実行できるようになりました。
   そしてホストから自動的にアクセスできるようになりました。
@z

@x
## Share your Dev Environment
@y
{: #share-your-dev-environment }
## Dev 環境の共有
@z

@x
{% include upgrade-cta.html
  body="Docker Pro, Team, and Business users can now share Dev Environments with their team members."
  header-text="This feature requires a paid Docker subscription"
  target-url="https://www.docker.com/pricing?utm_source=docker&utm_medium=webreferral&utm_campaign=docs_driven_upgrade"
%}
@y
{% include upgrade-cta.html
  body="Docker の Pro プラン、Team プラン、Business プランのユーザーは、チームメンバー間において Dev 環境を共有できるようになりました。"
  header-text="この機能を利用するには、有償の Docker サブスクリプションが必要です。"
  target-url="https://www.docker.com/pricing?utm_source=docker&utm_medium=webreferral&utm_campaign=docs_driven_upgrade"
%}
@z

@x
When you are ready to share your environment, just click the **Share** button and specify the Docker Hub namespace where you’d like to push your Dev Environment to.
@y
環境を共有する準備が整ったら、 あとは **Share** (共有) ボタンをクリックして、Docker Hub の名前空間を指定するだけです。
この名前空間とは、Dev 環境をプッシュしたい対象のことです。
@z

@x
![Share a Dev environment](images/dev-env-share.png){:width="700px"}
@y
![Dev 環境の共有](/images/dev-env-share.png){:width="700px"}
@z

@x
This creates a Docker image of your dev environment, uploads it to the Docker Hub namespace you have specified in the previous step, and provides a tiny URL which you can use to share your work with your team members.
@y
これによって Dev 環境の Docker イメージが生成されます。
そして前手順で指定した Docker Hub 名前空間内にアップロードされます。
単純な URL が提供されるので、これを使ってチームメンバーとの間で、作業環境を共有することができます。
@z

@x
![Dev environment shared](images/dev-env-shared.png){:width="700px"}
@y
![共有された Dev 環境](/images/dev-env-shared.png){:width="700px"}
@z

@x
Your team members need to open the **Create** dialog, select the **Existing Dev Environment** tab, and then paste the URL. Your Dev Environment now starts in the exact same state as you shared it.
@y
チームメンバーは **Create** (生成) ダイアログ画面を開きます。
**Existing Dev Environment** (既存の Dev 環境) タブを選び、URL を貼り付けます。
こうして起動する Dev 環境は、共有した時点での同じ環境が実現します。
@z

@x
Using this shared Dev Environment, your team members can access the code, any dependencies, and the current Git branch you are working on. They can also review your changes and provide feedback even before you create a pull request!
@y
この Dev 環境共有機能を利用すると、チームメンバーは、作業中のコード、依存パッケージ、現在の Git ブランチにアクセスすることができます。
あなたが行った変更をメンバーがレビューしたり、プルリクエスト前にフィードバックを行うこともできます。
@z

@x
## Start a sample Compose Dev Environment
@y
{: #start-a-sample-compose-dev-environment }
## compose による Dev 環境例の起動
@z

@x
You can also use Dev Environments to collaborate on any Docker Compose-based projects. For example, let's use the `compose-dev-env` project from the [Docker Samples](https://github.com/dockersamples/compose-dev-env){:target="_blank" rel="noopener" class="_"} GitHub repository.
@y
Dev 環境は Docker compose を用いたプロジェクトにおいても共有利用することができます。
たとえば GitHub リポジトリ [Docker Samples](https://github.com/dockersamples/compose-dev-env){:target="_blank" rel="noopener" class="_"} から`compose-dev-env`プロジェクトを用いることにします。
@z

@x
  > **Note**
  >
  > When cloning a Git repository using SSH, ensure you've added your SSH key to the ssh-agent. To do this, open a terminal and run `ssh-add <path to your private ssh key>`.
@y
  > **メモ**
  >
  > SSH を経由して Git リポジトリをクローンする場合は、ssh-agent に対して SSH 鍵を追加しておくのを忘れないでください。
  > これを行うには、ターミナルを開いて`ssh-add <秘密鍵へのパス>`を実行します。
@z

@x
1. Click **Create** to open the **Create a Dev Environment** dialog. Then, copy `https://github.com/dockersamples/compose-dev-env.git` and add it to the **Docker image** field on the **Remote** tab.
2. Click **Create**. This initializes the project and clones the Git code and builds the Compose application. This:
@y
1. **Create** (生成) をクリックして **Create a Dev Environment** (Dev 環境の生成) ダイアログ画面を開きます。
   `https://github.com/dockersamples/compose-dev-env.git`をコピーして、**Remote** タブ上の **Docker image** 欄に貼り付けます。
2. **Create** (生成) をクリックします。
   これによりプロジェクトの初期化が行われて、Git コードをクローンし、compose アプリケーションがビルドされます。
   さらに以下が行われます。
@z

@x
    - Builds local images for services that are defined in the Compose file
    - Pulls images required for other services
    - Creates volumes and networks
    - Starts the Compose stack
@y
    - compose ファイル内に定義されているサービスのローカルイメージがビルドされます。
    - その他のサービスに必要となるイメージがプルされます。
    - ボリュームとネットワークが生成されます。
    - compose スタックが起動します。
@z

@x
![Compose Dev environment](images/dev-env-compose.png){:width="700px"}
@y
![compose による Dev 環境](/images/dev-env-compose.png){:width="700px"}
@z

@x
Now your application is up and running, you can check by opening [http://localhost:8080](http://localhost:8080) in your browser.
@y
こうしてアプリケーションが起動しました。
ブラウザーから [http://localhost:8080](http://localhost:8080) にアクセスして確認します。
@z

@x
The time taken to start the Compose application depends on how your application is configured, whether the images have been built, and the number of services you have defined, etc.
@y
compose アプリケーションの起動に要する時間は、アプリケーションの設定方法により異なります。
イメージがすでにビルドされているかどうか、サービス起動数をいくつに定義しているか、などです。
@z

@x
You'll also notice that VS Code doesn't open directly (unlike the single container Dev Environment) as there are multiple services configured. You can hover over a service and then click on the **Open in VS Code** button to open a specific service in Visual Studio Code. This stops the existing container and creates a new container which allows you to develop and update your service in VS Code.
@y
このときには VS Code は (単一コンテナーによる Dev 環境のときとは違って) 直接開かないことがわかるはずです。
これは複数のサービスが設定されているためです。
サービスのうちの 1 つの上にマウス移動して **Open in VS Code** ボタンをクリックします。
そうすると Visual Studio Code 内に指定したサービスが開きます。
この際には既存のコンテナーが停止されて、新たなコンテナーが生成されます。
このようにして VS Code 内においてサービスの開発や更新を行うことができます。
@z

@x
You can now update your service and test it against your Compose application.
@y
この後は Compose アプリケーションにおいて、サービスを更新やテストを行っていきます。
@z

@x
## Set up your own Compose Dev Environment
@y
{: #set-up-your-own-compose-dev-environment }
## 独自の Compose Dev 環境の設定
@z

@x
In the previous section, we've learnt how to start a sample Compose Dev Environment. To set up a Dev Environment for your own Compose-based project, you'll need some extra configuration that tells Docker Desktop how to build, start, and use the right Dev Environment image for your services.
@y
前節では、サンプルである Compose Dev 環境の起動方法について説明しました。
独自の Compose ベースによるプロジェクトに対して Dev 環境を構築するには、追加の設定が必要になります。
Docker Desktop に対してどのようにビルドを行うのか、サービスに対してどの Dev 環境を利用するのか、といった設定です。
@z

@x
Dev Environments use an additional `docker-compose.yaml` file located in the `.docker` directory at the root of your project. This file allows you to define the image required for a dedicated service, the ports you'd like to expose, along with additional configuration options dedicated to Dev Environments coming in the future.
@y
Dev 環境では、プロジェクトのルートディレクトリ配下の`.docker`ディレクトリに、追加の`docker-compose.yaml`ファイルを用意して利用します。
このファイルでは、特定サービスに必要なイメージの定義、公開するポート、今後 Dev 環境独自となる追加設定オプションを定めます。
@z

@x
Let's take a detailed look at the `docker-compose.yaml` file we used in the [compose-dev-env](https://github.com/dockersamples/compose-dev-env/blob/main/.docker/docker-compose.yaml){:target="_blank" rel="noopener" class="_"} sample project.
@y
ではサンプルプロジェクト [compose-dev-env](https://github.com/dockersamples/compose-dev-env/blob/main/.docker/docker-compose.yaml){:target="_blank" rel="noopener" class="_"} において利用した`docker-compose.yaml`ファイルを見てみることにします。
@z

@x
```yaml
version: "3.7"
services:
  backend:
    build:
      context: backend
      target: development
    secrets:
      - db-password
    depends_on:
      - db
  db:
    image: mariadb
    restart: always
    healthcheck:
      test: [ "CMD", "mysqladmin", "ping", "-h", "127.0.0.1", "--silent" ]
      interval: 3s
      retries: 5
      start_period: 30s
    secrets:
      - db-password
    volumes:
      - db-data:/var/lib/mysql
    environment:
      - MYSQL_DATABASE=example
      - MYSQL_ROOT_PASSWORD_FILE=/run/secrets/db-password
    expose:
      - 3306
  proxy:
    build: proxy
    ports:
      - 8080:80
    depends_on:
      - backend
volumes:
  db-data:
secrets:
  db-password:
    file: db/password.txt
```
@y
```yaml
version: "3.7"
services:
  backend:
    build:
      context: backend
      target: development
    secrets:
      - db-password
    depends_on:
      - db
  db:
    image: mariadb
    restart: always
    healthcheck:
      test: [ "CMD", "mysqladmin", "ping", "-h", "127.0.0.1", "--silent" ]
      interval: 3s
      retries: 5
      start_period: 30s
    secrets:
      - db-password
    volumes:
      - db-data:/var/lib/mysql
    environment:
      - MYSQL_DATABASE=example
      - MYSQL_ROOT_PASSWORD_FILE=/run/secrets/db-password
    expose:
      - 3306
  proxy:
    build: proxy
    ports:
      - 8080:80
    depends_on:
      - backend
volumes:
  db-data:
secrets:
  db-password:
    file: db/password.txt
```
@z

@x
In the above yaml file, the build context `backend` specifies that that the container should be built using the `development` stage (`target` attribute) of the Dockerfile located in the `backend` directory (`context` attribute)
@y
上の yaml ファイルでは、ビルドコンテキストを`backend`として、コンテナーのビルドを`develoment`ステージを利用して行うこと (`target`属性による指定)、Dockerfile の配置を`backend`ディレクトリとすること (`context`属性による指定) が定義されています。
@z

@x
The `development` stage of the Dockerfile is defined as follows:
@y
Dockerfile の`development`ステージは、以下のように定義しています。
@z

@x
```dockerfile
FROM golang:1.16-alpine AS build
WORKDIR /go/src/github.com/org/repo
COPY . .
@y
```dockerfile
FROM golang:1.16-alpine AS build
WORKDIR /go/src/github.com/org/repo
COPY . .
@z

@x
RUN go build -o server .
@y
RUN go build -o server .
@z

@x
FROM build AS development
RUN apk update \
    && apk add git
CMD ["go", "run", "main.go"]
@y
FROM build AS development
RUN apk update \
    && apk add git
CMD ["go", "run", "main.go"]
@z

@x
FROM alpine:3.12
EXPOSE 8000
COPY --from=build /go/src/github.com/org/repo/server /server
CMD ["/server"]
```
@y
FROM alpine:3.12
EXPOSE 8000
COPY --from=build /go/src/github.com/org/repo/server /server
CMD ["/server"]
```
@z

@x
The `development`target uses a `golang:1.16-alpine` image with all dependencies you need for development. You can start your project directly from VS Code and interact with the others applications or services such as the database or the frontend.
@y
`development`ターゲットが`golang:1.16-alpine`イメージを利用するので、開発に必要な依存パッケージがすべて利用できます。
VS Code からプロジェクトを直接利用でき、データベースやフロントエンドなど、他のアプリケーションやサービスと連携して作業を進められます。
@z

@x
In our example, the Docker Compose files are the same. However, they could be different and the services defined in the main Compose file may use other targets to build or directly reference other images.
@y
ここに示す例では Docker Compose ファイルは同じものとします。
実際には異なる定義になっていくはずです。
またメインの Compose ファイルにて定義されたサービスが、別にビルドを行うターゲットを利用したり、別のイメージを直接参照したり、といったようにもなるでしょう。
@z

@x
## Specify a base image
@y
{: #specify-a-base-image }
## ベースイメージの指定
@z

@x
In this preview, Dev Environments support a simple YAML file which allows you to specify the base image that you would like to use as part of your Dev Environment. You must include this as part of the `.docker` folder and then add it as a `config.json` file. For example, to use the Jekyll base image, add:
@y
このプレビューにおいては、簡単な YAML ファイルをサポートしていて、Dev 環境の一部として利用したいベースイメージを指定するものとなっています。
このファイルを`.docker`フォルダーの一部として含めて、`config.json`ファイルとして追加することが必要です。
たとえば Jekyll ベースイメージを用いる場合には、以下のようにします。
@z

@x
```jsx
{
  "image": "jekyll/jekyll"
}
```
@y
```jsx
{
  "image": "jekyll/jekyll"
}
```
@z

@x
> **Note**
>
> This configuration is to unblock users for the Preview release only. We may move this configuration for single and multi-container applications to a Compose-based implementation in future releases.
>
> To get involved with the discussion on how we are going to implement this as part of Compose, join the **#docker-dev-environments** channel in the [Docker Community Slack](https://dockercommunity.slack.com/messages){:target="_blank" rel="noopener" class="_"}, or let us know your feedback by creating an issue in the [Dev Environments](https://github.com/docker/dev-environments/issues){:target="_blank" rel="noopener" class="_"} GitHub repository.
@y
> **メモ**
>
> この設定は、プレビューリリースにおいてのみ、ユーザーが利用可能なものです。
> 単一あるいは複数コンテナーによるアプリケーションを Compose ベースにより実現するように、この設定を将来リリースに移行する予定です。
>
> その Compose 実装に関しての議論に参加したい方は、[Docker Community Slack](https://dockercommunity.slack.com/messages){:target="_blank" rel="noopener" class="_"} の **#docker-dev-environments** チャネルに参加してください。
> または GitHub リポジトリ [Dev Environments](https://github.com/docker/dev-environments/issues){:target="_blank" rel="noopener" class="_"} に issue を生成して、フードバックしてください。
@z

@x
## Start a Dev Environment from a local folder
@y
{: #start-a-dev-environment-from-a-local-folder }
## ローカルフォルダーからの Dev 環境の起動
@z

@x
You can also start a Dev Environment from local code on your machine.
@y
自分のマシン上にあるローカルコードから Dev 環境を起動することもできます。
@z

@x
1. Click **Create** to open the **Create a Dev Environment** dialog. Select the **Local Folder** tab, and click **Select directory** to open the root of the code that you would like to work on.
2. Now, click **Create**.
@y
1. **Create** (生成) をクリックして **Create a Dev Environment** (Dev 環境の生成) ダイアログ画面を開きます。
   **Local Folder** タブを選び、**Select directory** (ディレクトリの選択) をクリックします。
   そして作業対象とするコードのルートディレクトリを開きます。
2. **Create** (生成) をクリックします。
@z

@x
    This creates a Dev Environment using your local folder, and bind-mounts your local code in the Dev Environment. Finally, it opens VS Code inside the Dev Environment container.
@y
    This creates a Dev Environment using your local folder, and bind-mounts your local code in the Dev Environment. Finally, it opens VS Code inside the Dev Environment container.
@z

@x
> **Note**
>
> When using a local folder for a Dev Environment, file changes are synchronized between your Dev Environment container and your local files. This can affect the performance inside the container, depending on the number of files in your local folder and the operations performed in the container.
@y
> **Note**
>
> When using a local folder for a Dev Environment, file changes are synchronized between your Dev Environment container and your local files. This can affect the performance inside the container, depending on the number of files in your local folder and the operations performed in the container.
@z

@x
## Known issues
@y
{: #known-issues }
## 既知の問題
@z

@x
The following section lists known issues and workarounds in the Dev Environments Preview:
@y
この節では、Dev 環境プレビューにおける既知の問題とその解決方法について一覧に示します。
@z

@x
1. It is currently not possible to share Compose-based applications using Dev Environments because registries do not support Compose applications. Refer to the [Feedback](#feedback) section to let us know your requirements for sharing Compose-based applications.
2. When sharing a Dev Environment between Mac and Windows, the VS Code terminal may not function correctly in some cases. To work around this issue, use the Exec in CLI option in the Docker Dashboard.
3. When sharing a Dev Environment between ARM64 and AMD64 machines, the environment will be emulated.
@y
1. 今のところ Dev 環境では、Compose ベースのアプリケーションを共有することはできません。
   レジストリが Compose アプリケーションをサポートしていないためです。
   [フィードバック](#feedback) の節を参考にして、Compose ベースアプリケーションに関するご要望をお知らせください。
2. Mac と Windows の間で Dev 環境を共有する場合、
   VS Code のターミナルが適切に動作しないことがあります。
   この問題を解消するには、Docker Dashboard において CLI オプションの Exec を利用してください。
3. ARM64 と AMD64 のマシン間において Dev 環境を共有する場合、この環境はエミュレート処理が行われます。
@z

@x
## Feedback
@y
{: #feedback }
## フィードバック
@z

@x
We are excited that you are trying out our Dev Environments Preview. We would love to hear from you.
@y
みなさんが Dev 環境プレビューをお使いいただければ、大変うれしく思います。
是非感想をお聞かせください。
@z

@x
You can let us know your feedback by creating an issue in the [Dev Environments](https://github.com/docker/dev-environments/issues){:target="_blank" rel="noopener" class="_"} GitHub repository. Alternatively, get in touch with us on the **#docker-dev-environments** channel in the [Docker Community Slack](https://dockercommunity.slack.com/messages){:target="_blank" rel="noopener" class="_"}.
@y
GitHub リポジトリ [Dev Environments](https://github.com/docker/dev-environments/issues){:target="_blank" rel="noopener" class="_"} に issue を生成していただければ、フィードバックとして確認いたします。
または [Docker Community Slack](https://dockercommunity.slack.com/messages){:target="_blank" rel="noopener" class="_"} における **#docker-dev-environments** チャネルを通じてご連絡ください。
@z
