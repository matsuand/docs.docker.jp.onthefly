%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Controlling and configuring Docker using systemd
keywords: docker, daemon, systemd, configuration
redirect_from:
- /engine/articles/systemd/
- /articles/systemd/
- /engine/admin/systemd/
title: Control Docker with systemd
---
@y
---
description: Controlling and configuring Docker using systemd
keywords: docker, daemon, systemd, configuration
redirect_from:
- /engine/articles/systemd/
- /articles/systemd/
- /engine/admin/systemd/
title: systemd を用いた Docker の管理
---
@z

@x
Many Linux distributions use systemd to start the Docker daemon. This document
shows a few examples of how to customize Docker's settings.
@y
{% comment %}
Many Linux distributions use systemd to start the Docker daemon. This document
shows a few examples of how to customize Docker's settings.
{% endcomment %}
Linux ディストリビューションでは、Docker デーモンの起動に systemd を用いるものが多くあります。
このドキュメントでは Docker の設定例をいくつか示します。
@z

@x
## Start the Docker daemon
@y
{% comment %}
## Start the Docker daemon
{% endcomment %}
{: #start-the-docker-daemon }
## Docker デーモンの起動
@z

@x
### Start manually
@y
{% comment %}
### Start manually
{% endcomment %}
{: #start-manually }
### 手動で起動する場合
@z

@x
Once Docker is installed, you need to start the Docker daemon.
Most Linux distributions use `systemctl` to start services. If you
do not have `systemctl`, use the `service` command.
@y
{% comment %}
Once Docker is installed, you need to start the Docker daemon.
Most Linux distributions use `systemctl` to start services. If you
do not have `systemctl`, use the `service` command.
{% endcomment %}
Docker をインストールしたら Docker デーモンを起動する必要があります。
たいていの Linux ディストリビューションでは `systemctl` を使ってサービスを起動します。
`systemctl` がない場合は `service` コマンドを使ってください。
@z

@x
- **`systemctl`**:
@y
{% comment %}
- **`systemctl`**:
{% endcomment %}
- **`systemctl` の場合**
@z

@x
  ```bash
  $ sudo systemctl start docker
  ```
@y
  ```bash
  $ sudo systemctl start docker
  ```
@z

@x
- **`service`**:
@y
{% comment %}
- **`service`**:
{% endcomment %}
- **`service` の場合**
@z

@x
  ```bash
  $ sudo service docker start
  ```
@y
  ```bash
  $ sudo service docker start
  ```
@z

@x
### Start automatically at system boot
@y
{% comment %}
### Start automatically at system boot
{% endcomment %}
{: #start-automatically-at-system-boot }
### システムブート時に自動起動する場合
@z

@x
If you want Docker to start at boot, see
[Configure Docker to start on boot](../../engine/install/linux-postinstall.md#configure-docker-to-start-on-boot).
@y
{% comment %}
If you want Docker to start at boot, see
[Configure Docker to start on boot](../../engine/install/linux-postinstall.md#configure-docker-to-start-on-boot).
{% endcomment %}
Docker をシステムブート時に起動したい場合は [システムブート時の Docker 起動設定](../../engine/install/linux-postinstall.md#configure-docker-to-start-on-boot) を参照してください。
@z

@x
## Custom Docker daemon options
@y
{% comment %}
## Custom Docker daemon options
{% endcomment %}
{: #custom-docker-daemon-options }
## Docker デーモンオプションのカスタマイズ
@z

@x
There are a number of ways to configure the daemon flags and environment variables
for your Docker daemon. The recommended way is to use the platform-independent
`daemon.json` file, which is located in `/etc/docker/` on Linux by default. See
[Daemon configuration file](../../engine/reference/commandline/dockerd.md#daemon-configuration-file).
@y
{% comment %}
There are a number of ways to configure the daemon flags and environment variables
for your Docker daemon. The recommended way is to use the platform-independent
`daemon.json` file, which is located in `/etc/docker/` on Linux by default. See
[Daemon configuration file](../../engine/reference/commandline/dockerd.md#daemon-configuration-file).
{% endcomment %}
Docker デーモンに対してのデーモンフラグや環境変数を設定する方法はいろいろあります。
推奨されるのは、プラットフォームに依存しない `daemon.json` ファイルを用いる方法です。
この `daemon.json` ファイルは Linux においてはデフォルトで `/etc/docker/` に置かれます。
詳しくは [デーモン設定ファイル](../../engine/reference/commandline/dockerd.md#daemon-configuration-file) を参照してください。
@z

@x
You can configure nearly all daemon configuration options using `daemon.json`. The following
example configures two options. One thing you cannot configure using `daemon.json` mechanism is
a [HTTP proxy](#http-proxy).
@y
{% comment %}
You can configure nearly all daemon configuration options using `daemon.json`. The following
example configures two options. One thing you cannot configure using `daemon.json` mechanism is
a [HTTP proxy](#http-proxy).
{% endcomment %}
`daemon.json` を使うと、デーモンオプションはほぼすべて設定することができます。
以下の例では 2 つのオプションを設定しています。
`daemon.json` による仕組みで設定できないものに [HTTP プロキシー](#http-proxy) があります。
@z

@x
### Runtime directory and storage driver
@y
{% comment %}
### Runtime directory and storage driver
{% endcomment %}
{: #runtime-directory-and-storage-driver }
### 実行時の利用ディレクトリとストレージドライバー
@z

@x
You may want to control the disk space used for Docker images, containers,
and volumes by moving it to a separate partition.
@y
{% comment %}
You may want to control the disk space used for Docker images, containers,
and volumes by moving it to a separate partition.
{% endcomment %}
Docker のイメージ、コンテナー、ボリュームは、別のパーティションを使ってディスク管理を行いたいと考えるかもしれません。
@z

@x
To accomplish this, set the following flags in the `daemon.json` file:
@y
{% comment %}
To accomplish this, set the following flags in the `daemon.json` file:
{% endcomment %}
これを行うには `daemon.json` ファイルにおいて、以下のようなフラグ設定を行います。
@z

@x
```none
{
    "data-root": "/mnt/docker-data",
    "storage-driver": "overlay2"
}
```
@y
```none
{
    "data-root": "/mnt/docker-data",
    "storage-driver": "overlay2"
}
```
@z

@x
### HTTP/HTTPS proxy
@y
{% comment %}
### HTTP/HTTPS proxy
{% endcomment %}
{: #httphttps-proxy }
### HTTP/HTTPS プロキシー
@z

@x
The Docker daemon uses the `HTTP_PROXY`, `HTTPS_PROXY`, and `NO_PROXY` environmental variables in
its start-up environment to configure HTTP or HTTPS proxy behavior. You cannot configure
these environment variables using the `daemon.json` file.
@y
{% comment %}
The Docker daemon uses the `HTTP_PROXY`, `HTTPS_PROXY`, and `NO_PROXY` environmental variables in
its start-up environment to configure HTTP or HTTPS proxy behavior. You cannot configure
these environment variables using the `daemon.json` file.
{% endcomment %}
Docker デーモンではその起動環境において `HTTP_PROXY`, `HTTPS_PROXY`, `NO_PROXY` という環境変数を利用して、HTTP または HTTPS プロキシーの動作を定めています。
この環境変数による設定は `daemon.json` ファイルを用いて行うことはできません。
@z

@x
This example overrides the default `docker.service` file.
@y
{% comment %}
This example overrides the default `docker.service` file.
{% endcomment %}
以下は、デフォルトの `docker.service` ファイルを上書き設定する例です。
@z

@x
If you are behind an HTTP or HTTPS proxy server, for example in corporate settings,
you need to add this configuration in the Docker systemd service file.
@y
{% comment %}
If you are behind an HTTP or HTTPS proxy server, for example in corporate settings,
you need to add this configuration in the Docker systemd service file.
{% endcomment %}
企業内で設定されるような HTTP あるいは HTTPS プロキシーサーバーを利用している場合は、Docker systemd サービスファイルに、これらの設定を加える必要があります。
@z

@x
> **Note for rootless mode**
@y
{% comment %}
> **Note for rootless mode**
{% endcomment %}
> **rootless モードに関するメモ**
@z

@x
> The location of systemd configuration files are different when running Docker
> in [rootless mode](../../engine/security/rootless.md). When running in rootless
> mode, Docker is started as a user-mode systemd service, and uses files stored
> in each users' home directory in `~/.config/systemd/user/docker.service.d/`.
> In addition, `systemctl` must be executed without `sudo` and with the `--user`
> flag. Select the _"rootless mode"_ tab below if you are running Docker in rootless mode.
@y
{% comment %}
> The location of systemd configuration files are different when running Docker
> in [rootless mode](../../engine/security/rootless.md). When running in rootless
> mode, Docker is started as a user-mode systemd service, and uses files stored
> in each users' home directory in `~/.config/systemd/user/docker.service.d/`.
> In addition, `systemctl` must be executed without `sudo` and with the `--user`
> flag. Select the _"rootless mode"_ tab below if you are running Docker in rootless mode.
{% endcomment %}
> Docker を [rootless モード](../../engine/security/rootless.md) で起動させるとき、systemd 設定ファイルの収容ディレクトリは異なるところにあります。
> rootless モードの起動にあたって、Docker はユーザーモードの systemd サービスとして起動されます。
> そしてその設定ファイルは、各ユーザーのホームディレクトリ配下の `~/.config/systemd/user/docker.service.d/` にあるものを利用します。
> これに加えて `systemctl` は `sudo` を用いず `--user` フラグをつけて実行することが必要です。
> rootless モードにより Docker を動作させる場合は、以下の **"rootless モード"** を選んでください。
@z

@x
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" data-target="#rootful">regular install</a></li>
  <li><a data-toggle="tab" data-target="#rootless">rootless mode</a></li>
</ul>
<div class="tab-content">
<div id="rootful" class="tab-pane fade in active" markdown="1">
@y
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" data-target="#rootful">通常のインストール</a></li>
  <li><a data-toggle="tab" data-target="#rootless">rootless モード</a></li>
</ul>
<div class="tab-content">
<div id="rootful" class="tab-pane fade in active" markdown="1">
@z

@x
1.  Create a systemd drop-in directory for the docker service:
@y
{% comment %}
1.  Create a systemd drop-in directory for the docker service:
{% endcomment %}
1.  Docker サービスに対応した systemd のドロップインディレクトリを生成します。
@z

@x
    ```bash
    sudo mkdir -p /etc/systemd/system/docker.service.d
    ```
@y
    ```bash
    sudo mkdir -p /etc/systemd/system/docker.service.d
    ```
@z

@x
2.  Create a file named `/etc/systemd/system/docker.service.d/http-proxy.conf`
    that adds the `HTTP_PROXY` environment variable:
@y
{% comment %}
2.  Create a file named `/etc/systemd/system/docker.service.d/http-proxy.conf`
    that adds the `HTTP_PROXY` environment variable:
{% endcomment %}
2.  `/etc/systemd/system/docker.service.d/http-proxy.conf` というファイルを生成して、そこに環境変数 `HTTP_PROXY` の設定を書きます。
@z

@x
    ```conf
    [Service]
    Environment="HTTP_PROXY=http://proxy.example.com:80"
    ```
@y
    ```conf
    [Service]
    Environment="HTTP_PROXY=http://proxy.example.com:80"
    ```
@z

@x
    If you are behind an HTTPS proxy server, set the `HTTPS_PROXY` environment
    variable:
@y
    {% comment %}
    If you are behind an HTTPS proxy server, set the `HTTPS_PROXY` environment
    variable:
    {% endcomment %}
    HTTPS プロキシーサーバーを利用している場合には、環境変数 `HTTPS_PROXY` の設定を書きます。
@z

@x
    ```conf
    [Service]
    Environment="HTTPS_PROXY=https://proxy.example.com:443"
    ```
@y
    ```conf
    [Service]
    Environment="HTTPS_PROXY=https://proxy.example.com:443"
    ```
@z

@x
    Multiple environment variables can be set; to set both a non-HTTPS and
    a HTTPs proxy;
@y
    {% comment %}
    Multiple environment variables can be set; to set both a non-HTTPS and
    a HTTPs proxy;
    {% endcomment %}
    環境変数を同時に複数設定することもできます。
    以下は HTTP および HTTPs プロキシーを設定します。
@z

@x
    ```conf
    [Service]
    Environment="HTTP_PROXY=http://proxy.example.com:80"
    Environment="HTTPS_PROXY=https://proxy.example.com:443"
    ```
@y
    ```conf
    [Service]
    Environment="HTTP_PROXY=http://proxy.example.com:80"
    Environment="HTTPS_PROXY=https://proxy.example.com:443"
    ```
@z

@x
3.  If you have internal Docker registries that you need to contact without
    proxying you can specify them via the `NO_PROXY` environment variable.
@y
{% comment %}
3.  If you have internal Docker registries that you need to contact without
    proxying you can specify them via the `NO_PROXY` environment variable.
{% endcomment %}
3.  内部に Docker レジストリがあって、プロキシーを介さずに接続する必要がある場合は、環境変数 `NO_PROXY` を通じて設定することができます。
@z

@x
    The `NO_PROXY` variable specifies a string that contains comma-separated
    values for hosts that should be excluded from proxying. These are the
    options you can specify to exclude hosts: 
@y
    {% comment %}
    The `NO_PROXY` variable specifies a string that contains comma-separated
    values for hosts that should be excluded from proxying. These are the
    options you can specify to exclude hosts: 
    {% endcomment %}
    変数 `NO_PROXY` は、プロキシーから除外したいホスト名を、カンマで区切った文字列として指定します。
    ホストを除外する設定は必要に応じて行います。
@z

@x
    * IP address prefix (`1.2.3.4`)   
    * Domain name, or a special DNS label (`*`)
@y
    {% comment %}
    * IP address prefix (`1.2.3.4`)   
    * Domain name, or a special DNS label (`*`)
    {% endcomment %}
    * IP アドレスプレフィックス (`1.2.3.4`)   
    * ドメイン名、あるいは特別な DNS ラベル (`*`)
@z

@x
    * A domain name matches that name and all subdomains. A domain name with
      a leading "." matches subdomains only. For example, given the domains
      `foo.example.com` and `example.com`:
      * `example.com` matches `example.com` and `foo.example.com`, and
      * `.example.com` matches only `foo.example.com`
@y
    {% comment %}
    * A domain name matches that name and all subdomains. A domain name with
      a leading "." matches subdomains only. For example, given the domains
      `foo.example.com` and `example.com`:
      * `example.com` matches `example.com` and `foo.example.com`, and
      * `.example.com` matches only `foo.example.com`
    {% endcomment %}
    * ドメイン名は、その名前とサブドメインすべてにマッチします。
      先頭に "." のついたドメイン名は、サブドメインのみにマッチします。
      たとえばドメイン名が `foo.example.com` と `example.com` であるとします。
      * `example.com` は `example.com` と `foo.example.com` にマッチします。
      * `.example.com` は `foo.example.com` のみにマッチします。
@z

@x
    * A single asterisk (`*`) indicates that no proxying should be done
    * Literal port numbers are accepted by IP address prefixes (`1.2.3.4:80`)
      and domain names (`foo.example.com:80`)
@y
    {% comment %}
    * A single asterisk (`*`) indicates that no proxying should be done
    * Literal port numbers are accepted by IP address prefixes (`1.2.3.4:80`)
      and domain names (`foo.example.com:80`)
    {% endcomment %}
    * 単一のアスタリスク (`*`) を指定するとプロキシーは行われません。
    * リテラル数値としてポート番号を IP アドレスやドメイン名につけることができます（`1.2.3.4:80` や `foo.example.com:80`）。
@z

@x
    Config example:
@y
    {% comment %}
    Config example:
    {% endcomment %}
    設定例は以下です。
@z

@x
    ```conf
    [Service]
    Environment="HTTP_PROXY=http://proxy.example.com:80"
    Environment="HTTPS_PROXY=https://proxy.example.com:443"
    Environment="NO_PROXY=localhost,127.0.0.1,docker-registry.example.com,.corp"
    ```
@y
    ```conf
    [Service]
    Environment="HTTP_PROXY=http://proxy.example.com:80"
    Environment="HTTPS_PROXY=https://proxy.example.com:443"
    Environment="NO_PROXY=localhost,127.0.0.1,docker-registry.example.com,.corp"
    ```
@z

@x
4.  Flush changes and restart Docker
@y
{% comment %}
4.  Flush changes and restart Docker
{% endcomment %}
4.  設定を反映して Docker を再起動します。
@z

@x
    ```bash
    sudo systemctl daemon-reload
    sudo systemctl restart docker
    ```
@y
    ```bash
    sudo systemctl daemon-reload
    sudo systemctl restart docker
    ```
@z

@x
5.  Verify that the configuration has been loaded and matches the changes you
    made, for example:
@y
{% comment %}
5.  Verify that the configuration has been loaded and matches the changes you
    made, for example:
{% endcomment %}
5.  設定が適切にロードされていること、そして変更した内容が反映されていることを確認します。
    たとえば以下のようにします。
@z

@x
    ```bash
    sudo systemctl show --property=Environment docker
    
    Environment=HTTP_PROXY=http://proxy.example.com:80 HTTPS_PROXY=https://proxy.example.com:443 NO_PROXY=localhost,127.0.0.1,docker-registry.example.com,.corp
    ```
@y
    ```bash
    sudo systemctl show --property=Environment docker
    
    Environment=HTTP_PROXY=http://proxy.example.com:80 HTTPS_PROXY=https://proxy.example.com:443 NO_PROXY=localhost,127.0.0.1,docker-registry.example.com,.corp
    ```
@z

@x
</div>
<div id="rootless" class="tab-pane fade in" markdown="1">
@y
</div>
<div id="rootless" class="tab-pane fade in" markdown="1">
@z

@x
1.  Create a systemd drop-in directory for the docker service:
@y
{% comment %}
1.  Create a systemd drop-in directory for the docker service:
{% endcomment %}
1.  Docker サービスに対応した systemd のドロップインディレクトリを生成します。
@z

@x
    ```bash
    mkdir -p ~/.config/systemd/user/docker.service.d
    ```
@y
    ```bash
    mkdir -p ~/.config/systemd/user/docker.service.d
    ```
@z

@x
2.  Create a file named `~/.config/systemd/user/docker.service.d/http-proxy.conf`
    that adds the `HTTP_PROXY` environment variable:
@y
{% comment %}
2.  Create a file named `~/.config/systemd/user/docker.service.d/http-proxy.conf`
    that adds the `HTTP_PROXY` environment variable:
{% endcomment %}
2.  `~/.config/systemd/user/docker.service.d/http-proxy.conf` というファイルを生成して、そこに環境変数 `HTTP_PROXY` の設定を書きます。
@z

@x
    ```conf
    [Service]
    Environment="HTTP_PROXY=http://proxy.example.com:80"
    ```
@y
    ```conf
    [Service]
    Environment="HTTP_PROXY=http://proxy.example.com:80"
    ```
@z

@x
    If you are behind an HTTPS proxy server, set the `HTTPS_PROXY` environment
    variable:
@y
    {% comment %}
    If you are behind an HTTPS proxy server, set the `HTTPS_PROXY` environment
    variable:
    {% endcomment %}
    HTTPS プロキシーサーバーを利用している場合には、環境変数 `HTTPS_PROXY` の設定を書きます。
@z

@x
    ```conf
    [Service]
    Environment="HTTPS_PROXY=https://proxy.example.com:443"
    ```
@y
    ```conf
    [Service]
    Environment="HTTPS_PROXY=https://proxy.example.com:443"
    ```
@z

@x
    Multiple environment variables can be set; to set both a non-HTTPS and
    a HTTPs proxy;
@y
    {% comment %}
    Multiple environment variables can be set; to set both a non-HTTPS and
    a HTTPs proxy;
    {% endcomment %}
    環境変数を同時に複数設定することもできます。
    以下は HTTP および HTTPs プロキシーを設定します。
@z

@x
    ```conf
    [Service]
    Environment="HTTP_PROXY=http://proxy.example.com:80"
    Environment="HTTPS_PROXY=https://proxy.example.com:443"
    ```
@y
    ```conf
    [Service]
    Environment="HTTP_PROXY=http://proxy.example.com:80"
    Environment="HTTPS_PROXY=https://proxy.example.com:443"
    ```
@z

@x
3.  If you have internal Docker registries that you need to contact without
    proxying, you can specify them via the `NO_PROXY` environment variable.
@y
{% comment %}
3.  If you have internal Docker registries that you need to contact without
    proxying, you can specify them via the `NO_PROXY` environment variable.
{% endcomment %}
3.  内部に Docker レジストリがあって、プロキシーを介さずに接続する必要がある場合は、環境変数 `NO_PROXY` を通じて設定することができます。
@z

@x
    The `NO_PROXY` variable specifies a string that contains comma-separated
    values for hosts that should be excluded from proxying. These are the
    options you can specify to exclude hosts: 
@y
    {% comment %}
    The `NO_PROXY` variable specifies a string that contains comma-separated
    values for hosts that should be excluded from proxying. These are the
    options you can specify to exclude hosts: 
    {% endcomment %}
    変数 `NO_PROXY` は、プロキシーから除外したいホスト名を、カンマで区切った文字列として指定します。
    ホストを除外する設定は必要に応じて行います。
@z

@x
    * IP address prefix (`1.2.3.4`)   
    * Domain name, or a special DNS label (`*`)
@y
    {% comment %}
    * IP address prefix (`1.2.3.4`)   
    * Domain name, or a special DNS label (`*`)
    {% endcomment %}
    * IP アドレスプレフィックス (`1.2.3.4`)   
    * ドメイン名、あるいは特別な DNS ラベル (`*`)
@z

@x
    * A domain name matches that name and all subdomains. A domain name with
      a leading "." matches subdomains only. For example, given the domains
      `foo.example.com` and `example.com`:
      * `example.com` matches `example.com` and `foo.example.com`, and
      * `.example.com` matches only `foo.example.com`
@y
    {% comment %}
    * A domain name matches that name and all subdomains. A domain name with
      a leading "." matches subdomains only. For example, given the domains
      `foo.example.com` and `example.com`:
      * `example.com` matches `example.com` and `foo.example.com`, and
      * `.example.com` matches only `foo.example.com`
    {% endcomment %}
    * ドメイン名は、その名前とサブドメインすべてにマッチします。
      先頭に "." のついたドメイン名は、サブドメインのみにマッチします。
      たとえばドメイン名が `foo.example.com` と `example.com` であるとします。
      * `example.com` は `example.com` と `foo.example.com` にマッチします。
      * `.example.com` は `foo.example.com` のみにマッチします。
@z

@x
    * A single asterisk (`*`) indicates that no proxying should be done
    * Literal port numbers are accepted by IP address prefixes (`1.2.3.4:80`)
      and domain names (`foo.example.com:80`)
@y
    {% comment %}
    * A single asterisk (`*`) indicates that no proxying should be done
    * Literal port numbers are accepted by IP address prefixes (`1.2.3.4:80`)
      and domain names (`foo.example.com:80`)
    {% endcomment %}
    * 単一のアスタリスク (`*`) を指定するとプロキシーは行われません。
    * リテラル数値としてポート番号を IP アドレスやドメイン名につけることができます（`1.2.3.4:80` や `foo.example.com:80`）。
@z

@x
    Config example:
@y
    {% comment %}
    Config example:
    {% endcomment %}
    設定例は以下です。
@z

@x
    ```conf
    [Service]
    Environment="HTTP_PROXY=http://proxy.example.com:80"
    Environment="HTTPS_PROXY=https://proxy.example.com:443"
    Environment="NO_PROXY=localhost,127.0.0.1,docker-registry.example.com,.corp"
    ```
@y
    ```conf
    [Service]
    Environment="HTTP_PROXY=http://proxy.example.com:80"
    Environment="HTTPS_PROXY=https://proxy.example.com:443"
    Environment="NO_PROXY=localhost,127.0.0.1,docker-registry.example.com,.corp"
    ```
@z

@x
4.  Flush changes and restart Docker
@y
{% comment %}
4.  Flush changes and restart Docker
{% endcomment %}
4.  設定を反映して Docker を再起動します。
@z

@x
    ```bash
    systemctl --user daemon-reload
    systemctl --user restart docker
    ```
@y
    ```bash
    systemctl --user daemon-reload
    systemctl --user restart docker
    ```
@z

@x
5.  Verify that the configuration has been loaded and matches the changes you
    made, for example:
@y
{% comment %}
5.  Verify that the configuration has been loaded and matches the changes you
    made, for example:
{% endcomment %}
5.  設定が適切にロードされていること、そして変更した内容が反映されていることを確認します。
    たとえば以下のようにします。
@z

@x
    ```bash
    systemctl --user show --property=Environment docker

    Environment=HTTP_PROXY=http://proxy.example.com:80 HTTPS_PROXY=https://proxy.example.com:443 NO_PROXY=localhost,127.0.0.1,docker-registry.example.com,.corp
    ```
@y
    ```bash
    systemctl --user show --property=Environment docker

    Environment=HTTP_PROXY=http://proxy.example.com:80 HTTPS_PROXY=https://proxy.example.com:443 NO_PROXY=localhost,127.0.0.1,docker-registry.example.com,.corp
    ```
@z

@x
</div>
</div> <!-- tab-content -->
@y
</div>
</div> <!-- tab-content -->
@z

@x
## Configure where the Docker daemon listens for connections
@y
{% comment %}
## Configure where the Docker daemon listens for connections
{% endcomment %}
{: #configure-where-the-docker-daemon-listens-for-connections }
## Docker デーモンがどこからの接続待ちをするかの設定
@z

@x
See
[Configure where the Docker daemon listens for connections](../../engine/install/linux-postinstall.md#control-where-the-docker-daemon-listens-for-connections).
@y
{% comment %}
[Configure where the Docker daemon listens for connections](../../engine/install/linux-postinstall.md#control-where-the-docker-daemon-listens-for-connections).
{% endcomment %}
[Docker デーモンがどこからの接続待ちをするかの設定](../../engine/install/linux-postinstall.md#configure-where-the-docker-daemon-listens-for-connections) を参照してください。
@z

@x
## Manually create the systemd unit files
@y
{% comment %}
## Manually create the systemd unit files
{% endcomment %}
{: #manually-create-the-systemd-unit-files }
## systemd ユニットファイルの手動生成
@z

@x
When installing the binary without a package, you may want
to integrate Docker with systemd. For this, install the two unit files
(`service` and `socket`) from [the github repository](https://github.com/moby/moby/tree/master/contrib/init/systemd)
to `/etc/systemd/system`.
@y
{% comment %}
When installing the binary without a package, you may want
to integrate Docker with systemd. For this, install the two unit files
(`service` and `socket`) from [the github repository](https://github.com/moby/moby/tree/master/contrib/init/systemd)
to `/etc/systemd/system`.
{% endcomment %}
パッケージを利用せずにインストールを行った場合は、systemd を用いた Docker の設定が必要になるはずです。
これを行うには 2 つのユニットファイル（`service` と `socket`）を [Github リポジトリ](https://github.com/moby/moby/tree/master/contrib/init/systemd) から入手して `/etc/systemd/system` に置いてください。
@z
