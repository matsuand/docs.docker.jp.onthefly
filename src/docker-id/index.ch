%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Sign up for a Docker ID and log in
keywords: accounts, docker ID, billing, paid plans, support, Hub, Store, Forums, knowledge base, beta access, email, activation, verification
title: Docker ID accounts
redirect_from:
- /docker-cloud/dockerid/
- /docker-hub/accounts/
---
@y
---
description: Docker ID のサインアップとログイン。
keywords: accounts, docker ID, billing, paid plans, support, Hub, Store, Forums, knowledge base, beta access, email, activation, verification
title: Docker ID アカウント
redirect_from:
- /docker-cloud/dockerid/
- /docker-hub/accounts/
---
@z

@x
Your free Docker ID grants you access to Docker Hub repositories and some beta programs. All you need is an email address.
@y
フリーの Docker ID を取得すると Docker Hub リポジトリへアクセスでき、ベータプログラムのいくつかを利用できます。
Docker ID の取得には電子メールアドレスのみが必要です。
@z

@x
## Register for a Docker ID
@y
## Docker ID の登録
{: #register-for-a-docker-id }
@z

@x
Your Docker ID becomes your user namespace for hosted Docker services, and becomes your username on the [Docker forums](https://forums.docker.com/). To create a new Docker ID:
@y
Docker ID は、提供されている Docker サービスにおける各ユーザー向けの名前となり、[Docker フォーラム](https://forums.docker.com/) でのユーザー名にもなります。
新たな Docker ID は以下のようにして生成します。
@z

@x
1. Go to the [Docker Hub signup page](https://hub.docker.com/signup/).
@y
1. [Docker Hub サインアップページ](https://hub.docker.com/signup/)にアクセスします。
@z

@x
2. Enter a username that will become your Docker ID.
@y
2. ユーザー名を入力します。これが Docker ID となります。
@z

@x
    Your Docker ID must be between 4 and 30 characters long, and can only contain numbers and lowercase letters.
@y
    Docker ID は 4 文字以上、30 文字までで、数字と英小文字のみを用います。
@z

@x
3. Enter a unique, valid email address.
@y
3. ユニークで適正なメールアドレスを入力します。
@z

@x
4. Enter a password. Note that the password must be at least 9 characters.
@y
4. パスワードを入力します。
   なおパスワードは最低 9 文字以上なければなりません。
@z

@x
5. Complete the Captcha verification and then then click **Sign up**.
@y
5. Captcha 確認を行って **Sign up** をクリックします。
@z

@x
   Docker sends a verification email to the address you provided.
@y
   Docker からの確認メールが、入力されたメールアドレスに送信されます。
@z

@x
6. Verify your email address to complete the registration process.
@y
6. メールアドレスを確認して登録操作を完了します。
@z

@x
> **Note**
>
> You have limited actions available until you verify your email address.
@y
> **メモ**
>
> メールアドレスの承認処理を終えてからでないと、利用可能な処理が制限されます。
@z

@x
## Log in
@y
## ログイン
{: #log-in }
@z

@x
Once you register and verify your Docker ID email address, you can log in to [Docker Hub](https://hub.docker.com).
@y
Docker ID の登録を行ってメールアドレスの承認を終えたら [Docker Hub](https://hub.docker.com) にログインできるようになります。
@z

@x
You can also log in through the CLI using the `docker login` command. For more information, see [`docker login`](../engine/reference/commandline/login.md).
@y
`docker login`コマンドを使って CLI を通じたログインもできます。
詳しくは [こちら](../engine/reference/commandline/login.md) を参照してください。）
@z

@x
> **Warning**:
> When you use the `docker login` command, your credentials are
stored in your home directory in `.docker/config.json`. The password is base64-encoded in this file.
>
> We recommend using one of the [Docker credential helpers](https://github.com/docker/docker-credential-helpers) for secure storage of passwords. For extra security, you can also use a [personal access token](../docker-hub/access-tokens.md) to log in instead, which is still encoded in this file (without a Docker credential helper) but doesn't allow admin actions (such as changing the password).
{:.warning}
@y
> **警告**
>
> `docker login`コマンドを使ってログインすると、認証情報がホームディレクトリ配下の`.docker/config.json`に保存されます。
そしてパスワードは base64 エンコードにより保存されます。
>
> パスワードのセキュアな保存には [Docker credential helpers](https://github.com/docker/docker-credential-helpers) の利用をお勧めします。
> より強力なセキュリティが必要である場合は [パーソナルアクセストークン](../docker-hub/access-tokens.md)（personal access token）を使ってログインすることもできます。
> この場合もパスワードは (Docker credential helper なしでも) エンコードされてファイルに保存されますが、管理操作（たとえばパスワード変更など）を行うことはできません。
{:.warning}
@z

@x
## Troubleshooting
@y
{: #troubleshooting }
## トラブルシューティング
@z

@x
If you run into trouble with your Docker ID account, know that we are here to help!
@y
Docker ID アカウントについて問題が発生した場合、以下に示すヘルプがあります。
@z

@x
The most frequently asked questions regarding Docker ID accounts can be found on our [support troubleshooting FAQ](https://hub.docker.com/support/).
@y
Docker ID アカウントに関して、よくたずねられる質問が、[サポート、トラブルシューティング、FAQ](https://hub.docker.com/support/) にあります。
@z

@x
You can use the [Docker forums](https://forums.docker.com/) to ask questions amongst other Docker community members, while our [hub-feedback GitHub repository](https://github.com/docker/hub-feedback) allows you to provide feedback on how we can better improve the experience with Docker Hub.
@y
Docker コミュニティの他メンバーに対して、[Docker フォーラム](https://forums.docker.com/) を通じて質問することができます。
また [Git リポジトリの hub フィードバック](https://github.com/docker/hub-feedback) では、Docker Hub を利用した改善策についてフィードバック提供を行っています。
@z

@x
If you still need any help, [create a support ticket](https://hub.docker.com/support/contact/) and let us know how we can help you.
@y
さらにヘルプが必要な場合は、[サポートチケットの生成](https://hub.docker.com/support/contact/) を行って、ヘルプして欲しい内容をお知らせください。
@z
