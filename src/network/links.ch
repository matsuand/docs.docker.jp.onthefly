%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Learn how to connect Docker containers together.
keywords: Examples, Usage, user guide, links, linking, docker, documentation, examples, names, name, container naming, port, map, network port, network
redirect_from:
- /userguide/dockerlinks/
- /engine/userguide/networking/default_network/dockerlinks/
title: Legacy container links
---
@y
---
description: Learn how to connect Docker containers together.
keywords: Examples, Usage, user guide, links, linking, docker, documentation, examples, names, name, container naming, port, map, network port, network
redirect_from:
- /userguide/dockerlinks/
- /engine/userguide/networking/default_network/dockerlinks/
title: コンテナーリンク（古い機能）
---
@z

@x
>**Warning**:
>The `--link` flag is a legacy feature of Docker. It may eventually
be removed. Unless you absolutely need to continue using it, we recommend that you use
user-defined networks to facilitate communication between two containers instead of using
`--link`. One feature that user-defined networks do not support that you can do
with `--link` is sharing environment variables between containers. However,
you can use other mechanisms such as volumes to share environment variables
between containers in a more controlled way.
>
> See [Differences between user-defined bridges and the default bridge](bridge.md#differences-between-user-defined-bridges-and-the-default-bridge)
> for some alternatives to using `--link`.
{:.warning}
@y
{% comment %}
>**Warning**:
>The `--link` flag is a legacy feature of Docker. It may eventually
be removed. Unless you absolutely need to continue using it, we recommend that you use
user-defined networks to facilitate communication between two containers instead of using
`--link`. One feature that user-defined networks do not support that you can do
with `--link` is sharing environment variables between containers. However,
you can use other mechanisms such as volumes to share environment variables
between containers in a more controlled way.
>
> See [Differences between user-defined bridges and the default bridge](bridge.md#differences-between-user-defined-bridges-and-the-default-bridge)
> for some alternatives to using `--link`.
{:.warning}
{% endcomment %}
>**警告**:
>Docker の `--link` フラグは過去の機能です。
>そのうちに削除されるかもしれません。
>この機能を確実に必要としているのでなければ `--link` を使わず、2 つのコンテナー間の通信を実現するユーザー定義ネットワークの利用をお勧めします。
>`--link` に存在していて、ユーザー定義ネットワークにない機能は、コンテナー間での環境変数の共有機能です。
>ただしボリュームのような別の機能を使えば、コンテナー間での環境変数の共有は、より制御しやすく利用できます。
>
> [ユーザー定義のブリッジとデフォルトブリッジの違い](bridge.md#differences-between-user-defined-bridges-and-the-default-bridge) を参照して、`--link` とは違う方法について確認してください。
{:.warning}
@z

@x
The information in this section explains legacy container links within the
Docker default `bridge` network which is created automatically when you install
Docker.
@y
{% comment %}
The information in this section explains legacy container links within the
Docker default `bridge` network which is created automatically when you install
Docker.
{% endcomment %}
ここでは古い機能であるコンテナーリンクについて説明します。
これは Docker のデフォルトである `bridge` ネットワーク内にあるもので、この `bridge` ネットワークは Docker をインストールした際に自動的に生成されます。
@z

@x
Before the [Docker networks feature](index.md), you could use the
Docker link feature to allow containers to discover each other and securely
transfer information about one container to another container. With the
introduction of the Docker networks feature, you can still create links but they
behave differently between default `bridge` network and
[user defined networks](bridge.md#differences-between-user-defined-bridges-and-the-default-bridge).
@y
{% comment %}
Before the [Docker networks feature](index.md), you could use the
Docker link feature to allow containers to discover each other and securely
transfer information about one container to another container. With the
introduction of the Docker networks feature, you can still create links but they
behave differently between default `bridge` network and
[user defined networks](bridge.md#differences-between-user-defined-bridges-and-the-default-bridge).
{% endcomment %} 
[Docker のネットワーク機能](index.md) が提供される以前は、Docker のリンク機能によって複数のコンテナーが互いを検出し、一方から他方への情報送信を安全に行うようにしていました。
Docker のネットワーク機能が導入されてからも、リンクを生成することはできます。
ただしデフォルトの `bridge` ネットワークであるか、[ユーザー定義のネットワーク](bridge.md#differences-between-user-defined-bridges-and-the-default-bridge) であるかによって、その動作は異なることになります。
@z

@x
This section briefly discusses connecting via a network port and then goes into
detail on container linking in default `bridge` network.
@y
{% comment %}
This section briefly discusses connecting via a network port and then goes into
detail on container linking in default `bridge` network.
{% endcomment %}
この節においてはネットワークポートを通じてネットワークに接続する方法を簡単に説明した上で、デフォルトの `bridge` ネットワーク内でのコンテナーリンクを行う方法へ進んでいきます。
@z

@x
## Connect using network port mapping
@y
{% comment %}
## Connect using network port mapping
{% endcomment %}
{: #connect-using-network-port-mapping }
## ネットワークポートマッピングを利用した接続
@z

@x
Let's say you used this command to run a simple Python Flask application:
@y
{% comment %}
Let's say you used this command to run a simple Python Flask application:
{% endcomment %}
以下のコマンドによって Python Flask アプリケーションを起動しているとします。
@z

@x
    $ docker run -d -P training/webapp python app.py
@y
    $ docker run -d -P training/webapp python app.py
@z

@x
> **Note**:
> Containers have an internal network and an IP address.
> Docker can have a variety of network configurations. You can see more
> information on Docker networking [here](index.md).
@y
{% comment %}
> **Note**:
> Containers have an internal network and an IP address.
> Docker can have a variety of network configurations. You can see more
> information on Docker networking [here](index.md).
{% endcomment %}
> **メモ**:
> コンテナーには内部ネットワークと IP アドレスがあります。
> そして Docker にはさまざまなネットワーク設定方法があります。
> Docker のネットワーク機能の詳細は [こちら](index.md) を参照してください。
@z

@x
When that container was created, the `-P` flag was used to automatically map
any network port inside it to a random high port within an *ephemeral port
range* on your Docker host. Next, when `docker ps` was run, you saw that port
5000 in the container was bound to port 49155 on the host.
@y
{% comment %}
When that container was created, the `-P` flag was used to automatically map
any network port inside it to a random high port within an *ephemeral port
range* on your Docker host. Next, when `docker ps` was run, you saw that port
5000 in the container was bound to port 49155 on the host.
{% endcomment %}
このコンテナーの生成時には `-P` フラグが指定されているので、コンテナー内部のネットワークポートはすべて、Docker ホスト上の「エフェメラルポート」範囲内にあるランダムな高位ポートに自動的に割り当てられます。
その後に `docker ps` を実行すれば、コンテナー内の 5000 番ポートが、ホスト上の 49155 番ポートに割り当てられているのがわかります。
@z

@x
    $ docker ps nostalgic_morse
@y
    $ docker ps nostalgic_morse
@z

@x
    CONTAINER ID  IMAGE                   COMMAND       CREATED        STATUS        PORTS                    NAMES
    bc533791f3f5  training/webapp:latest  python app.py 5 seconds ago  Up 2 seconds  0.0.0.0:49155->5000/tcp  nostalgic_morse
@y
    CONTAINER ID  IMAGE                   COMMAND       CREATED        STATUS        PORTS                    NAMES
    bc533791f3f5  training/webapp:latest  python app.py 5 seconds ago  Up 2 seconds  0.0.0.0:49155->5000/tcp  nostalgic_morse
@z

@x
You also saw how you can bind a container's ports to a specific port using
the `-p` flag. Here port 80 of the host is mapped to port 5000 of the
container:
@y
{% comment %}
You also saw how you can bind a container's ports to a specific port using
the `-p` flag. Here port 80 of the host is mapped to port 5000 of the
container:
{% endcomment %}
またコンテナーのポートを特定のポートに割り当てるには `-p` フラグを使えばよいことも、すでに見てきました。
以下はホストの 80 番ポートを、コンテナーの 5000 番ポートに割り当てます。
@z

@x
    $ docker run -d -p 80:5000 training/webapp python app.py
@y
    $ docker run -d -p 80:5000 training/webapp python app.py
@z

@x
And you saw why this isn't such a great idea because it constrains you to
only one container on that specific port.
@y
{% comment %}
And you saw why this isn't such a great idea because it constrains you to
only one container on that specific port.
{% endcomment %}
ただしこれはあまり良い方法でないのは、すでにお分かりでしょう。
これでは、特定のポートを指定できるのが、ただ一つのコンテナーでしかないからです。
@z

@x
Instead, you may specify a range of host ports to bind a container port to
that is different than the default *ephemeral port range*:
@y
{% comment %}
Instead, you may specify a range of host ports to bind a container port to
that is different than the default *ephemeral port range*:
{% endcomment %}
上とは違って、コンテナーポートに対して、ホストのポート範囲を指定することができます。
この範囲は「エフェメラルポート」の範囲とは異なるものです。
@z

@x
    $ docker run -d -p 8000-9000:5000 training/webapp python app.py
@y
    $ docker run -d -p 8000-9000:5000 training/webapp python app.py
@z

@x
This would bind port 5000 in the container to a randomly available port
between 8000 and 9000 on the host.
@y
{% comment %}
This would bind port 5000 in the container to a randomly available port
between 8000 and 9000 on the host.
{% endcomment %}
これによるとコンテナーの 5000 番ポートは、ホスト上の 8000 から 9000 の中で利用可能なポートがランダムに選び出されます。
@z

@x
There are also a few other ways you can configure the `-p` flag. By
default the `-p` flag binds the specified port to all interfaces on
the host machine. But you can also specify a binding to a specific
interface, for example only to the `localhost`.
@y
{% comment %}
There are also a few other ways you can configure the `-p` flag. By
default the `-p` flag binds the specified port to all interfaces on
the host machine. But you can also specify a binding to a specific
interface, for example only to the `localhost`.
{% endcomment %}
`-p` フラグの設定方法には他にもいくつかあります。
デフォルトにおいて `-p` フラグは、ホストマシン上のすべてのインターフェースに対して、指定されたポートを割り当てます。
しかし特定のインターフェースに対しての割り当てを行うこともできます。
たとえば以下は `loalhost` にのみ割り当てる例です。
@z

@x
    $ docker run -d -p 127.0.0.1:80:5000 training/webapp python app.py
@y
    $ docker run -d -p 127.0.0.1:80:5000 training/webapp python app.py
@z

@x
This would bind port 5000 inside the container to port 80 on the
`localhost` or `127.0.0.1` interface on the host machine.
@y
{% comment %}
This would bind port 5000 inside the container to port 80 on the
`localhost` or `127.0.0.1` interface on the host machine.
{% endcomment %}
上はコンテナー内の 5000 番ポートを、ホストマシン上の 80 番ポートに割り当てますが、これが行われるのは `localhost` つまり `127.0.0.1` インターフェースに対してのみです。
@z

@x
Or, to bind port 5000 of the container to a dynamic port but only on the
`localhost`, you could use:
@y
{% comment %}
Or, to bind port 5000 of the container to a dynamic port but only on the
`localhost`, you could use:
{% endcomment %}
コンテナー内の 5000 番ポートを `localhost` 上の動的ポートに割り当てるなら、以下のようにします。
@z

@x
    $ docker run -d -p 127.0.0.1::5000 training/webapp python app.py
@y
    $ docker run -d -p 127.0.0.1::5000 training/webapp python app.py
@z

@x
You can also bind UDP and SCTP (typically used by telecom protocols such as SIGTRAN, Diameter, and S1AP/X2AP) ports by adding a trailing `/udp` or `/sctp`. For example:
@y
{% comment %}
You can also bind UDP and SCTP (typically used by telecom protocols such as SIGTRAN, Diameter, and S1AP/X2AP) ports by adding a trailing `/udp` or `/sctp`. For example:
{% endcomment %}
UDP や SCTP を割り当てることもできます。
（SCTP は一般に SIGTRAN、Diameter、S1AP/X2AP といった通信プロトコルにおいて利用されています。）
UDP や SCTP は、以下の例のように `/udp` や `/sctp` をつけて指定します。
@z

@x
    $ docker run -d -p 127.0.0.1:80:5000/udp training/webapp python app.py
@y
    $ docker run -d -p 127.0.0.1:80:5000/udp training/webapp python app.py
@z

@x
You also learned about the useful `docker port` shortcut which showed us the
current port bindings. This is also useful for showing you specific port
configurations. For example, if you've bound the container port to the
`localhost` on the host machine, then the `docker port` output reflects that.
@y
{% comment %}
You also learned about the useful `docker port` shortcut which showed us the
current port bindings. This is also useful for showing you specific port
configurations. For example, if you've bound the container port to the
`localhost` on the host machine, then the `docker port` output reflects that.
{% endcomment %}
便利なコマンド `docker port` についてはこれまでにも使ってきました。
これによって現時点でのポート割り当ての状況がすぐにわかります。
また特定のポートがどのように設定されているかがわかります。
たとえばコンテナーの特定のポートを、ホストマシンの `localhost` に割り当てていたとします。
`docker port` コマンドの出力には、そのことが示されます。
@z

@x
    $ docker port nostalgic_morse 5000
@y
    $ docker port nostalgic_morse 5000
@z

@x
    127.0.0.1:49155
@y
    127.0.0.1:49155
@z

@x
> **Note**:
> The `-p` flag can be used multiple times to configure multiple ports.
@y
{% comment %}
> **Note**:
> The `-p` flag can be used multiple times to configure multiple ports.
{% endcomment %}
> **メモ**:
> `-p` フラグは複数個の指定が可能であり、これにより複数ポートの指定を行うことができます。
@z

@x
## Connect with the linking system
@y
{% comment %}
## Connect with the linking system
{% endcomment %}
{: #connect-with-the-linking-system }
## リンクシステムを用いた接続
@z

@x
> **Note**:
> This section covers the legacy link feature in the default `bridge` network.
> Refer to [differences between user-defined bridges and the default bridge](bridge.md#differences-between-user-defined-bridges-and-the-default-bridge)
> for more information on links in user-defined networks.
@y
{% comment %}
> **Note**:
> This section covers the legacy link feature in the default `bridge` network.
> Refer to [differences between user-defined bridges and the default bridge](bridge.md#differences-between-user-defined-bridges-and-the-default-bridge)
> for more information on links in user-defined networks.
{% endcomment %}
> **メモ**:
> この節ではデフォルトの `bridge` ネットワーク内の古い機能であるリンク機能について説明します。
> ユーザー定義ネットワーク上のリンクに関しては [ユーザー定義ネットワークでのコンテナーのリンク](bridge.md#differences-between-user-defined-bridges-and-the-default-bridge) を参照してください。
@z

@x
Network port mappings are not the only way Docker containers can connect to one
another. Docker also has a linking system that allows you to link multiple
containers together and send connection information from one to another. When
containers are linked, information about a source container can be sent to a
recipient container. This allows the recipient to see selected data describing
aspects of the source container.
@y
{% comment %}
Network port mappings are not the only way Docker containers can connect to one
another. Docker also has a linking system that allows you to link multiple
containers together and send connection information from one to another. When
containers are linked, information about a source container can be sent to a
recipient container. This allows the recipient to see selected data describing
aspects of the source container.
{% endcomment %}
Docker コンテナーを別のコンテナーと接続させるのは、ネットワークのポート割り当てだけが唯一の方法ではありません。
Docker にはリンクシステム（linking system）があります。
このシステムにより複数のコンテナーは互いにリンクすることが可能となり、接続情報をやり取りできるようになります。
複数のコンテナーがリンクされていると、1 つのコンテナーの情報を別のコンテナーに送信することが可能です。
つまり情報を受け取る側のコンテナーは、情報元のコンテナーに関する情報の中から、必要な情報を取り出して見ることができます。
@z

@x
### The importance of naming
@y
{% comment %}
### The importance of naming
{% endcomment %}
{: #the-importance-of-naming }
### 名前づけの重要性
@z

@x
To establish links, Docker relies on the names of your containers.
You've already seen that each container you create has an automatically
created name; indeed you've become familiar with our old friend
`nostalgic_morse` during this guide. You can also name containers
yourself. This naming provides two useful functions:
@y
{% comment %}
To establish links, Docker relies on the names of your containers.
You've already seen that each container you create has an automatically
created name; indeed you've become familiar with our old friend
`nostalgic_morse` during this guide. You can also name containers
yourself. This naming provides two useful functions:
{% endcomment %}
Docker がリンクを確立するためには、コンテナーの名前が重要になります。
これまでコンテナーを生成した際には、各コンテナーに自動的に名前がつけられることを見てきました。
実際にここまでの説明においては、おなじみの `nostalgic_morse` という名前を用いています。
コンテナーの名前は自由につけることができます。
名前をつけることによって、以下の 2 点が得られます。
@z

@x
1. It can be useful to name containers that do specific functions in a way
   that makes it easier for you to remember them, for example naming a
   container containing a web application `web`.
@y
{% comment %}
1. It can be useful to name containers that do specific functions in a way
   that makes it easier for you to remember them, for example naming a
   container containing a web application `web`.
{% endcomment %}
1. コンテナーが実現する特定の機能に合わせて、それを表わす名称にしておくと覚えやすく便利です。
   たとえばウェブアプリケーションを含んだコンテナーには `web` という名前をつけます。
@z

@x
2. It provides Docker with a reference point that allows it to refer to other
   containers, for example, you can specify to link the container `web` to container `db`.
@y
{% comment %}
2. It provides Docker with a reference point that allows it to refer to other
   containers, for example, you can specify to link the container `web` to container `db`.
{% endcomment %}
2. 名前は、他のコンテナーから参照させるための参照名となります。
   たとえば `web` コンテナーからのリンクとして、`db` という名前の別のコンテナーを指定することができます。
@z

@x
You can name your container by using the `--name` flag, for example:
@y
{% comment %}
You can name your container by using the `--name` flag, for example:
{% endcomment %}
たとえば以下のようにして `--name` フラグを使ってコンテナーに名前をつけることができます。
@z

@x
    $ docker run -d -P --name web training/webapp python app.py
@y
    $ docker run -d -P --name web training/webapp python app.py
@z

@x
This launches a new container and uses the `--name` flag to
name the container `web`. You can see the container's name using the
`docker ps` command.
@y
{% comment %}
This launches a new container and uses the `--name` flag to
name the container `web`. You can see the container's name using the
`docker ps` command.
{% endcomment %}
上のコマンドは、新規にコンテナーを起動させ、`--name` フラグの情報からコンテナーに `web` という名前をつけます。
`docker ps` コマンドによってコンテナー名を確認することができます。
@z

@x
    $ docker ps -l
@y
    $ docker ps -l
@z

@x
    CONTAINER ID  IMAGE                  COMMAND        CREATED       STATUS       PORTS                    NAMES
    aed84ee21bde  training/webapp:latest python app.py  12 hours ago  Up 2 seconds 0.0.0.0:49154->5000/tcp  web
@y
    CONTAINER ID  IMAGE                  COMMAND        CREATED       STATUS       PORTS                    NAMES
    aed84ee21bde  training/webapp:latest python app.py  12 hours ago  Up 2 seconds 0.0.0.0:49154->5000/tcp  web
@z

@x
You can also use `docker inspect` to return the container's name.
@y
{% comment %}
You can also use `docker inspect` to return the container's name.
{% endcomment %}
`docker inspect` の結果からも、コンテナー名を得ることができます。
@z

@x
> **Note**:
> Container names must be unique. That means you can only call
> one container `web`. If you want to re-use a container name you must delete
> the old container (with `docker container rm`) before you can create a new
> container with the same name. As an alternative you can use the `--rm`
> flag with the `docker run` command. This deletes the container
> immediately after it is stopped.
@y
{% comment %}
> **Note**:
> Container names must be unique. That means you can only call
> one container `web`. If you want to re-use a container name you must delete
> the old container (with `docker container rm`) before you can create a new
> container with the same name. As an alternative you can use the `--rm`
> flag with the `docker run` command. This deletes the container
> immediately after it is stopped.
{% endcomment %}
> **メモ**:
> コンテナー名は一意である必要があります。
> つまり `web` と呼ぶことができるコンテナーは 1 つだけということです。
> コンテナー名を再利用したい場合は、それまでの古いコンテナーを（`docker container rm` を使って）削除する必要があります。
> その後であれば、同一名のコンテナーを生成して利用することができます。
> これとは別に `docker run` の `--rm` フラグを利用する方法もあります。
> この方法ではそれまでのコンテナーが停止され、すぐに削除されます。
@z

@x
## Communication across links
@y
{% comment %}
## Communication across links
{% endcomment %}
{: #communication-across-links }
## リンク間の通信
@z

@x
Links allow containers to discover each other and securely transfer information
about one container to another container. When you set up a link, you create a
conduit between a source container and a recipient container. The recipient can
then access select data about the source. To create a link, you use the `--link`
flag. First, create a new container, this time one containing a database.
@y
{% comment %}
Links allow containers to discover each other and securely transfer information
about one container to another container. When you set up a link, you create a
conduit between a source container and a recipient container. The recipient can
then access select data about the source. To create a link, you use the `--link`
flag. First, create a new container, this time one containing a database.
{% endcomment %}
リンク機能によって複数のコンテナーが互いを検出し、一方から他方への情報送信を安全に行うことができます。
リンク機能を設定すると、情報発信元のコンテナーと受信先のコンテナーの間に経路が生成されます。
そして受信先コンテナーは、発信元コンテナーに関する情報を選び出してアクセスできるようになります。
リンクの生成には `--link` フラグを使います。
そこで以下では、まず新たなコンテナーを生成します。
今回はデータベースを含むコンテナーです。
@z

@x
    $ docker run -d --name db training/postgres
@y
    $ docker run -d --name db training/postgres
@z

@x
This creates a new container called `db` from the `training/postgres`
image, which contains a PostgreSQL database.
@y
{% comment %}
This creates a new container called `db` from the `training/postgres`
image, which contains a PostgreSQL database.
{% endcomment %}
上のコマンドは、PostgreSQL データベースを含む `training/postgres` イメージから `db` という新規のコンテナーを生成します。
@z

@x
Now, you need to delete the `web` container you created previously so you can replace it
with a linked one:
@y
{% comment %}
Now, you need to delete the `web` container you created previously so you can replace it
with a linked one:
{% endcomment %}
先ほど生成した `web` コンテナーは、リンクされた状態のコンテナーとするために、いったんここで削除する必要があります。
@z

@x
    $ docker container rm -f web
@y
    $ docker container rm -f web
@z

@x
Now, create a new `web` container and link it with your `db` container.
@y
{% comment %}
Now, create a new `web` container and link it with your `db` container.
{% endcomment %}
新たな `web` コンテナーを生成して、`db` コンテナーにリンクします。
@z

@x
    $ docker run -d -P --name web --link db:db training/webapp python app.py
@y
    $ docker run -d -P --name web --link db:db training/webapp python app.py
@z

@x
This links the new `web` container with the `db` container you created
earlier. The `--link` flag takes the form:
@y
{% comment %}
This links the new `web` container with the `db` container you created
earlier. The `--link` flag takes the form:
{% endcomment %}
これにより、新しい `web` コンテナーが、直前に生成した `db` コンテナーにリンクされます。
`--link` フラグは以下のような書式です。
@z

@x
    --link <name or id>:alias
@y
    {% comment %}
    --link <name or id>:alias
    {% endcomment %}
    --link <name または id>:alias
@z

@x
Where `name` is the name of the container we're linking to and `alias` is an
alias for the link name. That alias is used shortly.
The `--link` flag also takes the form:
@y
{% comment %}
Where `name` is the name of the container we're linking to and `alias` is an
alias for the link name. That alias is used shortly.
The `--link` flag also takes the form:
{% endcomment %}
ここで `name` はリンクするコンテナーの名前を指定します。
また `alias` はリンク名に対するエイリアス名の定義です。
このエイリアス名は簡単に利用することができます。
`--link` フラグは以下の書式でも構いません。
@z

@x
	--link <name or id>
@y
	--link <name or id>
@z

@x
In this case the alias matches the name. You could write the previous
example as:
@y
{% comment %}
In this case the alias matches the name. You could write the previous
example as:
{% endcomment %}
この場合、エイリアスはリンク名そのものになります。
先ほどの実行例は、以下のようにすることもできます。
@z

@x
    $ docker run -d -P --name web --link db training/webapp python app.py
@y
    $ docker run -d -P --name web --link db training/webapp python app.py
@z

@x
Next, inspect your linked containers with `docker inspect`:
@y
{% comment %}
Next, inspect your linked containers with `docker inspect`:
{% endcomment %}
次にリンクしたコンテナーを `docker inspect` によって確認してみます。
@z

@x
    {% raw %}
    $ docker inspect -f "{{ .HostConfig.Links }}" web
@y
    {% raw %}
    $ docker inspect -f "{{ .HostConfig.Links }}" web
@z

@x
    [/db:/web/db]
    {% endraw %}
@y
    [/db:/web/db]
    {% endraw %}
@z

@x
You can see that the `web` container is now linked to the `db` container
`web/db`. Which allows it to access information about the `db` container.
@y
{% comment %}
You can see that the `web` container is now linked to the `db` container
`web/db`. Which allows it to access information about the `db` container.
{% endcomment %}
`web` コンテナーが `db` コンテナーにリンクされ `web/db` となっているのがわかります。
これにより `db` コンテナーに関する情報にアクセスできるようになりました。
@z

@x
So what does linking the containers actually do? You've learned that a link allows a
source container to provide information about itself to a recipient container. In
our example, the recipient, `web`, can access information about the source `db`. To do
this, Docker creates a secure tunnel between the containers that doesn't need to
expose any ports externally on the container; when we started the
`db` container we did not use either the `-P` or `-p` flags. That's a big benefit of
linking: we don't need to expose the source container, here the PostgreSQL database, to
the network.
@y
{% comment %}
So what does linking the containers actually do? You've learned that a link allows a
source container to provide information about itself to a recipient container. In
our example, the recipient, `web`, can access information about the source `db`. To do
this, Docker creates a secure tunnel between the containers that doesn't need to
expose any ports externally on the container; when we started the
`db` container we did not use either the `-P` or `-p` flags. That's a big benefit of
linking: we don't need to expose the source container, here the PostgreSQL database, to
the network.
{% endcomment %}
コンテナーのリンク機能は実際には何をしているでしょう？
リンクを使うと、情報発信元となるコンテナーそのものの情報を、受信先コンテナーに提供できるということを、すでに学びました。
上の例においては情報を受け取るコンテナーが `web` であり、情報元となる `db` の情報にアクセスできるというものです。
Docker はこのとき、コンテナー間にセキュアなトンネルを作り出します。
そこではコンテナーから外部に向けてポートを公開する必要がないようにしています。
そもそも `db` コンテナーを起動する際には、`-P` フラグも `-p` フラグも使っていませんでした。
これこそがリンクシステムの優れたところです。
情報元となるコンテナー、つまり上の例では PostgreSQL データベースを、ネットワーク上に公開していなくても構わないということです。
@z

@x
Docker exposes connectivity information for the source container to the
recipient container in two ways:
@y
{% comment %}
Docker exposes connectivity information for the source container to the
recipient container in two ways:
{% endcomment %}
情報元のコンテナーから受信先のコンテナーに公開される接続情報は、以下の 2 つの手段を通じて受け渡されます。
@z

@x
* Environment variables,
* Updating the `/etc/hosts` file.
@y
{% comment %}
* Environment variables,
* Updating the `/etc/hosts` file.
{% endcomment %}
* 環境変数
* `/etc/hosts` ファイルの更新
@z

@x
### Environment variables
@y
{% comment %}
### Environment variables
{% endcomment %}
{: #environment-variables }
### 環境変数
@z

@x
Docker creates several environment variables when you link containers. Docker
automatically creates environment variables in the target container based on
the `--link` parameters. It also exposes all environment variables
originating from Docker from the source container. These include variables from:
@y
{% comment %}
Docker creates several environment variables when you link containers. Docker
automatically creates environment variables in the target container based on
the `--link` parameters. It also exposes all environment variables
originating from Docker from the source container. These include variables from:
{% endcomment %}
コンテナーをリンクすると、環境変数が数種類作り出されます。
Docker は `--link` パラメーターに基づいて、対象とするコンテナー上に自動的に環境変数を作り出すものです。
また発信元コンテナーからは、Docker がもともと提供している環境変数もすべて公開されています。
そういった環境変数は以下に基づくものです。
@z

@x
* the `ENV` commands in the source container's Dockerfile
* the `-e`, `--env`, and `--env-file` options on the `docker run`
command when the source container is started
@y
{% comment %}
* the `ENV` commands in the source container's Dockerfile
* the `-e`, `--env`, and `--env-file` options on the `docker run`
command when the source container is started
{% endcomment %}
* 情報元のコンテナーにおける Dockerfile に記述された `ENV` コマンド
* 情報元のコンテナーを `docker run` によって起動する際の、`-e`, `--env`, `--env-file` オプション
@z

@x
These environment variables enable programmatic discovery from within the
target container of information related to the source container.
@y
{% comment %}
These environment variables enable programmatic discovery from within the
target container of information related to the source container.
{% endcomment %}
このような環境変数があることによって、発信元コンテナーに関する情報を、目的としているコンテナー内部においてプログラムレベルで検出できるようになります。
@z

@x
> **Warning**:
> It is important to understand that *all* environment variables originating
> from Docker within a container are made available to *any* container
> that links to it. This could have serious security implications if sensitive
> data is stored in them.
{:.warning}
@y
{% comment %}
> **Warning**:
> It is important to understand that *all* environment variables originating
> from Docker within a container are made available to *any* container
> that links to it. This could have serious security implications if sensitive
> data is stored in them.
{:.warning}
{% endcomment %}
> **警告**:
> コンテナー内の環境変数のうち Docker がもともと提供している環境変数はすべて、リンクしているどのコンテナーからも利用可能である点を、十分に留意しておいてください。
> その環境変数の中に重要な機密情報が含まれていたら、重大なセキュリティ問題にもなります。
{:.warning}
@z

@x
Docker sets an `<alias>_NAME` environment variable for each target container
listed in the `--link` parameter. For example, if a new container called
`web` is linked to a database container called `db` via `--link db:webdb`,
then Docker creates a `WEBDB_NAME=/web/webdb` variable in the `web` container.
@y
{% comment %}
Docker sets an `<alias>_NAME` environment variable for each target container
listed in the `--link` parameter. For example, if a new container called
`web` is linked to a database container called `db` via `--link db:webdb`,
then Docker creates a `WEBDB_NAME=/web/webdb` variable in the `web` container.
{% endcomment %}
`--link` パラメーターに指定されたコンテナーに対しては、`<alias>_NAME` という名前の環境変数が定義されます。
たとえば `web` という名前の新たなコンテナーが、`--link db:webdb` という指定を通じてデータベースコンテナー `db` にリンクしているとします。
このとき `web` コンテナー内には `WEBDB_NAME=/web/webdb` という環境変数が生成されます。
@z

@x
Docker also defines a set of environment variables for each port exposed by the
source container. Each variable has a unique prefix in the form:
@y
{% comment %}
Docker also defines a set of environment variables for each port exposed by the
source container. Each variable has a unique prefix in the form:
{% endcomment %}
さらに情報発信元となるコンテナーが公開しているポートに対しても、環境変数が定義されます。
各変数には一意なプリフィックスがつけられます。
@z

@x
`<name>_PORT_<port>_<protocol>`
@y
`<name>_PORT_<port>_<protocol>`
@z

@x
The components in this prefix are:
@y
{% comment %}
The components in this prefix are:
{% endcomment %}
プリフィックスは以下のものから構成されます。
@z

@x
* the alias `<name>` specified in the `--link` parameter (for example, `webdb`)
* the `<port>` number exposed
* a `<protocol>` which is either TCP or UDP
@y
{% comment %}
* the alias `<name>` specified in the `--link` parameter (for example, `webdb`)
* the `<port>` number exposed
* a `<protocol>` which is either TCP or UDP
{% endcomment %}
* `<name>`： `--link` パラメーターによって指定されたエイリアス名。
  (たとえば `webdb`)
* `<port>`： 公開されているポート番号。
* `<protocol>`： TCP、 UDP いずれかのプロトコル。
@z

@x
Docker uses this prefix format to define three distinct environment variables:
@y
{% comment %}
Docker uses this prefix format to define three distinct environment variables:
{% endcomment %}
このプリフィックスの書式から、以下の 3 つの環境変数が定義されます。
@z

@x
* The `prefix_ADDR` variable contains the IP Address from the URL, for
example `WEBDB_PORT_5432_TCP_ADDR=172.17.0.82`.
* The `prefix_PORT` variable contains just the port number from the URL for
example `WEBDB_PORT_5432_TCP_PORT=5432`.
* The `prefix_PROTO` variable contains just the protocol from the URL for
example `WEBDB_PORT_5432_TCP_PROTO=tcp`.
@y
{% comment %}
* The `prefix_ADDR` variable contains the IP Address from the URL, for
example `WEBDB_PORT_5432_TCP_ADDR=172.17.0.82`.
* The `prefix_PORT` variable contains just the port number from the URL for
example `WEBDB_PORT_5432_TCP_PORT=5432`.
* The `prefix_PROTO` variable contains just the protocol from the URL for
example `WEBDB_PORT_5432_TCP_PROTO=tcp`.
{% endcomment %}
* `prefix_ADDR` 変数： URL に対する IP アドレス。
  たとえば `WEBDB_PORT_5432_TCP_ADDR=172.17.0.82` など。
* `prefix_PORT` 変数： URL に対するポート番号。
  たとえば `WEBDB_PORT_5432_TCP_PORT=5432` など。
* `prefix_PROTO` 変数： URL に対するプロトコル。
  たとえば `WEBDB_PORT_5432_TCP_PROTO=tcp` など。
@z

@x
If the container exposes multiple ports, an environment variable set is
defined for each one. This means, for example, if a container exposes 4 ports
that Docker creates 12 environment variables, 3 for each port.
@y
{% comment %}
If the container exposes multiple ports, an environment variable set is
defined for each one. This means, for example, if a container exposes 4 ports
that Docker creates 12 environment variables, 3 for each port.
{% endcomment %}
コンテナーが複数ポートを公開している場合は、個々のポートに対して環境変数が定義されます。
これはたとえば、コンテナーが 4 つのポートを公開していたとすると、1 つのポートに対して 3 つの環境変数、つまり全部で 12 個の環境変数が定義されることになります。
@z

@x
Additionally, Docker creates an environment variable called `<alias>_PORT`.
This variable contains the URL of the source container's first exposed port.
The 'first' port is defined as the exposed port with the lowest number.
For example, consider the `WEBDB_PORT=tcp://172.17.0.82:5432` variable. If
that port is used for both tcp and udp, then the tcp one is specified.
@y
{% comment %}
Additionally, Docker creates an environment variable called `<alias>_PORT`.
This variable contains the URL of the source container's first exposed port.
The 'first' port is defined as the exposed port with the lowest number.
For example, consider the `WEBDB_PORT=tcp://172.17.0.82:5432` variable. If
that port is used for both tcp and udp, then the tcp one is specified.
{% endcomment %}
さらに `<alias>_PORT` という環境変数も生成されます。
この変数には、発信元コンテナーの一番初めの公開ポートを用いた URL が定義されます。
この「一番初めの」というのは、公開ポート番号の中で最も小さなものを指します。
たとえば `WEBDB_PORT=tcp://172.17.0.82:5432` という変数があったとして、このポートが tcp、udp の双方で利用されている場合、tcp が設定されます。
@z

@x
Finally, Docker also exposes each Docker originated environment variable
from the source container as an environment variable in the target. For each
variable Docker creates an `<alias>_ENV_<name>` variable in the target
container. The variable's value is set to the value Docker used when it
started the source container.
@y
{% comment %}
Finally, Docker also exposes each Docker originated environment variable
from the source container as an environment variable in the target. For each
variable Docker creates an `<alias>_ENV_<name>` variable in the target
container. The variable's value is set to the value Docker used when it
started the source container.
{% endcomment %}
最後に、発信元コンテナーにおいて Docker が元から定義している環境変数が、対象とするコンテナー上の環境変数として公開されます。
各変数に対しては、対象コンテナー上に `<alias>_ENV_<name>` という変数が生成されます。
この変数の値は、発信元コンテナーが起動する際に、Docker が利用した値が設定されます。
@z

@x
Returning back to our database example, you can run the `env`
command to list the specified container's environment variables.
@y
{% comment %}
Returning back to our database example, you can run the `env`
command to list the specified container's environment variables.
{% endcomment %}
データベースの例に戻ります。
`env` コマンドを実行して、指定するコンテナー上の環境変数を一覧表示してみます。
@z

@x
```
    $ docker run --rm --name web2 --link db:db training/webapp env
@y
```
    $ docker run --rm --name web2 --link db:db training/webapp env
@z

@x
    . . .
    DB_NAME=/web2/db
    DB_PORT=tcp://172.17.0.5:5432
    DB_PORT_5432_TCP=tcp://172.17.0.5:5432
    DB_PORT_5432_TCP_PROTO=tcp
    DB_PORT_5432_TCP_PORT=5432
    DB_PORT_5432_TCP_ADDR=172.17.0.5
    . . .
```
@y
    . . .
    DB_NAME=/web2/db
    DB_PORT=tcp://172.17.0.5:5432
    DB_PORT_5432_TCP=tcp://172.17.0.5:5432
    DB_PORT_5432_TCP_PROTO=tcp
    DB_PORT_5432_TCP_PORT=5432
    DB_PORT_5432_TCP_ADDR=172.17.0.5
    . . .
```
@z

@x
You can see that Docker has created a series of environment variables with
useful information about the source `db` container. Each variable is prefixed
with
`DB_`, which is populated from the `alias` you specified above. If the `alias`
were `db1`, the variables would be prefixed with `DB1_`. You can use these
environment variables to configure your applications to connect to the database
on the `db` container. The connection is secure and private; only the
linked `web` container can communicate with the `db` container.
@y
{% comment %}
You can see that Docker has created a series of environment variables with
useful information about the source `db` container. Each variable is prefixed
with
`DB_`, which is populated from the `alias` you specified above. If the `alias`
were `db1`, the variables would be prefixed with `DB1_`. You can use these
environment variables to configure your applications to connect to the database
on the `db` container. The connection is secure and private; only the
linked `web` container can communicate with the `db` container.
{% endcomment %}
この出力から、情報元である `db` コンテナーに関して必要となる情報が、環境変数としていくつも生成されているのがわかります。
各環境変数には `DB_` というプリフィックスがつけられていて、これは上で指定した `alias` から命名されたものです。
`alias` を `db1` としていたら、環境変数のプリフィックスは `DB1_` になっていたはずです。
この環境変数を使えば、`db` コンテナー上にあるデータベースに、アプリケーションから接続する設定を行うことができます。
その際の接続はセキュアでありプライベートなものです。
そしてリンクしている `web` コンテナーだけが、`db` コンテナーとの通信を行うことができます。
@z

@x
### Important notes on Docker environment variables
@y
{% comment %}
### Important notes on Docker environment variables
{% endcomment %}
{: #important-notes-on-docker-environment-variables }
### Docker 環境変数に関する重要事項
@z

@x
Unlike host entries in the [`/etc/hosts` file](#updating-the-etchosts-file),
IP addresses stored in the environment variables are not automatically updated
if the source container is restarted. We recommend using the host entries in
`/etc/hosts` to resolve the IP address of linked containers.
@y
{% comment %}
Unlike host entries in the [`/etc/hosts` file](#updating-the-etchosts-file),
IP addresses stored in the environment variables are not automatically updated
if the source container is restarted. We recommend using the host entries in
`/etc/hosts` to resolve the IP address of linked containers.
{% endcomment %}
[`/etc/hosts` ファイル](#updating-the-etchosts-file) におけるホストの設定とは違って、環境変数内に保存された IP アドレスは、発信元のコンテナーが再起動されたときに自動的に更新されません。
リンクされたコンテナーの IP アドレスを取得するためには、`/etc/hosts` に設定することをお勧めします。
@z

@x
These environment variables are only set for the first process in the
container. Some daemons, such as `sshd`, scrub them when spawning shells
for connection.
@y
{% comment %}
These environment variables are only set for the first process in the
container. Some daemons, such as `sshd`, scrub them when spawning shells
for connection.
{% endcomment %}
こういった環境変数の設定は、そのコンテナーの初期処理段階でのみ行われます。
デーモンの中には `sshd` などのように、接続を実現するために起動するシェルにおいて、そのような変数を破棄するものもあります。
@z

@x
### Updating the `/etc/hosts` file
@y
{% comment %}
### Updating the `/etc/hosts` file
{% endcomment %}
{: #updating-the-etchosts-file }
### `/etc/hosts` ファイルの更新
@z

@x
In addition to the environment variables, Docker adds a host entry for the
source container to the `/etc/hosts` file. Here's an entry for the `web`
container:
@y
{% comment %}
In addition to the environment variables, Docker adds a host entry for the
source container to the `/etc/hosts` file. Here's an entry for the `web`
container:
{% endcomment %}
環境変数とは別に Docker は、発信元コンテナーを示すホスト設定を `/etc/hosts` ファイルに加えます。以下は `web` コンテナーに対するホスト設定の例です。
@z

@x
    $ docker run -t -i --rm --link db:webdb training/webapp /bin/bash
@y
    $ docker run -t -i --rm --link db:webdb training/webapp /bin/bash
@z

@x
    root@aed84ee21bde:/opt/webapp# cat /etc/hosts
@y
    root@aed84ee21bde:/opt/webapp# cat /etc/hosts
@z

@x
    172.17.0.7  aed84ee21bde
    . . .
    172.17.0.5  webdb 6e5cdeb2d300 db
@y
    172.17.0.7  aed84ee21bde
    . . .
    172.17.0.5  webdb 6e5cdeb2d300 db
@z

@x
You can see two relevant host entries. The first is an entry for the `web`
container that uses the Container ID as a host name. The second entry uses the
link alias to reference the IP address of the `db` container. In addition to
the alias you provide, the linked container's name, if unique from the alias
provided to the `--link` parameter, and the linked container's hostname are
also added to `/etc/hosts` for the linked container's IP address. You can ping
that host via any of these entries:
@y
{% comment %}
You can see two relevant host entries. The first is an entry for the `web`
container that uses the Container ID as a host name. The second entry uses the
link alias to reference the IP address of the `db` container. In addition to
the alias you provide, the linked container's name, if unique from the alias
provided to the `--link` parameter, and the linked container's hostname are
also added to `/etc/hosts` for the linked container's IP address. You can ping
that host via any of these entries:
{% endcomment %}
上においては、関連する 2 つの設定を見ることができます。
1 つめは `web` コンテナーに対する設定であり、ホスト名としてコンテナー ID が用いられています。
2 つめの設定では、`db` コンテナーの IP アドレスを参照する、リンク機能のエイリアスを用いています。
エイリアス名の他に、リンクされたコンテナー名も追加されています。
そして `--link` パラメーターによって指定されたエイリアスとホスト名が異なっていれば、このホスト名も、`/etc/hosts` 内のリンクされたコンテナーの IP アドレスに対して追加されます。
設定項目の要素のどれを使っても ping を実行することができます。
@z

@x
    root@aed84ee21bde:/opt/webapp# apt-get install -yqq inetutils-ping
@y
    root@aed84ee21bde:/opt/webapp# apt-get install -yqq inetutils-ping
@z

@x
    root@aed84ee21bde:/opt/webapp# ping webdb
@y
    root@aed84ee21bde:/opt/webapp# ping webdb
@z

@x
    PING webdb (172.17.0.5): 48 data bytes
    56 bytes from 172.17.0.5: icmp_seq=0 ttl=64 time=0.267 ms
    56 bytes from 172.17.0.5: icmp_seq=1 ttl=64 time=0.250 ms
    56 bytes from 172.17.0.5: icmp_seq=2 ttl=64 time=0.256 ms
@y
    PING webdb (172.17.0.5): 48 data bytes
    56 bytes from 172.17.0.5: icmp_seq=0 ttl=64 time=0.267 ms
    56 bytes from 172.17.0.5: icmp_seq=1 ttl=64 time=0.250 ms
    56 bytes from 172.17.0.5: icmp_seq=2 ttl=64 time=0.256 ms
@z

@x
> **Note**:
> In the example, you had to install `ping` because it was not included
> in the container initially.
@y
{% comment %}
> **Note**:
> In the example, you had to install `ping` because it was not included
> in the container initially.
{% endcomment %}
> **メモ**:
> ここに示す例においては `ping` をインストールしています。
> このコンテナーの初期状態ではインストールされていないためです。
@z

@x
Here, you used the `ping` command to ping the `db` container using its host entry,
which resolves to `172.17.0.5`. You can use this host entry to configure an application
to make use of your `db` container.
@y
{% comment %}
Here, you used the `ping` command to ping the `db` container using its host entry,
which resolves to `172.17.0.5`. You can use this host entry to configure an application
to make use of your `db` container.
{% endcomment %}
上では `db` コンテナーに対しての `ping` コマンド実行において、`/etc/hosts` の設定項目を利用しました。
そしてそれは `172.17.0.5` であることがわかりました。
このように `/etc/hosts` の設定項目を用いてアプリケーションを設定すれば、`db` コンテナーを利用することができます。
@z

@x
> **Note**:
> You can link multiple recipient containers to a single source. For
> example, you could have multiple (differently named) web containers attached to your
>`db` container.
@y
{% comment %}
> **Note**:
> You can link multiple recipient containers to a single source. For
> example, you could have multiple (differently named) web containers attached to your
>`db` container.
{% endcomment %}
> **メモ**:
> 情報発信元となる 1 つのコンテナーに対して、受信先となるコンテナーを複数リンクすることができます。
> たとえば複数の（名前の異なる）ウェブコンテナーを `db` コンテナーにリンクすることもできます。
@z

@x
If you restart the source container, the `/etc/hosts` files on the linked containers
are automatically updated with the source container's new IP address,
allowing linked communication to continue.
@y
{% comment %}
If you restart the source container, the `/etc/hosts` files on the linked containers
are automatically updated with the source container's new IP address,
allowing linked communication to continue.
{% endcomment %}
情報発信元となるコンテナーを再起動すると、リンクされたコンテナー内の `/etc/hosts` ファイルは自動的に更新されて、発信元コンテナーの新たな IP アドレスが設定されます。
こうしてリンクされた通信状態が維持されます。
@z

@x
    $ docker restart db
@y
    $ docker restart db
@z

@x
    db
@y
    db
@z

@x
    $ docker run -t -i --rm --link db:db training/webapp /bin/bash
@y
    $ docker run -t -i --rm --link db:db training/webapp /bin/bash
@z

@x
    root@aed84ee21bde:/opt/webapp# cat /etc/hosts
@y
    root@aed84ee21bde:/opt/webapp# cat /etc/hosts
@z

@x
    172.17.0.7  aed84ee21bde
    . . .
    172.17.0.9  db
@y
    172.17.0.7  aed84ee21bde
    . . .
    172.17.0.9  db
@z
