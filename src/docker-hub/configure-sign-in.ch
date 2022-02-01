%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Configure registry.json to require sign in
keywords: authentication, registry.json, configure,
title: Configure registry.json to require sign in
---
@y
---
description: Configure registry.json to require sign in
keywords: authentication, registry.json, configure,
title: サインインを要求する registry.json の設定
---
@z

@x
The `registry.json` file is a configuration file that allows administrators to
specify the Docker organization the user must belong to, and thereby ensure
that the organization's settings are applied to the user's session. Docker
Desktop installation requires admin access. In large enterprises where admin
access is restricted, administrators can create a `registry.json` file and
deploy it to the users’ machines using a device management software as part of
the Docker Desktop installation process.
@y
`registry.json`ファイルは、ユーザーが所属するべき Docker 組織を定めるものとして、管理者が設定するファイルです。
したがって組織に対する設定は、ユーザーセッションに対して適用されます。
Docker Desktop のインストールには管理者権限を必要とします。
エンタープライズの規模が大きいために、管理者によるアクセスが制限されてしまうような場合には、管理者が`registry.json`を生成する方法をとります。
このファイルは Docker Desktop のインストールの一部として導入されるデバイス管理ソフトウェアを使って、各ユーザーのマシンにデプロイすることができます。
@z

@x
After you deploy a `registry.json` file to a user’s machine, it prompts the user to sign into Docker Desktop. If a user doesn’t sign in, or tries to sign in using a different organization, other than the organization listed in the `registry.json` file, they will be denied access to Docker Desktop.
Deploying a `registry.json` file and forcing users to authenticate offers the following benefits:
@y
ユーザーマシンに`registry.json`ファイルをデプロイした後は、Docker Desktop へのサインインが求められます。
ユーザーがサインインしなかった場合、または`registry.json`に指定されている組織とは別の組織を使ってサインインしようとした場合、Docker Desktop へのアクセスは拒否されます。
`registry.json`ファイルをデプロイしてユーザーに対して認証操作を行わせることには、以下のメリットがあります。
@z

@x
1. Allows administrators to configure features such as [Image Access Management](image-access-management.md) which allows team members to:
    - Only have access to Trusted Content on Docker Hub
    - Pull only from the specified categories of images
2. Authenticated users get a higher pull rate limit compared to anonymous users. For example, if you are authenticated, you get 200 pulls per 6 hour period, compared to 100 pulls per 6 hour period per IP address for anonymous users. For more information, see [Download rate limit](download-rate-limit.md).
3. Blocks users from accessing Docker Desktop until they are added to a specific organization.
@y
1. [イメージアクセス管理](image-access-management.md) などにおいて管理者は、チームメンバーに許可する機能を以下のように制限することができます。
    - Docker Hub では信頼されたコンテンツのみへのアクセスとする。
    - 指定したカテゴリーのイメージしかプルできないようにする。
2. 認証されたユーザーは匿名ユーザーに比べて、より高いプル制限率が得られます。
   たとえば認証ユーザーの場合、6 時間ごとに 200 プルを行うことができます。
   これが匿名ユーザーの場合は IP アドレスごとに、6 時間内では 100 プルしか行うことができません。
   詳しいことは [ダウンロード率制限](download-rate-limit.md) を参照してください。
3. 指定した組織にユーザーが追加されていない限りは、Docker Desktop へのアクセスを拒否することができます。
@z

@x
## Create a registry.json file
@y
{: #create-a-registryjson-file }
## registry.json ファイルの生成
@z

@x
Before you create a `registry.json` file, ensure that the user is a member of at least one organization in Docker Hub. If the `registry.json` file matches at least one organization the user is a member of, they can sign into Docker Desktop, and then access all their organizations.
@y
`registry.json`ファイルを生成するにあたっては、そのユーザーが Docker Hub 内において、少なくとも 1 つの組織のメンバーであることを確認してください。
`registry.json`ファイルの内容が、そのメンバーが属する組織に 1 つでも一致すれば、そのユーザーは Docker Desktop にサインインすることができて、すべての組織へのアクセスが可能になります。
@z

@x
### Windows
@y
{: #windows }
### Windows の場合
@z

@x
On Windows, you must create a file at
`C:\ProgramData\DockerDesktop\registry.json` with file permissions that ensure
that the developer using Docker Desktop cannot remove or edit the file (that is,
only the system administrator can write to the file). The file must be of type
`JSON` and contain the name of the organization in the `allowedOrgs` key.
@y
Windows では`C:\ProgramData\DockerDesktop\registry.json`を生成します。
この生成にあたっては、そのファイルパーミッションとして、Docker Desktop を利用する開発者がこのファイルの編集と削除ができないようにすることが必要です（つまりこのファイルを書き込めるのはシステム管理者のみとします）。
このファイルは`JSON`形式であり、`allowedOrgs`に Docker Hub 組織名を記述することが必要です。
@z

@x
To create your `registry.json` file on Windows:
@y
Windows において`registry.json`ファイルは以下のようにして生成します。
@z

@x
1. Open Windows Powershell and select Run as Administrator.
2. Type the following command `cd /ProgramData/DockerDesktop/`
3. Type `notepad registry.json` and enter the name of the Docker Hub
   organization that the user belongs to in the `allowedOrgs` key and click
   **Save**. For example:
@y
1. Windows Powershell を開いて Run as Administrator を選びます。
2. 以下のコマンド`cd /ProgramData/DockerDesktop/`を実行します。
3. `notepad registry.json`を実行します。
   そのユーザーが所属する Docker Hub 組織名を`allowedOrgs`キーに入力し、**Save**（保存）をクリックします。
   たとえば以下のようにします。
@z

@x
    ```json
    {
        "allowedOrgs": ["myorg"]
    }
    ```
@y
    ```json
    {
        "allowedOrgs": ["myorg"]
    }
    ```
@z

@x
### Mac
@y
{: #mac }
### Mac の場合
@z

@x
On macOS, you must create a file at `/Library/Application Support/com.docker.docker/registry.json` with file permissions that ensure that
the developer using Docker Desktop cannot remove or edit the file (that is, only
the system administrator can write to the file). The file must be of type `JSON`
and contain the name of the Docker Hub organization names in the `allowedOrgs`
key.
@y
macOS では`/Library/Application Support/com.docker.docker/registry.json`を生成します。
この生成にあたっては、そのファイルパーミッションとして、Docker Desktop を利用する開発者がこのファイルの編集と削除ができないようにすることが必要です（つまりこのファイルを書き込めるのはシステム管理者のみとします）。
このファイルは`JSON`形式であり、`allowedOrgs`に Docker Hub 組織名を記述することが必要です。
@z

@x
To create your `registry.json` file on macOS:
@y
macOS において`registry.json`ファイルは以下のようにして生成します。
@z

@x
1. Navigate to VS Code or any text editor of your choice.
2. Enter the name of the Docker Hub organization that the user belongs to in the
   `allowedOrgs` key and save it in your Documents. For example:
@y
1. VS Code または好みのテキストエディターを開きます。
2. そのユーザーが所属する Docker Hub 組織名を`allowedOrgs`キーに入力してドキュメントフォルダに保存します。
   たとえば以下のようにします。
@z

@x
    ```json
    {
        "allowedOrgs": ["myorg"]
    }
    ```
@y
    ```json
    {
        "allowedOrgs": ["myorg"]
    }
    ```
@z

@x
3. Open a new terminal and type the following command:
@y
3. 新たに端末画面を開いて、以下のコマンドを実行します。
@z

@x
    ```console
    sudo mkdir -p /Library/Application\ Support/com.docker.docker
    ```
@y
    ```console
    sudo mkdir -p /Library/Application\ Support/com.docker.docker
    ```
@z

@x
    If prompted, type your password associated with your local computer.
@y
    プロンプトが表示されたら、ローカルマシンに関連づいたパスワードを入力します。
@z

@x
4. Type the following command:
@y
4. 以下のコマンドを入力します。
@z

@x
     ```console
    sudo cp Documents/registry.json /Library/Application\ Support/com.docker.docker/registry.json
    ```
@y
     ```console
    sudo cp Documents/registry.json /Library/Application\ Support/com.docker.docker/registry.json
    ```
@z

@x
## Verify the changes
@y
{: #verify-the-changes }
## 変更の確認
@z

@x
After you’ve created the `registry.json` file and deployed it onto the users’ machines, you can verify whether the changes have taken effect by asking users to start Docker Desktop.
@y
`registry.json`ファイルを生成して、各ユーザーマシンに対してデプロイしたら、各ユーザーが Docker Desktop を起動できるかどうかを問い合わせて、変更が適用されたことを確認します。
@z

@x
If the configuration is successful, Docker Desktop prompts the user to authenticate using the organization credentials on start. If the user fails to authenticate, they will see an error message, and they will be denied access to Docker Desktop.
@y
設定が正しく行われたら、各ユーザーによる Docker Desktop の起動時に、組織情報を使ったユーザー認証が求められます。
ユーザー認証に失敗した場合は、エラーメッセージが表示されて、Docker Desktop へのアクセスが拒否されます。
@z
