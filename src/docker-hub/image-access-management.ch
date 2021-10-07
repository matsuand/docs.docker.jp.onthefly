%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Image Access Management
keywords: image, access, management
title: Image Access Management
---
@y
---
description: Image Access Management
keywords: image, access, management
title: イメージアクセス管理
---
@z

@x
Image Access Management is a new feature that is a part of the Docker Business subscription. This feature allows Organization owners to control which types of images (Docker Official Images, Docker Verified Publisher Images, Community images) their developers can pull from Docker Hub.
@y
イメージアクセス管理（Image Access Management）は、Docker Business サブスクリプションの一部に含まれる新機能です。
この機能は、各開発者が Docker Hub からどのような種類のイメージ（Docker 公式イメージ、Docker 認証者によるイメージ、コミュニティイメージ）をプルしたのか、それを組織所有者が管理するものです。
@z

@x
For example, a developer, who is part of an organization, building a new containerized application could accidentally use an untrusted, community image as a component of their application. This image could be malicious and pose a security risk to the company. Using Image Access Management, the Organization owner could ensure that the developer can only access trusted content like Docker Official Images, Docker Verified Publisher Images, or the Organization’s own images, preventing such a risk.
@y
たとえば、組織の一員である開発者が、新たにコンテナー化アプリケーションを構築する際に、アプリケーションの一部に、信頼できないコミュニティイメージを含めてしまうことが起こりえます。
そのようなイメージは、企業に対して悪意を含んだセキュリティリスクとなる可能性があります。
イメージアクセス管理を利用すると、開発者がアクセスするイメージを、Docker 公式イメージ、Docker 認証者によるイメージ、組織の保有するイメージといった、信頼のおけるイメージだけとなるように、組織所有者が仕向けることができます。
こうしてセキュリティリスクを回避できます。
@z

@x
## Configure Image Access Management permissions
@y
{: #configure-image-access-management-permissions }
## イメージアクセス管理のパーミッション設定
@z

@x
1. Log into your [Docker Hub](https://hub.docker.com) account as an organization administrator.
2. Select an organization, and navigate to the **Settings** tab on the **Organizations** page and click Org Permissions.
@y
1. 組織管理者として [Docker Hub](https://hub.docker.com) アカウントにログインします。
2. 組織を選択して、**Organizations**（組織）ページの **Settings**（設定）タブを開き、Org Permissions をクリックします。
@z

@x
    ![Image Access Management](images/image-access-management.png){:width="700px"}
@y
    ![イメージアクセス管理](images/image-access-management.png){:width="700px"}
@z

@x
3. Enable Image Access Management to set the permissions for the following categories of images you can manage:
- **Organization Images**: When Image Access Management is enabled, images from your organization are always allowed. These images can be public or private created by members within your organization.
- **Docker Official Images**: A curated set of Docker repositories hosted on Hub. They provide OS repositories, best practices for Dockerfiles, drop-in solutions, and applies security updates on time.
- **Docker Verified Publisher Images**: published by Docker partners that are part of the Verified Publisher program and are qualified to be included in the developer secure supply chain. You can set permissions to **Allowed** or **Restricted**.
- **Community Images**: Images are always disabled when Image Access Management is enabled. These images are not trusted because various Docker Hub users contribute them and pose security risks.
@y
3. イメージアクセス管理を有効にして、管理対象としたい以下のようなイメージ種類に対するパーミッションを設定します。
- **Organization Images**（組織イメージ）＝ イメージアクセス管理が有効なときに、自組織が構築したイメージは常に有効となります。
   このイメージは組織内のメンバーが生成したものであり、公開されたもの、プライベートなものを問いません。
- **Docker Official Images**（Docker 公式イメージ）＝ Docker Hub 上の Docker リポジトリから提供されるイメージです。
  ここには OS リポジトリ、Dockerfile のベストプラクティス、すぐに使えるソリューションが提供されていて、日々セキュリティ更新が行われています。
- **Docker Verified Publisher Images**（Docker 認証者によるイメージ）＝ 認証公開者（Verified Publisher）プログラムの一部である Docker パートナーによって公開されたイメージです。
  開発者の安全性を確保するサプライチェーンに含める、信頼のおけるイメージです。
  これに対するパーミッションとして、**Allowed**（許可）や **Restricted**（限定的）を設定することができます。
- **Community Images**（コミュニティイメージ）＝ イメージアクセス管理が有効である場合に、このイメージは常に無効となります。
  こういったイメージは信頼できないものです。さまざまな Docker Hub ユーザーが提供しているため、セキュリティリスクを引き起こすためです。
@z

@x
    > **Note**
    >
    > Image Access Management is set to Disabled by default. However, member(s) of the `owners` Team in your Organization have access to all images regardless of the settings.
@y
    > **メモ**
    >
    > イメージアクセス管理は、デフォルトでは無効となっています。
    > ただし、組織内の`owners`チームに属するメンバーは、この設定には関係なく、すべてのイメージにアクセスできます。
@z

@x
4. Select the category restrictions for your images by clicking **Allowed**.
5. Once the restrictions are applied, your members can view the Org permissions page in a read-only format.
@y
4. **Allowed**（許可）をクリックして、イメージに対するカテゴリー制約を選択します。
5. 制約を適用した後、各メンバーは、組織のパーミッションページを編集はできませんが参照することはできます。
@z

@x
To ensure that each org member uses images in a safe and secure environment, you can  perform the following steps below to enforce sign-in under your organization.
@y
組織内の各メンバーが、安全でセキュアな環境のもとでイメージを利用するように仕向けるため、以下の手順を実施して、組織内においては強制的にサインインさせるようにします。
@z

@x
1. Download Docker Desktop 4.0 or a later release.
@y
1. Docker Desktop 4.0 またはそれ以降のリリースをダウンロードします。
@z

@x
    - [Download and install for Windows](/desktop/windows/install/)
    - [Download and install for Mac](/desktop/mac/install/)
@y
    - [Windows 向けのダウンロードとインストール]({{ site.baseurl }}/desktop/windows/install/)
    - [Mac 向けのダウンロードとインストール]({{ site.baseurl }}/desktop/mac/install/)
@z

@x
    > **Note**
    >
    > There currently is no Docker Desktop for Linux. Linux users will have the same restrictions as Mac and Windows users while logged in, but there is currently no way to require them to log in.
@y
    > **メモ**
    >
    > 現在のところ Linux 向けの Docker Desktop はありません。
    > ログインに際しては Linux ユーザーも、 Mac や Windows ユーザーと同様の制約を持つことになりますが、現在のところ、ログイン時にこれを要求する方法はありません。
@z

@x
2. Create a registry.json file on Windows or Mac.
@y
2. Windows または Mac 上に registry.json ファイルを生成します。
@z

@x
    For **Windows**:
@y
    **Windows** の場合
@z

@x
    Create a file `C:\ProgramData\DockerDesktop\registry.json` with file permissions that ensure that the developer using Docker Desktop cannot remove or edit the file (i.e., only the system administrator can write to the file). The file must be JSON and contain one or more organization names in the `allowedOrgs` key.
@y
    `C:\ProgramData\DockerDesktop\registry.json`というファイルを生成します。
    そしてこのファイルのパーミッションとして、Docker Desktop を利用する開発者が、このファイルを削除や編集ができないようにします（つまり管理者だけが、このファイルに書き込みできるようにします）。
    このファイルは JSON 形式であり、`allowedOrgs`キー内に、少なくとも組織名を 1 つ設定していなければなりません。
@z

@x
    To create your registry.json file:
@y
    個人用の registry.json ファイルを生成するには以下を行います。
@z

@x
    1. Open Windows Powershell and select Run as Administrator.
    2. Type the following command: `cd /ProgramData/DockerDesktop/`
    3. In Notepad, type `registry.json` and enter one or more organization names in the `allowedOrgs` key and click Save.
@y
    1. Windows Powershell を開いて Run as Administrator（管理者として実行）を選択します。
    2. 以下のコマンドを入力します。 `cd /ProgramData/DockerDesktop/`
    3. メモ帳を開いて、`registry.json`を入力し、`allowedOrgs`キー内に必要な分だけ組織名を記述します。
       そして Save をクリックします。
@z

@x
        Example:
@y
        たとえば以下のようにします。
@z

@x
        ```json
        {
         "allowedOrgs": ["mycompany"]
         }
        ```
    4. Navigate to Powershell and type ```start .```
@y
        ```json
        {
         "allowedOrgs": ["mycompany"]
         }
        ```
    4. Powershell において ```start .``` を入力します。
@z

@x
        Congratulations, you have just created the registry.json file.
@y
        おめでとうございます。registry.json ファイルができあがりました。
@z

@x
    For **macOS**:
@y
    **macOS** の場合
@z

@x
    Create a file `/Library/Application Support/com.docker.docker/registry.json` with file permissions that ensure that the developer using Docker Desktop cannot remove or edit the file (i.e., only the system administrator can write to the file). The file must be JSON and contain one or more organization names in the `allowedOrgs` key. The user must sign in and be a member of at least one of the organizations before using Docker Desktop.
@y
    `/Library/Application Support/com.docker.docker/registry.json`というファイルを生成します。
    そしてこのファイルのパーミッションとして、Docker Desktop を利用する開発者が、このファイルを削除や編集ができないようにします（つまり管理者だけが、このファイルに書き込みできるようにします）。
    このファイルは JSON 形式であり、`allowedOrgs`キー内に、少なくとも組織名を 1 つ設定していなければなりません。
    Docker Desktop を利用するユーザーは、あらかじめサインインができていて、その組織のうちの 1 つのメンバーであることが必要です。
@z

@x
    To create your registry.json file:
    1. Navigate to VS Code or any text editor of your choice.
    2. Enter one or more organization names in the `allowedOrgs` key and save it in your Documents.
@y
    個人用の registry.json ファイルを生成するには以下を行います。
    1. VS Code か、好みのテキストエディターを開きます。
    2. `allowedOrgs`キー内に必要な分だけ組織名を記述します。
       そしてファイルを保存します。
@z

@x
        Example:
@y
        たとえば以下のようにします。
@z

@x
       ```json
        {
          "allowedOrgs": ["mycompany"]
        }
        ```
@y
       ```json
        {
          "allowedOrgs": ["mycompany"]
        }
        ```
@z

@x
    3. Open a new terminal and type the following command:
@y
    3. 別の端末画面を開いて、以下のコマンドを入力します。
@z

@x
         `sudo mkdir -p /Library/Application\ Support/com.docker.docker`
@y
         `sudo mkdir -p /Library/Application\ Support/com.docker.docker`
@z

@x
        Note: if prompted, type your password associated with your local computer.
@y
        メモ： プロンプトが表示されたら、そのマシンにおけるパスワードを入力してください。
@z

@x
    4. Type the following command:
@y
    4. 以下のコマンドを入力します。
@z

@x
        `Documents/registry.json /Library/Application\ Support/com.docker.docker/registry.json`
@y
        `Documents/registry.json /Library/Application\ Support/com.docker.docker/registry.json`
@z

@x
        Congratulations, you have just created the registry.json file.
@y
        おめでとうございます。registry.json ファイルができあがりました。
@z
