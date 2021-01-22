%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Docker Context
description: Learn about Docker Context
keywords: engine, context, cli, kubernetes
---
@y
---
title: Docker Context
description: Docker コンテキストについて学びます。
keywords: engine, context, cli, kubernetes
---
@z

@x
## Introduction
@y
{: #introduction }
## はじめに
@z

@x
This guide shows how _contexts_ make it easy for a **single Docker CLI** to manage multiple Swarm clusters, multiple Kubernetes clusters, and multiple individual Docker nodes.
@y
本ガイドでは **コンテキスト**（context）というものが、いかに簡単に、**単一の Docker CLI** から複数 Swarm クラスターを、そして複数 Kubernetes クラスター、各 Docker ノードを操作できるかを示します。
@z

@x
A single Docker CLI can have multiple contexts. Each context contains all of the endpoint and security information required to manage a different cluster or node. The `docker context` command makes it easy to configure these contexts and switch between them.
@y
1 つの Docker CLI に対しては、複数のコンテキスト（context）を持たせることができます。
各コンテキストには、さまざまなクラスターやノードの管理に必要となる、エンドポイント情報やセキュリティ情報が含まれています。
`docker context`コマンドを使うと、そういったコンテキストを簡単に設定したり切り替えたりすることができます。
@z

@x
As an example, a single Docker client on your company laptop might be configured with two contexts; **dev-k8s** and **prod-swarm**. **dev-k8s** contains the endpoint data and security credentials to configure and manage a Kubernetes cluster in a development environment. **prod-swarm** contains everything required to manage a Swarm cluster in a production environment. Once these contexts are configured, you can use the top-level `docker context use <context-name>` to easily switch between them.
@y
その例として、会社で利用するノート PC 上において、1 つの Docker クライアントから 2 つのコンテキスト、**dev-k8s** と **prod-swarm** の利用設定が必要であるとします。
**dev-k8s** は、開発環境上の Kubernetes クラスターの設定管理を行うものであり、エンドポイントデータやセキュリティ情報が含まれています。
一方 **prod-swarm** は、本番環境上の Swarm クラスター管理を一手に引き受けているものとします。
コンテキストの設定を一度行ってしまえば、トップレベルのコマンド`docker context use <コンテキスト名>`を実行するだけで、コンテキストを簡単に切り替えられるようになります。
@z

@x
For information on using Docker Context to deploy your apps to the cloud, see [Deploying Docker containers on Azure](../../cloud/aci-integration.md) and [Deploying Docker containers on ECS](../../cloud/ecs-integration.md).
@y
Docker Context を利用し、開発アプリをクラウド上にデプロイする方法については、[Azure 上の Docker コンテナーのデプロイ](../../cloud/aci-integration.md) や [ECS 上への Docker コンテナーのデプロイ](../../cloud/ecs-integration.md) を参照してください。
@z

@x
## Prerequisites
@y
{: #prerequisites }
## 前提条件
@z

@x
To follow the examples in this guide, you'll need:
@y
本ガイドの利用例を進めていくためには、以下が必要になります。
@z

@x
- A Docker client that supports the top-level `context` command
@y
- トップレベルコマンド`context`をサポートしている Docker クライアント。
@z

@x
Run `docker context` to verify that your Docker client supports contexts.
@y
`docker context`を実行して、Docker クライアントがコンテキストをサポートしていることを確認してください。
@z

@x
You will also need one of the following:
@y
また以下のいずれかが必要です。
@z

@x
- Docker Swarm cluster
- Single-engine Docker node
- Kubernetes cluster
@y
- Docker Swarm クラスター
- 単独エンジンによる Docker クラスター
- Kubernetes クラスター
@z

@x
## The anatomy of a context
@y
{: #the-anatomy-of-a-context }
## コンテキストの意味
@z

@x
A context is a combination of several properties. These include:
@y
コンテキストとは、複数プロパティが組み合わせれたものです。
そこには以下の情報が含まれます。
@z

@x
- Name
- Endpoint configuration
- TLS info
- Orchestrator
@y
- 名前
- エンドポイント設定
- TLS 情報
- オーケストレーター
@z

@x
The easiest way to see what a context looks like is to view the **default** context.
@y
コンテキストというものがどのようなものに見えるかは、**default** コンテキストを見てみれば一番よくわかります。
@z

@x
```
$ docker context ls
NAME          DESCRIPTION     DOCKER ENDPOINT                KUBERNETES ENDPOINT      ORCHESTRATOR
default *     Current...      unix:///var/run/docker.sock                             swarm
```
@y
```
$ docker context ls
NAME          DESCRIPTION     DOCKER ENDPOINT                KUBERNETES ENDPOINT      ORCHESTRATOR
default *     Current...      unix:///var/run/docker.sock                             swarm
```
@z

@x
This shows a single context called "default". It's configured to talk to a Swarm cluster through the local `/var/run/docker.sock` Unix socket. It has no Kubernetes endpoint configured.
@y
上の結果より、「default」という単一のコンテキストがあることがわかります。
これは Swarm クラスターとやりとりするものとして設定されていて、ローカルの Unix ソケット`/var/run/docker.sock`を利用して実現するものとなっています。
ここには Kubernetes のエンドポイントは設定されていません。
@z

@x
The asterisk in the `NAME` column indicates that this is the active context. This means all `docker` commands will be executed against the "default" context unless overridden with environment variables such as `DOCKER_HOST` and `DOCKER_CONTEXT`, or on the command-line with the `--context` and `--host` flags.
@y
`NAME`列の横に示されるアスタリスクは、そのコンテキストがアクティブであることを表わします。
これはつまり`docker`コマンドがすべて、この「default」コンテキストに対して実行されることを意味します。
`DOCKER_HOST`や`DOCKER_CONTEXT`といった環境変数を使うか、コマンドラインから`--context`や`--host`フラグを指定することで、その対象をオーバーライドすることができます。
@z

@x
Dig a bit deeper with `docker context inspect`. In this example, we're inspecting the context called `default`.
@y
さらに詳しく見るには`docker context inspect`を実行します。
この例においては、`default`というコンテキストを確認しています。
@z

@x
```
$ docker context inspect default
[
    {
        "Name": "default",
        "Metadata": {
            "StackOrchestrator": "swarm"
        },
        "Endpoints": {
            "docker": {
                "Host": "unix:///var/run/docker.sock",
                "SkipTLSVerify": false
            }
        },
        "TLSMaterial": {},
        "Storage": {
            "MetadataPath": "\u003cIN MEMORY\u003e",
            "TLSPath": "\u003cIN MEMORY\u003e"
        }
    }
]
```
@y
```
$ docker context inspect default
[
    {
        "Name": "default",
        "Metadata": {
            "StackOrchestrator": "swarm"
        },
        "Endpoints": {
            "docker": {
                "Host": "unix:///var/run/docker.sock",
                "SkipTLSVerify": false
            }
        },
        "TLSMaterial": {},
        "Storage": {
            "MetadataPath": "\u003cIN MEMORY\u003e",
            "TLSPath": "\u003cIN MEMORY\u003e"
        }
    }
]
```
@z

@x
This context is using "swarm" as the orchestrator (`metadata.stackOrchestrator`). It is configured to talk to an endpoint exposed on a local Unix socket at `/var/run/docker.sock` (`Endpoints.docker.Host`), and requires TLS verification (`Endpoints.docker.SkipTLSVerify`).
@y
このコンテキストでは、オーケストレーター（`metadata.stackOrchestrator`）として「swarm」を利用しています。
また `/var/run/docker.sock`にあるローカル Unix ソケットを使い、利用可能なエンドポイントとの間でやりとりを行うように設定されています（`Endpoints.docker.Host`）。
そして TLS 検証を必要とする設定もあります（`Endpoints.docker.SkipTLSVerify`）。
@z

@x
### Create a new context
@y
{: #create-a-new-context }
### 新たなコンテキストの生成
@z

@x
You can create new contexts with the `docker context create` command.
@y
新たなコンテキストを生成するには`docker context create`コマンドを実行します。
@z

@x
The following example creates a new context called "docker-test" and specifies the following:
@y
以下の例では「docker-test」というコンテキストを生成するものとし、以下を設定するものとします。
@z

@x
- Default orchestrator = Swarm
- Issue commands to the local Unix socket `/var/run/docker.sock`
@y
- デフォルトのオーケストレーターを Swarm とします。
- ローカル Unix ソケット`/var/run/docker.sock`に対してコマンド実行するものとします。
@z

@x
```
$ docker context create docker-test \
  --default-stack-orchestrator=swarm \
  --docker host=unix:///var/run/docker.sock

Successfully created context "docker-test"
```
@y
```
$ docker context create docker-test \
  --default-stack-orchestrator=swarm \
  --docker host=unix:///var/run/docker.sock

Successfully created context "docker-test"
```
@z

@x
The new context is stored in a `meta.json` file below `~/.docker/contexts/`. Each new context you create gets its own `meta.json` stored in a dedicated sub-directory of `~/.docker/contexts/`.
@y
新たなコンテキストは`~/.docker/contexts/`配下の`meta.json`内に保存されます。
コンテキストを新規に生成すると、`~/.docker/contexts/`に専用のサブディレクトリが生成され、それぞれの`meta.json`が保存されるものです。
@z

@x
> **Note:** The default context behaves differently than manually created contexts. It does not have a `meta.json` configuration file, and it dynamically updates based on the current configuration. For example, if you switch your current Kubernetes config using `kubectl config use-context`, the default Docker context will dynamically update itself to the new Kubernetes endpoint.
@y
> **メモ:** デフォルトのコンテキストは、手動で生成したコンテキストとは、多少違った動きをします。
デフォルトのコンテキストには、設定ファイル`meta.json`が存在しません。
そしてその時点の設定に基づいて、動的に設定が更新されます。
たとえばコマンド`kubectl config use-context`を実行して、現在の Kubernetes 設定を切り替えたとします。
この場合 Docker のデフォルトコンテキストは、新たに Kubernetes エンドポイントに対応して、動的にコンテキスト自体を更新します。
@z

@x
You can view the new context with `docker context ls` and `docker context inspect <context-name>`.
@y
新たに生成したコンテキストは、`docker context ls`や`docker context inspect <コンテキスト名>`により確認することができます。
@z

@x
The following can be used to create a config with Kubernetes as the default orchestrator using the existing kubeconfig stored in `/home/ubuntu/.kube/config`. For this to work, you will need a valid kubeconfig file in `/home/ubuntu/.kube/config`. If your kubeconfig has more than one context, the current context (`kubectl config current-context`) will be used.
@y
以下のコマンドは新たな設定を生成するものであり、`/home/ubuntu/.kube/config`に保存されている既存の kubeconfig を使って、デフォルトのオーケストレーターを Kubernetes とする設定を行うものです。
これを動作させるためには、`/home/ubuntu/.kube/config`に Kubernetes の適切な設定ファイルが存在している必要があります。
kubeconfig に複数のコンテキストが設定されている場合、現在のコンテキスト（`kubectl config current-context`）が用いられます。
@z

@x
```
$ docker context create k8s-test \
  --default-stack-orchestrator=kubernetes \
  --kubernetes config-file=/home/ubuntu/.kube/config \
  --docker host=unix:///var/run/docker.sock

Successfully created context "k8s-test"
```
@y
```
$ docker context create k8s-test \
  --default-stack-orchestrator=kubernetes \
  --kubernetes config-file=/home/ubuntu/.kube/config \
  --docker host=unix:///var/run/docker.sock

Successfully created context "k8s-test"
```
@z

@x
You can view all contexts on the system with `docker context ls`.
@y
システム上にあるコンテキストをすべて確認するには`docker context ls`を実行します。
@z

@x
```
$ docker context ls
NAME           DESCRIPTION   DOCKER ENDPOINT               KUBERNETES ENDPOINT               ORCHESTRATOR
default *      Current       unix:///var/run/docker.sock   https://35.226.99.100 (default)   swarm
k8s-test                     unix:///var/run/docker.sock   https://35.226.99.100 (default)   kubernetes
docker-test                  unix:///var/run/docker.sock                                     swarm
```
@y
```
$ docker context ls
NAME           DESCRIPTION   DOCKER ENDPOINT               KUBERNETES ENDPOINT               ORCHESTRATOR
default *      Current       unix:///var/run/docker.sock   https://35.226.99.100 (default)   swarm
k8s-test                     unix:///var/run/docker.sock   https://35.226.99.100 (default)   kubernetes
docker-test                  unix:///var/run/docker.sock                                     swarm
```
@z

@x
The current context is indicated with an asterisk ("\*").
@y
カレントなコンテキストはアスタリスク（"\*"）により示されます。
@z

@x
## Use a different context
@y
{: #use-a-different-context }
## 別のコンテキストへの切り替え
@z

@x
You can use `docker context use` to quickly switch between contexts.
@y
`docker context use`コマンドを利用すれば、コンテキストの切り替えをすばやく行うことができます。
@z

@x
The following command will switch the `docker` CLI to use the "k8s-test" context.
@y
以下のコマンドは`docker`CLI が「k8s-test」コンテキストを利用するように切り替えるものです。
@z

@x
```
$ docker context use k8s-test

k8s-test
Current context is now "k8s-test"
```
@y
```
$ docker context use k8s-test

k8s-test
Current context is now "k8s-test"
```
@z

@x
Verify the operation by listing all contexts and ensuring the asterisk ("\*") is against the "k8s-test" context.
@y
処理結果を確認するため、コンテキストをすべて一覧表示して、「k8s-test」コンテキストにアスタリスク（"\*"）がついているかどうかを見てみます。
@z

@x
```
$ docker context ls
NAME            DESCRIPTION                               DOCKER ENDPOINT               KUBERNETES ENDPOINT               ORCHESTRATOR
default         Current DOCKER_HOST based configuration   unix:///var/run/docker.sock   https://35.226.99.100 (default)   swarm
docker-test                                               unix:///var/run/docker.sock                                     swarm
k8s-test *                                                unix:///var/run/docker.sock   https://35.226.99.100 (default)   kubernetes
```
@y
```
$ docker context ls
NAME            DESCRIPTION                               DOCKER ENDPOINT               KUBERNETES ENDPOINT               ORCHESTRATOR
default         Current DOCKER_HOST based configuration   unix:///var/run/docker.sock   https://35.226.99.100 (default)   swarm
docker-test                                               unix:///var/run/docker.sock                                     swarm
k8s-test *                                                unix:///var/run/docker.sock   https://35.226.99.100 (default)   kubernetes
```
@z

@x
`docker` commands will now target endpoints defined in the "k8s-test" context.
@y
`docker`コマンドはこれ以降、「k8s-test」コンテキストに定義されたエンドポイントを操作対象とします。
@z

@x
You can also set the current context using the `DOCKER_CONTEXT` environment variable. This overrides the context set with `docker context use`.
@y
コンテキストの設定は、環境変数`DOCKER_CONTEXT`を使って行うこともできます。
これは`docker context use`によって設定されたコンテキストをオーバーライドします。
@z

@x
Use the appropriate command below to set the context to `docker-test` using an environment variable.
@y
以下の中から適切なコマンドを選んで、環境変数を利用した`docker-test`コンテキストの設定を行います。
@z

@x
Windows PowerShell:
@y
Windows PowerShell の場合
@z

@x
```
> $Env:DOCKER_CONTEXT=docker-test
```
@y
```
> $Env:DOCKER_CONTEXT=docker-test
```
@z

@x
Linux:
@y
Linux の場合
@z

@x
```
$ export DOCKER_CONTEXT=docker-test
```
@y
```
$ export DOCKER_CONTEXT=docker-test
```
@z

@x
Run a `docker context ls` to verify that the "docker-test" context is now the active context.
@y
`docker context ls`を実行すると、「docker-test」コンテキストが現在のアクティブコンテキストであることがわかります。
@z

@x
You can also use the global `--context` flag to override the context specified by the `DOCKER_CONTEXT` environment variable. For example, the following will send the command to a context called "production".
@y
またグローバルな`--context`フラグを使うと`DOCKER_CONTEXT`環境変数によるコンテキスト指定ををオーバーライドします。
たとえば以下は、コマンドに対して「production」というコンテキストを指定します。
@z

@x
```
$ docker --context production container ls
```
@y
```
$ docker --context production container ls
```
@z

@x
## Exporting and importing Docker contexts
@y
{: #exporting-and-importing-docker-contexts }
## Docker Context のインポート、エクスポート
@z

@x
The `docker context` command makes it easy to export and import contexts on different machines with the Docker client installed.
@y
`docker context`コマンドでは、Docker クライアントがインストールされている別のマシンにおいて、コンテキストを簡単にインポート、エクスポートすることができます。
@z

@x
You can use the `docker context export` command to export an existing context to a file. This file can later be imported on another machine that has the `docker` client installed.
@y
`docker context export`コマンドを使うと、既存のコンテキストをファイルにエクスポートします。
そのファイルは、`docker`クライアントがインストールされている別のマシンにインポートすることができます。
@z

@x
By default, contexts will be exported as a _native Docker contexts_. You can export and import these using the `docker context` command. If the context you are exporting includes a Kubernetes endpoint, the Kubernetes part of the context will be included in the `export` and `import` operations.
@y
デフォルトでコンテキストは **ネイティブな Docker Context** としてエクスポートされます。
これは`docker context`コマンドを使って、インポートエクスポートができるものです。
エクスポートしたコンテキストに Kubernetes エンドポイントが含まれている場合、その Kubernetes 部分のコンテキストも `export`、`import`操作を通じて含まれることになります。
@z

@x
There is also an option to export just the Kubernetes part of a context. This will produce a native kubeconfig file that can be manually merged with an existing `~/.kube/config` file on another host that has `kubectl` installed. You cannot export just the Kubernetes portion of a context and then import it with `docker context import`. The only way to import the exported Kubernetes config is to manually merge it into an existing kubeconfig file.
@y
エクスポートにあたっては Kubernetes 部分のコンテキストだけをエクスポートすることもできます。
これにより、ネイティブな kubeconfig ファイルが生成され、そのファイル内容は、`kubectl`がインストールされている他のホスト上において`~/.kube/config`ファイルへ手動でマージすることができます。
Kubernetes 部分のコンテキストだけをエクスポートし、これをインポートする場合は、`docker context import`コマンドは使えません。
エクスポートされた Kubernetes 設定をインポートするには、既存の kubeconfig ファイルに対して、手動でマージする以外に方法はありません。
@z

@x
Let's look at exporting and importing a native Docker context.
@y
ネイティブな Docker コンテキストのエクスポートとインポートを以降に示します。
@z

@x
### Exporting and importing a native Docker context
@y
{: #exporting-and-importing-a-native-docker-context }
### ネイティブな Docker コンテキストのエクスポートとインポート
@z

@x
The following example exports an existing context called "docker-test". It will be written to a file called `docker-test.dockercontext`.
@y
以下の例では「docker-test」という既存のコンテキストをエクスポートします。
これはコンテキストを`docker-test.dockercontext`というファイルに出力します。
@z

@x
```
$ docker context export docker-test
Written file "docker-test.dockercontext"
```
@y
```
$ docker context export docker-test
Written file "docker-test.dockercontext"
```
@z

@x
Check the contents of the export file.
@y
エクスポートしたファイルの中身を確認します。
@z

@x
```
$ cat docker-test.dockercontext
meta.json0000644000000000000000000000022300000000000011023 0ustar0000000000000000{"Name":"docker-test","Metadata":{"StackOrchestrator":"swarm"},"Endpoints":{"docker":{"Host":"unix:///var/run/docker.sock","SkipTLSVerify":false}}}tls0000700000000000000000000000000000000000000007716 5ustar0000000000000000
```
@y
```
$ cat docker-test.dockercontext
meta.json0000644000000000000000000000022300000000000011023 0ustar0000000000000000{"Name":"docker-test","Metadata":{"StackOrchestrator":"swarm"},"Endpoints":{"docker":{"Host":"unix:///var/run/docker.sock","SkipTLSVerify":false}}}tls0000700000000000000000000000000000000000000007716 5ustar0000000000000000
```
@z

@x
This file can be imported on another host using `docker context import`. The target host must have the Docker client installed.
@y
このファイルは、別のホスト上において`docker context import`を使ってインポートできます。
対象とするホストには、Docker クライアントがインストールされている必要があります。
@z

@x
```
$ docker context import docker-test docker-test.dockercontext
docker-test
Successfully imported context "docker-test"
```
@y
```
$ docker context import docker-test docker-test.dockercontext
docker-test
Successfully imported context "docker-test"
```
@z

@x
You can verify that the context was imported with `docker context ls`.
@y
コンテキストがインポートできたかどうかは`docker context ls`により確認します。
@z

@x
The format of the import command is `docker context import <context-name> <context-file>`.
@y
インポートするコマンドの記述書式は`docker context import <コンテキスト名> <コンテキストファイル>`です。
@z

@x
Now, let's look at exporting just the Kubernetes parts of a context.
@y
次は、コンテキストの Kubernetes 部分のみをエクスポートする例です。
@z

@x
### Exporting a Kubernetes context
@y
{: #exporting-a-Kubernetes-context }
### Kubernetes コンテキストのエクスポート
@z

@x
You can export a Kubernetes context only if the context you are exporting has a Kubernetes endpoint configured. You cannot import a Kubernetes context using `docker context import`.
@y
Kubernetes コンテキストがエクスポートできるのは、エクスポートするコンテキスト内に Kubernetes エンドポイントが設定されている場合に限ります。
Kubernetes コンテキストのインポートには`docker context import`を使うことはできません。
@z

@x
These steps will use the `--kubeconfig` flag to export **only** the Kubernetes elements of the existing `k8s-test` context to a file called "k8s-test.kubeconfig". The `cat` command will then show that it's exported as a valid kubeconfig file.
@y
この手順では`--kubeconfig`フラグを使って Kubernetes 部分のコンテキスト **のみ** をエクスポートします。
コンテキスト名は既存の`k8s-test`であり、これを「k8s-test.kubeconfig」というファイルに出力します。
`cat`コマンドを実行すれば、適正な kubeconfig ファイルとして出力されていることがわかります。
@z

@x
```
$ docker context export k8s-test --kubeconfig
Written file "k8s-test.kubeconfig"
```
@y
```
$ docker context export k8s-test --kubeconfig
Written file "k8s-test.kubeconfig"
```
@z

@x
Verify that the exported file contains a valid kubectl config.
@y
エクスポートしたファイルが、適正な kubectl 設定であることを確認します。
@z

@x
```
$ cat k8s-test.kubeconfig
apiVersion: v1
clusters:
- cluster:
    certificate-authority-data:
    <Snip>
    server: https://35.226.99.100
  name: cluster
contexts:
- context:
    cluster: cluster
    namespace: default
    user: authInfo
  name: context
current-context: context
kind: Config
preferences: {}
users:
- name: authInfo
  user:
    auth-provider:
      config:
        cmd-args: config config-helper --format=json
        cmd-path: /snap/google-cloud-sdk/77/bin/gcloud
        expiry-key: '{.credential.token_expiry}'
        token-key: '{.credential.access_token}'
      name: gcp
```
@y
```
$ cat k8s-test.kubeconfig
apiVersion: v1
clusters:
- cluster:
    certificate-authority-data:
    <Snip>
    server: https://35.226.99.100
  name: cluster
contexts:
- context:
    cluster: cluster
    namespace: default
    user: authInfo
  name: context
current-context: context
kind: Config
preferences: {}
users:
- name: authInfo
  user:
    auth-provider:
      config:
        cmd-args: config config-helper --format=json
        cmd-path: /snap/google-cloud-sdk/77/bin/gcloud
        expiry-key: '{.credential.token_expiry}'
        token-key: '{.credential.access_token}'
      name: gcp
```
@z

@x
You can merge this with an existing `~/.kube/config` file on another machine.
@y
上の内容を、別のマシン上の`~/.kube/config`ファイルにマージします。
@z

@x
## Updating a context
@y
{: #updating-a-context }
## コンテキストの更新
@z

@x
You can use `docker context update` to update fields in an existing context.
@y
既存のコンテキストにおいて項目を更新するには`docker context update`を実行します。
@z

@x
The following example updates the "Description" field in the existing `k8s-test` context.
@y
以下の例は、既存の`k8s-test`コンテキストにおいて「Description」という項目を更新するものです。
@z

@x
```
$ docker context update k8s-test --description "Test Kubernetes cluster"
k8s-test
Successfully updated context "k8s-test"
```
@y
```
$ docker context update k8s-test --description "Test Kubernetes cluster"
k8s-test
Successfully updated context "k8s-test"
```
@z
