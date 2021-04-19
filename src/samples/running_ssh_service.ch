%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Installing and running an SSHd service on Docker
keywords: docker, example, package installation,  networking
title: Dockerize an SSH service
redirect_from:
  - /engine/examples/running_ssh_service/
---
@y
---
description: Docker 上での SSHd サービスのインストールと起動。
keywords: docker, example, package installation,  networking
title: SSH サービスの Docker 化
redirect_from:
  - /engine/examples/running_ssh_service/
---
@z

@x
Running sshd inside a container is discouraged, however, it might be still useful
for certain use cases such as port forwarding.
@y
コンテナー内で sshd を稼動させることは推奨されません。
ただしポートフォワードなど、特定の利用状況においては必要かもしれません。
@z

@x
See [https://github.com/linuxserver/docker-openssh-server](https://github.com/linuxserver/docker-openssh-server)
for an example of Dockerized SSH service.
@y
Docker 化された SSH サービスの例については [https://github.com/linuxserver/docker-openssh-server](https://github.com/linuxserver/docker-openssh-server) を参照してください。
@z
