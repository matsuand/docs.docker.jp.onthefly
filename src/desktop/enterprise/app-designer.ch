%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Application Designer
description: Docker Desktop Enterprise Application Designer
keywords: Docker EE, Windows, Mac, Docker Desktop, Enterprise, templates, designer
redirect_from:
- /ee/desktop/app-designer/
---
@y
---
title: アプリケーションデザイナー
description: Docker Desktop Enterprise Application Designer
keywords: Docker EE, Windows, Mac, Docker Desktop, Enterprise, templates, designer
redirect_from:
- /ee/desktop/app-designer/
---
@z

@x
## Overview
@y
{% comment %}
## Overview
{% endcomment %}
{: #overview }
## 概要
@z

@x
The Application Designer helps Docker developers quickly create new
Docker apps using a library of templates. To start the Application
Designer, select the **Design new application** menu entry.
@y
{% comment %}
The Application Designer helps Docker developers quickly create new
Docker apps using a library of templates. To start the Application
Designer, select the **Design new application** menu entry.
{% endcomment %}
アプリケーションデザイナー（Application Designer）を用いれば、Docker 開発者は、テンプレートライブラリを利用して Docker アプリケーションをすばやく生成することができます。
アプリケーションデザイナーを起動するには、メニューから **Design new application** を実行します。
@z

@x
![The Application Designer lets you choose an existing template or create a custom application.](/desktop/enterprise/images/app-design-start.png "Application Designer")
@y
{% comment %}
![The Application Designer lets you choose an existing template or create a custom application.](/desktop/enterprise/images/app-design-start.png "Application Designer")
{% endcomment %}
![アプリケーションデザイナーを使って、既存テンプレートを選んだり、カスタムアプリケーションを生成したりできます。]({{ site.baseurl }}/desktop/enterprise/images/app-design-start.png "アプリケーションデザイナー")
@z

@x
The list of available templates is provided:
@y
{% comment %}
The list of available templates is provided:
{% endcomment %}
利用可能なテンプレートは一覧表示されています。
@z

@x
![You can tab through the available application templates. A description of each template is provided.](/desktop/enterprise/images/app-design-choose.png "Available templates for application creation")
@y
{% comment %}
![You can tab through the available application templates. A description of each template is provided.](/desktop/enterprise/images/app-design-choose.png "Available templates for application creation")
{% endcomment %}
![タブ切り替えすると利用可能なテンプレート一覧が得られます。各テンプレートの説明が記述されています。]({{ site.baseurl }}/desktop/enterprise/images/app-design-choose.png "アプリケーション生成時の利用可能テンプレート一覧")
@z

@x
After selecting a template, you can then customize your application, For
example, if you select **Flask / NGINX / MySQL**, you can then
@y
{% comment %}
After selecting a template, you can then customize your application, For
example, if you select **Flask / NGINX / MySQL**, you can then
{% endcomment %}
テンプレートを選択し、アプリケーションをカスタマイズすることができます。
たとえば **Flask / NGINX / MySQL** を選ぶと、以下のようなことが可能です。
@z

@x
- select a different version of python or mysql; and
@y
{% comment %}
- select a different version of python or mysql; and
{% endcomment %}
- Python や MySQL のバージョンを選択することができます。
@z

@x
- choose different external ports:
@y
{% comment %}
- choose different external ports:
{% endcomment %}
- 外部ポートを自由に選ぶことができます。
@z

@x
![You can customize your application, which includes specifying database, proxy, and other details.](/desktop/enterprise/images/app-design-custom.png "Customizing your application")
@y
{% comment %}
![You can customize your application, which includes specifying database, proxy, and other details.](/desktop/enterprise/images/app-design-custom.png "Customizing your application")
{% endcomment %}
![アプリケーションをカスタマイズできます。たとえばデータベースやプロキシーの指定などさまざまな詳細設定を行います。]({{ site.baseurl }}/desktop/enterprise/images/app-design-custom.png "アプリケーションのカスタマイズ")
@z

@x
You can then name your application and customize the disk location:
@y
{% comment %}
You can then name your application and customize the disk location:
{% endcomment %}
そしてアプリケーション名を定め、保存場所を設定します。
@z

@x
![You can also customize the name and location of your application.](/desktop/enterprise/images/app-design-custom2.png "Naming and specifying a location for your application")
@y
{% comment %}
![You can also customize the name and location of your application.](/desktop/enterprise/images/app-design-custom2.png "Naming and specifying a location for your application")
{% endcomment %}
![アプリケーションの名前と保存場所を設定します。]({{ site.baseurl }}/desktop/enterprise/images/app-design-custom2.png "アプリケーション名と保存場所の設定")
@z

@x
When you select **Assemble**, your application is created.
@y
{% comment %}
When you select **Assemble**, your application is created.
{% endcomment %}
**Assemble** をクリックすればアプリケーションが生成されます。
@z

@x
![When you assemble your application, a status screen is displayed.](/desktop/enterprise/images/app-design-test.png "Assembling your application")
@y
{% comment %}
![When you assemble your application, a status screen is displayed.](/desktop/enterprise/images/app-design-test.png "Assembling your application")
{% endcomment %}
![Assemble のクリックによりステータス画面が表示されます。]({{ site.baseurl }}/desktop/enterprise/images/app-design-test.png "アプリケーションを生成します。")
@z

@x
Once assembled, the following screen allows you to run the application. Select **Run application** to pull the images and start the containers:
@y
{% comment %}
Once assembled, the following screen allows you to run the application. Select **Run application** to pull the images and start the containers:
{% endcomment %}
生成が終わると以下のような画面が表示されて、アプリケーションが実行できるようになります。
**Run application** をクリックして、イメージをプルしコンテナーを起動します。
@z

@x
![When you run your application, the terminal displays output from the application.](/desktop/enterprise/images/app-design-run.png "Running your application")
@y
{% comment %}
![When you run your application, the terminal displays output from the application.](/desktop/enterprise/images/app-design-run.png "Running your application")
{% endcomment %}
![アプリケーションを実行すると、ターミナル画面にアプリケーションによる出力が表示されます。]({{ site.baseurl }}/desktop/enterprise/images/app-design-run.png "アプリケーションの実行")
@z

@x
Use the corresponding buttons to start and stop your application. Select **Open in Finder** on Mac or **Open in Explorer** on Windows to
view application files on disk. Select **Open in Visual Studio Code** to open files with an editor. Note that debug logs from the application are displayed in the lower part of the Application Designer
window.
@y
{% comment %}
Use the corresponding buttons to start and stop your application. Select **Open in Finder** on Mac or **Open in Explorer** on Windows to
view application files on disk. Select **Open in Visual Studio Code** to open files with an editor. Note that debug logs from the application are displayed in the lower part of the Application Designer
window.
{% endcomment %}
start や stop のボタンを使って、アプリケーションの起動や停止を行います。
Mac では **Open in Finder**、Windows では **Open in Explorer** をクリックして、ディスク上にあるアプリケーションのファイルを参照します。
**Open in Visual Studio Code** をクリックすれば、ファイルをエディターで開きます。
アプリケーションが出力するデバッグログは、アプリケーションデザイナーの下段画面に表示されます。
@z
