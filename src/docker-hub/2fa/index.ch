%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Enabling two-factor authentication on Docker Hub
keywords: Docker, docker, registry, security, Docker Hub, authentication, two-factor authentication
title: Enable two-factor authentication for Docker Hub
---
@y
---
description: Enabling two-factor authentication on Docker Hub
keywords: Docker, docker, registry, security, Docker Hub, authentication, two-factor authentication
title: Docker Hub における２要素認証の有効化
---
@z

@x
## About two-factor authentication
@y
{% comment %}
## About two-factor authentication
{% endcomment %}
{: #about-two-factor-authentication }
## ２要素認証について
@z

@x
Two-factor authentication adds an extra layer of security to your Docker Hub
account by requiring a unique security code when you log into your account. The
security code will be required in addition to your password.
@y
{% comment %}
Two-factor authentication adds an extra layer of security to your Docker Hub
account by requiring a unique security code when you log into your account. The
security code will be required in addition to your password.
{% endcomment %}
２要素認証は Docker Hub アカウントに対してセキュリティレベルを一段と高めるものです。
アカウントにログインする際には、ユニークなセキュリティコードの入力を行います。
セキュリティコードは、パスワードに加えて必要になるものです。
@z

@x
When you enable two-factor authentication, you will also be provided a recovery
code. Each recovery code is unique and specific to your account. You can use
this code to recover your account in case you lose access to your authenticator
app. See [Recover your Docker Hub account](recover-hub-account/).
@y
{% comment %}
When you enable two-factor authentication, you will also be provided a recovery
code. Each recovery code is unique and specific to your account. You can use
this code to recover your account in case you lose access to your authenticator
app. See [Recover your Docker Hub account](recover-hub-account/).
{% endcomment %}
２要素認証を有効にすると、リカバリーコードというものも同時に提供されます。
リカバリーコードもユニークなものであり、アカウントに固有のものです。
このコードは、認証アプリへアクセスできなくなった際に、アカウントを復旧させるために利用します。
[Docker Hub アカウントの復旧](recover-hub-account/) を参照してください。
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
You need a mobile phone with a time-based one-time password authenticator
application installed. Common examples include Google Authenticator or Yubico
Authenticator with a registered YubiKey.
@y
{% comment %}
You need a mobile phone with a time-based one-time password authenticator
application installed. Common examples include Google Authenticator or Yubico
Authenticator with a registered YubiKey.
{% endcomment %}
携帯端末が必要になります。
そこに時間制限つきのワンタイムパスワード認証アプリがインストールされていることが必要です。
一般的な例として Google Authenticator や、登録済み YubiKey を利用する Yubico Authenticator があります。
@z

@x
> **Note:**
> Two-factor authentication is currently in beta. Feel free to provide feedback
> at the [Docker Hub feedback repo](https://github.com/docker/hub-feedback/issues).
{: .important}
@y
{% comment %}
> **Note:**
> Two-factor authentication is currently in beta. Feel free to provide feedback
> at the [Docker Hub feedback repo](https://github.com/docker/hub-feedback/issues).
{: .important}
{% endcomment %}
> **Note:**
> ２要素認証は、今のところベータ版です。
> フィードバックは [Docker Hub フィードバックリポジトリ](https://github.com/docker/hub-feedback/issues) までお気軽にお寄せください。
{: .important}
@z

@x
## Enable two-factor authentication
@y
{% comment %}
## Enable two-factor authentication
{% endcomment %}
{: #enable-two-factor-authentication }
## ２要素認証の有効化
@z

@x
To enable two-factor authentication, log in to your Docker Hub account. Click
on your username and select **Account Settings**. Go to Security and click
**Enable Two-Factor Authentication**.
@y
{% comment %}
To enable two-factor authentication, log in to your Docker Hub account. Click
on your username and select **Account Settings**. Go to Security and click
**Enable Two-Factor Authentication**.
{% endcomment %}
２要素認証を有効化するには、まず Docker Hub アカウントにログインします。
ユーザー名をクリックして **Account Settings** を実行します。
Security にアクセスして **Enable Two-Factor Authentication**（２要素認証を有効化） をクリックします。
@z

@x
![Two-factor home](../images/2fa-security-home.png)
@y
{% comment %}
![Two-factor home](../images/2fa-security-home.png)
{% endcomment %}
![２要素認証画面](../images/2fa-security-home.png)
@z

@x
The next page will remind you to download an authenticator app. Click **Set up**
**using an app**. You will receive your unique recovery code.
@y
{% comment %}
The next page will remind you to download an authenticator app. Click **Set up**
**using an app**. You will receive your unique recovery code.
{% endcomment %}
次のページでは認証アプリをダウンロードするように求められるので **Set up using an app**（アプリを利用して設定）をクリックします。
ここでリカバリーコードが示されます。
@z

@x
> **Save your recovery code and store it somewhere safe.**
>
> Your recovery code can be used to recover your account in the event you lose
> access to your authenticator app.
{: .important }
@y
{% comment %}
> **Save your recovery code and store it somewhere safe.**
>
> Your recovery code can be used to recover your account in the event you lose
> access to your authenticator app.
{% endcomment %}
> **リカバリーコードを書きとめて、どこか安全なところに保存してください**
>
> リカバリーコードは、認証アプリにアクセスできなくなった場合に、アカウントを復旧させるために利用するものです。
{: .important }
@z

@x
![Recovery code example](../images/2fa-recovery-code.png)
@y
{% comment %}
![Recovery code example](../images/2fa-recovery-code.png)
{% endcomment %}
![リカバリーコードの例](../images/2fa-recovery-code.png)
@z

@x
After you have saved your code, click **Next**.
@y
{% comment %}
After you have saved your code, click **Next**.
{% endcomment %}
リカバリーコードを保存したら **Next** をクリックします。
@z

@x
Open your authenticator app. You can choose between scanning the QR code or
entering a text code into your authenticator app. Once you have linked your
authenticator app, it will give you a six-digit code to enter in text field.
Click **Next**.
@y
{% comment %}
Open your authenticator app. You can choose between scanning the QR code or
entering a text code into your authenticator app. Once you have linked your
authenticator app, it will give you a six-digit code to enter in text field.
Click **Next**.
{% endcomment %}
認証アプリを開きます。
認証アプリの開き方としては、QR コードをスキャンするか、テキストコードを入力するか、いずれかを選びます。
認証アプリにリンクできていれば、テキスト欄に入力する 6 桁のコードが示されます。
**Next** をクリックします。
@z

@x
![Enter special code](../images/2fa-enter-code.png)
@y
{% comment %}
![Enter special code](../images/2fa-enter-code.png)
{% endcomment %}
![特別なコードを入力](../images/2fa-enter-code.png)
@z

@x
You have successfully enabled two-factor authentication. The next time you log
in to your Docker Hub account, you will be asked for a security code.
@y
{% comment %}
You have successfully enabled two-factor authentication. The next time you log
in to your Docker Hub account, you will be asked for a security code.
{% endcomment %}
これにより２要素認証が有効化されました。
Docker Hub アカウントの次回からのログインでは、セキュリティコードの入力が求められます。
@z

@x
> **Note:**
> Now that you have two-factor authentication enabled on your account, you must
> create at least one personal access token. Otherwise, you will be unable to
> log in to your account from the Docker CLI. See [Managing access tokens](../access-tokens)
> for more information.
{: .important }
@y
{% comment %}
> **Note:**
> Now that you have two-factor authentication enabled on your account, you must
> create at least one personal access token. Otherwise, you will be unable to
> log in to your account from the Docker CLI. See [Managing access tokens](../access-tokens)
> for more information.
{: .important }
{% endcomment %}
> **メモ**
> アカウントに対して２要素認証を有効化したので、個人用のアクセストークンを少なくとも 1 つ生成する必要があります。
> これを行っていないと、Docker CLI を使ってアカウントへのログインを行うことができません。
> 詳しくは [アクセストークンの管理](../access-tokens) を参照してください。
{: .important }
@z
