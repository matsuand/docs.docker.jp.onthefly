%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Sign up for a Docker ID and log in
keywords: accounts, docker ID, billing, paid plans, support, Hub, Store, Forums, knowledge base, beta access
title: Docker ID accounts
redirect_from:
- /docker-cloud/dockerid/
- /docker-hub/accounts/
---
@y
---
description: Docker ID のサインアップとログイン。
keywords: accounts, docker ID, billing, paid plans, support, Hub, Store, Forums, knowledge base, beta access
title: Docker ID アカウント
redirect_from:
- /docker-cloud/dockerid/
- /docker-hub/accounts/
---
@z

@x
Your free Docker ID grants you access to Docker Hub repositories and some beta programs. All you need is an email address.
@y
{% comment %}
Your free Docker ID grants you access to Docker Hub repositories and some beta programs. All you need is an email address.
{% endcomment %}
フリーの Docker ID を取得すると Docker Hub リポジトリへアクセスでき、ベータプログラムのいくつかを利用できます。
Docker ID の取得には電子メールアドレスのみが必要です。
@z

@x
## Register for a Docker ID
@y
{% comment %}
## Register for a Docker ID
{% endcomment %}
## Docker ID の登録
{: #register-for-a-docker-id }
@z

@x
Your Docker ID becomes your user namespace for hosted Docker services, and becomes your username on the Docker Forums. To create a new Docker ID:
@y
{% comment %}
Your Docker ID becomes your user namespace for hosted Docker services, and becomes your username on the Docker Forums. To create a new Docker ID:
{% endcomment %}
Docker ID は、提供されている Docker サービスにおける各ユーザー向けの名前となり、Docker フォーラムでのユーザー名にもなります。
新たな Docker ID は以下のようにして生成します。
@z

@x
1. Go to the [Docker Hub signup page](https://hub.docker.com/signup/).
@y
{% comment %}
1. Go to the [Docker Hub signup page](https://hub.docker.com/signup/).
{% endcomment %}
1. [Docker Hub サインアップページ](https://hub.docker.com/signup/)にアクセスします。
@z

@x
2. Enter a username that is also your Docker ID.
@y
{% comment %}
2. Enter a username that is also your Docker ID.
{% endcomment %}
2. ユーザー名を入力します。これが Docker ID となります。
@z

@x
    Your Docker ID must be between 4 and 30 characters long, and can only contain numbers and lowercase letters.
@y
    {% comment %}
    Your Docker ID must be between 4 and 30 characters long, and can only contain numbers and lowercase letters.
    {% endcomment %}
    Docker ID は 4 文字以上、30 文字までで、数字と英小文字のみを用います。
@z

@x
3. Enter a unique, valid email address.
@y
{% comment %}
3. Enter a unique, valid email address.
{% endcomment %}
3. ユニークで適正なメールアドレスを入力します。
@z

@x
4. Enter a password. Note that the password must be at least 9 characters.
@y
{% comment %}
4. Enter a password. Note that the password must be at least 9 characters.
{% endcomment %}
4. パスワードを入力します。
   なおパスワードは最低 9 文字以上なければなりません。
@z

@x
5. Complete the Captcha verification and then then click **Sign up**.
@y
{% comment %}
5. Complete the Captcha verification and then then click **Sign up**.
{% endcomment %}
5. Captcha 確認を行って **Sign up** をクリックします。
@z

@x
   Docker sends a verification email to the address you provided.
@y
   {% comment %}
   Docker sends a verification email to the address you provided.
   {% endcomment %}
   Docker からの確認メールが、入力されたメールアドレスに送信されます。
@z

@x
6. Verify your email address to complete the registration process.
@y
{% comment %}
6. Verify your email address to complete the registration process.
{% endcomment %}
4. メールアドレスを確認して登録操作を完了します。
@z

@x
> **Note**: You cannot log in with your Docker ID until you verify your email address.
@y
{% comment %}
> **Note**: You cannot log in with your Docker ID until you verify your email address.
{% endcomment %}
> **メモ**: メールアドレスの承認処理を終えてからでないと Docker ID を使ったログインはできません。
@z

@x
## Log in
@y
{% comment %}
## Log in
{% endcomment %}
## ログイン
{: #log-in }
@z

@x
Once you register and verify your Docker ID email address, you can log in
to [Docker Hub](https://hub.docker.com).
@y
{% comment %}
Once you register and verify your Docker ID email address, you can log in
to [Docker Hub](https://hub.docker.com).
{% endcomment %}
Docker ID の登録を行ってメールアドレスの承認を終えたら [Docker Hub](https://hub.docker.com) にログインできるようになります。
@z

@x
You can also log in through the CLI using the `docker login` command. For more information, see [`docker login`](../engine/reference/commandline/login.md).
@y
{% comment %}
You can also log in through the CLI using the `docker login` command. For more information, see [`docker login`](../engine/reference/commandline/login.md).
{% endcomment %}
`docker login` コマンドを使って CLI を通じたログインもできます。
詳しくは [こちら](../engine/reference/commandline/login.md) を参照してください。）
@z

@x
> **Warning**:
> When you use the `docker login` command, your credentials are
stored in your home directory in `.docker/config.json`. The password is base64-encoded in this file.
>
> For extra security, you can use a [personal access token](../docker-hub/access-tokens.md) to log in instead, which is still encoded in this file but doesn't allow admin actions (such as changing the password). If you require secure storage for this password or personal access token, use the [Docker credential helpers](https://github.com/docker/docker-credential-helpers).
{:.warning}
@y
{% comment %}
> **Warning**:
> When you use the `docker login` command, your credentials are
stored in your home directory in `.docker/config.json`. The password is base64-encoded in this file.
>
> For extra security, you can use a [personal access token](../docker-hub/access-tokens.md) to log in instead, which is still encoded in this file but doesn't allow admin actions (such as changing the password). If you require secure storage for this password or personal access token, use the [Docker credential helpers](https://github.com/docker/docker-credential-helpers).
{:.warning}
{% endcomment %}
> **警告**:
> `docker login` コマンドを使ってログインすると、認証情報がホームディレクトリ配下の`.docker/config.json`に保存されます。
そしてパスワードは base64 エンコードにより保存されます。
>
> より強力なセキュリティが必要である場合は [パーソナルアクセストークン](../docker-hub/access-tokens.md)（personal access token）を使ってログインすることもできます。
> この場合もパスワードはエンコードされてファイルに保存されますが、管理操作（たとえばパスワード変更など）を行うことはできません。
> パスワードやパーソナルアクセストークンを安全に保存する必要がある場合は [Docker credential helpers](https://github.com/docker/docker-credential-helpers) を利用してください。
{:.warning}
@z
