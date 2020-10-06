%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Using Docker Machine to provision hosts on DigitalOcean
keywords: docker, machine, cloud, digitalocean
title: DigitalOcean example
hide_from_sitemap: true
---
@y
---
description: Using Docker Machine to provision hosts on DigitalOcean
keywords: docker, machine, cloud, digitalocean
title: DigitalOcean 利用例
hide_from_sitemap: true
---
@z

@x
Follow along with this example to create a Dockerized [DigitalOcean](https://digitalocean.com) Droplet (cloud host).
@y
{% comment %}
Follow along with this example to create a Dockerized [DigitalOcean](https://digitalocean.com) Droplet (cloud host).
{% endcomment %}
以下に示す例に従って、Docker 化された [DigitalOcean](https://digitalocean.com) ドロップレット（クラウドホスト）を生成します。
@z

@x
### Step 1. Create a DigitalOcean account
@y
{% comment %}
### Step 1. Create a DigitalOcean account
{% endcomment %}
{: #step-1-create-a-digitalocean-account }
### ステップ 1. DigitalOcean アカウントの生成
@z

@x
If you have not done so already, go to [DigitalOcean](https://digitalocean.com), create an account, and log in.
@y
{% comment %}
If you have not done so already, go to [DigitalOcean](https://digitalocean.com), create an account, and log in.
{% endcomment %}
[DigitalOcean](https://digitalocean.com) のアカウントをまだ生成していない場合は、サイトにアクセスしてアカウントを生成し、ログインします。
@z

@x
### Step 2. Generate a personal access token
@y
{% comment %}
### Step 2. Generate a personal access token
{% endcomment %}
{: #step-2-generate-a-personal-access-token }
### ステップ 2. 個人用アクセストークンの生成
@z

@x
To generate your access token:
@y
{% comment %}
To generate your access token:
{% endcomment %}
個人用のアクセストークンを以下のようにして生成します。
@z

@x
1.  Go to the DigitalOcean administrator console and click **API** in the header.
@y
{% comment %}
1.  Go to the DigitalOcean administrator console and click **API** in the header.
{% endcomment %}
1.  DigitalOcean の管理コンソールにアクセスし、ヘッダーにある **API** をクリックします。
@z

@x
    ![Click API in DigitalOcean console](../img/ocean_click_api.png)
@y
    {% comment %}
    ![Click API in DigitalOcean console](../img/ocean_click_api.png)
    {% endcomment %}
    ![DigitalOcean コンソールでの API クリック](../img/ocean_click_api.png)
@z

@x
2.  Click **Generate new token** to get to the token generator.
@y
{% comment %}
2.  Click **Generate new token** to get to the token generator.
{% endcomment %}
2.  **Generate new token**（新たなトークンの生成）をクリックしてトークン生成画面に進みます。
@z

@x
    ![Generate token](../img/ocean_gen_token.png)
@y
    {% comment %}
    ![Generate token](../img/ocean_gen_token.png)
    {% endcomment %}
    ![トークンの生成](../img/ocean_gen_token.png)
@z

@x
3.  Give the token a descriptive name, make sure the **Write (Optional)** checkbox is checked, and click **Generate Token**.
@y
{% comment %}
3.  Give the token a descriptive name, make sure the **Write (Optional)** checkbox is checked, and click **Generate Token**.
{% endcomment %}
3.  トークンに対するわかりやすい名前を入力して、チェックボックス **Write (Optional)** をチェックします。
    そして **Generate Token**（トークンの生成）をクリックします。
@z

@x
    ![Name and generate token](../img/ocean_token_create.png)
@y
    {% comment %}
    ![Name and generate token](../img/ocean_token_create.png)
    {% endcomment %}
    ![トークンの命名と生成](../img/ocean_token_create.png)
@z

@x
4.  Grab (copy to clipboard) the generated big long hex string and store it somewhere safe.
@y
{% comment %}
4.  Grab (copy to clipboard) the generated big long hex string and store it somewhere safe.
{% endcomment %}
4.  画面上に生成された長い 16 進数文字列を取得して（クリップボードにコピーして）どこか安全な場所に保存します。
@z

@x
    ![Copy and save personal access token](../img/ocean_save_token.png)
@y
    {% comment %}
    ![Copy and save personal access token](../img/ocean_save_token.png)
    {% endcomment %}
    ![個人用アクセストークンのコピーと保存](../img/ocean_save_token.png)
@z

@x
    This is the personal access token used in the next step to create your cloud server.
@y
    {% comment %}
    This is the personal access token used in the next step to create your cloud server.
    {% endcomment %}
    これが個人用のアクセストークンであり、クラウドサーバー生成のために次のステップで利用します。
@z

@x
### Step 3. Use Machine to create the Droplet
@y
{% comment %}
### Step 3. Use Machine to create the Droplet
{% endcomment %}
{: #step-3-use-machine-to-create-the-droplet }
### ステップ 3. Machine を使ったドロップレットの生成
@z

@x
1.  Run `docker-machine create` with the `digitalocean` driver and pass your key to the `--digitalocean-access-token` flag, along with a name for the new cloud server.
@y
{% comment %}
1.  Run `docker-machine create` with the `digitalocean` driver and pass your key to the `--digitalocean-access-token` flag, along with a name for the new cloud server.
{% endcomment %}
1.  ドライバーに`digitalocean`を指定して`docker-machine create`コマンドを実行します。
    トークンは`--digitalocean-access-token`フラグに指定します。
    また新たなクラウドサーバーに対する名前を指定します。
@z

@x
    For this example, the new Droplet is called `docker-sandbox`:
@y
    {% comment %}
    For this example, the new Droplet is called `docker-sandbox`:
    {% endcomment %}
    以下の例では、新たなドロップレットを`docker-sandbox`とします。
@z

@x
    ```none
    $ docker-machine create --driver digitalocean --digitalocean-access-token xxxxx docker-sandbox
    Running pre-create checks...
    Creating machine...
    (docker-sandbox) OUT | Creating SSH key...
    (docker-sandbox) OUT | Creating Digital Ocean droplet...
    (docker-sandbox) OUT | Waiting for IP address to be assigned to the Droplet...
    Waiting for machine to be running, this may take a few minutes...
    Machine is running, waiting for SSH to be available...
    Detecting operating system of created instance...
    Detecting the provisioner...
    Provisioning created instance...
    Copying certs to the local machine directory...
    Copying certs to the remote machine...
    Setting Docker configuration on the remote daemon...
    To see how to connect Docker to this machine, run: docker-machine env docker-sandbox
    ```
@y
    ```none
    $ docker-machine create --driver digitalocean --digitalocean-access-token xxxxx docker-sandbox
    Running pre-create checks...
    Creating machine...
    (docker-sandbox) OUT | Creating SSH key...
    (docker-sandbox) OUT | Creating Digital Ocean droplet...
    (docker-sandbox) OUT | Waiting for IP address to be assigned to the Droplet...
    Waiting for machine to be running, this may take a few minutes...
    Machine is running, waiting for SSH to be available...
    Detecting operating system of created instance...
    Detecting the provisioner...
    Provisioning created instance...
    Copying certs to the local machine directory...
    Copying certs to the remote machine...
    Setting Docker configuration on the remote daemon...
    To see how to connect Docker to this machine, run: docker-machine env docker-sandbox
    ```
@z

@x
      When the Droplet is created, Docker generates a unique SSH key and stores it on your local system in `~/.docker/machines`. Initially, this is used to provision the host. Later, it's used under the hood to access the Droplet directly with the `docker-machine ssh` command. Docker Engine is installed on the cloud server and the daemon is configured to accept remote connections over TCP using TLS for authentication.
@y
      {% comment %}
      When the Droplet is created, Docker generates a unique SSH key and stores it on your local system in `~/.docker/machines`. Initially, this is used to provision the host. Later, it's used under the hood to access the Droplet directly with the `docker-machine ssh` command. Docker Engine is installed on the cloud server and the daemon is configured to accept remote connections over TCP using TLS for authentication.
      {% endcomment %}
      ドロップレットが生成されると、Docker はユニークな SSH 鍵を生成して、ローカルシステムの`~/.docker/machines`に保存します。
      はじめにこの鍵は、ホストのプロビジョニングに用いられます。
      そして後には、`docker-machine ssh`コマンドを通じて、ドロップレットに直接アクセスするために用いられます。
      Docker Engine はクラウドサーバー上にインストールされ、Docker デーモンの TCP リモート接続を可能とするために TLS 認証を用いるように設定されます。
@z

@x
2. Go to the DigitalOcean console to view the new Droplet.
@y
{% comment %}
2. Go to the DigitalOcean console to view the new Droplet.
{% endcomment %}
2. DigitalOcean コンソールにアクセスして、新たなドロップレットを確認してみます。
@z

@x
    ![Droplet in DigitalOcean created with Machine](../img/ocean_droplet.png)
@y
    {% comment %}
    ![Droplet in DigitalOcean created with Machine](../img/ocean_droplet.png)
    {% endcomment %}
    ![Machine により生成された DigitalOcean のドロップレット](../img/ocean_droplet.png)
@z

@x
3. At the command terminal, run `docker-machine ls`.
@y
{% comment %}
3. At the command terminal, run `docker-machine ls`.
{% endcomment %}
3. コマンドターミナル画面から`docker-machine ls`を実行します。
@z

@x
        $ docker-machine ls
        NAME             ACTIVE   DRIVER         STATE     URL                         SWARM
        default          -        virtualbox     Running   tcp://192.168.99.100:2376
        docker-sandbox   *        digitalocean   Running   tcp://45.55.139.48:2376
@y
        $ docker-machine ls
        NAME             ACTIVE   DRIVER         STATE     URL                         SWARM
        default          -        virtualbox     Running   tcp://192.168.99.100:2376
        docker-sandbox   *        digitalocean   Running   tcp://45.55.139.48:2376
@z

@x
    The new `docker-sandbox` machine is running, and it is the active host as
    indicated by the asterisk (\*). When you create a new machine, your command
    shell automatically connects to it. If for some reason your new machine is
    not the active host, run `docker-machine env docker-sandbox`, followed by
    `eval $(docker-machine env docker-sandbox)` to connect to it.
@y
    {% comment %}
    The new `docker-sandbox` machine is running, and it is the active host as
    indicated by the asterisk (\*). When you create a new machine, your command
    shell automatically connects to it. If for some reason your new machine is
    not the active host, run `docker-machine env docker-sandbox`, followed by
    `eval $(docker-machine env docker-sandbox)` to connect to it.
    {% endcomment %}
    新たな`docker-sandbox`マシンが実行されています。
    それがアクティブホストとなっていることが、アスタリスク（\*）の表示からわかります。
    さらに新たなマシンを生成すると、コマンドシェルは自動的にそのマシンに接続されます。
    何らかの理由によりマシンがアクティブホストでない場合は、`docker-machine env docker-sandbox`を実行した上で、`eval $(docker-machine env docker-sandbox)`を実行し、マシンへの接続を行います。
@z

@x
### Step 4. Run Docker commands on the Droplet
@y
{% comment %}
### Step 4. Run Docker commands on the Droplet
{% endcomment %}
{: #step-4-run-docker-commands-on-the-droplet }
### ステップ 4. ドロップレット上での Docker コマンド実行
@z

@x
1. Run some `docker-machine` commands to inspect the remote host. For example, `docker-machine ip <machine>` gets the host IP address and `docker-machine inspect <machine>` lists all the details.
@y
{% comment %}
1. Run some `docker-machine` commands to inspect the remote host. For example, `docker-machine ip <machine>` gets the host IP address and `docker-machine inspect <machine>` lists all the details.
{% endcomment %}
1. リモートホストが確認できる`docker-machine`コマンドを実行します。
   たとえば`docker-machine ip <マシン名>`は、ホストの IP アドレスを取得します。
   また`docker-machine inspect <マシン名>`はマシンの詳細を一覧表示します。
@z

@x
        $ docker-machine ip docker-sandbox
        104.131.43.236
@y
        $ docker-machine ip docker-sandbox
        104.131.43.236
@z

@x
        $ docker-machine inspect docker-sandbox
        {
            "ConfigVersion": 3,
            "Driver": {
            "IPAddress": "104.131.43.236",
            "MachineName": "docker-sandbox",
            "SSHUser": "root",
            "SSHPort": 22,
            "SSHKeyPath": "/Users/samanthastevens/.docker/machine/machines/docker-sandbox/id_rsa",
            "StorePath": "/Users/samanthastevens/.docker/machine",
            "SwarmMaster": false,
            "SwarmHost": "tcp://0.0.0.0:3376",
            "SwarmDiscovery": "",
            ...
@y
        $ docker-machine inspect docker-sandbox
        {
            "ConfigVersion": 3,
            "Driver": {
            "IPAddress": "104.131.43.236",
            "MachineName": "docker-sandbox",
            "SSHUser": "root",
            "SSHPort": 22,
            "SSHKeyPath": "/Users/samanthastevens/.docker/machine/machines/docker-sandbox/id_rsa",
            "StorePath": "/Users/samanthastevens/.docker/machine",
            "SwarmMaster": false,
            "SwarmHost": "tcp://0.0.0.0:3376",
            "SwarmDiscovery": "",
            ...
@z

@x
2. Verify Docker Engine is installed correctly by running `docker` commands.
@y
{% comment %}
2. Verify Docker Engine is installed correctly by running `docker` commands.
{% endcomment %}
2. Docker Engine が正しくインストールできていることを確認するために`docker`コマンドを実行します。
@z

@x
    Start with something basic like `docker run hello-world`, or for a more interesting test, run a Dockerized webserver on your new remote machine.
@y
    {% comment %}
    Start with something basic like `docker run hello-world`, or for a more interesting test, run a Dockerized webserver on your new remote machine.
    {% endcomment %}
    たとえば`docker run hello-world`のような簡単なコマンドから実行してみてください。
    あるいはもっとおもしろい確認として、Docker 化されたウェブサーバーをリモートマシン上に起動してみます。
@z

@x
    In this example, the `-p` option is used to expose port 80 from the `nginx` container and make it accessible on port `8000` of the `docker-sandbox` host.
@y
    {% comment %}
    In this example, the `-p` option is used to expose port 80 from the `nginx` container and make it accessible on port `8000` of the `docker-sandbox` host.
    {% endcomment %}
    以下の例において`-p`オプションは、`nginx`コンテナーのポート 80 を公開する指定であり、`docker-sandbox`ホストのポート`8000`からアクセスできるようにします。
@z

@x
        $ docker run -d -p 8000:80 --name webserver kitematic/hello-world-nginx
        Unable to find image 'kitematic/hello-world-nginx:latest' locally
        latest: Pulling from kitematic/hello-world-nginx
        a285d7f063ea: Pull complete
        2d7baf27389b: Pull complete
        ...
        Digest: sha256:ec0ca6dcb034916784c988b4f2432716e2e92b995ac606e080c7a54b52b87066
        Status: Downloaded newer image for kitematic/hello-world-nginx:latest
        942dfb4a0eaae75bf26c9785ade4ff47ceb2ec2a152be82b9d7960e8b5777e65
@y
        $ docker run -d -p 8000:80 --name webserver kitematic/hello-world-nginx
        Unable to find image 'kitematic/hello-world-nginx:latest' locally
        latest: Pulling from kitematic/hello-world-nginx
        a285d7f063ea: Pull complete
        2d7baf27389b: Pull complete
        ...
        Digest: sha256:ec0ca6dcb034916784c988b4f2432716e2e92b995ac606e080c7a54b52b87066
        Status: Downloaded newer image for kitematic/hello-world-nginx:latest
        942dfb4a0eaae75bf26c9785ade4ff47ceb2ec2a152be82b9d7960e8b5777e65
@z

@x
    In a web browser, go to `http://<host_ip>:8000` to bring up the webserver home page. You got the `<host_ip>` from the output of the `docker-machine ip <machine>` command you ran in a previous step. Use the port you exposed in the `docker run` command.
@y
    {% comment %}
    In a web browser, go to `http://<host_ip>:8000` to bring up the webserver home page. You got the `<host_ip>` from the output of the `docker-machine ip <machine>` command you ran in a previous step. Use the port you exposed in the `docker run` command.
    {% endcomment %}
    ウェブブラウザーから`http://<ホストIP>:8000`にアクセスして、ウェブサーバーのホームページを開きます。
    `<host_ip>`は、前のステップにおいて実行したコマンド`docker-machine ip <マシン名>`の出力結果から、すでに取得できているものです。
    また指定するポートは、`docker run`コマンドにおいて指定したものです。
@z

@x
    ![nginx webserver](../img/nginx-webserver.png)
@y
    {% comment %}
    ![nginx webserver](../img/nginx-webserver.png)
    {% endcomment %}
    ![Nginx ウェブサーバー](../img/nginx-webserver.png)
@z

@x
### Step 5. Use Machine to remove the Droplet
@y
{% comment %}
### Step 5. Use Machine to remove the Droplet
{% endcomment %}
{: #step-5-use-machine-to-remove-the-droplet }
### ステップ 5. Machine を使ったドロップレットの削除
@z

@x
To remove a host and all of its containers and images, first stop the machine, then use `docker-machine rm`:
@y
{% comment %}
To remove a host and all of its containers and images, first stop the machine, then use `docker-machine rm`:
{% endcomment %}
ホストとそのコンテナーやイメージを削除するには、その前にマシンを停止させ、それから`docker-machine rm`コマンドを実行します。
@z

@x
    $ docker-machine stop docker-sandbox
    $ docker-machine rm docker-sandbox
    Do you really want to remove "docker-sandbox"? (y/n): y
    Successfully removed docker-sandbox
@y
    $ docker-machine stop docker-sandbox
    $ docker-machine rm docker-sandbox
    Do you really want to remove "docker-sandbox"? (y/n): y
    Successfully removed docker-sandbox
@z

@x
    $ docker-machine ls
    NAME      ACTIVE   DRIVER       STATE     URL                         SWARM
    default   *        virtualbox   Running   tcp:////xxx.xxx.xx.xxx:xxxx
@y
    $ docker-machine ls
    NAME      ACTIVE   DRIVER       STATE     URL                         SWARM
    default   *        virtualbox   Running   tcp:////xxx.xxx.xx.xxx:xxxx
@z

@x
If you monitor the DigitalOcean console while you run these commands, notice
that it updates first to reflect that the Droplet was stopped, and then removed.
@y
{% comment %}
If you monitor the DigitalOcean console while you run these commands, notice
that it updates first to reflect that the Droplet was stopped, and then removed.
{% endcomment %}
上のコマンド実行の際に DigitalOcean コンソールを確認していたら、まずドロップレットが停止され、次にドロップレットが削除される様子がわかります。
@z

@x
If you create a host with Docker Machine, but remove it through the cloud
provider console, Machine loses track of the server status. Use the
`docker-machine rm` command for hosts you create with `docker-machine create`.
@y
{% comment %}
If you create a host with Docker Machine, but remove it through the cloud
provider console, Machine loses track of the server status. Use the
`docker-machine rm` command for hosts you create with `docker-machine create`.
{% endcomment %}
Docker Machine を使ってホストを生成しておいて、その削除をクラウドプロバイダーコンソールから行ったとしたら、Docker Machine はサーバーの状態を追跡できないことになります。
`docker-machine create`を使って生成したホストは、`docker-machine rm`コマンドを使うようにしてください。
@z

@x
## Where to go next
@y
{% comment %}
## Where to go next
{% endcomment %}
{: #where-to-go-next }
## 次に読むものは
@z

@x
-   [Understand Machine concepts](../concepts.md)
-   [Docker Machine driver reference](../drivers/index.md)
-   [Docker Machine subcommand reference](../reference/index.md)
-   [Create containers for your Docker Machine](../../get-started/part2.md)
-   [Provision a Docker Swarm cluster with Docker Machine](../../swarm/provision-with-machine.md)
@y
{% comment %}
-   [Understand Machine concepts](../concepts.md)
-   [Docker Machine driver reference](../drivers/index.md)
-   [Docker Machine subcommand reference](../reference/index.md)
-   [Create containers for your Docker Machine](../../get-started/part2.md)
-   [Provision a Docker Swarm cluster with Docker Machine](../../swarm/provision-with-machine.md)
{% endcomment %}
-   [Machine の考え方](../concepts.md)
-   [Docker Machine ドライバーライセンス](../drivers/index.md)
-   [Docker Machine サブコマンドリファレンス](../reference/index.md)
-   [Docker Machine におけるコンテナー生成](../../get-started/part2.md)
-   [Docker Machine を使った Docker Swarm クラスターのプロビジョニング](../../swarm/provision-with-machine.md)
@z
