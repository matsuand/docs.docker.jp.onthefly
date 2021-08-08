%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Using Docker Machine to provision hosts on AWS
keywords: docker, machine, cloud, aws
title: Amazon Web Services (AWS) EC2 example
---
@y
---
description: Using Docker Machine to provision hosts on AWS
keywords: docker, machine, cloud, aws
title: Amazon ウェブサービス (AWS) EC2 の利用例
---
@z

@x
Follow along with this example to create a Dockerized [Amazon Web Services (AWS)](https://aws.amazon.com/) EC2 instance.
@y
以下に示す例に従って、Docker 化された [Amazon ウェブサービス (AWS)](https://aws.amazon.com/) EC2 インスタンスを生成します。
@z

@x
### Step 1. Sign up for AWS and configure credentials
@y
{: #step-1-sign-up-for-aws-and-configure-credentials }
### ステップ 1. AWS へのサインアップと資格情報の設定
@z

@x
1.  If you are not already an AWS user, sign up for [AWS](https://aws.amazon.com/) to create an account and get root access to EC2 cloud computers.
@y
1.  まだ AWS ユーザーになっていない場合は [AWS](https://aws.amazon.com/) にサインアップしてアカウントを生成し、EC2 クラウドコンピューターへのルートアクセスを行ってください。
@z

@x
    If you have an Amazon account, you can use it as your root user account.
@y
    Amazon アカウントを持っていれば、これをルートユーザーアカウントとして利用できます。
@z

@x
2.  Create an IAM (Identity and Access Management) administrator user, an admin group, and a key pair associated with a region.
@y
2.  IAM (Identity and Access Management) 管理ユーザー、管理グループ、地域に関連づいたキーペアを生成します。
@z

@x
    From the AWS menus, select **Services** > **IAM** to get started.
@y
    AWS メニューから **Services** > **IAM** を選んで進めます。
@z

@x
    To create machines on AWS, you must supply two parameters:
@y
    AWS 上にマシンを生成するには、以下の 2 つのパラメーターを指定する必要があります。
@z

@x
    * an AWS Access Key ID
@y
    * AWS アクセスキー ID
@z

@x
    * an AWS Secret Access Key
@y
    * AWS シークレットアクセスキー
@z

@x
    See the AWS documentation on [Setting Up with Amazon EC2](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/get-set-up-for-amazon-ec2.html). Follow the steps for "Create an IAM User" and "Create a Key Pair".
@y
    AWS のドキュメント [Setting Up with Amazon EC2](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/get-set-up-for-amazon-ec2.html) を参照してください。
    そして「Create an IAM User」と「Create a Key Pair」の手順に従ってください。
@z

@x
### Step 2. Use Machine to create the instance
@y
{: #step-2-use-machine-to-create-the-instance }
### ステップ 2. Machine を使ったインスタンス生成
@z

@x
1.  Optionally, create an AWS credential file.
@y
1.  任意の操作として、AWS の資格情報（credential）ファイルを生成します。
@z

@x
    You can create an `~/.aws/credentials` file to hold your AWS keys so that
    you don't need to type them every time you run the `docker-machine create`
    command. Here is an example of a credentials file.
@y
    `~/.aws/credentials`というファイルを生成して、そこに AWS キーを保存しておくことができます。
    こうしておくと、`docker-machine create`コマンドを実行するたびに、キーの入力を行わなくて済むようになります。
    以下はその資格情報ファイルの例です。
@z

@x
    ```conf
    [default]
    aws_access_key_id = AKID1234567890
    aws_secret_access_key = MY-SECRET-KEY
    ```
@y
    ```conf
    [default]
    aws_access_key_id = AKID1234567890
    aws_secret_access_key = MY-SECRET-KEY
    ```
@z

@x
2.  Run `docker-machine create` with the `amazonec2` driver, credentials, inbound
    port, region, and a name for the new instance. For example:
@y
2.  `docker-machine create`を実行します。
    ドライバーとして`amazonec2`を指定し、さらに資格情報、インバウンドポート、地域、新たなインスタンス名を指定します。
    たとえば以下のとおりです。
@z

@x
    ```console
    $ docker-machine create --driver amazonec2 --amazonec2-open-port 8000 --amazonec2-region us-west-1 aws-sandbox
    ```
@y
    ```console
    $ docker-machine create --driver amazonec2 --amazonec2-open-port 8000 --amazonec2-region us-west-1 aws-sandbox
    ```
@z

@x
    > **Note**: For all aws create flags, run: `docker-machine create --driver amazonec2 --help`
@y
    > **メモ**: AWS の create フラグについては`docker-machine create --driver amazonec2 --help`を実行して確認してください。
@z

@x
    **Use aws credentials file**
@y
    **AWS 資格情報ファイルの利用**
@z

@x
    If you set your keys in a credentials file, the command looks like this to
    create an instance called `aws-sandbox`:
@y
    キーを資格情報ファイル内に設定している場合、たとえば`aws-sandbox`という名のインスタンスを生成するコマンドは、以下のようになります。
@z

@x
    ```console
    $ docker-machine create --driver amazonec2 aws-sandbox
    ```
@y
    ```console
    $ docker-machine create --driver amazonec2 aws-sandbox
    ```
@z

@x
    **Specify keys at the command line**
@y
    **コマンドライン上でのキー指定**
@z

@x
    If you don't have a credentials file, you can use the flags
    `--amazonec2-access-key` and `--amazonec2-secret-key` on the command line:
@y
    資格情報ファイルを設定していない場合、コマンドライン実行において`--amazonec2-access-key`フラグと`--amazonec2-secret-key`フラグを利用します。
@z

@x
    ```console
    $ docker-machine create --driver amazonec2 --amazonec2-access-key AKI******* --amazonec2-secret-key 8T93C*******  aws-sandbox
    ```
@y
    ```console
    $ docker-machine create --driver amazonec2 --amazonec2-access-key AKI******* --amazonec2-secret-key 8T93C*******  aws-sandbox
    ```
@z

@x
    **Expose a port**
@y
    **ポートの公開**
@z

@x
    To expose an inbound port to the new machine, use the flag, `--amazonec2-open-port`:
@y
    新たなマシンに対してインバウンドポートを公開するには、`--amazonec2-open-port`フラグを使います。
@z

@x
    ```console
    $ docker-machine create --driver amazonec2 --amazonec2-open-port 8000 aws-sandbox
    ```
@y
    ```console
    $ docker-machine create --driver amazonec2 --amazonec2-open-port 8000 aws-sandbox
    ```
@z

@x
    **Specify a region**
@y
    **地域の設定**
@z

@x
    By default, the driver creates new instances in region us-east-1 (North
    Virginia). You can specify a different region by using the
    `--amazonec2-region` flag. For example, create aws-sandbox in us-west-1
    (Northern California).
@y
    ドライバーが生成するインスタンスの地域（region）設定は、デフォルトで us-east-1 (North Virginia) です。
    これは`--amazonec2-region`フラグを使って、別の地域に設定することができます。
    たとえば以下は aws-sandbox を us-west-1 (Northern California) により生成するものです。
@z

@x
    ```console
    $ docker-machine create --driver amazonec2 --amazonec2-region us-west-1 aws-sandbox
    ```
@y
    ```console
    $ docker-machine create --driver amazonec2 --amazonec2-region us-west-1 aws-sandbox
    ```
@z

@x
3.  Go to the AWS EC2 Dashboard to view the new instance.
@y
3.  AWS EC2 ダッシュボードにアクセスして、新たなインスタンスを確認してみます。
@z

@x
    Log into AWS with your IAM credentials, and navigate to your EC2 Running Instances.
@y
    IAM 資格情報を使って AWS にログインします。
    そして EC2 の Running Instances 一覧にアクセスします。
@z

@x
    ![instance on AWS EC2 Dashboard](../img/aws-instance-east.png)
@y
    ![AWS EC2 ダッシュボード上のインスタンス](../img/aws-instance-east.png)
@z

@x
    > **Note**: To ensure that you see your new instance, select your region from
    > the menu in the upper right. If you did not specify a region as part of
    > `docker-machine create` (with the optional `--amazonec2-region` flag), select
    > the default, US East (N. Virginia).
@y
    > **メモ**: 新たなインスタンスを確認するためには、画面右上にあるメニューから地域を設定してください。
    > `docker-machine create`コマンドの実行に際して（`--amazonec2-region`フラグを使って）地域の設定を行っていなかった場合は、地域のデフォルト、つまり US East (N. Virginia) を選んでください。
@z

@x
4.  Ensure that your new machine is the active host.
@y
4.  新たなマシンがアクティブホストになっていることを確認します。
@z

@x
    ```console
    $ docker-machine ls
    NAME             ACTIVE   DRIVER         STATE     URL                         SWARM   DOCKER        ERRORS
    aws-sandbox      *        amazonec2      Running   tcp://52.90.113.128:2376            v1.10.0
    default          -        virtualbox     Running   tcp://192.168.99.100:2376           v1.10.0-rc4
    digi-sandbox       -      digitalocean   Running   tcp://104.131.43.236:2376           v1.9.1
    ```
@y
    ```console
    $ docker-machine ls
    NAME             ACTIVE   DRIVER         STATE     URL                         SWARM   DOCKER        ERRORS
    aws-sandbox      *        amazonec2      Running   tcp://52.90.113.128:2376            v1.10.0
    default          -        virtualbox     Running   tcp://192.168.99.100:2376           v1.10.0-rc4
    digi-sandbox       -      digitalocean   Running   tcp://104.131.43.236:2376           v1.9.1
    ```
@z

@x
    The new `aws-sandbox` instance is running and is the active host as
    indicated by the asterisk (\*). When you create a new machine, your command
    shell automatically connects to it. You can also check active status by
    running `docker-machine active`.
@y
    新たな`aws-sandbox`インスタンスが実行されています。
    それがアクティブホストとなっていることが、アスタリスク（\*）の表示からわかります。
    さらに新たなマシンを生成すると、コマンドシェルは自動的にそのマシンに接続されます。
    アクティブステータスであるかどうかは`docker-machine active`を実行して確認することもできます。
@z

@x
    > **Note**: If your new machine is not the active host, connect to it by
    running `docker-machine env aws-sandbox` and the returned eval command:
    `eval $(docker-machine env aws-sandbox)`.
@y
    > **メモ**: 新たなマシンがアクティブホストでない場合は、`docker-machine env aws-sandbox`を実行して返ってくる eval コマンド`eval $(docker-machine env aws-sandbox)`を使ってマシンへの接続を行います。
@z

@x
5. Inspect the remote host. For example, `docker-machine ip <machine>` returns
the host IP address and `docker-machine inspect <machine>` lists all the
details.
@y
5. リモートホストを確認してみます。
   たとえば`docker-machine ip <マシン名>`は、ホストの IP アドレスを取得します。
   また`docker-machine inspect <マシン名>`はマシンの詳細を一覧表示します。
@z

@x
    ```console
    $ docker-machine ip aws-sandbox
    192.168.99.100
@y
    ```console
    $ docker-machine ip aws-sandbox
    192.168.99.100
@z

@x
    $ docker-machine inspect aws-sandbox
    {
        "ConfigVersion": 3,
        "Driver": {
            "IPAddress": "52.90.113.128",
            "MachineName": "aws-sandbox",
            "SSHUser": "ubuntu",
            "SSHPort": 22,
            ...
          }
    }
    ```
@y
    $ docker-machine inspect aws-sandbox
    {
        "ConfigVersion": 3,
        "Driver": {
            "IPAddress": "52.90.113.128",
            "MachineName": "aws-sandbox",
            "SSHUser": "ubuntu",
            "SSHPort": 22,
            ...
          }
    }
    ```
@z

@x
### Step 3. Run Docker commands on the new instance
@y
{: #step-3-run-docker-commands-on-the-new-instance }
### ステップ 3. 新たなインスタンス上での Docker コマンド実行
@z

@x
You can run docker commands from a local terminal to the active docker machine.
@y
ローカルのターミナル画面からアクティブな Docker マシンに向けて、Docker コマンドを実行することができます。
@z

@x
1.  Run docker on the active docker machine by downloading and running the
hello-world image:
@y
1.  アクティブな Docker マシンに対して Docker コマンドを実行し、hello-world イメージのダウンロードと実行を行います。
@z

@x
    ```console
    $ docker run hello-world
    ```
@y
    ```console
    $ docker run hello-world
    ```
@z

@x
2. Ensure that you ran hello-world on aws-sandbox (and not localhost or some
other machine):
@y
2. hello-world を実行しているのが aws-sandbox 上であることを確認します。
   （ローカルホスト上でもなく別のマシン上でもありません。）
@z

@x
    Log on to aws-sandbox with ssh and list all containers. You should see
    hello-world (with a recent exited status):
@y
    SSH 接続により aws-sandbox にログオンして、コンテナー一覧を表示します。
    hello-world が確認できる（最新の終了ステータスとなっている）はずです。
@z

@x
    ```console
    $ docker-machine ssh aws-sandbox
    $ sudo docker container ls -a
    $ exit
    ```
@y
    ```console
    $ docker-machine ssh aws-sandbox
    $ sudo docker container ls -a
    $ exit
    ```
@z

@x
    Log off aws-sandbox and unset this machine as active. Then list images
    again. You should not see hello-world (at least not with the same exited
    status):
@y
    aws-sandbox からログオフして、このマシンのアクティブ状態を解除します。
    もう一度イメージの一覧を確認してみます。
    hello-world は一覧に表示されません。
    （少なくとも同一の終了ステータスでは存在しないはずです。）
@z

@x
    ```console
    $ eval $(docker-machine env -u)
    $ docker container ls -a
    ```
@y
    ```console
    $ eval $(docker-machine env -u)
    $ docker container ls -a
    ```
@z

@x
3. Reset aws-sandbox as the active docker machine:
@y
3. aws-sandbox をアクティブな Docker マシンからリセットします。
@z

@x
    ```console
    $ eval $(docker-machine env aws-sandbox)
    ```
@y
    ```console
    $ eval $(docker-machine env aws-sandbox)
    ```
@z

@x
    For a more interesting test, run a Dockerized webserver on your new machine.
@y
    あるいはもっとおもしろい確認として、Docker 化されたウェブサーバーを新たなマシン上に起動してみます。
@z

@x
    > **Note**: In this example, we use port `8000` which we added to the
    > docker-machine AWS Security Group during `docker-machine create`. To run your
    > container on another port, update the security group to reflect that.
@y
    > **メモ**: 以下の例においては、`docker-machine create`コマンドの実行時に、docker-machine の AWS セキュリティグループに対して追加したポート`8000`を利用しています。
    > コンテナーを別ポートにおいて実行するには、セキュリティグループを再設定して変更を反映させる必要があります。
@z

@x
    In this example, the `-p` option is used to expose port 80 from the `nginx`
    container and make it accessible on port `8000` of the `aws-sandbox` host:
@y
    以下の例において`-p`オプションは、`nginx`コンテナーのポート 80 を公開する指定であり、`aws-sandbox`ホストのポート`8000`からアクセスできるようにします。
@z

@x
    ```console
    $ docker run -d -p 8000:80 --name webserver kitematic/hello-world-nginx
    Unable to find image 'kitematic/hello-world-nginx:latest' locally
    latest: Pulling from kitematic/hello-world-nginx
    a285d7f063ea: Pull complete
    2d7baf27389b: Pull complete
    ...
    Digest: sha256:ec0ca6dcb034916784c988b4f2432716e2e92b995ac606e080c7a54b52b87066
    Status: Downloaded newer image for kitematic/hello-world-nginx:latest
    942dfb4a0eaae75bf26c9785ade4ff47ceb2ec2a152be82b9d7960e8b5777e65
    ```
@y
    ```console
    $ docker run -d -p 8000:80 --name webserver kitematic/hello-world-nginx
    Unable to find image 'kitematic/hello-world-nginx:latest' locally
    latest: Pulling from kitematic/hello-world-nginx
    a285d7f063ea: Pull complete
    2d7baf27389b: Pull complete
    ...
    Digest: sha256:ec0ca6dcb034916784c988b4f2432716e2e92b995ac606e080c7a54b52b87066
    Status: Downloaded newer image for kitematic/hello-world-nginx:latest
    942dfb4a0eaae75bf26c9785ade4ff47ceb2ec2a152be82b9d7960e8b5777e65
    ```
@z

@x
    In a web browser, go to `http://<host_ip>:8000` to bring up the webserver
    home page. You got the `<host_ip>` from the output of the `docker-machine ip <machine>`
    command you ran in a previous step. Use the port you exposed in the
    `docker run` command.
@y
    ウェブブラウザーから`http://<ホストIP>:8000`にアクセスして、ウェブサーバーのホームページを開きます。
    `<host_ip>`は、前のステップにおいて実行したコマンド`docker-machine ip <マシン名>`の出力結果から、すでに取得できているものです。
    また指定するポートは、`docker run`コマンドにおいて指定したものです。
@z

@x
    ![nginx webserver](../img/nginx-webserver.png)
@y
    ![nginx ウェブサーバー](../img/nginx-webserver.png)
@z

@x
### Step 4. Use Machine to remove the instance
@y
{: #step-4-use-machine-to-remove-the-instance }
### ステップ 4. Machine を使ったインスタンス削除
@z

@x
To remove an instance and all of its containers and images, first stop the
machine, then use `docker-machine rm`.
@y
インスタンスとそのコンテナーやイメージを削除するには、その前にマシンを停止させ、それから`docker-machine rm`コマンドを実行します。
@z

@x
## Where to go next
@y
{: #where-to-go-next }
## 次に読むものは
@z

@x
-   [Understand Machine concepts](../concepts.md)
-   [Docker Machine driver reference](../drivers/index.md)
-   [Docker Machine subcommand reference](../reference/index.md)
@y
-   [Machine の考え方](../concepts.md)
-   [Docker Machine ドライバーリファレンス](../drivers/index.md)
-   [Docker Machine サブコマンドリファレンス](../reference/index.md)
@z
