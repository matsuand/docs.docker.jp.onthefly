%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Docker Desktop for Windows and Docker Toolbox
keywords: windows, alpha, beta, toolbox, docker-machine, tutorial
sitemap: false
title: Docker Toolbox
redirect_from:
- /toolbox/
- /toolbox/overview/
- /toolbox/toolbox_install_mac/
- /toolbox/toolbox_install_windows/
- /toolbox/faqs/
- /toolbox/faqs/troubleshoot/
- /docker-for-mac/docker-toolbox/
toc_min: 1
toc_max: 2
---
@y
---
description: Docker Desktop for Windows and Docker Toolbox
keywords: windows, alpha, beta, toolbox, docker-machine, tutorial
sitemap: false
title: Docker Toolbox
redirect_from:
- /toolbox/
- /toolbox/overview/
- /toolbox/toolbox_install_mac/
- /toolbox/toolbox_install_windows/
- /toolbox/faqs/
- /toolbox/faqs/troubleshoot/
- /docker-for-mac/docker-toolbox/
toc_min: 1
toc_max: 2
---
@z

@x
>**Deprecated**
>
> Docker Toolbox has been deprecated and is no longer in active development. Please use Docker Desktop instead. See [Docker Desktop for Mac](../docker-for-mac/index.md) and [Docker Desktop for Windows](../docker-for-windows/index.md).
{: .warning }
@y
{% comment %}
>**Deprecated**
>
> Docker Toolbox has been deprecated and is no longer in active development. Please use Docker Desktop instead. See [Docker Desktop for Mac](../docker-for-mac/index.md) and [Docker Desktop for Windows](../docker-for-windows/index.md).
{: .warning }
{% endcomment %}
>**廃止決定**
>
> Docker Toolbox は廃止決定されており、開発は行われていません。
  この代わりに Docker Desktop を利用してください。
  詳しくは [Docker Desktop for Mac](../docker-for-mac/index.md) や [Docker Desktop for Windows](../docker-for-windows/index.md) を参照してください。
{: .warning }
@z

@x
This page explains how to migrate your Docker Toolbox disk images to Docker Desktop. It also contains instructions on how to uninstall Docker Toolbox from Mac and Windows machines.
@y
{% comment %}
This page explains how to migrate your Docker Toolbox disk images to Docker Desktop. It also contains instructions on how to uninstall Docker Toolbox from Mac and Windows machines.
{% endcomment %}
このページでは Docker Toolbox ディスクイメージを Docker Desktop へ移行する方法について説明します。
また Docker Toolbox を Mac または Windows からアンインストールする手順についても説明します。
@z

@x
## Migrate from Docker Toolbox to Docker Desktop on Mac
@y
{% comment %}
## Migrate from Docker Toolbox to Docker Desktop on Mac
{% endcomment %}
{: #migrate-from-docker-toolbox-to-docker-desktop-on-mac }
## Docker Toolbox から Docker Desktop on Mac への移行
@z

@x
You can migrate existing Docker Toolbox images with the steps described below.
@y
{% comment %}
You can migrate existing Docker Toolbox images with the steps described below.
{% endcomment %}
Docker Toolbox イメージを移行するには以下の手順を行います。
@z

@x
In a terminal, while running Toolbox, use `docker commit` to create an image snapshot
from a container, for each container you wish to preserve:
@y
{% comment %}
In a terminal, while running Toolbox, use `docker commit` to create an image snapshot
from a container, for each container you wish to preserve:
{% endcomment %}
Toolbox が起動している状態でターミナル画面から`docker commit`を実行し、保存しておきたいコンテナーのイメージスナップショットを生成します。
@z

@x
```
$ docker commit nginx
sha256:1bc0ee792d144f0f9a1b926b862dc88b0206364b0931be700a313111025df022
```
@y
```
$ docker commit nginx
sha256:1bc0ee792d144f0f9a1b926b862dc88b0206364b0931be700a313111025df022
```
@z

@x
Next, export each of these images (and any other images you wish to keep):
@y
{% comment %}
Next, export each of these images (and any other images you wish to keep):
{% endcomment %}
次にそのイメージをエクスポートします（保存しておきたいイメージすべてについて行います）。
@z

@x
```
$ docker save -o nginx.tar sha256:1bc0ee792d144f0f9a1b926b862dc88b0206364b0931be700a313111025df022
```
@y
```
$ docker save -o nginx.tar sha256:1bc0ee792d144f0f9a1b926b862dc88b0206364b0931be700a313111025df022
```
@z

@x
Next, when running Docker Desktop on Mac, reload all these images:
@y
{% comment %}
Next, when running Docker Desktop on Mac, reload all these images:
{% endcomment %}
Docker Desktop on Mac が起動している状態で、上のイメージをリロードします。
@z

@x
```
$ docker load -i nginx.tar
Loaded image ID: sha256:1bc0ee792d144f0f9a1b926b862dc88b0206364b0931be700a313111025df022
```
@y
```
$ docker load -i nginx.tar
Loaded image ID: sha256:1bc0ee792d144f0f9a1b926b862dc88b0206364b0931be700a313111025df022
```
@z

@x
Note these steps will not migrate any `docker volume` contents: these must
be copied across manually.
@y
{% comment %}
Note these steps will not migrate any `docker volume` contents: these must
be copied across manually.
{% endcomment %}
なお上の手順を行っても`docker volume`の内容は一切移行されません。
これについては手動でコピーを行ってください。
@z

@x
Finally (optional), if you are done with Docker Toolbox, you can fully
[uninstall](#uninstall-docker-toolbox-on-windows) Docker Toolbox using the instructions described in the following section.
@y
{% comment %}
Finally (optional), if you are done with Docker Toolbox, you can fully
[uninstall](#uninstall-docker-toolbox-on-windows) Docker Toolbox using the instructions described in the following section.
{% endcomment %}
最後に任意の作業として Docker Toolbox での作業が他に何もなければ、Docker Toolbox の [アンインストール](#uninstall-docker-toolbox-on-windows) を行います。
その手順は以降の節で説明しています。
@z

@x
## Migrate from Docker Toolbox to Docker Desktop on Windows
@y
{% comment %}
## Migrate from Docker Toolbox to Docker Desktop on Windows
{% endcomment %}
{: #migrate-from-docker-toolbox-to-docker-desktop-on-windows }
## Docker Toolbox から Docker Desktop on Windows への移行
@z

@x
You can migrate existing Docker Toolbox images with the steps described below.
@y
{% comment %}
You can migrate existing Docker Toolbox images with the steps described below.
{% endcomment %}
Docker Toolbox イメージを移行するには以下の手順を行います。
@z

@x
In a terminal, while running Toolbox, use `docker commit` to create an image snapshot
from a container, for each container you wish to preserve:
@y
{% comment %}
In a terminal, while running Toolbox, use `docker commit` to create an image snapshot
from a container, for each container you wish to preserve:
{% endcomment %}
Toolbox が起動している状態でターミナル画面から`docker commit`を実行し、保存しておきたいコンテナーのイメージスナップショットを生成します。
@z

@x
```
> docker commit nginx
sha256:1bc0ee792d144f0f9a1b926b862dc88b0206364b0931be700a313111025df022
```
@y
```
> docker commit nginx
sha256:1bc0ee792d144f0f9a1b926b862dc88b0206364b0931be700a313111025df022
```
@z

@x
Next, export each of these images (and any other images you wish to keep):
@y
{% comment %}
Next, export each of these images (and any other images you wish to keep):
{% endcomment %}
次にそのイメージをエクスポートします（保存しておきたいイメージすべてについて行います）。
@z

@x
```
> docker save -o nginx.tar sha256:1bc0ee792d144f0f9a1b926b862dc88b0206364b0931be700a313111025df022
```
@y
```
> docker save -o nginx.tar sha256:1bc0ee792d144f0f9a1b926b862dc88b0206364b0931be700a313111025df022
```
@z

@x
Next, when running Docker Desktop on Windows, reload all these images:
@y
{% comment %}
Next, when running Docker Desktop on Windows, reload all these images:
{% endcomment %}
Docker Desktop on Windows が起動している状態で、上のイメージをリロードします。
@z

@x
```
> docker load -i nginx.tar
Loaded image ID: sha256:1bc0ee792d144f0f9a1b926b862dc88b0206364b0931be700a313111025df022
```
@y
```
> docker load -i nginx.tar
Loaded image ID: sha256:1bc0ee792d144f0f9a1b926b862dc88b0206364b0931be700a313111025df022
```
@z

@x
Note these steps will not migrate any `docker volume` contents: these must
be copied across manually.
@y
{% comment %}
Note these steps will not migrate any `docker volume` contents: these must
be copied across manually.
{% endcomment %}
なお上の手順を行っても`docker volume`の内容は一切移行されません。
これについては手動でコピーを行ってください。
@z

@x
## Uninstall Docker Toolbox
@y
{% comment %}
## Uninstall Docker Toolbox
{% endcomment %}
{: #uninstall-docker-toolbox }
## Docker Toolbox のアンインストール
@z

@x
Removing Toolbox involves removing all the Docker components it includes.
@y
{% comment %}
Removing Toolbox involves removing all the Docker components it includes.
{% endcomment %}
Toolbox を削除するということは、そこに含まれていた Docker コンポーネントをすべて削除するということです。
@z

@x
A full uninstall also includes removing the local and remote machines
you created with Docker Machine. In some cases, you might want to keep
machines created with Docker Machine. For example, if you plan to re-install Docker Machine as a part of Docker Desktop, you can continue to manage those machines through Docker. Or, if you have remote machines on a cloud provider and you plan to manage them using the provider, you wouldn't want to remove
them. So, the step to remove machines is described here as optional.
@y
{% comment %}
A full uninstall also includes removing the local and remote machines
you created with Docker Machine. In some cases, you might want to keep
machines created with Docker Machine. For example, if you plan to re-install Docker Machine as a part of Docker Desktop, you can continue to manage those machines through Docker. Or, if you have remote machines on a cloud provider and you plan to manage them using the provider, you wouldn't want to remove
them. So, the step to remove machines is described here as optional.
{% endcomment %}
また完全にアンインストールを行うと、Docker Machine を使って生成したローカルマシンおよびリモートマシンもすべて削除されます。
場合によっては Docker Machine によって生成したマシンを保存しておきたいことがあるはずです。
たとえば Docker Desktop の一部として Docker Machine を再インストールしようとしている場合には、引き続きそのようなマシンを管理していきたいはずです。
あるいはクラウドプロバイダー上にリモートマシンを生成していて、プロバイダー上の管理を引き続き行うのであれば、マシンを削除したくないはずです。
そこで以下の説明においては、マシン削除の手順は任意の作業として説明することにします。
@z

@x
### Uninstall Docker Toolbox on Mac
@y
{% comment %}
### Uninstall Docker Toolbox on Mac
{% endcomment %}
{: #uninstall-docker-toolbox-on-mac }
### Docker Toolbox on Mac のアンインストール
@z

@x
To uninstall Docker Toolbox on Mac:
@y
{% comment %}
To uninstall Docker Toolbox on Mac:
{% endcomment %}
Docker Toolbox on Mac のアンインストールは以下のようにして行います。
@z

@x
1.  List your machines.
@y
{% comment %}
1.  List your machines.
{% endcomment %}
1.  マシン一覧を表示します。
@z

@x
    ```
    $ docker-machine ls
    NAME                ACTIVE   DRIVER       STATE     URL                        SWARM
    dev                 *        virtualbox   Running   tcp://192.168.99.100:2376
    my-docker-machine            virtualbox   Stopped
    default                      virtualbox   Stopped
    ```
@y
    ```
    $ docker-machine ls
    NAME                ACTIVE   DRIVER       STATE     URL                        SWARM
    dev                 *        virtualbox   Running   tcp://192.168.99.100:2376
    my-docker-machine            virtualbox   Stopped
    default                      virtualbox   Stopped
    ```
@z

@x
2.  Optionally, remove each machine. For example:
@y
{% comment %}
2.  Optionally, remove each machine. For example:
{% endcomment %}
2.  任意の手順として個々のマシンを削除します。
    たとえば以下のとおりです。
@z

@x
    ```
    $ docker-machine rm my-docker-machine
    Successfully removed my-docker-machine
    ```
@y
    ```
    $ docker-machine rm my-docker-machine
    Successfully removed my-docker-machine
    ```
@z

@x
    This step is optional because if you plan
    to re-install Docker Machine as a part
    of [Docker Desktop for Mac](../docker-for-mac/index.md), you can import and
    continue to manage those machines through Docker.
@y
    {% comment %}
    This step is optional because if you plan
    to re-install Docker Machine as a part
    of [Docker Desktop for Mac](../docker-for-mac/index.md), you can import and
    continue to manage those machines through Docker.
    {% endcomment %}
    この手順は任意です。
    [Docker Desktop for Mac](../docker-for-mac/index.md) の一部として Docker Machine を再インストールする予定であれば、上のマシンをインポートして Docker による管理を引き続き行っていくことができます。
@z

@x
3.  In your "Applications" folder, remove the "Docker" directory,
    which contains "Docker Quickstart Terminal" and "Kitematic".
@y
{% comment %}
3.  In your "Applications" folder, remove the "Docker" directory,
    which contains "Docker Quickstart Terminal" and "Kitematic".
{% endcomment %}
3.  「Applications」フォルダーにおいて、「Docker Quickstart Terminal」や「Kitematic」が含まれている「Docker」ディレクトリを削除します。
@z

@x
4.  Run the following in a command shell to fully remove Kitematic:
@y
{% comment %}
4.  Run the following in a command shell to fully remove Kitematic:
{% endcomment %}
4.  コマンドシェルから以下のコマンドを実行して Kitematic を完全に削除します。
@z

@x
    ```
    $ rm -fr ~/Library/Application\ Support/Kitematic
    ```
@y
    ```
    $ rm -fr ~/Library/Application\ Support/Kitematic
    ```
@z

@x
5.  Remove the `docker`, `docker-compose`, and `docker-machine` commands from
    the `/usr/local/bin` folder.  Docker Desktop for Mac and Brew may also have
    installed them; in case of doubt leave them, or reinstall them via Brew, or
    rerun Docker Desktop for Mac (no need to reinstall it).
@y
{% comment %}
5.  Remove the `docker`, `docker-compose`, and `docker-machine` commands from
    the `/usr/local/bin` folder.  Docker Desktop for Mac and Brew may also have
    installed them; in case of doubt leave them, or reinstall them via Brew, or
    rerun Docker Desktop for Mac (no need to reinstall it).
{% endcomment %}
5.  `/usr/local/bin`フォルダーから`docker`、`docker-compose`、`docker-machine`の各コマンドを削除します。
    Docker Desktop for Mac や Brew にはそれらがインストールされたままかもしれません。
    それが疑われる場合は、Brew を通した再インストールを行うか、Docker Desktop for Mac を再起動してください（再インストールの必要はありません）。
@z

@x
    ```
    $ rm -f /usr/local/bin/docker
    $ rm -f /usr/local/bin/docker-compose
    $ rm -f /usr/local/bin/docker-machine
    ```
@y
    ```
    $ rm -f /usr/local/bin/docker
    $ rm -f /usr/local/bin/docker-compose
    $ rm -f /usr/local/bin/docker-machine
    ```
@z

@x
6.  Optionally, remove the `~/.docker/machine` directory.
@y
{% comment %}
6.  Optionally, remove the `~/.docker/machine` directory.
{% endcomment %}
6.  任意の手順として`~/.docker/machine`ディレクトリを削除します。
@z

@x
    This directory stores some configuration and/or state, such as information
    about created machines and certificates.
@y
    {% comment %}
    This directory stores some configuration and/or state, such as information
    about created machines and certificates.
    {% endcomment %}
    このディレクトリには設定ファイルや状態に関する情報が保存されています。
    たとえば生成されたマシンや証明書などの情報を含みます。
@z

@x
7.  Uninstall Oracle VirtualBox, which is installed as a part of the
    Toolbox install.
@y
{% comment %}
7.  Uninstall Oracle VirtualBox, which is installed as a part of the
    Toolbox install.
{% endcomment %}
7.  Oracle VirtualBox をアンインストールします。
    これは Toolbox インストールの際の一部としてインストールされるものです。
@z

@x
### Uninstall Docker Toolbox on Windows
@y
{% comment %}
### Uninstall Docker Toolbox on Windows
{% endcomment %}
{: #uninstall-docker-toolbox-on-windows }
### Docker Toolbox on Windows のアンインストール
@z

@x
To uninstall Toolbox on Windows:
@y
{% comment %}
To uninstall Toolbox on Windows:
{% endcomment %}
Docker Toolbox on Windows のアンインストールは以下のようにして行います。
@z

@x
1.  List your machines.
@y
{% comment %}
1.  List your machines.
{% endcomment %}
1.  マシン一覧を表示します。
@z

@x
    ```
    $ docker-machine ls
    NAME                ACTIVE   DRIVER       STATE     URL                        SWARM
    dev                 *        virtualbox   Running   tcp://192.168.99.100:2376
    my-docker-machine            virtualbox   Stopped
    default                      virtualbox   Stopped
    ```
@y
    ```
    $ docker-machine ls
    NAME                ACTIVE   DRIVER       STATE     URL                        SWARM
    dev                 *        virtualbox   Running   tcp://192.168.99.100:2376
    my-docker-machine            virtualbox   Stopped
    default                      virtualbox   Stopped
    ```
@z

@x
2.  Optionally, remove each machine. For example:
@y
{% comment %}
2.  Optionally, remove each machine. For example:
{% endcomment %}
2.  任意の手順として個々のマシンを削除します。
    たとえば以下のとおりです。
@z

@x
    ```
    $ docker-machine rm my-docker-machine
    Successfully removed my-docker-machine
    ```
@y
    ```
    $ docker-machine rm my-docker-machine
    Successfully removed my-docker-machine
    ```
@z

@x
    This step is optional because if you plan to re-install Docker Machine as a
    part of [Docker Desktop for Windows](../docker-for-windows/index.md), you can
    import and continue to manage those machines through Docker.
@y
    {% comment %}
    This step is optional because if you plan to re-install Docker Machine as a
    part of [Docker Desktop for Windows](../docker-for-windows/index.md), you can
    import and continue to manage those machines through Docker.
    {% endcomment %}
    この手順は任意です。
    [Docker Desktop for Windows](../docker-for-windows/index.md) の一部として Docker Machine を再インストールする予定であれば、上のマシンをインポートして Docker による管理を引き続き行っていくことができます。
@z

@x
3. Uninstall Docker Toolbox using Window's standard process for uninstalling programs through the control panel (programs and features).
@y
{% comment %}
3. Uninstall Docker Toolbox using Window's standard process for uninstalling programs through the control panel (programs and features).
{% endcomment %}
3. Docker Toolbox のアンインストールは、コントロールパネル（そのプログラムと機能）を通じて、通常のアンインストールプログラムによる処理手順に従って行います。
@z

@x
    >**Note**: This process does not remove the `docker-install.exe` file. You must delete that file yourself.
@y
    {% comment %}
    >**Note**: This process does not remove the `docker-install.exe` file. You must delete that file yourself.
    {% endcomment %}
    >**メモ**: この手順を行っても`docker-install.exe`ファイルは削除されません。
     このファイルは手動で削除してください。
@z

@x
4. Optionally, remove the `C:\Users\<your-user>\.docker` directory.
@y
{% comment %}
4. Optionally, remove the `C:\Users\<your-user>\.docker` directory.
{% endcomment %}
4. 任意の手順として`C:\Users\<your-user>\.docker`ディレクトリを削除します。
@z

@x
    If you want to remove Docker entirely, you
    can verify that the uninstall removed
    the `.docker` directory under your user path.
    If it is still there, remove it manually.
    This directory stores some Docker
    program configuration and state, such as
    information about created machines and
    certificates. You usually don't need to remove this directory.
@y
    {% comment %}
    If you want to remove Docker entirely, you
    can verify that the uninstall removed
    the `.docker` directory under your user path.
    If it is still there, remove it manually.
    This directory stores some Docker
    program configuration and state, such as
    information about created machines and
    certificates. You usually don't need to remove this directory.
    {% endcomment %}
    Docker を完全に削除する場合は、アンインストールによってユーザーパス配下の`.docker`が削除されているかどうかを確認します。
    このディレクトリがまだ存在している場合は手動で削除してください。
    このディレクトリには Docker のプログラム設定や状態に関する情報が保存されています。
    たとえば生成されたマシンや証明書などの情報を含みます。
    通常はこのディレクトリを削除する必要はありません。
@z

@x
5. Uninstall Oracle VirtualBox, which is
  installed as a part of the Toolbox install.
@y
{% comment %}
5. Uninstall Oracle VirtualBox, which is
  installed as a part of the Toolbox install.
{% endcomment %}
5. Oracle VirtualBox をアンインストールします。
   これは Toolbox インストールの際の一部としてインストールされるものです。
@z
