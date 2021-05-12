%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Advanced Image Management dashboard
keywords: dashboard, images, image management, inactive
title: Advanced Image Management dashboard
---
@y
---
description: 拡張イメージ管理ダッシュボード。
keywords: dashboard, images, image management, inactive
title: 拡張イメージ管理ダッシュボード
---
@z

@x
> Docker Pro and Team users can now use Docker Hub's new **Advanced Image Management** dashboard. The dashboard enables a new level of access to your content, allowing fine-grained pruning of old data and exploration of old versions of pushed images. [Upgrade](https://www.docker.com/pricing?utm_source=docker&utm_medium=webreferral&utm_campaign=docs_driven_upgrade){: target="_blank" rel="noopener" class="_"} your existing subscription to start using the Advanced Image Management dashboard.
@y
> Docker のプロユーザーおよびチームユーザーは、Docker Hub の新機能、**拡張イメージ管理**（Advanced Image Management）ダッシュボードが利用できるようになりました。
ダッシュボードを使えば、これまでにないイメージアクセスが可能になります。
そして古いデータをきめ細かく整理したり、プッシュされたイメージの旧バージョンを確認したりすることができます。
拡張イメージ管理ダッシュボードを利用するために、既存のサブスクリプションを [アップグレード](https://www.docker.com/pricing?utm_source=docker&utm_medium=webreferral&utm_campaign=docs_driven_upgrade){: target="_blank" rel="noopener" class="_"} してください。
@z

@x
The **Advanced Image Management** dashboard allows you to manage Docker images across all repositories. [Upgrade](https://www.docker.com/pricing?utm_source=docker&utm_medium=webreferral&utm_campaign=docs_driven_upgrade){: target="_blank" rel="noopener" class="_"} your existing account to a Pro or a Team account to start using the Advanced Image Management dashboard.
@y
**拡張イメージ管理**（Advanced Image Management）ダッシュボードは、あらゆるリポジトリにわたっての Docker イメージ管理を実現します。
すでにお持ちのアカウントをプロアカウントやチームアカウントに [アップグレード](https://www.docker.com/pricing?utm_source=docker&utm_medium=webreferral&utm_campaign=docs_driven_upgrade){: target="_blank" rel="noopener" class="_"} して、この拡張イメージ管理ダッシュボードをご利用ください。
@z

@x
The Advanced Image Management dashboard provides a snapshot of your existing images and allows you to view, sort, and filter images by tags, activity status, and date, and contains options to clean up your workspace by deleting images that are no longer required.
@y
拡張イメージ管理ダッシュボードでは、既存イメージのスナップショットを提供し、イメージの一覧表示や並べ替えや、タグ、アクティビティ状態、日付などによるフィルター検索を可能にします。
また作業スペースをすっきりさせるために、不要なイメージを削除する機能もあります。
@z

@x
The dashboard provides visibility into the status of the images in your repository and allows you to reduce the number of images stored in Docker Hub by reviewing their active status. An image retains its 'active' status if it is pulled or pushed in the last month. If there isn’t any activity on the image in the last month, it is considered 'inactive'.
@y
ダッシュボードは、リポジトリ内の各イメージの状態をわかりやすく示します。
したがってアクティブ状態を確認することで、Docker Hub 内に保存するイメージ数を減らすことができます。
直近の 1 ヵ月においてプッシュやプルを行っているイメージは「アクティブ」（active）という状態で扱われます。
その期間に何も操作が行われていないイメージは「非アクティブ」（inactive）とみなされます。
@z

@x
By displaying the activity status and tags, the dashboard makes it easier for you to review the existing images and take actions to delete images that are not needed anymore. This is particularly helpful when your repository contains a lot of images that you have pushed over time, and you are now trying to streamline storage in Docker Hub.
@y
アクティビティ状態とタグが表示されていることから、ダッシュボードを使って既存イメージの確認や不要イメージの削除操作が容易にできます。
リポジトリを長らく利用してきたユーザーが数多くのイメージをプッシュしている場合に、特に便利な機能となります。
これからは Docker Hub におけるイメージ保存を効率的に行うことができます。
@z

@x
The dashboard also displays the old versions of images you have pushed. When you push an image to Docker Hub, you push a manifest, a list of all the layers of your image, and the layers themselves. When you update an existing tag, only the new layers are pushed, along with the new manifest which references these layers. This new manifest gets the tag you specify when you push the image, such as `myNamespace/mytag:latest`. This does not remove the old manifests or the unique layers referenced by them from Hub. You can still use and reference these using the digest of the manifest if you know the SHA.
@y
ダッシュボードでは、プッシュされたイメージの旧バージョンを表示することもできます。
Docker Hub にイメージをプッシュするということは、そのイメージのマニフェストや全レイヤーの一覧もプッシュします。
もちろんレイヤーデータそのものもプッシュします。
既存タグを更新するときには、新たなレイヤーデータだけがプッシュされ、そのレイヤーを参照する新たなマニフェストが同時にプッシュされます。
その新たなマニフェストには、イメージプッシュの際に指定したタグ、たとえば`myNamespace/mytag:latest`といったものが含まれます。
こうしたところで古いマニフェストやそれが参照する固有レイヤーは削除されずに Docker Hub に残ります。
したがってマニフェストの SHA ダイジェスト値がわかっていれば、古いものを参照し利用することができます。
@z

@x
With the new Advanced Image Management dashboard, all of this is now simpler and accessible for you to browse, use, and clean up.
@y
この新たな拡張イメージ管理ダッシュボードを使えば、上に示すようなことがすべて単純化でき、参照、利用、削除も容易に実現できます。
@z

@x
To access the  Advanced Image Management dashboard:
@y
拡張イメージ管理ダッシュボードへアクセスするには、以下のようにします。
@z

@x
1. Log into [Docker Hub](https://hub.docker.com){: target="_blank" rel="noopener" class="_"}.
2. Click **Repositories** from the main menu and select a repository from the list. This displays a banner indicating the number of inactive images in the repository.
3. Click **View inactive images**. This displays the Advanced Image Management dashboard. It lists images in your repository and allows you to sort and filter images by tags, activity status, and the last activity date.
@y
1. [Docker Hub](https://hub.docker.com){: target="_blank" rel="noopener" class="_"} にログインします。
2. メインメニューから **Repositories**（リポジトリ）をクリックして、一覧の中からリポジトリを 1 つ選択します。
   バナー表示には、このリポジトリ内にある非アクティブなイメージ数が表示されます。
3. **View inactive images**（非アクティブイメージの表示）をクリックします。
   すると拡張イメージ管理ダッシュボードが開きます。
   ここにはリポジトリ内のイメージが一覧表示されます。
   この一覧では並べ替えを行ったり、タグ、アクティビティ状態、最終アクティビティ日付を使ってフィルター検索を行うことができます。
@z

@x
    > You must be logged in as a Pro or a Team user to use the Advanced Image Management dashboard. Click [Upgrade](https://www.docker.com/pricing?utm_source=docker&utm_medium=webreferral&utm_campaign=docs_driven_upgrade){: target="_blank" rel="noopener" class="_"} to upgrade your existing subscription.
@y
    > 拡張イメージ管理ダッシュボードを利用するためには、プロユーザーまたはチームユーザーとしてログインしなければなりません。
    > 既存のサブスクリプションを [アップグレード](https://www.docker.com/pricing?utm_source=docker&utm_medium=webreferral&utm_campaign=docs_driven_upgrade){: target="_blank" rel="noopener" class="_"} してご利用ください。
@z

@x
## View images
@y
{: #view-images }
## イメージの一覧表示
@z

@x
The Advanced Image Management dashboard provides a snapshot of your existing images and allows you to view images by tags, activity status and date, and also allows you to clean up your workspace by deleting images that are no longer required.
@y
拡張イメージ管理ダッシュボードでは既存イメージのスナップショットが示されます。
そしてタグ、アクティビティ状態、日付別にイメージを一覧することができます。
また作業スペースをすっきりさせるために、不要なイメージを削除する機能もあります。
@z

@x
![Advanced image management dashboard](images/image-management-dashboard.png){:width="700px"}
@y
![拡張イメージ管理ダッシュボード](images/image-management-dashboard.png){:width="700px"}
@z

@x
## Delete images
@y
{: #delete-images }
## イメージの削除
@z

@x
> You must be logged in as a Pro or a Team user and have admin access to the repository to delete images.
@y
> イメージの削除を行うには、プロユーザーまたはチームユーザーとしてログインし、リポジトリへの管理権限を有していることが必要です。
@z

@x
By default, the Advanced Image Management dashboard displays inactive images in the repository. To delete an inactive image:
@y
拡張イメージ管理ダッシュボードでは、デフォルトでリポジトリ内の非アクティブイメージを表示します。
非アクティブなイメージを削除するには以下のようにします。
@z

@x
1. Log in to [Docker Hub](https://hub.docker.com){: target="_blank" rel="noopener" class="_"}.
2. Click **Repositories** from the main menu and select a repository from the list. This displays a banner indicating the number of inactive images in the repository.
3. Click **View inactive images**. This displays the Advanced Image Management dashboard.
4. Select the images that you’d like to delete from the repository.
5. Click the delete icon located above the list of images.
@y
1. [Docker Hub](https://hub.docker.com){: target="_blank" rel="noopener" class="_"} にログインします。
2. メインメニューから **Repositories**（リポジトリ）をクリックして、一覧の中からリポジトリを 1 つ選択します。
   バナー表示には、このリポジトリ内にある非アクティブなイメージ数が表示されます。
3. **View inactive images**（非アクティブイメージの表示）をクリックします。
   すると拡張イメージ管理ダッシュボードが開きます。
4. リポジトリから削除したいイメージを選択します。
5. イメージ一覧の上側にある削除アイコンをクリックします。
@z

@x
    ![Advanced image management dashboard](images/dashboard-delete-image.png){:width="700px"}
@y
    ![拡張イメージ管理ダッシュボード](images/dashboard-delete-image.png){:width="700px"}
@z

@x
6. Carefully read the advice displayed about deleting the image you have selected.
7. Select the check box to confirm your action and then click **Delete**.
@y
6. イメージ削除に関しての注意事項をしっかりと読みます。
7. 確認を行ったことを示すチェックボックスを選択して **Delete**（削除）をクリックします。
@z

@x
### Deleting a tagged image
@y
{: #deleting-a-tagged-image }
### タグつきイメージの削除
@z

@x
A Docker image can contain multiple tags. A ‘tag’ refers to a combination of artifacts or labels associated with the image. When you attempt to delete a tagged image, it deletes the tag associated with the image. This means, if there are any untagged images in your repository that previously held the same tag, those images will also be deleted even if they are not inactive. Therefore, you must be careful when deleting tagged images.
@y
Docker イメージは複数タグを持つことができます。
「タグ」（tag）というのは、イメージに関連づいた成果物の組み合わせ、あるいはラベルを意味します。
タグづけされているイメージを削除すると、イメージに関連づいたタグが削除されます。
さらに言えば、かつて同一のタグを持っていたイメージがタグづけを解除して存在していた場合、そういったイメージも削除されます。
その場合にはアクティブ状態であっても削除されます。
したがってタグつきイメージを削除する際には十分に注意してください。
@z

@x
For example, let's assume that Image-A is tagged as ‘latest’. You push another image, Image-B, and tag it as the new 'latest'. If you now delete Image-B, the 'latest' tag will be deleted, along with all images it previously referred to. However, if those images are tagged by another tag - in this case, if Image-B is also tagged with '1.5.0', for example, that tag would prevent its deletion.
@y
例としてイメージA が「latest」としてタグづけされているとします。
そして別のイメージB をプッシュして、新たに「latest」としてタグづけしたとします。
ここでイメージB を削除したとすると、タグ「latest」も削除されることになります。
そしてこれがかつて参照していたイメージもすべて削除されます。
しかし別のタグづけも行っていたとします。
今の例で言えば、イメージB に対してたとえば「1.5.0」というタグもつけていたとします。
この場合、このタグは削除の対象とはなりません。
@z

@x
## Advanced Image Management API
@y
{: #advanced-image-management-api }
## 拡張イメージ管理 API
@z

@x
The Advanced Image Management API endpoints allow you to manage Docker images across all repositories. For more information, see [Advanced Image management API](../api/latest/).
@y
拡張イメージ管理による API エンドポイントを利用すると、あらゆるリポジトリにわたっての Docker イメージ管理を行うことができます。
詳しくは [拡張イメージ管理 API](../api/latest/) を参照してください。
@z

@x
## Feedback
@y
{: #feedback }
## フィードバック
@z

@x
Thank you for trying out the Advanced Image Management dashboard. Your feedback is very important to us. Let us know your feedback by creating an issue in the [hub-feedback](https://github.com/docker/hub-feedback/issues){: target="_blank" rel="noopener" class="_"} GitHub repository.
@y
拡張イメージ管理ダッシュボードをお試しいただきありがとうございます。
みなさんからフィードバックをいただくことが大変重要であると思っています。
フィードバックは GitHub リポジトリ [hub-feedback](https://github.com/docker/hub-feedback/issues){: target="_blank" rel="noopener" class="_"} において issue を生成してお知らせください。
@z
