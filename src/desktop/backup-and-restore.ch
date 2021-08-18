%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Back up and restore data
keywords: Docker Desktop, backup, restore, migration, reinstall, containers, images, volumes
---
@y
---
title: バックアップとリストア
keywords: Docker Desktop, backup, restore, migration, reinstall, containers, images, volumes
---
@z

@x
You can use the following procedure to save and restore images and container data.
For example to reset your VM disk or to move your Docker environment to a new
computer.
@y
以下の手順に従うと、イメージやコンテナーのデータバックアップを保存しリストアすることができます。
たとえば VM ディスクを初期化する場合や Docker 環境を別のコンピューターに移行する場合などに利用します。
@z

@x
## Save your data
@y
## データの保存
{: #save-your-data }
@z

@x
1. If you have containers that contain data that must be backed up, commit those
   containers to an image with [`docker container commit`](../engine/reference/commandline/commit.md).
@y
1. コンテナー内にバックアップを必要とするデータが含まれる場合は、[`docker container commit`](../engine/reference/commandline/commit.md) を実行して、そのコンテナーをイメージにコミットします。
@z

@x
   Committing a container stores the container filesystem changes and some of the
   container's configuration (labels, environment-variables, command/entrypoint)
   as a local image. Be aware that environment variables may contain sensitive
   information such as passwords or proxy-authentication, so care should be taken
   when pushing the resulting image to a registry.
@y
   コンテナーをコミットすると、コンテナー内のファイルシステムの変更内容やコンテナーの設定内容（ラベル、環境変数、コマンドやエンドポイントなど）がローカルイメージに保存されます。
   なお環境変数の中には、パスワードやプロキシー認証などの重要な情報が含まれているかもしれません。
   したがってこのイメージをレジストリにプッシュする場合には十分に注意してください。
@z

@x
   Also note that filesystem changes in volume that are attached to the
   container are not included in the image, and must be backed up separately
   (see step 3 below).
@y
   なおコンテナーにボリュームを割り当てていて、そのボリューム内のファイルシステムが変更されても、その変更はイメージには含まれませんから注意してください。
   その場合は個別にバックアップをとる必要があります（以下の手順 3 を参照のこと）。
@z

@x
   Refer to the [`docker container commit` page](../engine/reference/commandline/commit.md)
   in the Docker Engine command line reference section for details on using this
   command.
@y
   [`docker container commit`](../engine/reference/commandline/commit.md) コマンドについては、Docker Engine コマンドラインリファレンス内の当コマンドの節を参照してください。
@z

@x
   > Should I back up my containers?
   >
   > If you use volumes or bind-mounts to store your container data, backing up
   > your containers may not be needed, but make sure to remember the options that
   > were used when creating the container or use a [Docker Compose file](../compose/compose-file/index.md)
   > if you want to re-create your containers with the same configuration after
   > re-installation.
@y
   > 自分のコンテナーはバックアップが必要？
   >
   > コンテナーデータの保存にボリュームやバインドマウントを利用している場合は、コンテナーのバックアップが不要になるかもしれません。
   > ただし再インストールを行った後に同一の設定内容を使って再度コンテナー生成を行う場合は、最初に生成したときのオプション設定を覚えておいてください。
   > あるいは同等の [Docker Compose ファイル](../compose/compose-file/index.md) を利用してください。
@z

@x
2. Use [`docker push`](../engine/reference/commandline/push.md) to push any
   images you have built locally and want to keep to the [Docker Hub registry](../docker-hub/index.md).
   Make sure to configure the [repository's visibility as "private"](../docker-hub/repos.md#private-repositories)
   for images that should not be publicly accessible. Refer to the [`docker push` page](../engine/reference/commandline/push.md)
   in the Docker Engine command line reference section for details on using this
   command.
@y
2. ローカルにおいてビルドしているイメージを [Docker Hub レジストリ](../docker-hub/index.md) に保存しておきたい場合は [`docker push`](../engine/reference/commandline/push.md) を使ってイメージプッシュを行います。
   イメージを公開したくない場合は [リポジトリの visibility を「プライベート」](../docker-hub/repos.md#private-repositories) に設定してください。
    [`docker push`](../engine/reference/commandline/push.md) コマンドについては、Docker Engine コマンドラインリファレンス内の当コマンドの節を参照してください。
@z

@x
   Alternatively, use [`docker image save -o images.tar image1 [image2 ...]`](../engine/reference/commandline/save.md)
   to save any images you want to keep to a local tar file. Refer to the
   [`docker image  save` page](../engine/reference/commandline/save.md) in the
   Docker Engine command line reference section for details on using this command.
@y
   上の方法ではなく [`docker image save -o images.tar image1 [image2 ...]`](../engine/reference/commandline/save.md) を利用すれば、イメージをローカルの tar ファイルに保存することができます。
   [`docker image  save`](../engine/reference/commandline/save.md) コマンドについては、Docker Engine コマンドラインリファレンス内の当コマンドの節を参照してください。
@z

@x
3. If you use [named volume](../storage/index.md#more-details-about-mount-types)
   to store container data, such as databases, refer to the
   [backup, restore, or migrate data volumes](../storage/volumes.md#backup-restore-or-migrate-data-volumes)
   page in the storage section.
@y
3. [名前つきボリューム](../storage/index.md#more-details-about-mount-types) を利用してデータベースなどのコンテナーデータを保存している場合は、ストレージに関しての説明ページ、[データボリュームのバックアップ、復元、移行](../storage/volumes.md#backup-restore-or-migrate-data-volumes) を参照してください。
@z

@x
After backing up your data, you can uninstall the current version of Docker Desktop
and install a different version ([Windows](windows/install.md)
[macOS](mac/install.md), or reset Docker Desktop to factory defaults.
@y
データのバックアップをとった後は、現状の Docker Desktop バージョンをアンインストールすることができます。
そして（[Windows](windows/install.md) や [macOS](mac/install.md)）の別バージョンをインストールしたり、Docker Desktop の設定を初期化したりすることができます。
@z

@x
## Restore your data
@y
{: #restore-your-data }
## データのリストア
@z

@x
1. Use [`docker pull`](../engine/reference/commandline/load.md) to restore images
   you pushed to Docker Hub in "step 2." in the [save your data section](#save-your-data)
@y
1. [`docker pull`](../engine/reference/commandline/load.md) を実行します。
   これにより、[データの保存](#save-your-data) の「手順 2」において Docker Hub にプッシュしたイメージを復元します。
@z

@x
   If you backed up your images to a local tar file, use [`docker image load -i images.tar`](../engine/reference/commandline/load.md)
   to restore previously saved images.
@y
   イメージのバックアップをローカルの tar ファイルにとっている場合は、[`docker image load -i images.tar`](../engine/reference/commandline/load.md) を実行することで、保存していたイメージをリストアします。
@z

@x
   Refer to the [`docker image load` page](../engine/reference/commandline/load.md)
   in the Docker Engine command line reference section for details on using this
   command.
@y
   [`docker image load` page](../engine/reference/commandline/load.md) コマンドについては、Docker Engine コマンドラインリファレンス内の当コマンドの節を参照してください。
@z

@x
2. Refer to the [backup, restore, or migrate data volumes](../storage/volumes.md#backup-restore-or-migrate-data-volumes)
   page in the storage section to restore volume data.
@y
2. ボリュームデータをリストアする方法については、ストレージに関しての説明ページ、[データボリュームのバックアップ、復元、移行](../storage/volumes.md#backup-restore-or-migrate-data-volumes) を参照してください。
@z

@x
3. Re-create your containers if needed, using [`docker run`](../engine/reference/commandline/load.md),
   or [Docker Compose](../compose/index.md).
@y
3. コンテナーの再生成が必要である場合は [`docker run`](../engine/reference/commandline/load.md) を実行するか [Docker Compose](../compose/index.md) を実行してください。
@z
