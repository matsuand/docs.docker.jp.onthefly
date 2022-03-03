%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Using repositories on Docker Hub
keywords: Docker, docker, trusted, registry, accounts, plans, Dockerfile, Docker Hub, webhooks, docs, documentation
title: Repositories
redirect_from:
- /engine/tutorials/dockerrepos/
---
@y
---
description: Docker Hub 上のリポジトリを利用する。
keywords: Docker, docker, trusted, registry, accounts, plans, Dockerfile, Docker Hub, webhooks, docs, documentation
title: リポジトリ
redirect_from:
- /engine/tutorials/dockerrepos/
---
@z

@x
Docker Hub repositories allow you share container images with your team,
customers, or the Docker community at large.
@y
Docker Hub リポジトリは、開発チーム、顧客、Docker コミュニティ全般に対してコンテナーの共有を可能にします。
@z

@x
Docker images are pushed to Docker Hub through the [`docker push`](https://docs.docker.com/engine/reference/commandline/push/)
command. A single Docker Hub repository can hold many Docker images (stored as
**tags**).
@y
Docker イメージは Docker Hub に対して [`docker push`](https://docs.docker.com/engine/reference/commandline/push/) コマンドを使ってプッシュします。
1 つの Docker Hub リポジトリ内には複数の Docker イメージを含めることができます（**タグ**を使って保存します）。
@z

@x
## Creating repositories
@y
{: #creating-repositories }
## リポジトリの生成
@z

@x
To create a repository, sign into Docker Hub, click on **Repositories** then
**Create Repository**:
@y
リポジトリを生成するには Docker Hub にサインインして、**Repositories** をクリックし、さらに **Create Repository** をクリックします。
@z

@x
![Create repo](images/repos-create.png)
@y
![リポジトリの生成](images/repos-create.png)
@z

@x
When creating a new repository:
@y
リポジトリの新規生成時には以下を行います。
@z

@x
* You can choose to put it in your Docker ID namespace, or in any
  [organization](orgs.md) where you are an [_owner_](orgs.md#the-owners-team).
* The repository name needs to be unique in that namespace, can be two
  to 255 characters, and can only contain lowercase letters, numbers, hyphens (`-`), and underscores (`_`).
@y
* リポジトリを Docker ID 名前空間に含めるか、自身が [**所有者**](orgs.md#the-owners-team) となっている [組織](orgs.md) に含めるかを選びます。
* リポジトリ名は、これが属する名前空間内においてユニークである必要があります。
  文字数は 2 文字以上 255 文字までです。
  利用できる文字は、英小文字、数字、ハイフン（`-`）、アンダースコア（`_`）です。
@z

@x

  > **Note:**
  >
  > You cannot rename a Docker Hub repository once it has been created.

@y

  > **メモ**
  >
  > Docker Hub のリポジトリを一度生成した後は、名称変更することはできません。

@z

@x
* The description can be up to 100 characters and is used in the search result.
* You can link a GitHub or Bitbucket account now, or choose to do it later in
  the repository settings.
@y
* 内容説明を 100 文字以内で記述できます。
  これは検索を行った際に、結果として表示されます。
* この場ですぐに GitHub や Bitbucket のアカウントにリンクさせることができます。
  またはリポジトリ設定において、後で行うこともできます。
@z

@x
![Setting page for creating a repo](images/repo-create-details.png)
@y
![リポジトリ生成の設定ページ](images/repo-create-details.png)
@z

@x
After you hit the **Create** button, you can start using `docker push` to push
images to this repository.
@y
**Create** ボタンをクリックした後は、`docker push` を利用してこのリポジトリに対してイメージをプッシュしていくことができます。
@z

@x
## Deleting a repository
@y
{: #deleting-a-repository }
## リポジトリの削除
@z

@x
1. Sign into [Docker Hub](https://hub.docker.com){: target="_blank" rel="noopener" class="_"} and click **Repositories**.
@y
1. [Docker Hub](https://hub.docker.com){: target="_blank" rel="noopener" class="_"} にサインインして **Repositories** をクリックします。
@z

@x
2. Select a repository from the list, click **Settings** and then Delete Repository.
@y
2. 一覧の中からリポジトリを 1 つ選択して、**Settings** をクリックし Delete Repository を行います。
@z

@x
  > **Note:**
  >
  > Deleting a repository deletes all the images it contains and its build settings. This action cannot be undone.
@y
  > **メモ**
  >
  > リポジトリの削除を行うと、そこに含まれていたイメージやビルド設定はすべて失われます。
  > この操作は取り消すことはできません。
@z

@x
3. Enter the name of the repository to confirm the deletion and click **Delete**.
@y
3. 確認のためリポジトリ名を入力し、**Delete** をクリックします。
@z

@x
## Pushing a Docker container image to Docker Hub
@y
{: #pushing-a-docker-container-image-to-docker-hub }
## Docker コンテナーイメージの Docker Hub へのプッシュ
@z

@x
To push an image to Docker Hub, you must first name your local image using your
Docker Hub username and the repository name that you created through Docker Hub
on the web.
@y
Docker Hub にイメージをプッシュするには、Docker Hub のユーザー名と、ウェブ画面を通じて Docker Hub 上に生成したリポジトリ名を使って、まずはローカルイメージに名前をつける必要があります。

@z

@x
You can add multiple images to a repository by adding a specific `:<tag>` to
them (for example `docs/base:testing`). If it's not specified, the tag defaults
to `latest`.
@y
リポジトリへは複数のイメージを追加することができます。
これにはイメージに対して、特定の`:<tag>`というものを加えます。
これが指定されていない場合、タグのデフォルト名は`latest`になります。
@z

@x
Name your local images using one of these methods:
@y
ローカルイメージに名前をつけるには、以下の 3 つの方法の中から選びます。
@z

@x
* When you build them, using `docker build -t <hub-user>/<repo-name>[:<tag>]`
* By re-tagging an existing local image `docker tag <existing-image> <hub-user>/<repo-name>[:<tag>]`
* By using `docker commit <existing-container> <hub-user>/<repo-name>[:<tag>]`
  to commit changes
@y
* イメージをビルドする際に`docker build -t <hub-user>/<repo-name>[:<tag>]`を実行します。
* ローカルイメージに改めてタグをつける`docker tag <existing-image> <hub-user>/<repo-name>[:<tag>]`を実行します。
* `docker commit <existing-container> <hub-user>/<repo-name>[:<tag>]`を実行して変更をコミットします。
@z

@x
Now you can push this repository to the registry designated by its name or tag.
@y
そこでこのリポジトリを、名前およびタグによって指定されるレジストリへプッシュします。
@z

@x
```console
$ docker push <hub-user>/<repo-name>:<tag>
```
@y
```console
$ docker push <hub-user>/<repo-name>:<tag>
```
@z

@x
The image is then uploaded and available for use by your teammates and/or
the community.
@y
イメージがアップロードされて、チームメンバーやコミュニティが利用できるようになりました。
@z

@x
## Private repositories
@y
{: #private-repositories }
## プライベートリポジトリ
@z

@x
Private repositories let you keep container images private, either to your
own account or within an organization or team.
@y
プライベートリポジトリは、コンテナーイメージをプライベートなものにします。
これは自身のアカウントだけでなく、組織やチーム内においてもプライベートなものになります。
@z

@x
To create a private repository, select **Private** when creating a repository:
@y
プライベートリポジトリを生成するには、リポジトリ生成の操作時に **Private** を選びます。
@z

@x
![Create Private Repo](images/repo-create-private.png){: style="max-width: 60%"}
@y
![プライベートリポジトリの生成](images/repo-create-private.png){: style="max-width: 60%"}
@z

@x
You can also make an existing repository private by going to its **Settings** tab:
@y
**Settings** タブにおいては、既存のリポジトリをプライベートに変更することもできます。
@z

@x
![Convert Repo to Private](images/repo-make-private.png){: style="max-width: 60%"}
@y
![リポジトリをプライベートに変更](images/repo-make-private.png){: style="max-width: 60%"}
@z

@x
You get one private repository for free with your Docker Hub user account (not
usable for organizations you're a member of). If you need more private
repositories for your user account, upgrade your Docker Hub plan from your
[Billing Information](https://hub.docker.com/billing/plan){: target="_blank" rel="noopener" class="_"} page.
@y
Docker Hub ユーザーアカウントに対して、プライベートリポジトリは無償で 1 つだけ生成することができます。
（メンバーとして所属している組織からは利用できません。）
ユーザーアカウントにおいて、これ以上のプライベートリポジトリを必要とする場合は、[有料プランの情報](https://hub.docker.com/billing/plan){: target="_blank" rel="noopener" class="_"} ページから Docker Hub プランをアップグレードすることが必要になります。
@z

@x
Once the private repository is created, you can `push` and `pull` images to and
from it using Docker.
@y
プライベートリポジトリが生成できたら、Docker を使ってイメージの`push`や`pull`を行うことができます。
@z

@x
> **Note**: You need to be signed in and have access to work with a
> private repository.
@y
> **メモ** プライベートリポジトリにアクセスして操作を行っていくには、サインインしておくことが必要です。
@z

@x
> **Note**: Private repositories are not currently available to search through
> the top-level search or `docker search`.
@y
> **メモ** プライベートリポジトリは今のところ、トップレベルの検索、つまり`docker search`を利用した検索は利用できません。
@z

@x
You can designate collaborators and manage their access to a private
repository from that repository's **Settings** page. You can also toggle the
repository's status between public and private, if you have an available
repository slot open. Otherwise, you can upgrade your
[Docker Hub](https://hub.docker.com/account/billing-plans/){: target="_blank" rel="noopener" class="_"} plan.
@y
プライベートリポジトリでは、協力者（collaborator）を設定して、リポジトリへのアクセスを管理することができます。
これはリポジトリの **Settings** ページから行います。
またリポジトリの状態は、利用可能なスロット数があれば、パブリックとプライベートの間で切り替えることもできます。
スロット数が足りない場合、[Docker Hub](https://hub.docker.com/account/billing-plans/){: target="_blank" rel="noopener" class="_"} プランをアップグレードすることができます。
@z

@x
## Collaborators and their role
@y
{: #collaborators-and-their-role }
## 協力者とその役割
@z

@x
A collaborator is someone you want to give access to a private repository. Once
designated, they can `push` and `pull` to your repositories. They are not
allowed to perform any administrative tasks such as deleting the repository or
changing its status from private to public.
@y
協力者（collaborator）とは、プライベートリポジトリへのアクセスを許可する他ユーザーのことです。
これを設定すると、協力者もリポジトリに対して`push`と`pull`ができるようになります。
ただし協力者になったからといって、リポジトリを削除したり、プライベートリポジトリをパブリックに変更したり、といった管理操作を行うことはできません。
@z

@x
> **Note**
>
> A collaborator cannot add other collaborators. Only the owner of
> the repository has administrative access.
@y
> **メモ**
>
> 協力者が他の協力者を追加することはできません。
> 管理操作が可能なのは、あくまでそのリポジトリの所有者のみです。
@z

@x
You can also assign more granular collaborator rights ("Read", "Write", or
"Admin") on Docker Hub by using organizations and teams. For more information
see the [organizations documentation](orgs.md).
@y
組織やチームを利用すれば、Docker Hub での協力者の権限は、さらに細かく割り当てることもできます（「Read」、「Write」、「Admin」）。
詳しくは [組織のドキュメント](orgs.md) を参照してください。
@z

@x
## Viewing repository tags
@y
{: #viewing-repository-tags }
## リポジトリのタグ参照
@z

@x
Docker Hub's individual repositories view shows you the available tags and the
size of the associated image. Go to the **Repositories** view and click on a
repository to see its tags.
@y
Docker Hub の個々のリポジトリ画面では、利用可能なタグと、関連イメージのサイズが表示されます。
**Repositories** 画面にアクセスして、1 つのリポジトリをクリックし、タグを確認してください。
@z

@x
![Repository View](images/repos-create.png)
@y
![リポジトリ画面](images/repos-create.png)
@z

@x
![View Repo Tags](images/repo-overview.png)
@y
![リポジトリタグの参照](images/repo-overview.png)
@z

@x
Image sizes are the cumulative space taken up by the image and all its parent
images. This is also the disk space used by the contents of the `.tar` file
created when you `docker save` an image.
@y
イメージサイズは、そのイメージと親イメージによって占有される合計サイズです。
これはまた、`docker save`によりイメージを生成した際の`.tar`ファイルのディスク容量でもあります。
@z

@x
To view individual tags, click on the **Tags** tab.
@y
個々のタグを確認するには **Tags** タブを開きます。
@z

@x
![Manage Repo Tags](images/repo-tags-list.png)
@y
![リポジトリタグの管理](images/repo-tags-list.png)
@z

@x
An image is considered stale if there has been no push/pull activity for more
than 1 month, i.e.:
@y
イメージに対するプッシュ、プルの操作が 1 ヶ月以上なかったら、そのイメージは古いものとみなされます。
たとえば以下のようなものです。
@z

@x
* It has not been pulled for more than 1 month
* And it has not been pushed for more than 1 month
@y
* 1 ヶ月以上、プル操作が行われていない。
* 1 ヶ月以上、プッシュ操作が行われていない。
@z

@x
A multi-architecture image is considered stale if all single-architecture images
part of its manifest are stale.
@y
マルチアーキテクチャーのイメージの場合は、そのマニフェストにある一つずつのアーキテクチャーイメージがすべて古くなった場合に、古いものとみなされます。
@z

@x
To delete a tag, select the corresponding checkbox and select **Delete** from the
**Action** drop-down list.
@y
タグを削除するには、対応するチェックボックスを選択して **Action** ドロップダウンリストから **Delete** を選択します。
@z

@x
> **Note**
>
> Only a user with administrative access (owner or team member with Admin
> permission) over the repository can delete tags.
@y
> **メモ**
>
> リポジトリに対してタグの削除が可能なのは、管理者権限を持つユーザー（所有者まはた管理者権限を持つチームメンバー）のみです。
@z

@x
Select a tag's digest to view details.
@y
タグのダイジェスト値をクリックして、タグの詳細を確認します。
@z

@x
![View Tag](images/repo-image-layers.png)
@y
![タグの確認](images/repo-image-layers.png)
@z

@x
## Searching for Repositories
@y
{: #searching-for-repositories }
## リポジトリの検索
@z

@x
You can search the [Docker Hub](https://hub.docker.com) registry through its
search interface or by using the command line interface. Searching can find
images by image name, username, or description:
@y
[Docker Hub](https://hub.docker.com) レジストリに対しては、検索画面やコマンドラインインターフェースを利用して検索することができます。
検索では、イメージ名、ユーザー名、内容説明を使ってイメージを検索します。
@z

@x
```console
$ docker search centos

NAME                                 DESCRIPTION                                     STARS     OFFICIAL   AUTOMATED
centos                               The official build of CentOS.                   1034      [OK]
ansible/centos7-ansible              Ansible on Centos7                              43                   [OK]
tutum/centos                         Centos image with SSH access. For the root...   13                   [OK]
...
```
@y
```console
$ docker search centos

NAME                                 DESCRIPTION                                     STARS     OFFICIAL   AUTOMATED
centos                               The official build of CentOS.                   1034      [OK]
ansible/centos7-ansible              Ansible on Centos7                              43                   [OK]
tutum/centos                         Centos image with SSH access. For the root...   13                   [OK]
...
```
@z

@x
There you can see two example results: `centos` and `ansible/centos7-ansible`.
The second result shows that it comes from the public repository of a user,
named `ansible/`, while the first result, `centos`, doesn't explicitly list a
repository which means that it comes from the top-level namespace for
[Docker Official Images](official_images.md). The `/` character separates
a user's repository from the image name.
@y
上の検索によると、検索結果として`centos`と`ansible/centos7-ansible`という 2 つがあります。
2 つめの結果は、パブリックリポジトリにある、ユーザー`ansible/`によるイメージを表わしています。
一方 1 つめである`centos`はリポジトリが表示されていません。
これは [Docker 公式イメージ](official_images.md) によるトップレベルの名前空間からきていることを表わします。
なお`/`は、ユーザーのリポジトリ名とイメージ名を区切るものです。
@z

@x
Once you've found the image you want, you can download it with `docker pull <imagename>`:
@y
検索したいイメージが見つかったら、`docker pull <イメージ名>`を実行してダウンロードします。
@z

@x
```console
$ docker pull centos

latest: Pulling from centos
6941bfcbbfca: Pull complete
41459f052977: Pull complete
fd44297e2ddb: Already exists
centos:latest: The image you are pulling has been verified. Important: image verification is a tech preview feature and should not be relied on to provide security.
Digest: sha256:d601d3b928eb2954653c59e65862aabb31edefa868bd5148a41fa45004c12288
Status: Downloaded newer image for centos:latest
```
@y
```console
$ docker pull centos

latest: Pulling from centos
6941bfcbbfca: Pull complete
41459f052977: Pull complete
fd44297e2ddb: Already exists
centos:latest: The image you are pulling has been verified. Important: image verification is a tech preview feature and should not be relied on to provide security.
Digest: sha256:d601d3b928eb2954653c59e65862aabb31edefa868bd5148a41fa45004c12288
Status: Downloaded newer image for centos:latest
```
@z

@x
You now have an image from which you can run containers.
@y
イメージが取得できたので、ここからコンテナーを実行することができます。
@z

@x
## Starring Repositories
@y
{: #starring-repositories }
## リポジトリへの星マークづけ
@z

@x
Your repositories can be starred and you can star repositories in return. Stars
are a way to show that you like a repository. They are also an easy way of
bookmarking your favorites.
@y
リポジトリは他の方から星マークをつけてもらうことがあり、逆に他のリポジトリへ星マークをつけることができます。
星マークをつけるのは、好きなリポジトリが何かを公開する方法として使えます。
またお気に入りのリポジトリをブックマークしておくということもできます。
@z
