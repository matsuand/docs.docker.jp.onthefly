%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Remove the service from the swarm
keywords: tutorial, cluster management, swarm, service
title: Delete the service running on the swarm
notoc: true
---
@y
---
description: Remove the service from the swarm
keywords: tutorial, cluster management, swarm, service
title: Swarm 上で稼動するサービスの削除
notoc: true
---
@z

@x
The remaining steps in the tutorial don't use the `helloworld` service, so now
you can delete the service from the swarm.
@y
{% comment %}
The remaining steps in the tutorial don't use the `helloworld` service, so now
you can delete the service from the swarm.
{% endcomment %}
このチュートリアルの残りの手順では `helloworld` サービスを使いません。
したがって Swarm からこのサービスを削除します。
@z

@x
1.  If you haven't already, open a terminal and ssh into the machine where you
    run your manager node. For example, the tutorial uses a machine named
    `manager1`.
@y
{% comment %}
1.  If you haven't already, open a terminal and ssh into the machine where you
    run your manager node. For example, the tutorial uses a machine named
    `manager1`.
{% endcomment %}
1.  マシンへの接続ができていなければ、端末画面を開いて SSH により接続します。
    接続先はマネージャーノードを起動したマシンです。
    たとえばこのチュートリアルでは `manager1` というマシンを利用します。
@z

@x
2.  Run `docker service rm helloworld` to remove the `helloworld` service.
@y
{% comment %}
2.  Run `docker service rm helloworld` to remove the `helloworld` service.
{% endcomment %}
2.  `docker service rm helloworld` を実行して `helloworld` サービスを削除します。
@z

@x
    ```bash
    $ docker service rm helloworld
@y
    ```bash
    $ docker service rm helloworld
@z

@x
    helloworld
    ```
@y
    helloworld
    ```
@z

@x
3.  Run `docker service inspect <SERVICE-ID>` to verify that the swarm manager
    removed the service. The CLI returns a message that the service is not
    found:
@y
{% comment %}
3.  Run `docker service inspect <SERVICE-ID>` to verify that the swarm manager
    removed the service. The CLI returns a message that the service is not
    found:
{% endcomment %}
3.  `docker service inspect <サービスID>` を実行し、Swarm マネージャーがこのサービスを削除していることを確認します。
    CLI の実行結果として、サービスが見つからなかったというメッセージが表示されます。
@z

@x
    ```bash
    $ docker service inspect helloworld
    []
    Error: no such service: helloworld
    ```
@y
    ```bash
    $ docker service inspect helloworld
    []
    Error: no such service: helloworld
    ```
@z

@x
4.  Even though the service no longer exists, the task containers take a few
    seconds to clean up. You can use `docker ps` on the nodes to verify when the
    tasks have been removed.
@y
{% comment %}
4.  Even though the service no longer exists, the task containers take a few
    seconds to clean up. You can use `docker ps` on the nodes to verify when the
    tasks have been removed.
{% endcomment %}
4.  そのサービスはもう存在しないわけですが、タスクコンテナーが削除の処理を終えるには数分を要します。
    そのノード上において `docker ps` を実行すれば、タスクが削除されたことが確認できます。
@z

@x
    ```bash
    $ docker ps
@y
    ```bash
    $ docker ps
@z

@x
        CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS               NAMES
        db1651f50347        alpine:latest       "ping docker.com"        44 minutes ago      Up 46 seconds                           helloworld.5.9lkmos2beppihw95vdwxy1j3w
        43bf6e532a92        alpine:latest       "ping docker.com"        44 minutes ago      Up 46 seconds                           helloworld.3.a71i8rp6fua79ad43ycocl4t2
        5a0fb65d8fa7        alpine:latest       "ping docker.com"        44 minutes ago      Up 45 seconds                           helloworld.2.2jpgensh7d935qdc857pxulfr
        afb0ba67076f        alpine:latest       "ping docker.com"        44 minutes ago      Up 46 seconds                           helloworld.4.1c47o7tluz7drve4vkm2m5olx
        688172d3bfaa        alpine:latest       "ping docker.com"        45 minutes ago      Up About a minute                       helloworld.1.74nbhb3fhud8jfrhigd7s29we
@y
        CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS               NAMES
        db1651f50347        alpine:latest       "ping docker.com"        44 minutes ago      Up 46 seconds                           helloworld.5.9lkmos2beppihw95vdwxy1j3w
        43bf6e532a92        alpine:latest       "ping docker.com"        44 minutes ago      Up 46 seconds                           helloworld.3.a71i8rp6fua79ad43ycocl4t2
        5a0fb65d8fa7        alpine:latest       "ping docker.com"        44 minutes ago      Up 45 seconds                           helloworld.2.2jpgensh7d935qdc857pxulfr
        afb0ba67076f        alpine:latest       "ping docker.com"        44 minutes ago      Up 46 seconds                           helloworld.4.1c47o7tluz7drve4vkm2m5olx
        688172d3bfaa        alpine:latest       "ping docker.com"        45 minutes ago      Up About a minute                       helloworld.1.74nbhb3fhud8jfrhigd7s29we
@z

@x
    $ docker ps
       CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               
@y
    $ docker ps
       CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               
@z

@x
    ```
@y
    ```
@z

@x
## What's next?
@y
{% comment %}
## What's next?
{% endcomment %}
{: #whats-next }
## 次にすることは
@z

@x
In the next step of the tutorial, you set up a new service and apply a
[rolling update](rolling-update.md).
@y
{% comment %}
In the next step of the tutorial, you set up a new service and apply a
[rolling update](rolling-update.md).
{% endcomment %}
チュートリアルの次のステップでは、新たなサービスを設定して [ローリングアップデート](rolling-update.md) を適用します。
@z
