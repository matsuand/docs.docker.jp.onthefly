%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: High-performance two-way file sync for volume mounts
keywords: mac, mutagen, volumes, file sync,
title: Mutagen-based file synchronization
redirect_from:
- /docker-for-mac//mutagen-caching/
---
@y
---
description: High-performance two-way file sync for volume mounts
keywords: mac, mutagen, volumes, file sync,
title: Mutagen ベースのファイル同期
redirect_from:
- /docker-for-mac//mutagen-caching/
---
@z

@x
Docker Desktop for Mac on Edge has a new file sharing feature which performs
a continuous two-way sync of files between the host and containers using
[Mutagen](https://mutagen.io/). This feature is ideal for app development where:
@y
{% comment %}
Docker Desktop for Mac on Edge has a new file sharing feature which performs
a continuous two-way sync of files between the host and containers using
[Mutagen](https://mutagen.io/). This feature is ideal for app development where:
{% endcomment %}
Docker Desktop for Mac の最新版（Edge）には、新しいファイル共有機能があります。
これは [Mutagen](https://mutagen.io/) を利用して、ホスト、コンテナー間の双方向のファイル同期を持続的に実現します。
この機能は以下のようなアプリケーション開発に適しています。
@z

@x
- the source code tree is quite large
- the source is edited on Mac
- the source is compiled and run interactively inside Linux containers.
@y
{% comment %}
- the source code tree is quite large
- the source is edited on Mac
- the source is compiled and run interactively inside Linux containers.
{% endcomment %}
- ソースコードツリーが極めて膨大な場合。
- ソースコードを Mac 上において編集する場合。
- ソースコードのコンパイルと実行を Linux コンテナー内において対話的に行う場合。
@z

@x
This page contains an example to show how the Mutagen feature should be used to sync files between the host and containers. It also gives some best practices to maximize performance.
@y
{% comment %}
This page contains an example to show how the Mutagen feature should be used to sync files between the host and containers. It also gives some best practices to maximize performance.
{% endcomment %}
このページでは、ホスト、コンテナー間において Mutagen 機能がどのようにしてファイル共有を行うのか、その例を示します。
またパフォーマンスを最大にするベストプラクティスも示します。
@z

@x
> **Important**
>
> After completing the synchronizing process, you must delete and re-create any 
containers which will make use of the synchronized directories.
@y
{% comment %}
> **Important**
>
> After completing the synchronizing process, you must delete and re-create any 
containers which will make use of the synchronized directories.
{% endcomment %}
> **重要**
>
> 同期処理を行った後に、同期ディレクトリを利用する予定のコンテナーは、いったん削除してから再生成する必要があります。
@z

@x
## A simple React app
@y
{% comment %}
## A simple React app
{% endcomment %}
{: #a-simple-react-app }
## 単純な React アプリ
@z

@x
The following example bootstraps a simple React app with `npx` and configures
Docker Desktop to sync the source code between the host and a
development container.
@y
{% comment %}
The following example bootstraps a simple React app with `npx` and configures
Docker Desktop to sync the source code between the host and a
development container.
{% endcomment %}
以下に示す例は `npx` を利用して単純な React アプリを起動し、Docker Desktop の設定として、ホストと開発コンテナー間においてソースコードを同期します。
@z

@x
First, create a directory which will contain the app:
@y
{% comment %}
First, create a directory which will contain the app:
{% endcomment %}
まずアプリを収めるディレクトリを生成します。
@z

@x
```bash
$ mkdir ~/workspace/my-app
```
@y
```bash
$ mkdir ~/workspace/my-app
```
@z

@x
Next, enable the two-way file sync feature in Docker Desktop:
@y
{% comment %}
Next, enable the two-way file sync feature in Docker Desktop:
{% endcomment %}
次に Docker Desktop において、双方向のファイル同期機能を有効にします。
@z

@x
1. From the Docker Desktop menu, click **Preferences** > **Resources** > **File sharing**.
@y
{% comment %}
1. From the Docker Desktop menu, click **Preferences** > **Resources** > **File sharing**.
{% endcomment %}
1. Docker Desktop メニューから **Preferences** > **Resources** > **File sharing** をクリックします。
@z

@x
2. Type the new directory name in the bottom of the list and press the enter key.
@y
{% comment %}
2. Type the new directory name in the bottom of the list and press the enter key.
{% endcomment %}
2. 一覧の下の欄に、上で生成したディレクトリを入力し、ENTER キーを押します。
@z

@x
3. Click on the toggle next to the directory name.
@y
{% comment %}
3. Click on the toggle next to the directory name.
{% endcomment %}
3. ディレクトリ名の横にあるトグルボタンをクリックします。
@z

@x
4. Click **Apply & Restart** for the changes to take effect.
@y
{% comment %}
4. Click **Apply & Restart** for the changes to take effect.
{% endcomment %}
4. 編集結果を有効にするために **Apply & Restart** をクリックします。
@z

@x
When Docker Desktop has restarted, the **File sharing** page looks like
this:
@y
{% comment %}
When Docker Desktop has restarted, the **File sharing** page looks like
this:
{% endcomment %}
Docker Desktop が再起動したら **File sharing** ページは以下のようになります。
@z

@x
![Caching with mutagen is "Ready"](images/mac-mutagen-ready.png)
@y
{% comment %}
![Caching with mutagen is "Ready"](images/mac-mutagen-ready.png)
{% endcomment %}
![Mutagen のキャッシュが「有効」](images/mac-mutagen-ready.png)
@z

@x
Run the following command to start a container and bootstrap the app with `npx`:
@y
{% comment %}
Run the following command to start a container and bootstrap the app with `npx`:
{% endcomment %}
以下のコマンドを実行してコンテナーを起動します。
そして `npx` を使ったアプリを起動します。
@z

@x
```bash
$ docker run -it -v ~/workspace/my-app:/my-app -w /my-app -p 3000:3000 node:lts bash
root@95441305251a:/my-app# npx create-react-app app
root@95441305251a:/my-app# cd app
root@95441305251a:/my-app# npm start
```
@y
```bash
$ docker run -it -v ~/workspace/my-app:/my-app -w /my-app -p 3000:3000 node:lts bash
root@95441305251a:/my-app# npx create-react-app app
root@95441305251a:/my-app# cd app
root@95441305251a:/my-app# npm start
```
@z

@x
Once the development webserver has started, open [https://localhost:3000/](https://localhost:3000/) in
your browser and observe the app is running.
@y
{% comment %}
Once the development webserver has started, open [https://localhost:3000/](https://localhost:3000/) in
your browser and observe the app is running.
{% endcomment %}
開発用のウェブサーバーが起動したら、ブラウザーから [https://localhost:3000/](https://localhost:3000/) を開いて、アプリが起動していることを確認します。
@z

@x
Return to the **File sharing** page in the UI and observe the status of the 
synchronize toggle located next to the directory name. The status will be
updated as file changes are detected and then synchronized between the host
and the containers.
@y
{% comment %}
Return to the **File sharing** page in the UI and observe the status of the 
synchronize toggle located next to the directory name. The status will be
updated as file changes are detected and then synchronized between the host
and the containers.
{% endcomment %}
**File sharing** ページに戻って、ディレクトリ名の横にある、ファイル同期に関するトグルボタンの状態を見てください。
ファイルの変更が検出されて、ホスト、コンテナー間のファイル同期が行われると、ボタンの状態が更新されます。
@z

@x
Wait until the text says **Ready** and then open the source code in your IDE on
the host. Edit the file `src/App.js`, save the changes and observe the change
on the webserver.
@y
{% comment %}
Wait until the text says **Ready** and then open the source code in your IDE on
the host. Edit the file `src/App.js`, save the changes and observe the change
on the webserver.
{% endcomment %}
表示されるテキストが **Ready** になるまで待ちます。
この表示になったら、ホスト上の IDE 環境からソースコードを開いてみます。
`src/App.js` というファイルを編集して、変更内容を保存します。
ウェブサーバー上から変更が反映されていることを確認します。
@z

@x
As you edit code on the host, the changes are detected and transferred to the
container for testing. Changes inside the container (for example, the creation of build artifacts) are detected and transferred back to the host.
@y
{% comment %}
As you edit code on the host, the changes are detected and transferred to the
container for testing. Changes inside the container (for example, the creation of build artifacts) are detected and transferred back to the host.
{% endcomment %}
ホスト上のコードを編集したので、この変更が検出されて、確認を行っているコンテナーに向けてファイルが転送されます。
同じくコンテナー内部でのファイル変更（たとえばビルド成果物の生成）を行うと、これが検出されて、ホスト側に逆に転送されます。
@z

@x
## Adding synchronized directories through the CLI
@y
{% comment %}
## Adding synchronized directories through the CLI
{% endcomment %}
{: #adding-synchronized-directories-through-the-cli }
## CLI を用いた同期ディレクトリの追加
@z

@x
As of Docker Desktop Edge 2.3.2.0 the `:delegated` flag on a shared volume will 
automatically enable synchronization. This is particularly useful if you want to share
the synchronization setting with other developers in your team, through your source code.
@y
{% comment %}
As of Docker Desktop Edge 2.3.2.0 the `:delegated` flag on a shared volume will 
automatically enable synchronization. This is particularly useful if you want to share
the synchronization setting with other developers in your team, through your source code.
{% endcomment %}
Docker Desktop の最新版（Edge）2.3.2.0 においては、共有ボリュームに対して `:delegated` フラグというものがあり、これを使うとファイル同期が自動的に有効となります。
開発チーム内において他の開発者とソースコードを共有して、ファイル同期を行いたいような場合に活用できます。
@z

@x
## Scripting
@y
{% comment %}
## Scripting
{% endcomment %}
{: #scripting }
## スクリプト処理
@z

@x
Many projects have scripts which modify files in a container and then read them back on
the host, or the other way around. To support these, Docker Desktop automatically flushes
file changes around `docker run` calls. Therefore, the following will work as expected:
@y
{% comment %}
Many projects have scripts which modify files in a container and then read them back on
the host, or the other way around. To support these, Docker Desktop automatically flushes
file changes around `docker run` calls. Therefore, the following will work as expected:
{% endcomment %}
開発プロジェクトにおいては、コンテナー内のファイルを修正し、これをホスト側に戻すような処理を、スクリプト化している場合を多く見かけます。
あるいはこういったことを、いろいろな方法で実現する場合があります。
こういったことをサポートするために、Docker Desktop には `docker run` 実行の際に、自動的にファイル変更を反映させる機能があります。
以下のコマンドは、これを実現するものです。
@z

@x
```bash
docker run -v ~/foo:/foo:delegated touch /foo/new-file-in-container
stat ~/foo/new-file-in-container
```
@y
```bash
docker run -v ~/foo:/foo:delegated touch /foo/new-file-in-container
stat ~/foo/new-file-in-container
```
@z

@x
and
@y
{% comment %}
and
{% endcomment %}
さらに以下を実行します。
@z

@x
```bash
touch ~/foo/new-file-on-host
docker run -v ~/foo:/foo:delegated stat /foo/new-file-on-host
```
@y
```bash
touch ~/foo/new-file-on-host
docker run -v ~/foo:/foo:delegated stat /foo/new-file-on-host
```
@z

@x
Note that changes are not flushed around `docker exec` calls, so this will not work as
expected:
@y
{% comment %}
Note that changes are not flushed around `docker exec` calls, so this will not work as
expected:
{% endcomment %}
`docker exec` の実行の際には、こういった変更は反映されません。
したがって以下を行ったとしても、思ったようには動作しません。
@z

@x
```bash
docker exec existing-container touch /foo/new-file-from-existing-container
stat ~/foo/new-file-from-existing-container # file will not be found
```
@y
{% comment %}
```bash
docker exec existing-container touch /foo/new-file-from-existing-container
stat ~/foo/new-file-from-existing-container # file will not be found
```
{% endcomment %}
```bash
docker exec existing-container touch /foo/new-file-from-existing-container
stat ~/foo/new-file-from-existing-container # ファイルは見つかりません
```
@z

@x
## Bypassing a two-way sync for a volume
@y
{% comment %}
## Bypassing a two-way sync for a volume
{% endcomment %}
## ボリュームにおける双方向同期の停止
@z

@x
By default, if a directory has two-way sync enabled, then shared volumes will use the
sync. However, if you want to *avoid* using a two-way file synchronization, use
`:consistent`: this will bypass both file caching and the two-way sync. This is
backwards compatible with previous Docker versions.
@y
{% comment %}
By default, if a directory has two-way sync enabled, then shared volumes will use the
sync. However, if you want to *avoid* using a two-way file synchronization, use
`:consistent`: this will bypass both file caching and the two-way sync. This is
backwards compatible with previous Docker versions.
{% endcomment %}
ディレクトリが双方向の同期を有効にしている場合、デフォルトでは共有ボリュームはその同期機能を利用します。
もし双方向のファイル同期を **行いたくない** 場合は、`:consistent` を利用します。
これによってファイルのキャッシングと双方向の同期が行われなくなります。
これは従前の Docker バージョンとの下位互換性のためのものです。
@z

@x
## Avoiding synchronizing a subdirectory from a container to the host
@y
{% comment %}
## Avoiding synchronizing a subdirectory from a container to the host
{% endcomment %}
{: #avoiding-synchronizing-a-subdirectory-from-a-container-to-the-host }
## コンテナーからホストに向けてのサブディレクトリ同期の防止
@z

@x
Although two-way file sync is suitable for many types of files, sometimes containers can
generate lots of data which doesn't require copying to the host, for example, debug logs.
@y
{% comment %}
Although two-way file sync is suitable for many types of files, sometimes containers can
generate lots of data which doesn't require copying to the host, for example, debug logs.
{% endcomment %}
双方向のファイル同期は、ほとんどの種類のファイルにおいて有用な機能です。
しかしホストにコピーする必要のない大量のデータを、コンテナーが作り出してしまうこともあります。
たとえばデバッグログです。
@z

@x
If your project has a subdirectory that doesn't need to be continuously copied back to
the host, then use a named docker volume to bypass the sync.
@y
{% comment %}
If your project has a subdirectory that doesn't need to be continuously copied back to
the host, then use a named docker volume to bypass the sync.
{% endcomment %}
開発プロジェクト内にサブディレクトリがあって、そのディレクトリ内のデータは、ホストに対してコピーする必要がないものである場合、名前つきボリュームを利用して同期を停止することができます。
@z

@x
First create a volume using:
@y
{% comment %}
First create a volume using:
{% endcomment %}
まずボリュームを生成するため、以下のコマンドを実行します。
@z

@x
```bash
$ docker volume create donotsyncme
donotsyncme
```
@y
```bash
$ docker volume create donotsyncme
donotsyncme
```
@z

@x
Use the volume for the subdirectory you want to avoid syncing:
@y
{% comment %}
Use the volume for the subdirectory you want to avoid syncing:
{% endcomment %}
このボリュームを、同期したくないサブディレクトリ用として定めます。
@z

@x
```bash
$ docker run -it -v ~/workspace/my-app:/my-app -v donotsyncme:/my-app/dontsyncme -w /my-app -p 3000:3000 node:lts bash
```
@y
```bash
$ docker run -it -v ~/workspace/my-app:/my-app -v donotsyncme:/my-app/dontsyncme -w /my-app -p 3000:3000 node:lts bash
```
@z

@x
Docker Desktop will sync all changes written by the app to `/my-app` to
the host, except changes written to `/my-app/dontsyncme` which will be written
to the named volume instead.
@y
{% comment %}
Docker Desktop will sync all changes written by the app to `/my-app` to
the host, except changes written to `/my-app/dontsyncme` which will be written
to the named volume instead.
{% endcomment %}
Docker Desktop は `/my-app` にて行われるアプリへの変更を、ホストに対して同期します。
ただし `/my-app/dontsyncme` へ行われた変更は、名前つきボリュームに対して行われるため、同期対象から除外されます。
@z

@x
## Avoiding synchronizing a subdirectory in both directions
@y
{% comment %}
## Avoiding synchronizing a subdirectory in both directions
{% endcomment %}
{: #avoiding-synchronizing-a-subdirectory-in-both-directions }
## サブディレクトリの双方向同期の防止
@z

@x
Although the example in the previous section successfully prevents changes written in
the container from being copied back to the host, changes written on the host will
still be written to the container (although hidden by the `docker volume`).
@y
{% comment %}
Although the example in the previous section successfully prevents changes written in
the container from being copied back to the host, changes written on the host will
still be written to the container (although hidden by the `docker volume`).
{% endcomment %}
前節の例では、コンテナーに加えられた変更を、ホストにコピーしないようにする方法を示しました。
しかしホスト側にて加えられた変更は、コンテナーに同期されます（`docker volume` によって隠蔽されていても行われます）。
@z

@x
To completely avoid synchronization in both directions, create a
[global mutagen config file](https://mutagen.io/documentation/introduction/configuration#configuration-files).
For example, create a file `~/.mutagen.yml` containing:
@y
{% comment %}
To completely avoid synchronization in both directions, create a
[global mutagen config file](https://mutagen.io/documentation/introduction/configuration#configuration-files).
For example, create a file `~/.mutagen.yml` containing:
{% endcomment %}
双方向のファイル同期を完全に停止させるには、[グローバルな Mutagen 設定ファイルe](https://mutagen.io/documentation/introduction/configuration#configuration-files) を生成します。
たとえば `~/.mutagen.yml` を生成し、内容を以下のようにします。
@z

@x
```bash
sync:
  defaults:
    ignore:
      paths:
        - /path1/to/ignore
        - /path2/to/ignore
        - ...
        - /pathN/to/ignore
```
@y
```bash
sync:
  defaults:
    ignore:
      paths:
        - /path1/to/ignore
        - /path2/to/ignore
        - ...
        - /pathN/to/ignore
```
@z

@x
## Best practices
@y
{% comment %}
## Best practices
{% endcomment %}
{: #best-practices }
## ベストプラクティス
@z

@x
To achieve maximum performance when you enable two-way file sync:
@y
{% comment %}
To achieve maximum performance when you enable two-way file sync:
{% endcomment %}
双方向のファイル同期を有効にした場合に、パフォーマンスを最大とするために、以下を行います。
@z

@x
- Avoid wasting disk space and CPU by minimising the size of the synchronized
  directories. For example, synchronize a project directory like `~/my-app`, but
  never sync a large directory like `/Users` or `/Volumes`.
@y
{% comment %}
- Avoid wasting disk space and CPU by minimising the size of the synchronized
  directories. For example, synchronize a project directory like `~/my-app`, but
  never sync a large directory like `/Users` or `/Volumes`.
{% endcomment %}
- 同期を行うディレクトリ容量は最小として、不要なディスク消費や CPU 利用を避けます。
  たとえば同期を行う開発プロジェクトが `~/my-app` にあるとすると、`/Users` や `/Volumes` といった膨大なディレクトリは同期対象としないようにします。
@z

@x
  Remember that the files will be copied inside the container and therefore must fit within the
  `Docker.qcow2` or `Docker.raw` file.
@y
  {% comment %}
  Remember that the files will be copied inside the container and therefore must fit within the
  `Docker.qcow2` or `Docker.raw` file.
  {% endcomment %}
  同期されるファイルはコンテナー内にコピーされます。
  したがって `Docker.qcow2` や `Docker.raw` ファイルが許容するファイルサイズでなければなりません。
@z

@x
- For every volume you want to sync in `docker run -v` or in
  `docker-compose.yml`, ensure either the directory itself or a
  parent/grandparent/... directory is listed in **Preferences** > **Resources** > **File sharing**.
@y
{% comment %}
- For every volume you want to sync in `docker run -v` or in
  `docker-compose.yml`, ensure either the directory itself or a
  parent/grandparent/... directory is listed in **Preferences** > **Resources** > **File sharing**.
{% endcomment %}
- `docker run -v` や `docker-compose.yml` において同期を行うボリュームに対しては、同期ディレクトリそのもの、あるいは親ディレクトリなど上位ディレクトリが、**Preferences** > **Resources** > **File sharing** の一覧に含まれていることを確認してください。
@z

@x
   Note in particular that if only a *child* directory is listed
  on the **File sharing** page, then the whole `docker run -v` may bypass the two-way sync and be slower.
@y
   {% comment %}
   Note in particular that if only a *child* directory is listed
  on the **File sharing** page, then the whole `docker run -v` may bypass the two-way sync and be slower.
   {% endcomment %}
   特に **File sharing** ページにおいて、**子ディレクトリ** しか一覧に設定されていなかった場合、`docker run -v` による双方向同期の指定はすべて停止され、処理を遅くする点に注意してください。
@z

@x
- Avoid changing the same files from both the host and containers. If changes
  are detected on both sides, the host takes precedence and the changes in the containers will be discarded.
@y
{% comment %}
- Avoid changing the same files from both the host and containers. If changes
  are detected on both sides, the host takes precedence and the changes in the containers will be discarded.
{% endcomment %}
- 同一のファイルを、ホスト、コンテナーの双方において変更することは避けます。
  両方において変更が検出された場合、ホスト側の変更が優先され、コンテナー側の変更は破棄されます。
@z

@x
- After completing the caching process, you must delete and re-create any containers which will make use of the synchronized directories.
@y
{% comment %}
- After completing the caching process, you must delete and re-create any containers which will make use of the synchronized directories.
{% endcomment %}
- キャッシュ処理を行った後に、同期ディレクトリを利用する予定のコンテナーは、いったん削除してから再生成する必要があります。
@z

@x
## Feedback
@y
{% comment %}
## Feedback
{% endcomment %}
{: #feedback }
## フィードバック
@z

@x
Your feedback is very important to us. Let us know your feedback by creating an issue in the [Docker Desktop for Mac GitHub](https://github.com/docker/for-mac/issues) repository with the **Mutagen** label.
@y
{% comment %}
Your feedback is very important to us. Let us know your feedback by creating an issue in the [Docker Desktop for Mac GitHub](https://github.com/docker/for-mac/issues) repository with the **Mutagen** label.
{% endcomment %}
フィードバックをいただくことは、大変ありがたいことです。
フィードバックは [Docker Desktop for Mac の GitHub リポジトリ](https://github.com/docker/for-mac/issues) に対して、**Mutagen** ラベルを使って issue としてお知らせください。
@z
