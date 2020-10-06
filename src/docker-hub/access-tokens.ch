%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Managing access tokens
description: Learn how to create and manage your personal Docker Hub access tokens to securely push and pull images programmatically.
keywords: docker hub, hub, security, PAT, personal access token
---
@y
---
title: アクセストークンの管理
description: Learn how to create and manage your personal Docker Hub access tokens to securely push and pull images programmatically.
keywords: docker hub, hub, security, PAT, personal access token
---
@z

@x
Docker Hub lets you create personal access tokens as alternatives to your password. You can use tokens to access Hub images from the Docker CLI.
@y
{% comment %}
Docker Hub lets you create personal access tokens as alternatives to your password. You can use tokens to access Hub images from the Docker CLI.
{% endcomment %}
Docker Hub では、パスワードに代わるものとして個人用のアクセストークンを利用することができます。
このトークンを使って Docker CLI から Docker Hub イメージにアクセスできます
@z

@x
Using personal access tokens provides some advantages over a password:
* You can investigate when an access token was used last, and disable or delete it if you find any suspicious activity.
* When logged in with an access token, you can't perform any admin activity on the account, including changing the password.
@y
{% comment %}
Using personal access tokens provides some advantages over a password:
* You can investigate when an access token was used last, and disable or delete it if you find any suspicious activity.
* When logged in with an access token, you can't perform any admin activity on the account, including changing the password.
{% endcomment %}
個人用のアクセストークンを利用すると、パスワードに比べて以下の利点があります。
* アクセストークンの前回利用状況を確認できます。
  そのため何か疑わしい履歴が残っていたら、アクセストークンを無効化したり削除したりすることができます。
* アクセストークンを使ってログインしている際には、ログインアカウントに対する管理操作、たとえばパスワードの変更といったことを行うことはできません。
@z

@x
Access tokens are also useful in building integrations, since you can issue
multiple tokens &ndash; one for each integration &ndash; and revoke them at
any time.
@y
{% comment %}
Access tokens are also useful in building integrations, since you can issue
multiple tokens &ndash; one for each integration &ndash; and revoke them at
any time.
{% endcomment %}
アクセストークンは複数環境で利用する際に活用できます。
複数のトークンを生成しておき、環境ごとにトークンを使い分けます。
不要になったらいつでも削除することができます。
@z

@x
> Note: If you have [two-factor authentication (2FA)](/docker-hub/2fa) enabled on your account, you must create at least one personal access token. Otherwise, you will be unable to log in to your account from the Docker CLI.
{: .important }
@y
{% comment %}
> Note: If you have [two-factor authentication (2FA)](/docker-hub/2fa) enabled on your account, you must create at least one personal access token. Otherwise, you will be unable to log in to your account from the Docker CLI.
{: .important }
{% endcomment %}
> メモ: 利用アカウントに対して [２要素認証（two-factor authentication; 2FA）](../2fa) を有効にしている場合は、個人用のアクセストークンを少なくとも 1 つ生成しておかなければなりません。
> これを行っていないと、Docker CLI を使ってアカウントへのログインを行うことができません。
{: .important }
@z

@x
## Create an access token
@y
{% comment %}
## Create an access token
{% endcomment %}
{: #create-an-access-token }
## アクセストークンの生成
@z

@x
You can create as many tokens as you need.
@y
{% comment %}
You can create as many tokens as you need.
{% endcomment %}
アクセストークンは必要な分だけ生成することができます。
@z

@x
1. Log in to [hub.docker.com](https://hub.docker.com).
@y
{% comment %}
1. Log in to [hub.docker.com](https://hub.docker.com).
{% endcomment %}
1. [hub.docker.com](https://hub.docker.com) にログインします。
@z

@x
2. Click on your username in the top right corner and select **Account
Settings**.
@y
{% comment %}
2. Click on your username in the top right corner and select **Account
Settings**.
{% endcomment %}
2. 画面右上に表示されている自身のユーザー名をクリックして、**Account Settings** を実行します。
@z

@x
3. Select **Security > New Access Token**.
@y
{% comment %}
3. Select **Security > New Access Token**.
{% endcomment %}
3. **Security > New Access Token** を実行します。
@z

@x
      ![](images/hub-create-token.png)
@y
      ![](images/hub-create-token.png)
@z

@x
4. Add a description for your token. Use something that indicates where
the token is going to be used, or set a purpose for the token.
@y
{% comment %}
4. Add a description for your token. Use something that indicates where
the token is going to be used, or set a purpose for the token.
{% endcomment %}
4. トークンに対する説明を書きます。
   トークンをどのように用いるべきか、トークンの利用目的は何か、といったことを書きます。
@z

@x
5. Copy the token that appears on the screen. Make sure you do this now:
once you close this prompt, Docker will never show the token again.
@y
{% comment %}
5. Copy the token that appears on the screen. Make sure you do this now:
once you close this prompt, Docker will never show the token again.
{% endcomment %}
5. 画面上に表示されるトークンをコピーします。
   これは必ず実施するようにしてください。
   この表示画面を閉じてしまうと、トークンは二度と表示されません。
@z

@x
      ![](images/hub-copy-token.png)
@y
      ![](images/hub-copy-token.png)
@z

@x
      Treat access tokens like your password and keep them secret. Store your tokens securely (for example, in a credential manager).
@y
      {% comment %}
      Treat access tokens like your password and keep them secret. Store your tokens securely (for example, in a credential manager).
      {% endcomment %}
      トークンはパスワードと同様に、大切な情報として扱ってください。
      トークンは安全な方法で保存するようにします（たとえば Credential マネージャー内など）。
@z

@x
## Modify existing tokens
@y
{% comment %}
## Modify existing tokens
{% endcomment %}
{: #modify-existing-tokens }
## 既存トークンの修正
@z

@x
You can rename, deactivate, or delete a token as needed.
@y
{% comment %}
You can rename, deactivate, or delete a token as needed.
{% endcomment %}
トークンは必要に応じて、名称変更、無効化、削除を行うことができます。
@z

@x
1. Access your tokens under **Account Settings > Security**.
@y
{% comment %}
1. Access your tokens under **Account Settings > Security**.
{% endcomment %}
1. **Account Settings > Security** の下にトークンを表示します。
@z

@x
2. Select a token and click **Delete** or **Edit**, or use the menu on
the far right of a token row to bring up the edit screen. You can also
select multiple tokens to delete them all once.
@y
{% comment %}
2. Select a token and click **Delete** or **Edit**, or use the menu on
the far right of a token row to bring up the edit screen. You can also
select multiple tokens to delete them all once.
{% endcomment %}
2. トークンを選択して **Delete** や **Edit** をクリックします。
   あるいはトークンが表示されている行の一番右にあるメニューを用いて、編集画面を開きます。
   複数のトークンを選択状態にして、一括で削除することもできます。
@z

@x
      ![](images/hub-edit-token.png)
@y
      ![](images/hub-edit-token.png)
@z

@x
## Use an access token
@y
{% comment %}
## Use an access token
{% endcomment %}
{: #use-an-access-token }
## アクセストークンの利用
@z

@x
You can use an access token anywhere that requires your Docker Hub
password.
@y
{% comment %}
You can use an access token anywhere that requires your Docker Hub
password.
{% endcomment %}
Docker Hub のパスワードを必要とする場面では、どこでもアクセストークンを利用することができます。
@z

@x
When logging in from your Docker CLI client (`docker login --username <username>`),
omit the password in the login command. When you're prompted for
a password, enter your token instead.
@y
{% comment %}
When logging in from your Docker CLI client (`docker login --username <username>`),
omit the password in the login command. When you're prompted for
a password, enter your token instead.
{% endcomment %}
Docker CLI クライアントからログインする場合（`docker login --username <ユーザー名>`）、ログインコマンドにおけるパスワード入力は行いません。
パスワードの入力プロンプトには、パスワードでなくトークンを入力します。
@z

@x
If you have 2FA enabled, you must use a personal access token when logging in
from the Docker CLI. If you don't have it enabled, this is an optional (but
more secure) method of authentication.
@y
{% comment %}
If you have 2FA enabled, you must use a personal access token when logging in
from the Docker CLI. If you don't have it enabled, this is an optional (but
more secure) method of authentication.
{% endcomment %}
２要素認証を有効にしている場合、Docker CLI によりログインを行うには、個人用アクセストークンを用いる必要があります。
２要素認証を有効にしていない場合、認証手段としてトークンを利用するかどうかは任意です（ただしトークンを利用することがより安全です）。
@z
