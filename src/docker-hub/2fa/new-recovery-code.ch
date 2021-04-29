%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Generate a new 2fa recovery code
keywords: Docker, docker, registry, security, Docker Hub, authentication, two-factor authentication
title: Generate a new recovery code
---
@y
---
description: Generate a new 2fa recovery code
keywords: Docker, docker, registry, security, Docker Hub, authentication, two-factor authentication
title: 新たなリカバリーコードの生成
---
@z

@x
If you have lost your two-factor authentication recovery code and still have
access to your Docker Hub account, you can generate a new recovery code.
@y
２要素認証のリカバリーコードが不明ながら、Docker Hub アカウントにアクセスはできている場合、新たなリカバリーコードを生成することができます。
@z

@x
## Prerequisites
@y
{: #prerequisites }
## 前提条件
@z

@x
Two-factor authentication is enabled on your Docker Hub account.
@y
Docker Hub アカウントにおいて２要素認証が有効であるとします。
@z

@x
## Generate a new recovery code
@y
{: #generate-a-new-recovery-code }
## 新たなリカバリーコードの生成
@z

@x
To disable two-factor authentication, log in to your Docker Hub account. Click
on your username and select **Account Settings**.  Go to **Security** and click
on **Click here to generate a new code**.
@y
まずは２要素認証を無効にするために、Docker Hub アカウントにログインします。
ユーザー名をクリックして **Account Settings** を実行します。
**Security** にアクセスして **Click here to generate a new code**（ここをクリックして新たなコードを生成）をクリックします。
@z

@x
![New recovery code link](../images/2fa-disable-2fa.png)
@y
![新たなリカバリーコードへのリンク](../../images/2fa-disable-2fa.png)
@z

@x
Enter your password.
@y
パスワードを入力します。
@z

@x
![Enter your password](../images/2fa-pw-new-code.png){:width="250px"}
@y
![パスワードの入力](../../images/2fa-pw-new-code.png){:width="250px"}
@z

@x
Your new recovery code will be displayed. Remember to save your recovery code
and store it somewhere safe.
@y
新たなリカバリーコードが表示されます。
このリカバリーコードを書きとめておき、どこか安全な場所に保存してください。
@z
