%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
<!-- This section is included in topics that contain instructions on how to configure registry.json file to enforce users to sign into Docker Desktop-->
@y
<!-- This section is included in topics that contain instructions on how to configure registry.json file to enforce users to sign into Docker Desktop-->
@z

@x
## Create a registry.json file
@y
{: #create-a-registryjson-file }
## registry.json ファイルの生成
@z

@x
After you’ve successfully installed Docker Desktop, create a `registry.json`
file. Before you create a `registry.json` file, ensure that the developer is a
member of at least one organization in Docker Hub. If the `registry.json` file
matches at least one organization the developer is a member of, they can sign
into Docker Desktop, and then access all their organizations.
@y
Docker Desktop を正常にインストールを終えたら、`registry.json`ファイルを生成します。
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
1. Open Windows PowerShell and select Run as Administrator.
2. Type the following command `cd /ProgramData/DockerDesktop/`
3. Type `notepad registry.json` and enter the name of the Docker Hub
   organization that the developer belongs to in the `allowedOrgs` key and click
   **Save**. For example:
@y
1. Windows PowerShell を開いて Run as Administrator を選びます。
2. 以下のコマンド`cd /ProgramData/DockerDesktop/`を実行します。
3. `notepad registry.json`を実行します。
   その開発者が所属する Docker Hub 組織名を`allowedOrgs`キーに入力し、**Save**（保存）をクリックします。
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
2. Enter the name of the Docker Hub organization that the developer belongs to in the  `allowedOrgs` key and save it in your Documents. For example:
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
