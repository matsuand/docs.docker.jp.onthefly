%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Docker Desktop for Windows and Docker Toolbox
keywords: windows, alpha, beta, toolbox, docker-machine, tutorial
sitemap: false
title: Docker Toolbox
redirect_from:
- /docker-for-mac/docker-toolbox/
- /docker-for-windows/docker-toolbox/
- /mackit/docker-toolbox/
- /toolbox/faqs/
- /toolbox/faqs/troubleshoot/
- /toolbox/overview/
- /toolbox/toolbox_install_mac/
- /toolbox/toolbox_install_windows/
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
- /docker-for-mac/docker-toolbox/
- /docker-for-windows/docker-toolbox/
- /mackit/docker-toolbox/
- /toolbox/faqs/
- /toolbox/faqs/troubleshoot/
- /toolbox/overview/
- /toolbox/toolbox_install_mac/
- /toolbox/toolbox_install_windows/
toc_min: 1
toc_max: 2
---
@z

@x
>**Deprecated**
>
> Docker Toolbox has been deprecated and is no longer in active development. Please
> use Docker Desktop instead. See [Docker Desktop for Mac](../docker-for-mac/index.md)
> and [Docker Desktop for Windows](../docker-for-windows/index.md).
{: .warning }
@y
>**廃止決定**
>
> Docker Toolbox は廃止決定されており、開発は行われていません。
  この代わりに Docker Desktop を利用してください。
  詳しくは [Docker Desktop for Mac](../docker-for-mac/index.md) や [Docker Desktop for Windows](../docker-for-windows/index.md) を参照してください。
{: .warning }
@z

@x
This page explains how to migrate your Docker Toolbox installation to Docker Desktop.
It also contains instructions on how to uninstall Docker Toolbox from Mac and Windows machines.
@y
このページでは Docker Toolbox ディスクイメージを Docker Desktop へ移行する方法について説明します。
また Docker Toolbox を Mac または Windows からアンインストールする手順についても説明します。
@z

@x
## Migrate from Docker Toolbox to Docker Desktop
@y
{: #migrate-from-docker-toolbox-to-docker-desktop }
## Docker Toolbox から Docker Desktop への移行
@z

@x
Uninstalling Docker Toolbox will remove your local image cache, volumes, containers,
and other data stored in Docker. Refer to the [back up and restore data](../desktop/backup-and-restore.md)
documentation before uninstalling Docker Toolbox, to learn how to back up your
data.
@y
Docker Toolbox をアンインストールすると、Docker によって保存されていたローカルイメージキャッシュ、ボリューム、コンテナーなどが削除されます。
Docker Toolbox をアンインストールする際には [バックアップとリストア](../desktop/backup-and-restore.md) を参照して、データのバックアップ方法を確認してください。
data.
@z

@x
## Uninstall Docker Toolbox
@y
{: #uninstall-docker-toolbox }
## Docker Toolbox のアンインストール
@z

@x
Removing Toolbox involves removing all the Docker components it includes.
@y
Toolbox を削除するということは、そこに含まれていた Docker コンポーネントをすべて削除するということです。
@z

@x
A full uninstall also includes removing the local and remote machines
you created with Docker Machine. In some cases, you might want to keep
machines created with Docker Machine. For example, if you plan to re-install
Docker Machine as a part of Docker Desktop, you can continue to manage those
machines through Docker. Or, if you have remote machines on a cloud provider and
you plan to manage them using the provider, you wouldn't want to remove
them. So, the step to remove machines is described here as optional.
@y
また完全にアンインストールを行うと、Docker Machine を使って生成したローカルマシンおよびリモートマシンもすべて削除されます。
場合によっては Docker Machine によって生成したマシンを保存しておきたいことがあるはずです。
たとえば Docker Desktop の一部として Docker Machine を再インストールしようとしている場合には、引き続きそのようなマシンを管理していきたいはずです。
あるいはクラウドプロバイダー上にリモートマシンを生成していて、プロバイダー上の管理を引き続き行うのであれば、マシンを削除したくないはずです。
そこで以下の説明においては、マシン削除の手順は任意の作業として説明することにします。
@z

@x
### Uninstall Docker Toolbox on Mac
@y
{: #uninstall-docker-toolbox-on-mac }
### Docker Toolbox on Mac のアンインストール
@z

@x
To uninstall Docker Toolbox on Mac:
@y
Docker Toolbox on Mac のアンインストールは以下のようにして行います。
@z

@x
1.  List your machines.
@y
1.  マシン一覧を表示します。
@z

@x
    ```console
    $ docker-machine ls
    NAME                ACTIVE   DRIVER       STATE     URL                        SWARM
    dev                 *        virtualbox   Running   tcp://192.168.99.100:2376
    my-docker-machine            virtualbox   Stopped
    default                      virtualbox   Stopped
    ```
@y
    ```console
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
2.  任意の手順として個々のマシンを削除します。
    たとえば以下のとおりです。
@z

@x
    ```console
    $ docker-machine rm my-docker-machine
    Successfully removed my-docker-machine
    ```
@y
    ```console
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
    この手順は任意です。
    [Docker Desktop for Mac](../docker-for-mac/index.md) の一部として Docker Machine を再インストールする予定であれば、上のマシンをインポートして Docker による管理を引き続き行っていくことができます。
@z

@x
3.  In your "Applications" folder, remove the "Docker" directory,
    which contains "Docker Quickstart Terminal" and "Kitematic".
@y
3.  「Applications」フォルダーにおいて、「Docker Quickstart Terminal」や「Kitematic」が含まれている「Docker」ディレクトリを削除します。
@z

@x
4.  Run the following in a command shell to fully remove Kitematic:
@y
4.  コマンドシェルから以下のコマンドを実行して Kitematic を完全に削除します。
@z

@x
    ```console
    $ rm -fr ~/Library/Application\ Support/Kitematic
    ```
@y
    ```console
    $ rm -fr ~/Library/Application\ Support/Kitematic
    ```
@z

@x
5.  Remove the `docker`, `docker-compose`, and `docker-machine` commands from
    the `/usr/local/bin` folder.  Docker Desktop for Mac and Brew may also have
    installed them; in case of doubt leave them, or reinstall them via Brew, or
    rerun Docker Desktop for Mac (no need to reinstall it).
@y
5.  `/usr/local/bin`フォルダーから`docker`、`docker-compose`、`docker-machine`の各コマンドを削除します。
    Docker Desktop for Mac や Brew にはそれらがインストールされたままかもしれません。
    それが疑われる場合は、Brew を通した再インストールを行うか、Docker Desktop for Mac を再起動してください（再インストールの必要はありません）。
@z

@x
    ```console
    $ rm -f /usr/local/bin/docker
    $ rm -f /usr/local/bin/docker-compose
    $ rm -f /usr/local/bin/docker-machine
    ```
@y
    ```console
    $ rm -f /usr/local/bin/docker
    $ rm -f /usr/local/bin/docker-compose
    $ rm -f /usr/local/bin/docker-machine
    ```
@z

@x
6.  Optionally, remove the `~/.docker/machine` directory.
@y
6.  任意の手順として`~/.docker/machine`ディレクトリを削除します。
@z

@x
    This directory stores some configuration and/or state, such as information
    about created machines and certificates.
@y
    このディレクトリには設定ファイルや状態に関する情報が保存されています。
    たとえば生成されたマシンや証明書などの情報を含みます。
@z

@x
7.  Uninstall Oracle VirtualBox, which is installed as a part of the
    Toolbox install.
@y
7.  Oracle VirtualBox をアンインストールします。
    これは Toolbox インストールの際の一部としてインストールされるものです。
@z

@x
### Uninstall Docker Toolbox on Windows
@y
{: #uninstall-docker-toolbox-on-windows }
### Docker Toolbox on Windows のアンインストール
@z

@x
To uninstall Toolbox on Windows:
@y
Docker Toolbox on Windows のアンインストールは以下のようにして行います。
@z

@x
1.  List your machines.
@y
1.  マシン一覧を表示します。
@z

@x
    ```console
    $ docker-machine ls
    NAME                ACTIVE   DRIVER       STATE     URL                        SWARM
    dev                 *        virtualbox   Running   tcp://192.168.99.100:2376
    my-docker-machine            virtualbox   Stopped
    default                      virtualbox   Stopped
    ```
@y
    ```console
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
2.  任意の手順として個々のマシンを削除します。
    たとえば以下のとおりです。
@z

@x
    ```console
    $ docker-machine rm my-docker-machine
    Successfully removed my-docker-machine
    ```
@y
    ```console
    $ docker-machine rm my-docker-machine
    Successfully removed my-docker-machine
    ```
@z

@x
    This step is optional because if you plan to re-install Docker Machine as a
    part of [Docker Desktop for Windows](../docker-for-windows/index.md), you can
    import and continue to manage those machines through Docker.
@y
    この手順は任意です。
    [Docker Desktop for Windows](../docker-for-windows/index.md) の一部として Docker Machine を再インストールする予定であれば、上のマシンをインポートして Docker による管理を引き続き行っていくことができます。
@z

@x
3. Uninstall Docker Toolbox using Window's standard process for uninstalling programs through the control panel (programs and features).
@y
3. Docker Toolbox のアンインストールは、コントロールパネル（そのプログラムと機能）を通じて、通常のアンインストールプログラムによる処理手順に従って行います。
@z

@x
    >**Note**: This process does not remove the `docker-install.exe` file. You must delete that file yourself.
@y
    >**メモ**
    >
    > この手順を行っても`docker-install.exe`ファイルは削除されません。
    > このファイルは手動で削除してください。
@z

@x
4. Optionally, remove the `C:\Users\<your-user>\.docker` directory.
@y
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
5. Oracle VirtualBox をアンインストールします。
   これは Toolbox インストールの際の一部としてインストールされるものです。
@z
