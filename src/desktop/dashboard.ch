%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Docker Dashboard
keywords: Docker Dashboard, manage, containers, images
title: Docker Dashboard
redirect_from:
- /docker-for-mac/dashboard/
- /docker-for-windows/dashboard/
toc_min: 2
toc_max: 3
---
@y
---
description: Docker ダッシュボード
keywords: Docker Dashboard, manage, containers, images
title: Docker ダッシュボード
redirect_from:
- /docker-for-mac/dashboard/
- /docker-for-windows/dashboard/
toc_min: 2
toc_max: 3
---
@z

@x
The Docker Dashboard provides a simple interface that enables you to manage your containers, applications, and images directly from your machine without having to use the CLI to perform core actions.
@y
Docker Desktop ダッシュボードは、コンテナー、アプリケーション、イメージに食説にアクセスできるようなシンプルなインターフェースを提供します。
CLI を使って難しい操作を行う必要がなくなります。
@z

@x
The **Containers/Apps** view provides a runtime view of all your containers and applications. It allows you to interact with containers and applications, and manage the lifecycle of your applications directly from your machine. This view also provides an intuitive interface to perform common actions to inspect, interact with, and manage your Docker objects including containers and Docker Compose-based applications. For more information, see [Explore running containers and applications](#explore-running-containers-and-applications).
@y
**Containers/Apps** 画面では、コンテナーやアプリケーションの実行状態を表示します。
この画面においてはコンテナーやアプリケーションとのやりとりを行うことが可能であり、手元のマシンからアプリケーションのライフサイクルを直接制御することができます。
この画面では、コンテナーや Docker Compose ベースのアプリケーションに含まれる Docker オブジェクトに対して、主要な操作、つまり詳細確認、対話指示、管理を直感的なインターフェースにより提供します。
詳しくは [実行中コンテナーやアプリケーションの動作確認](#explore-running-containers-and-applications) を参照してください。
@z

@x
The **Images** view displays a list of your Docker images, and allows you to run an image as a container, pull the latest version of an image from Docker Hub, and inspect images. It also displays a summary of the vulnerability scanning report using Snyk. In addition, the Images view contains clean up options to remove unwanted images from the disk to reclaim space. If you are logged in, you can also see the images you and your organization have shared on Docker Hub. For more information, see [Explore your images](#explore-your-images)
@y
**Images** 画面には Docker イメージが一覧表示されます。
ここからイメージをコンテナーとして実行したり、Docker Hub からの最新版イメージのプル、イメージの詳細確認を行ったりすることができます。
また Snyk を利用したぜい弱性スキャン報告の概要が表示されます。
さらにイメージ削除の機能もあり、不要となったイメージをディスク上から削除して容量を確保することができます。
Docker Hub にログインできていれば、Docker Hub 上において自分や組織が共有しているイメージを参照することもできます。
詳しくは [イメージの確認](#explore-your-images) を参照してください。
@z

@x
The **Volumes** view displays a list of volumes and allows you to easily create and delete volumes and see which ones are being used. For more information, see [Explore volumes](#explore-volumes).
@y
**Volumes** 画面にはボリュームの一覧が表示されるので、ボリュームの生成削除や、どれが利用中であるかの確認が簡単にできます。
詳しくは [ボリュームの確認](#explore-volumes) を参照してください。
@z

@x
In addition, the Docker Dashboard allows you to:
@y
さらに Docker ダッシュボード では以下のことが可能です。
@z

@x
- Easily navigate to the **Preferences** (**Settings** in Windows) menu to configure Docker Desktop preferences
- Access the **Troubleshoot** menu to debug and perform restart operations
- Sign into [Docker Hub](https://hub.docker.com/) using your Docker ID
@y
- **Preferences** から（Windows では **Settings**）メニューから簡単に Docker Desktop の設定を行うことができます。
- **Troubleshoot** メニューを使ってデバッグや再起動操作を行うことができます。
- Docker ID を使って [Docker Hub](https://hub.docker.com/) にサインインすることができます。
@z

@x
To access the Docker Dashboard, from the Docker menu, select **Dashboard**. On Windows, click the Docker icon to open the Dashboard.
@y
Docker ダッシュボードにアクセスするには、Docker メニューの **Dashboard** を実行します。
Windows においては Docker アイコンから Dashboard を開くことができます。
@z

@x
## Explore running containers and applications
@y
{: #explore-running-containers-and-applications }
## 実行中コンテナーやアプリケーションの動作確認
@z

@x
From the Docker menu, select **Dashboard**. This lists all your running containers and applications. You must have running or stopped containers and applications to see them listed on the Docker Dashboard.
@y
Docker メニューから **Dashboard** を実行します。
起動している全コンテナーおよびアプリケーションが一覧表示されます。
なお Docker ダッシュボード上に一覧として表示させるためには、そのコンテナーやアプリケーションは実行しているか停止中でなければなりません。
@z

@x
The following sections guide you through the process of creating a sample Redis container and a sample application to demonstrate the core functionalities in Docker Dashboard.
@y
これ以降の節では、サンプルとして Redis コンテナーとサンプルアプリケーションの生成手順を説明します。
これによって、Docker ダッシュボードの重要な機能を示していきます。
@z

@x
### Start a Redis container
@y
{: #start-a-redis-container }
### Redis コンテナーの起動
@z

@x
To start a Redis container, open your preferred CLI and run the following command:
@y
Redis コンテナーを起動するために、好みの CLI 環境を起動して以下のコマンドを実行します。
@z

@x
`docker run -dt redis`
@y
`docker run -dt redis`
@z

@x
This creates a new Redis container. From the Docker menu, select **Dashboard** to see the new Redis container.
@y
上により新規の Redis コンテナーが生成されます。
Docker メニューから **Dashboard** を実行して、新しい Redis コンテナーを確認してみます。
@z

@x
### Start a sample application
@y
{: #start-a-sample-application }
### サンプルアプリケーションの起動
@z

@x
Let's start a sample application. Download the [Example voting app](https://github.com/dockersamples/example-voting-app) from the Docker samples page. The example voting app is a distributed application that runs across multiple Docker containers. The app contains:
@y
サンプルアプリケーションを作ります。
Docker のサンプルページから [サンプル投票アプリ](https://github.com/dockersamples/example-voting-app) をダウンロードしてください。
このサンプル投票アプリは、さまざまな Docker コンテナー上において起動する分散アプリケーションです。
このアプリは以下により構成されます。
@z

@x
- A front-end web app in [Python](https://github.com/dockersamples/example-voting-app/blob/master/vote) or [ASP.NET Core](https://github.com/dockersamples/example-voting-app/blob/master/vote/dotnet) which lets you vote between two options
- A [Redis](https://hub.docker.com/_/redis/) or [NATS](https://hub.docker.com/_/nats/) queue which collects new votes
- A [.NET Core](https://github.com/dockersamples/example-voting-app/blob/master/worker/src/Worker), [Java](https://github.com/dockersamples/example-voting-app/blob/master/worker/src/main) or [.NET Core 2.1](https://github.com/dockersamples/example-voting-app/blob/master/worker/dotnet) worker which consumes votes and stores them
- A [Postgres](https://hub.docker.com/_/postgres/) or [TiDB](https://hub.docker.com/r/dockersamples/tidb/tags/) database backed by a Docker volume
- A [Node.js](https://github.com/dockersamples/example-voting-app/blob/master/result) or [ASP.NET Core SignalR](https://github.com/dockersamples/example-voting-app/blob/master/result/dotnet) web app which shows the results of the voting in real time
@y
- [Python](https://github.com/dockersamples/example-voting-app/blob/master/vote) や [ASP.NET Core](https://github.com/dockersamples/example-voting-app/blob/master/vote/dotnet) によって書かれたウェブアプリのフロントエンド。2 つの選択肢から投票を行う機能を提供します。
- [Redis](https://hub.docker.com/_/redis/) または [NATS](https://hub.docker.com/_/nats/) によるキュー。これが新しい投票データを集めます。
- [.NET Core](https://github.com/dockersamples/example-voting-app/blob/master/worker/src/Worker)、[Java](https://github.com/dockersamples/example-voting-app/blob/master/worker/src/main)、[.NET Core 2.1](https://github.com/dockersamples/example-voting-app/blob/master/worker/dotnet) によるワーカー。投票データを取り込み保存します。
- [Postgres](https://hub.docker.com/_/postgres/) または [TiDB](https://hub.docker.com/r/dockersamples/tidb/tags/) データベース。Docker ボリューム上に置かれます。
- [Node.js](https://github.com/dockersamples/example-voting-app/blob/master/result) または [ASP.NET Core SignalR](https://github.com/dockersamples/example-voting-app/blob/master/result/dotnet) によるウェブアプリ。リアルタイムに投票結果を表示します。
@z

@x
To start the application, navigate to the directory containing the example voting application in the CLI and run `docker-compose up --build`.
@y
このアプリケーションを起動するには、CLI 環境においてこのアプリケーションが存在しているディレクトリへ移動して`docker-compose up --build`を実行します。
@z

@x
```console
$ docker-compose up --build
Creating network "example-voting-app-master_front-tier" with the default driver
Creating network "example-voting-app-master_back-tier" with the default driver
Creating volume "example-voting-app-master_db-data" with default driver
Building vote
Step 1/7 : FROM python:2.7-alpine
2.7-alpine: Pulling from library/python
Digest: sha256:d2cc8451e799d4a75819661329ea6e0d3e13b3dadd56420e25fcb8601ff6ba49
Status: Downloaded newer image for python:2.7-alpine
 ---> 1bf48bb21060
Step 2/7 : WORKDIR /app

...
Successfully built 69da1319c6ce
Successfully tagged example-voting-app-master_worker:latest
Creating example-voting-app-master_vote_1   ... done
Creating example-voting-app-master_result_1 ... done
Creating db                                 ... done
Creating redis                              ... done
Creating example-voting-app-master_worker_1 ... done
Attaching to db, redis, example-voting-app-master_result_1, example-voting-app-master_vote_1, example-voting-app-master_worker_1
...
```
@y
```console
$ docker-compose up --build
Creating network "example-voting-app-master_front-tier" with the default driver
Creating network "example-voting-app-master_back-tier" with the default driver
Creating volume "example-voting-app-master_db-data" with default driver
Building vote
Step 1/7 : FROM python:2.7-alpine
2.7-alpine: Pulling from library/python
Digest: sha256:d2cc8451e799d4a75819661329ea6e0d3e13b3dadd56420e25fcb8601ff6ba49
Status: Downloaded newer image for python:2.7-alpine
 ---> 1bf48bb21060
Step 2/7 : WORKDIR /app

...
Successfully built 69da1319c6ce
Successfully tagged example-voting-app-master_worker:latest
Creating example-voting-app-master_vote_1   ... done
Creating example-voting-app-master_result_1 ... done
Creating db                                 ... done
Creating redis                              ... done
Creating example-voting-app-master_worker_1 ... done
Attaching to db, redis, example-voting-app-master_result_1, example-voting-app-master_vote_1, example-voting-app-master_worker_1
...
```
@z

@x
When the application starts successfully, from the Docker menu, select **Dashboard** to see the Example voting application. Expand the application to see the containers running inside the application.
@y
アプリケーションが正常に起動したら、Docker メニューから **Dashboard** を実行して、サンプル投票アプリを確認してみます。
アプリケーションの表示を展開して、アプリケーション内部で稼動するコンテナーを確認してみます。
@z

@x
![Spring Boot application view](images/app-dashboard-view.png){:width="700px"}
@y
![Spring Boot アプリケーションビュー](images/app-dashboard-view.png){:width="700px"}
@z

@x
Now that you can see the list of running containers and applications on the Dashboard, let us explore some of the actions you can perform:
@y
このようにして起動中のコンテナーやアプリケーションの一覧は、ダッシュボード上において確認できるようになりました。
ここからさらに操作できる内容を見ていきます。
@z

@x
- Click **Port** to open the port exposed by the container in a browser.
- Click **CLI** to open a terminal and run commands on the container. If you have installed iTerm2 on your Mac, the CLI option opens an iTerm2 terminal. Otherwise, it opens the Terminal app on Mac, or a Command Prompt on Windows.
- Click **Stop**, **Start**, **Restart**, or **Delete** to perform lifecycle operations on the container.
@y
- **Port** をクリックすると、コンテナーが開放しているそのポートをブラウザー上にて確認することができます。
- **CLI** をクリックすると端末画面が開くので、コンテナー上でのコマンド実行が可能です。
  Mac 上に iTerm2 をインストールしている場合、CLI オプションからは iTerm2 ターミナルが開きます。
  それ以外であれば、Mac なら Terminal アプリ、Windows ならコマンドプロンプトが開きます。
- **Stop**、**Start**、**Restart**、**Delete** をクリックすることで、コンテナーのライフサイクルを制御する操作を実行できます。
@z

@x
Use the **Search** option to search for a specific object. You can also sort your containers and applications using various options. Click the **Sort by** drop-down to see a list of available options.
@y
**Search** オプションを用いると、特定オブジェクトを検索することができます。
またコンテナーやアプリケーションの並び順は、さまざまなオプション指定により変更可能です。
ドロップダウンメニュー **Sort by** を実行すれば、利用可能な検索オプションの一覧を確認することができます。
@z

@x
### Interact with containers and applications
@y
{: #interact-with-containers-and-applications }
### コンテナーやアプリケーションとのやりとり
@z

@x
From the Docker Dashboard, select the example voting application we started earlier.
@y
Docker ダッシュボードから、先ほど起動したサンプル投票アプリを選びます。
@z

@x
The **Containers/Apps** view lists all the containers running on the application and contains a detailed logs view. It also allows you to start, stop, or delete the application. Use the **Search** option at the bottom of the logs view to search application logs for specific events, or select the **Copy** icon to copy the logs to your clipboard.
@y
**Containers/Apps** 画面には、アプリケーション上に起動する全コンテナーの一覧が表示され、詳細ログ画面も示されます。
ここからアプリケーションの起動、停止、削除を行うこともできます。
ログ画面の下段にある **Search** オプションを利用すると、特定イベントのアプリケーションログを検索することができます。
また **Copy** アイコンを選択すれば、その出力ログをクリップボードにコピーすることができます。
@z

@x
Click **Open in Visual Studio Code** to open the application in VS Code. Hover over the list of containers to see some of the core actions you can perform.
@y
**Open in Visual Studio Code** をクリックすると、VS Code 上にアプリケーションを開くことができます。
コンテナー一覧の上にマウスを移動させると、実行可能な主要操作が示されます。
@z

@x
![Application view](images/mac-application-view.png){:width="700px"}
@y
![アプリケーションビュー](images/mac-application-view.png){:width="700px"}
@z

@x
### Container view
@y
{: #container-view }
### コンテナー画面
@z

@x
Click on a specific container for detailed information about the container. The **container view** displays **Logs**, **Inspect**, and **Stats** tabs and provides quick action buttons to perform various actions.
@y
コンテナーのどれか 1 つをクリックし、コンテナーの詳細な情報を見てみます。
**container view** には **Logs**、**Inspect**、**Stats** の各タブが表示されています。
ボタンクリックによってさまざまな操作をすばやく行うことができます。
@z

@x
- Select **Logs** to see logs from the container. You can also search the logs for specific events and copy the logs to your clipboard.
@y
- **Logs** をクリックすると、コンテナーからのログを確認できます。
特定イベントに対するアプリケーションログを検索したり、出力ログをクリップボードにコピーしたりすることができます。
@z

@x
- Select **Inspect** to view low-level information about the container. You can see the local path, version number of the image, SHA-256, port mapping, and other details.
@y
- **Inspect** をクリックすると、コンテナーに関する低レベル情報が確認できます。
ローカルパス、イメージのバージョン番号、SHA-256、ポートマッピングなどの情報です。
@z

@x
- Select **Stats** to view information about the container resource utilization. You can see the amount of CPU, disk I/O, memory, and network I/O used by the container.
@y
- **Stats** をクリックすると、コンテナーのリソース使用状況を確認することができます。
コンテナーが利用している CPU 数、ディスク I/O、メモリ、ネットワーク I/O などです。
@z

@x
You can also use the quick action buttons on the top bar to perform common actions such as opening a CLI to run commands in a container, and perform lifecycle operations such as stop, start, restart, or delete your container.
@y
またトップバー上にはすばやく操作するためのボタン類があり、共通的な操作を行うことができます。
たとえば CLI を開いてコンテナー内にてコマンドを実行したり、コンテナーのライフサイクルを操作する操作としてコンテナーの停止、起動、再起動を行ったりできます。
@z

@x
## Explore your images
@y
{: #explore-your-images }
## イメージの確認
@z

@x
The **Images**  view is a simple interface that lets you manage Docker images without having to use the CLI. By default, it displays a list of all Docker images on your local disk. To view images in remote repositories, click **Sign in** and connect to Docker Hub. This allows you to collaborate with your team and manage your images directly through Docker Desktop.
@y
**Images** 画面の操作インターフェースはとても簡単です。
CLI を利用してくても Docker イメージを管理することができます。
Docker イメージの一覧は、デフォルトではローカルディスクにあるものが表示されます。
リモートリポジトリにあるイメージを表示するには **Sign in** をクリックして Docker Hub に接続します。
これを行うと開発チーム内での共同作業が可能となり、イメージを直接 Docker Desktop から管理することができます。
@z

@x
The Images view allows you to perform core operations such as running an image as a container, pulling the latest version of an image from Docker Hub, pushing the image to Docker Hub, and inspecting images.
@y
イメージ画面では主要な操作、たとえばイメージのコンテナーとしての実行、Docker Hub からのイメージ最新版のプル、Docker Hub へのイメージのプッシュ、イメージの詳細確認などを行うことができます。
@z

@x
In addition, the Images view displays metadata about the image such as the tag, image ID, date when the image was created, and the size of the image. It also displays **In Use** tags next to images used by running and stopped containers. This allows you to review the list of images and use the **Clean up images** option to remove any unwanted images from the disk to reclaim space.
@y
さらにイメージ画面には、イメージに関するメタデータ情報が表示されます。
たとえばタグ、イメージ ID、イメージ生成日付、イメージサイズなどです。
またイメージの横に **In Use** タグがあって、コンテナーの起動や停止に利用できます。
これを使ってイメージ一覧を抽出して **Clean up images** オプションを利用すれば、必要のないイメージを削除して容量を確保することができます。
@z

@x
The Images view also allows you to search images on your local disk and sort them using various options.
@y
イメージ画面では、ローカルディスク内のイメージを検索することもできます。
そしてさまざまなオプションを使って並べ替えができます。
@z

@x
Let's explore the various options in the **Images** view.
@y
**Images** 画面にてさまざまなオプションを使って試してみます。
@z

@x
If you don’t have any images on your disk, run the command `docker pull redis` in a terminal to pull the latest Redis image. This command pulls the latest Redis image from Docker Hub.
@y
ディスク上にイメージがまったくない場合は、ターミナルからコマンド`docker pull redis`を実行して、最新の Redis イメージを取得してください。
このコマンドは最新の Redis イメージを Docker Hub からプルします。
@z

@x
Select **Dashboard** > **Images** to see the Redis image.
@y
**Dashboard** > **Images** を実行して Redis イメージを確認します。
@z

@x
![Redis image](images/redis-image.png){:width="700px"}
@y
![Redis イメージ](images/redis-image.png){:width="700px"}
@z

@x
### Run an image as a container
@y
{: #run-an-image-as-a-container }
### コンテナーとしてのイメージ実行
@z

@x
Now that you have a Redis image on your disk, let’s run this image as a container:
@y
ディスク上に Redis イメージを取得したので、このイメージをコンテナーとして実行します。
@z

@x
1. From the Docker menu, select **Dashboard** > **Images**. This displays a list of images on your local disk.
2. Select the Redis image from the list and click **Run**.
3. When prompted, click the **Optional settings** drop-down to specify a name, port, volumes, and click **Run**.
@y
1. Docker メニューから **Dashboard** > **Images** を実行します。
   これによりローカルディスク上のイメージ一覧が表示されます。
2. 一覧から Redis イメージを選んで **Run** をクリックします。
3. 確認画面が表示されたら **Optional settings** ドロップダウンメニューをクリックして、名前、ポート、ボリュームを指定した上で **Run** をクリックします。
@z

@x
    To use the defaults, click **Run** without specifying any optional settings. This creates a new container from the Redis image and opens it on the **Container/Apps** view.
@y
    デフォルト設定を利用する場合は、オプション設定を何も指定せずに **Run** をクリックします。
    こうすると Redis イメージから新たなコンテナーが生成されて、**Container/Apps** 画面内に表示されます。
@z

@x
### Pull the latest image from Docker Hub
@y
{: #pull-the-latest-image-from-docker-hub }
### Docker Hub からの最新イメージのプル
@z

@x
To pull the latest image from Docker Hub:
@y
Docker Hub から最新イメージをプルするには以下を行います。
@z

@x
1. From the Docker menu, select **Dashboard** > **Images**. This displays a list of images on your local disk.
2. Select the image from the list and click the more options button.
3. Click **Pull**. This pulls the latest version of the image from Docker Hub.
@y
1. Docker メニューから **Dashboard** > **Images** を実行します。
   これによりローカルディスク上のイメージ一覧が表示されます。
2. 一覧から目的のイメージを選んで、more options ボタンをクリックします。
3. **Pull** をクリックします。
   Docker Hub から最新版のイメージがプルされます。
@z

@x
> **Note**
>
> The repository must exist on Docker Hub in order to pull the latest version of an image. You must be logged in to pull private images.
@y
> **メモ**
>
> イメージの最新版をプルするためには、利用するリポジトリが Docker Hub 上に存在していなければなりません。
> プライベートイメージをプルする場合には、ログインしておくことが必要です。
@z

@x
### Push an image to Docker Hub
@y
{: #push-an-image-to-docker-hub }
### Docker Hub へのイメージのプッシュ
@z

@x
To push an image to Docker Hub:
@y
Docker Hub へイメージをプッシュするには以下を行います。
@z

@x
1. From the Docker menu, select **Dashboard** > **Images**. This displays a list of images on your local disk.
2. Select the image from the list and click the more options button.
3. Click **Push to Hub.**
@y
1. Docker メニューから **Dashboard** > **Images** を実行します。
   これによりローカルディスク上のイメージ一覧が表示されます。
2. 一覧から目的のイメージを選んで、more options ボタンをクリックします。
3. **Push to Hub** をクリックします。
@z

@x
> **Note**
>
> You can only push an image to Docker Hub if the image belongs to your Docker ID or your organization. That is, the image must contain the correct username/organization in its tag to be able to push it to Docker Hub.
@y
> **メモ**
>
> Docker Hub にイメージをプッシュできるのは、そのイメージが自身の Docker ID や組織に属している場合に限ります。
> つまりそのイメージのタグ内に適切なユーザー名/組織が含まれている場合に限って、Docker Hub へのプッシュができるようになります。
@z

@x
### Inspect an image
@y
{: #inspect-an-image }
### イメージの確認
@z

@x
Inspecting an image displays detailed information about the image such as the image history, image ID, the date the image was created, size of the image, etc. To inspect an image:
@y
イメージの詳細確認を行うと、イメージに関する詳細情報が表示されます。
たとえばイメージ履歴、イメージ ID、イメージの生成日付、イメージサイズなどです。
イメージの詳細確認は以下のようにして行います。
@z

@x
1. From the Docker menu, select **Dashboard** > **Images**. This displays a list of images on your local disk.
2. Select the image from the list and click the more options button.
3. Click **Inspect**.
4. The image inspect view also provides options to pull the latest image, push image to Hub, remove the image, or run the image as a container.
@y
1. Docker メニューから **Dashboard** > **Images** を実行します。
   これによりローカルディスク上のイメージ一覧が表示されます。
2. 一覧から目的のイメージを選んで、more options ボタンをクリックします。
3. **Inspect** をクリックします。
4. イメージ詳細画面では、最新イメージのプル、Hub へのイメージプッシュ、イメージ削除、コンテナーとしてのイメージ実行も行うことができます。
@z

@x
### Remove an image
@y
{: #remove-an-image }
### イメージの削除
@z

@x
The **Images** view allows you to remove unwanted images from the disk. The Images on disk status bar displays the number of images and the total disk space used by the images.
@y
**Images** 画面からは、不要なイメージをディスクから削除することができます。
ディスクステータスバー上のイメージには、イメージ数、イメージによるディスク総容量が表示されます。
@z

@x
You can remove individual images or use the **Clean up** option to delete unused and dangling images.
@y
個別にイメージを削除することができます。
あるいは **Clean up** オプションを使って、未使用の dangling なイメージを削除することができます。
@z

@x
To remove individual images:
@y
イメージを個別に削除するには以下を行います。
@z

@x
1. From the Docker menu, select **Dashboard** > **Images**. This displays a list of images on your local disk.
2. Select the image from the list and click the more options button.
3. Click **Remove**. This removes the image from your disk.
@y
1. Docker メニューから **Dashboard** > **Images** を実行します。
   これによりローカルディスク上のイメージ一覧が表示されます。
2. 一覧から目的のイメージを選んで、more options ボタンをクリックします。
3. **Remove** をクリックします。
   これによりディスクからイメージが削除されます。
@z

@x
> **Note**
>
> To remove an image used by a running or a stopped container, you must first remove the associated container.
@y
> **メモ**
>
> 実行中、停止中のコンテナーによって利用されているイメージを削除するには、その前に関連するコンテナーを削除しなければなりません。
@z

@x
**To remove unused and dangling images:**
@y
**未使用の dangling なイメージの削除**
@z

@x
An **unused** image is an image which is not used by any running or stopped containers. An image becomes **dangling** when you build a new version of the image with the same tag.
@y
**未使用の** イメージとは、実行中、停止中のコンテナーのいずれからも利用されていないイメージのことです。
同一のタグを用いて、新たなバージョンのそのイメージをビルドしたときに、そのイメージが **dangling**（宙ぶらり）になります。
@z

@x
**To remove an unused or a dangling image:**
@y
**未使用の dangling なイメージの削除方法**
@z

@x
1. From the Docker menu, select **Dashboard** > **Images**. This displays a list of images on your disk.
2. Select the **Clean up** option from the **Images on disk** status bar.
3. Use the **Unused** and **Dangling** check boxes to select the type of images you would like to remove.
@y
1. Docker メニューから **Dashboard** > **Images** を実行します。
   これによりローカルディスク上のイメージ一覧が表示されます。
2. ステータスバー上の **Images on disk** から **Clean up** を選びます。
3. 削除jしたいイメージのタイプに合わせて **Unused** と **Dangling** のチェックボックスを選びます。
@z

@x
    The **Clean up** images status bar displays the total space you can reclaim by removing the selected images.
@y
    ステータスバーの **Clean up** イメージには、選択したイメージの削除によって増加するディスク総量が示されます。
@z

@x
4. Click **Remove** to confirm.
@y
4. 確認のために **Remove** をクリックします。
@z

@x
### Interact with remote repositories
@y
{: #interact-with-remote-repositories }
### リモートリポジトリとのやりとり
@z

@x
The Images view also allows you to manage and interact with images in remote repositories and lets you switch between organizations. Select an organization from the drop-down to view a list of repositories in your organization.
@y
Images 画面では、リモートリポジトリ内のイメージを管理したりやりとりしたりすることができます。
そして組織間を切り替えることもできます。
ドロップダウンメニューから組織を選択して、組織内のリポジトリの一覧を確認してください。
@z

@x
> **Note**
>
> If you have subscribed to a Pro or a Team plan and enabled [Vulnerability Scanning](../docker-hub/vulnerability-scanning.md) in Docker Hub, the scan results will appear on the Remote repositories tab.
@y
> **メモ**
>
> プロプランやチームプランを購入していて Docker Hub における [ぜい弱性スキャン](../docker-hub/vulnerability-scanning.md) を有効にしている場合、スキャン結果は Remote repositories タブに表示されます。
@z

@x
The **Pull** option allows you to pull the latest version of the image from Docker Hub. The **View in Hub** option opens the Docker Hub page and displays detailed information about the image, such as the OS architecture, size of the image, the date when the image was pushed, and a list of the image layers.
@y
**Pull** オプションを使うと、Docker Hub から最新版イメージをプルすることができます。
**View in Hub** オプションを使うと Docker Hub ページが開き、イメージに関する詳細情報が表示されます。
たとえば OS アーキテクチャー、イメージサイズ、イメージのプッシュ日付、イメージレイヤー一覧などです。
@z

@x
![Images in remote repositories](images/image-details.png){:width="700px"}
@y
![リモートリポジトリ内のイメージ](images/image-details.png){:width="700px"}
@z

@x
To interact with remote repositories:
@y
リモートリポジトリをやりとりするには以下を行います。
@z

@x
1. Click the **Remote repositories** tab.
2. Select an organization from the drop-down list. This displays a list of repositories in your organization.
3. Click on an image from the list and then select **Pull** to pull the latest image from the remote repository.
4. To view a detailed information about the image in Docker Hub, select the image and then click **View in Hub**.

    The **View in Hub** option opens the Docker Hub page and displays detailed information about the image, such as the OS architecture, size of the image, the date when the image was pushed, and a list of the image layers.
@y
1. **Remote repositories** タブをクリックします。
2. ドロップダウンリストから組織を選択します。
   これにより組織内のリポジトリ一覧が表示されます。
3. 一覧の中からイメージをクリックしてから **Pull** を選び、リモートリポジトリから最新イメージをプルします。
4. Docker Hub 内のイメージに関する詳細情報を確認するには、イメージを選択して **View in Hub** をクリックします。

   **View in Hub** オプションは Docker Hub ページを開いて、イメージの詳細情報を表示します。
   たとえば OS アーキテクチャー、イメージサイズ、イメージ公開日、イメージレイヤー一覧などです。
@z

@x
    If you have subscribed to a Pro or a Team plan and have enabled [Vulnerability Scanning](../docker-hub/vulnerability-scanning.md) the Docker Hub page also displays a summary of the vulnerability scan report and provides detailed information about the vulnerabilities identified.
@y
    If you have subscribed to a Pro or a Team plan and have enabled [Vulnerability Scanning](../docker-hub/vulnerability-scanning.md) the Docker Hub page also displays a summary of the vulnerability scan report and provides detailed information about the vulnerabilities identified.
@z

@x
## Explore volumes
@y
{: #explore-volumes }
## ボリュームの確認
@z

@x
The **Volumes** view in Docker Dashboard enables you to easily create and delete [volumes](../storage/volumes/index.md) and see which ones are being used. If you are a developer subscribed to a Pro or a Team plan, you can also see which container is using a specific volume and explore the files and folders in your volumes.
@y
Docker Dashboard の **Volumes** 画面では、[ボリューム](../storage/volumes/index.md) の生成削除や、どれが利用中であるかの確認が簡単にできます。
Pro プランや Team プランを購入している開発者であれば、特定のボリュームを利用するコンテナーがどれであって、そのボリューム内にどのようなファイルやフォルダーがあるのかも確認できます。
@z

@x
> [Upgrade](https://www.docker.com/pricing?utm_source=docker&utm_medium=webreferral&utm_campaign=docs_driven_upgrade){: target="_blank" rel="noopener" class="_"} your existing account to a Pro or a Team plan to start exploring the details in your volume.
@y
> 既存のプランを Pro プランや Team プランに [アップグレード](https://www.docker.com/pricing?utm_source=docker&utm_medium=webreferral&utm_campaign=docs_driven_upgrade){: target="_blank" rel="noopener" class="_"} して、ボリュームの詳細な確認を始めてみてください。
@z

@x
### Manage volumes
@y
{: #manage-volumes }
### ボリュームの管理
@z

@x
By default, the **Volumes** view displays a list of all the volumes.
@y
By default, the **Volumes** view displays a list of all the volumes.
@z

@x
![List volumes](images/volumes-list.png){:width="700px"}
@y
![ボリューム一覧](images/volumes-list.png){:width="700px"}
@z

@x
To explore the details of a specific volume, select a volume from the list. This opens the detailed view.
@y
特定のボリュームを詳細に確認するには、まず一覧の中からそのボリュームを選択します。
そこからは詳細画面が開きます。
@z

@x
The **In Use** tab displays the name of the container that’s using the volume, the image name, the port number used by the container, CPU, memory, disk read/write, and network I/O consumed by the container.
@y
The **In Use** tab displays the name of the container that’s using the volume, the image name, the port number used by the container, CPU, memory, disk read/write, and network I/O consumed by the container.
@z

@x
The **Data** tab displays the files and folders in the volume and their file size. To save a file or a folder, hover over the file or folder and click on the more options menu. Select **Save As** and then specify a location to download the file.
@y
**Data** タブには、そのボリューム内にあるファイルやフォルダーと、そのサイズが表示されます。
To save a file or a folder, hover over the file or folder and click on the more options menu. Select **Save As** and then specify a location to download the file.
@z

@x
To delete a file or a folder from the volume, select **Remove** from the more options menu.
@y
To delete a file or a folder from the volume, select **Remove** from the more options menu.
@z

@x
### Remove a volume
@y
### Remove a volume
@z

@x
Removing a volume deletes the volume and all its data. To remove a volume, hover over the volume and then click the **Delete** button. Alternatively, select the volume from the list and then click the **Delete** button.
@y
Removing a volume deletes the volume and all its data. To remove a volume, hover over the volume and then click the **Delete** button. Alternatively, select the volume from the list and then click the **Delete** button.
@z
