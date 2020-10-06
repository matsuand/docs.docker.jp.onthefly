%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Disable two-factor authentication on Docker Hub
keywords: Docker, docker, registry, security, Docker Hub, authentication, two-factor authentication
title: Disable two-factor authentication on Docker Hub
---
@y
---
description: Disable two-factor authentication on Docker Hub
keywords: Docker, docker, registry, security, Docker Hub, authentication, two-factor authentication
title: Docker Hub における２要素認証の無効化
---
@z

@x
> **Note:**
> Disabling two-factor authentication will result in decreased security for your
> Docker Hub account.
{: .warning }
@y
{% comment %}
> **Note:**
> Disabling two-factor authentication will result in decreased security for your
> Docker Hub account.
{: .warning }
{% endcomment %}
> **メモ**
> ２要素認証を無効化すると、Docker Hub アカウントのセキュリティを低下させることになります。
{: .warning }
@z

@x
## Prerequisites
@y
{% comment %}
## Prerequisites
{% endcomment %}
{: #prerequisites }
## 前提条件
@z

@x
Two-factor authentication is enabled on your Docker Hub account.
@y
{% comment %}
Two-factor authentication is enabled on your Docker Hub account.
{% endcomment %}
Docker Hub アカウントに対して、２要素認証が有効であることが必要です。
@z

@x
## Disable two-factor authentication
@y
{% comment %}
## Disable two-factor authentication
{% endcomment %}
{: #disable-two-factor-authentication }
## ２要素認証の無効化
@z

@x
To disable two-factor authentication, log in to your Docker Hub account. Click
on your username and select **Account Settings**. Go to Security and click on
**Disable 2FA**.
@y
{% comment %}
To disable two-factor authentication, log in to your Docker Hub account. Click
on your username and select **Account Settings**. Go to Security and click on
**Disable 2FA**.
{% endcomment %}
２要素認証を無効化するには、まず Docker Hub アカウントにログインします。
ユーザー名をクリックして **Account Settings** を実行します。
Security にアクセスして **Disable 2FA**（２要素認証の無効化）をクリックします。
@z

@x
![Disable 2fa button](../images/2fa-disable-2fa.png)
@y
{% comment %}
![Disable 2fa button](../images/2fa-disable-2fa.png)
{% endcomment %}
![２要素認証の無効化ボタン](../images/2fa-disable-2fa.png)
@z

@x
You will be prompted to input your Docker ID password. Enter your password and
click **Disable 2FA**.
@y
{% comment %}
You will be prompted to input your Docker ID password. Enter your password and
click **Disable 2FA**.
{% endcomment %}
Docker ID パスワードの入力を求められるので、パスワードを入力して **Disable 2FA**（２要素認証の無効化）をクリックします。
@z

@x
![Enter your password](../images/2fa-enter-pw-disable-2fa.png){:width="250px"}
@y
{% comment %}
![Enter your password](../images/2fa-enter-pw-disable-2fa.png){:width="250px"}
{% endcomment %}
![パスワード入力](../images/2fa-enter-pw-disable-2fa.png){:width="250px"}
@z

@x
You have successfully disabled two-factor authentication.
@y
{% comment %}
You have successfully disabled two-factor authentication.
{% endcomment %}
これにより２要素認証が無効化されます。
@z
