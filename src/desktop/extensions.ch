%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Extensions
keywords: Docker Extensions, Docker Desktop, Linux, Mac, Windows
title: Docker Extensions
toc_min: 1
toc_max: 2
---
@y
---
description: 拡張
keywords: Docker Extensions, Docker Desktop, Linux, Mac, Windows
title: Docker 拡張
toc_min: 1
toc_max: 2
---
@z

@x
Docker Extensions lets you use third-party tools within Docker Desktop to extend its functionality. There is no limit to the number of extensions you can install.
@y
Docker 拡張 (Docker Extensions) は Docker Desktop において、サードパーティー製のツール利用を可能にして、機能拡張を行うものです。
インストールする拡張機能の数に制限はありません。
@z

@x
Docker Community members and partners can use our [SDK](https://docker-desktop-extensions.netlify.app/){:target="_blank" rel="noopener" class="_"}  to create new extensions. 
@y
Docker コミュニティーメンバーやパートナーは [SDK](https://docker-desktop-extensions.netlify.app/){:target="_blank" rel="noopener" class="_"} を使って、新たな拡張機能を生成することができます。
@z

@x
> **Preview**
>
> The Docker Extensions feature is currently offered as a Preview. We recommend that you do not use Extensions in production environments.
@y
> **プレビュー**
>
> Docker 拡張機能は、現在のところプレビュー版として提供されています。
> この拡張機能を本番環境において用いることはお勧めしません。
@z

@x
![extenstions](images/extensions-image.PNG){:width="750px"}
@y
![拡張機能](images/extensions-image.PNG){:width="750px"}
@z

@x
## Prerequisites
@y
## 前提条件
@z

@x
Docker Extensions is available as part of Docker Desktop 4.8.0 or a later release. Download and install Docker Desktop 4.8.0 or later:
@y
Docker 拡張機能は Docker Desktop 4.8.0 またはそれ以降のリリースにおける一部として利用できます。
Docker Desktop 4.8.0 またはそれ以降をダウンロードおよびインストールしてください。
@z

@x
* [Mac](mac/release-notes/index.md)
* [Windows](windows/release-notes/index.md)
* [Linux](linux/index.md)
@y
* [Mac](mac/release-notes/index.md)
* [Windows](windows/release-notes/index.md)
* [Linux](linux/index.md)
@z

@x
## Add an extension
@y
{: #add-an-extension }
## 拡張機能の追加
@z

@x
>**Note**
>
> For some extensions, a separate account needs to be created before use.
@y
>**メモ**
>
> 拡張機能によっては、利用にあたり特別なアカウントの生成を必要とするものがあります。
@z

@x
To add Docker Extensions:
@y
Docker 拡張を追加するには以下のようにします。
@z

@x
1. Open Docker Desktop.
2. From the Dashboard, select **Add Extensions** in the menu bar. 
The Extensions Marketplace opens. 
2. Browse the available extensions.
3. Click **Install**.<br>
From here, you can click **Open** to access the extension or install additional extensions. The extension also appears in the menu bar.
@y
1. Docker Desktop を開きます。
2. ダッシュボード画面のメニューバーから **Add Extensions**（拡張の追加）を選びます。
   拡張マーケットプレース（Extensions Marketplace）画面が開きます。
2. 利用可能な拡張を探します。
3. **Install**（インストール）をクリックします。<br>
   そこから **Open**（開く）をクリックして拡張機能にアクセスしたり、追加機能をインストールしたりします。
   拡張はメニューバーに表示されます。
@z

@x
## Enable or disable extensions available in the Marketplace
@y
{: #enable-or-disable-extensions-available-in-the-marketplace }
## マーケットプレース内で利用可能な拡張機能の有効／無効化
@z

@x
 Docker Extensions are switched on by default. To change your settings:
@y
 Docker 拡張機能はデフォルトでオンに設定されています。
 設定変更は以下のように行います。
@z

@x
1. Navigate to  **Settings**, or **Preferences** if you're a Mac user.
2. Select the **Extensions** tab.
3. Next to **Enable Docker Extensions**, select or clear the checkbox to set your desired state.
4. In the bottom-right corner, click **Apply & Restart**.
@y
1. **Settings** 画面を開きます。 Mac ユーザーの場合は **Preferences** 画面を開きます。
2. **Extensions**（拡張）タブを開きます。
3. **Enable Docker Extensions**（Docker 拡張の有効化）の横にあるチェックボックスを選択またはクリア状態にすることで、指定したい内容を設定します。
4. 下段右隅にある **Apply & Restart**（適用＆リスタート）をクリックします。
@z

@x
## Enable or disable extensions not available in the Marketplace
@y
{: #enable-or-disable-extensions-not-available-in-the-marketplace }
## マーケットプレースからは利用できない拡張機能の有効／無効化
@z

@x
You can install Docker Extensions through the Marketplace or through the Extensions SDK tools. You can choose to only allow published extensions (that have been published in the Extensions Marketplace).
@y
Docker 拡張はマーケットプレースを通じて、あるいは拡張 SDK ツールを利用してインストールすることができます。
公開されている拡張機能（拡張マーケットプレースに公開済みであるもの）のみを許可するような設定が可能です。
@z

@x
1. Navigate to **Settings**, or **Preferences** if you're a Mac user.
2. Select the **Extensions** tab.
3. Next to **Allow only extensions distributed through the Docker Marketplace**, select or clear the checkbox to set your desired state.
4. In the bottom-right corner, click **Apply & Restart**.
@y
1. **Settings** 画面を開きます。 Mac ユーザーの場合は **Preferences** 画面を開きます。
2. **Extensions**（拡張）タブを開きます。
3. **Allow only extensions distributed through the Docker Marketplace**（Docker マーケットプレースから配布される拡張のみを許可する）の横にあるチェックボックスを選択またはクリア状態にすることで、指定したい内容を設定します。
4. 下段右隅にある **Apply & Restart**（適用＆リスタート）をクリックします。
@z

@x
## Update an extension
@y
{: #update-an-extension }
## 拡張機能の更新
@z

@x
You can update Docker Extensions outside of Docker Desktop releases. To update an extension to the latest version:
@y
Docker Desktop リリースとは関係なく Docker 拡張を更新することができます。
拡張機能を最新バージョンに更新するには以下を行います。
@z

@x
1. Navigate to Docker Dashboard, and from the menu bar select the ellipsis to the right of **Extensions**.
2. Click **Manage Extensions**.
If an extension has a new version available, it displays an **Update** button.
3. Click **Update**.
@y
1. Docker ダッシュボード画面のメニューバーから、**Extensions**（拡張機能）の右側にある省略記号を選択します。
2. **Manage Extensions**（拡張機能の管理）をクリックします。
   拡張機能の最新バージョンが利用可能な場合、**Update**（更新）ボタンが表示されています。
3. **Update**（更新）ボタンをクリックします。
@z

@x
## Uninstall an extension
@y
{: #uninstall-an-extension }
## 拡張機能のアンインストール
@z

@x
 You can uninstall an extension at any time. 
@y
 拡張機能はいつでもアンインストールできます。
@z

@x
 > **Note**  
 >
 > Any data used by the extension that is stored in a volume must be manually deleted. 
@y
 > **メモ**  
 >
 > 拡張機能を通じてボリューム内に保存されていたデータは、手動で削除することが必要です。
@z

@x
1. From the menu bar, select the ellipsis to the right of **Extensions**.
2. Click **Manage Extensions**. This displays a list of extensions you've installed.
3. Click **Uninstall**.
@y
1. メニューバーから **Extensions**（拡張機能）の右側にある省略記号を選択します。
2. **Manage Extensions**（拡張機能の管理）をクリックします。
   インストール済みの拡張機能の一覧が表示されます。
3. **Uninstall**（アンインストール）をクリックします。
@z
