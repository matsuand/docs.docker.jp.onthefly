%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
<!-- This text will be included in Build images topic in the Get started guides -->
@y
<!-- This text will be included in Build images topic in the Get started guides -->
@z

@x
### Enable BuildKit
@y
{: #enable-buildkit }
### BuildKit の有効化
@z

@x
Before we start building images, ensure you have enabled BuildKit on your machine.
BuildKit allows you to build Docker images efficiently. For more information,
see [Building images with BuildKit](/develop/develop-images/build_enhancements/).
@y
イメージビルドを行うにあたっては、マシン上において BuildKit が有効になっていることを確認してください。
BuildKit が有効になっていれば、Docker イメージビルドを効率的に行うことができます。
詳しくは [BuildKit によるイメージ構築](../develop/develop-images/build_enhancements.md) を参照してください。
@z

@x
BuildKit is enabled by default for all users on Docker Desktop. If you have
installed Docker Desktop, you don't have to manually enable BuildKit. If you are
running Docker on Linux, you can enable BuildKit either by using an environment
variable or by making BuildKit the default setting.
@y
BuildKit は Docker Desktop 上の全ユーザーに対して、デフォルトで有効になっています。
Docker Desktop をインストールしているのであれば、手動で BuildKit を有効にする必要はありません。
Linux 上において Docker を利用している場合は、環境変数を用いるか、あるいは BuildKit がデフォルト設定となるようにして、BuildKit を有効にします。
@z

@x
To set the BuildKit environment variable when running the `docker build` command,
run:
@y
`docker build`コマンド時に環境変数 BuildKit を設定するには、以下のようにします。
@z

@x
```console
$ DOCKER_BUILDKIT=1 docker build .
```
@y
```console
$ DOCKER_BUILDKIT=1 docker build .
```
@z

@x
To enable docker BuildKit by default, set daemon configuration in `/etc/docker/daemon.json` feature to `true` and restart the daemon.
If the `daemon.json` file doesn't exist, create new file called `daemon.json` and then add the following to the file.
@y
デフォルトで BuildKit を有効にするには、`/etc/docker/daemon.json`内のデーモン設定を`true`に設定して、デーモンを再起動します。
`daemon.json`ファイルが存在していない場合は、この`daemon.json`ファイルを新規生成して、以下の記述を追加します。
@z

@x
```json
{
  "features":{"buildkit" : true}
}
```
@y
```json
{
  "features":{"buildkit" : true}
}
```
@z

@x
Restart the Docker daemon.
@y
そして Docker デーモンを再起動します。
@z
