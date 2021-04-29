%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Recover your Docker Hub account
keywords: Docker, docker, registry, security, Docker Hub, authentication, two-factor authentication
title: Recover your Docker Hub account
---
@y
---
description: Recover your Docker Hub account
keywords: Docker, docker, registry, security, Docker Hub, authentication, two-factor authentication
title: Docker Hub アカウントの復旧
---
@z

@x
If you have lost your two-factor authentication device and need to access your
Docker Hub account, you can gain access to your account using your two-factor
authentication recovery code.
@y
２要素認証を行ったデバイスを失ってしまい、なお Docker Hub アカウントにアクセスが必要である場合、２要素認証のリカバリーコードを使って、アカウントアクセスを復旧させることができます。
@z

@x
## Prerequisites
@y
{: #prerequisites }
## 前提条件
@z

@x
Two-factor authentication is enabled on your Docker Hub account and you have
your two-factor authentication recovery code.
@y
Docker Hub アカウントに対して２要素認証が有効であり、２要素認証のリカバリーコードが手元にあるものとします。
@z

@x
> If you lose both your 2FA authentication device and recovery code, you may
> not be able to recover your account.
{: .important }
@y
> ２要素認証を行ったデバイスとリカバリーコードをともに失ってしまった場合、アカウントを復旧することはできません。
{: .important }
@z

@x
## Recover your Docker Hub account with a recovery code
@y
{: #recover-your-docker-hub-account-with-a-recovery-code }
## リカバリーコードによる Docker Hub アカウントの復旧
@z

@x
Go through the login process on Docker Hub. When you're asked to enter your
two-factor authentication code, click **I've lost my authentication device**.
@y
Docker Hub においてログイン操作を進めます。
２要素認証コードの入力が求められたら、**I've lost my authentication device**（認証済みデバイスを失いました）をクリックします。
@z

@x
![Lost authentication device](../images/2fa-enter-2fa-code.png){:width="250px"}
@y
![認証デバイスの紛失](../images/2fa-enter-2fa-code.png){:width="250px"}
@z

@x
On the next screen, click "I have my recovery code".
@y
次の画面において「I have my recovery code」（リカバリーコードを利用します）をクリックします。
@z

@x
![You have your code](../images/2fa-have-recovery-code.png){:width="250px"}
@y
![リカバリーコードの利用](../images/2fa-have-recovery-code.png){:width="250px"}
@z

@x
Enter your recovery code.
@y
そこでリカバリーコードを入力します。
@z

@x
![Enter recovery code](../images/2fa-enter-recover-code.png){:width="250px"}
@y
![リカバリーコードの入力](../images/2fa-enter-recover-code.png){:width="250px"}
@z

@x
Once you have used your recovery code, you will have to re-enable two-factor
authentication. See [Enabling two-factor authentication on Docker Hub](/docker-hub/2fa).
@y
リカバリーコードを入力したら、２要素認証を再び有効にすることが必要です。
[Docker Hub における２要素認証の有効化](/docker-hub/2fa) を参照してください。
@z

@x
## Alternative recovery methods
@y
{: #alternative-recovery-methods }
## 別の復旧方法
@z

@x
If you have lost access to both your two-factor authentication application and
your recovery code, get in touch with our Support team using the [Contact Support form](https://hub.docker.com/support/contact/?category=2fa-lockout){:target="_blank" rel="noopener" class="_"}. You must enter the primary email address associated with your Docker ID in the Contact Support form for recovery instructions.
@y
２要素認証アプリケーションとリカバリーコードをともに失ってしまった場合は、[Contact Support 画面](https://hub.docker.com/support/contact/?category=2fa-lockout){:target="_blank" rel="noopener" class="_"} を利用してサポートチームに連絡してください。
Contact Support 画面では復旧手順を確認するために、Docker ID に関連づけたメインのメールアドレスの入力が必要です。
@z
