%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Pruning unused objects
keywords: pruning, prune, images, volumes, containers, networks, disk, administration, garbage collection
title: Prune unused Docker objects
redirect_from:
- /engine/admin/pruning/
---
@y
---
description: 未使用オブジェクトを取り除く。
keywords: pruning, prune, images, volumes, containers, networks, disk, administration, garbage collection
title: 未使用 Docker オブジェクトの取り除き
redirect_from:
- /engine/admin/pruning/
---
@z

@x
Docker takes a conservative approach to cleaning up unused objects (often
referred to as "garbage collection"), such as images, containers, volumes, and
networks: these objects are generally not removed unless you explicitly ask
Docker to do so. This can cause Docker to use extra disk space. For each type of
object, Docker provides a `prune` command. In addition, you can use `docker
system prune` to clean up multiple types of objects at once. This topic shows
how to use these `prune` commands.
@y
Docker では未使用となったオブジェクトを取り除くために、従来どおりの（"ガベージコレクション" と呼ばれる）方法をとっています。
オブジェクトは、イメージ、コンテナー、ボリューム、ネットワークなどです。
こういったオブジェクトは、Docker に対して明示的に削除の指示を出さない限り、普通は削除されません。
こういった場合、Docker が余計なディスク容量を消費することにもつながります。
そこで Docker では、オブジェクトごとに`prune`コマンドが提供されています。
さらに`docker system prune`を使えば、複数タイプのオブジェクトを一度に取り除くことができます。
ここでは、そういった`prune`コマンドの利用方法について示します。
@z

@x
## Prune images
@y
{: #prune-images }
## イメージの取り除き
@z

@x
The `docker image prune` command allows you to clean up unused images. By
default, `docker image prune` only cleans up _dangling_ images. A dangling image
is one that is not tagged and is not referenced by any container. To remove
dangling images:
@y
`docker image prune`コマンドは未使用イメージを取り除くものです。
デフォルトで`docker image prune`は **「浮いている」**（dangling）イメージのみを対象とします。
ここで「浮いている」イメージとは、タグづけがされておらず、どのコンテナーからも参照されていないものを指します。
「浮いている」イメージを削除するには以下を行います。
@z

@x
```console
$ docker image prune

WARNING! This will remove all dangling images.
Are you sure you want to continue? [y/N] y
```
@y
```console
$ docker image prune

WARNING! This will remove all dangling images.
Are you sure you want to continue? [y/N] y
```
@z

@x
To remove all images which are not used by existing containers, use the `-a`
flag:
@y
既存コンテナーから利用されていないイメージをすべて削除するには`-a`フラグを使います。
@z

@x
```console
$ docker image prune -a

WARNING! This will remove all images without at least one container associated to them.
Are you sure you want to continue? [y/N] y
```
@y
```console
$ docker image prune -a

WARNING! This will remove all images without at least one container associated to them.
Are you sure you want to continue? [y/N] y
```
@z

@x
By default, you are prompted to continue. To bypass the prompt, use the `-f` or
`--force` flag.
@y
デフォルトでは、続行して良いかどうかが表示されます。
このプロンプトを省略したい場合は`-f`または`--force`フラグを用います。
@z

@x
You can limit which images are pruned using filtering expressions with the
`--filter` flag. For example, to only consider images created more than 24
hours ago:
@y
取り除かれるイメージを限定したい場合は、`--filter`フラグによるフィルター表現を指定することができます。
たとえば、生成されてから 24 時間以上経過したイメージを対象とする場合は、以下のようにします。
@z

@x
```console
$ docker image prune -a --filter "until=24h"
```
@y
```console
$ docker image prune -a --filter "until=24h"
```
@z

@x
Other filtering expressions are available. See the
[`docker image prune` reference](../engine/reference/commandline/image_prune.md)
for more examples.
@y
フィルター表現は他にもあります。
さまざまな例については [`docker image prune`リファレンス](../engine/reference/commandline/image_prune.md) を参照してください。
@z

@x
## Prune containers
@y
{: #prune-containers }
## コンテナーの取り除き
@z

@x
When you stop a container, it is not automatically removed unless you started it
with the `--rm` flag. To see all containers on the Docker host, including
stopped containers, use `docker ps -a`. You may be surprised how many containers
exist, especially on a development system! A stopped container's writable layers
still take up disk space. To clean this up, you can use the `docker container
prune` command.
@y
コンテナーを停止しても、`--rm`フラグを指定した起動を行っていなければ、コンテナーは自動的には削除されません。
Docker ホスト上において、停止しているコンテナーも含めてコンテナーすべてを見るには`docker ps -a`を実行します。
ひょっとすると特に開発マシンでは、たくさんのコンテナーが存在していたことに驚くかもしれません。
停止しているコンテナーの書き込みレイヤーは、まだディスク領域を占有しています。
これを取り除くには`docker container prune`コマンドを実行します。
@z

@x
```console
$ docker container prune
@y
```console
$ docker container prune
@z

@x
WARNING! This will remove all stopped containers.
Are you sure you want to continue? [y/N] y
```
@y
WARNING! This will remove all stopped containers.
Are you sure you want to continue? [y/N] y
```
@z

@x
By default, you are prompted to continue. To bypass the prompt, use the `-f` or
`--force` flag.
@y
デフォルトでは、続行して良いかどうかが表示されます。
このプロンプトを省略したい場合は`-f`または`--force`フラグを用います。
@z

@x
By default, all stopped containers are removed. You can limit the scope using
the `--filter` flag. For instance, the following command only removes
stopped containers older than 24 hours:
@y
デフォルトで、停止しているコンテナーはすべて削除されます。
`--filter`フラグを使うと、削除の範囲を限定することができます。
たとえば以下のコマンドの場合、停止してから 24 時間以上経過したコンテナーを削除します。
@z

@x
```console
$ docker container prune --filter "until=24h"
```
@y
```console
$ docker container prune --filter "until=24h"
```
@z

@x
Other filtering expressions are available. See the
[`docker container prune` reference](../engine/reference/commandline/container_prune.md)
for more examples.
@y
フィルター表現は他にもあります。
さまざまな例については [`docker container prune`リファレンス](../engine/reference/commandline/container_prune.md) を参照してください。
@z

@x
## Prune volumes
@y
{: #prune-volumes }
## ボリュームの取り除き
@z

@x
Volumes can be used by one or more containers, and take up space on the Docker
host. Volumes are never removed automatically, because to do so could destroy
data.
@y
ボリュームは複数のコンテナーにおいて利用できるものです。
したがって Docker ホスト上に容量を多くとります。
ボリュームは自動的に削除されることがありません。
これを行ってしまうと、データを壊してしまうかもしれないからです。
@z

@x
```console
$ docker volume prune
@y
```console
$ docker volume prune
@z

@x
WARNING! This will remove all volumes not used by at least one container.
Are you sure you want to continue? [y/N] y
```
@y
WARNING! This will remove all volumes not used by at least one container.
Are you sure you want to continue? [y/N] y
```
@z

@x
By default, you are prompted to continue. To bypass the prompt, use the `-f` or
`--force` flag.
@y
デフォルトでは、続行して良いかどうかが表示されます。
このプロンプトを省略したい場合は`-f`または`--force`フラグを用います。
@z

@x
By default, all unused volumes are removed. You can limit the scope using
the `--filter` flag. For instance, the following command only removes
volumes which are not labelled with the `keep` label:
@y
デフォルトで、未使用のボリュームはすべて削除されます。
`--filter`フラグを使うと、削除の範囲を限定することができます。
たとえば以下のコマンドの場合、`keep`ラベルがついていないボリュームだけが削除されます。
@z

@x
```console
$ docker volume prune --filter "label!=keep"
```
@y
```console
$ docker volume prune --filter "label!=keep"
```
@z

@x
Other filtering expressions are available. See the
[`docker volume prune` reference](../engine/reference/commandline/volume_prune.md)
for more examples.
@y
フィルター表現は他にもあります。
さまざまな例については [`docker volume prune`リファレンス](../engine/reference/commandline/volume_prune.md) を参照してください。
@z

@x
## Prune networks
@y
{: #prune-networks }
## ネットワークの取り除き
@z

@x
Docker networks don't take up much disk space, but they do create `iptables`
rules, bridge network devices, and routing table entries. To clean these things
up, you can use `docker network prune` to clean up networks which aren't used
by any containers.
@y
Docker ネットワークはそれほど容量をとるものではありません。
ただしネットワークからは、`iptables`ルール、ブリッジネットワークデバイス、ルーティングテーブル項目が生成されます。
これらを削除するために`docker network prune`コマンドを用います。
これによって、どのコンテナーからも利用されていないネットワークが削除されます。
@z

@x
```console
$ docker network prune
@y
```console
$ docker network prune
@z

@x
WARNING! This will remove all networks not used by at least one container.
Are you sure you want to continue? [y/N] y
```
@y
WARNING! This will remove all networks not used by at least one container.
Are you sure you want to continue? [y/N] y
```
@z

@x
By default, you are prompted to continue. To bypass the prompt, use the `-f` or
`--force` flag.
@y
デフォルトでは、続行して良いかどうかが表示されます。
このプロンプトを省略したい場合は `-f`または`--force`フラグを用います。
@z

@x
By default, all unused networks are removed. You can limit the scope using
the `--filter` flag. For instance, the following command only removes
networks older than 24 hours:
@y
デフォルトで、未使用のネットワークはすべて削除されます。
`--filter`フラグを使うと、削除の範囲を限定することができます。
たとえば以下のコマンドの場合、24 時間以上古いネットワークを削除します。
@z

@x
```console
$ docker network prune --filter "until=24h"
```
@y
```console
$ docker network prune --filter "until=24h"
```
@z

@x
Other filtering expressions are available. See the
[`docker network prune` reference](../engine/reference/commandline/network_prune.md)
for more examples.
@y
フィルター表現は他にもあります。
さまざまな例については [`docker network prune`リファレンス](../engine/reference/commandline/network_prune.md) を参照してください。
@z

@x
## Prune everything
@y
{: #prune-everything }
## すべての取り除き
@z

@x
The `docker system prune` command is a shortcut that prunes images, containers,
and networks. Volumes are not pruned by default, and you must specify the
`--volumes` flag for `docker system prune` to prune volumes.
@y
`docker system prune`コマンドは、イメージ、コンテナー、ネットワークを取り除くコマンドを合わせたものです。
ボリュームはデフォルトでは取り除かれません。
`docker system prune`実行時にボリュームも取り除くには`--volumes`フラグをつける必要があります。
@z

@x
```console
$ docker system prune
@y
```console
$ docker system prune
@z

@x
WARNING! This will remove:
        - all stopped containers
        - all networks not used by at least one container
        - all dangling images
        - all build cache
Are you sure you want to continue? [y/N] y
```
@y
WARNING! This will remove:
        - all stopped containers
        - all networks not used by at least one container
        - all dangling images
        - all build cache
Are you sure you want to continue? [y/N] y
```
@z

@x
To also prune volumes, add the `--volumes` flag:
@y
ボリュームも取り除きたい場合は`--volumes`フラグをつけます。
@z

@x
```console
$ docker system prune --volumes
@y
```console
$ docker system prune --volumes
@z

@x
WARNING! This will remove:
        - all stopped containers
        - all networks not used by at least one container
        - all volumes not used by at least one container
        - all dangling images
        - all build cache
Are you sure you want to continue? [y/N] y
```
@y
WARNING! This will remove:
        - all stopped containers
        - all networks not used by at least one container
        - all volumes not used by at least one container
        - all dangling images
        - all build cache
Are you sure you want to continue? [y/N] y
```
@z

@x
By default, you are prompted to continue. To bypass the prompt, use the `-f` or
`--force` flag.
@y
デフォルトでは、続行して良いかどうかが表示されます。
このプロンプトを省略したい場合は`-f`または`--force`フラグを用います。
@z
