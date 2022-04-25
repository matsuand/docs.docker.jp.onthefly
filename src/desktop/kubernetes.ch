%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Deploying to Kubernetes on Docker Desktop
keywords: deploy, kubernetes, kubectl, orchestration
title: Deploy on Kubernetes
redirect_from:
- /docker-for-windows/kubernetes/
- /docker-for-mac/kubernetes/
---
@y
---
description: Deploying to Kubernetes on Docker Desktop
keywords: deploy, kubernetes, kubectl, orchestration
title: Kubernetes でのデプロイ
redirect_from:
- /docker-for-windows/kubernetes/
- /docker-for-mac/kubernetes/
---
@z

@x
Docker Desktop includes a standalone Kubernetes server and client,
as well as Docker CLI integration that runs on your machine. The Kubernetes server runs locally within your Docker instance, is not configurable, and is a single-node cluster.
@y
Docker Desktop には手元のマシン上で動作する Docker CLI 統合環境に加えて、Kubernetes のスタンドアロンサーバーとクライアントが含まれます。
Kubernetes サーバーは Docker インスタンス内にローカルに実行されます。
設定変更することはできず、単一ノードクラスターとして動作します。
@z

@x
The Kubernetes server runs within a Docker container on your local system, and
is only for local testing. Enabling Kubernetes allows you to deploy
your workloads in parallel, on Kubernetes, Swarm, and as standalone containers. Enabling or disabling the Kubernetes server does not affect your other
workloads.
@y
Kubernetes サーバーは、ローカルシステム内の Docker コンテナー内部で稼動します。
ローカル環境でのテスト用として利用するものです。
Kubernetes サポートが有効である場合、Kubernetes と Swarm へ同時並行により開発内容をデプロイし、スタンドアロンコンテナーとすることができます。
Kubernetes サーバーの有効、無効は、他の開発内容へは影響しません。
@z

@x
## Enable Kubernetes
@y
{: #enable-kubernetes }
## Kubernetes の有効化
@z

@x
To enable Kubernetes in Docker Desktop, go to **Preferences** > **Kubernetes** and then click **Enable Kubernetes**.
@y
Docker Desktop において Kubernetes を有効にするには、**Preferences** > **Kubernetes** を実行して **Enable Kubernetes**（Kubernetes の有効化）をクリックします。
@z

@x
Click **Apply & Restart** to save the settings and then click **Install** to confirm. This instantiates images required to run the Kubernetes server as containers, and installs the `/usr/local/bin/kubectl` command on your machine.
@y
**Apply & Restart**（適用と再起動）をクリックして設定を保存したら、確認して **Install**（インストール）をクリックします。
これを行うと、Kubernetes サーバーをコンテナーとして起動させるためのイメージが初期化されて、マシン内に`/usr/local/bin/kubectl`コマンドがインストールされます。
@z

@x
![Enable Kubernetes](images/kube-enable.png){:width="750px"}
@y
![Kubernetes の有効化](images/kube-enable.png){:width="750px"}
@z

@x
By default, Kubernetes containers are hidden from commands like `docker ps`, because managing them manually is not supported. To see these internal containers, select **Show system containers (advanced)**. Most users do not need this option.
@y
Kuberntes コンテナーは、デフォルトでは`docker ps`などのコマンドに表示されません。
なぜならこのコンテナーは手動で制御することがサポートされていないからです。
そういった内部コンテナーを参照するには **Show system containers (advanced)**（システムコンテナー参照(高度)）を選んでください。
普通のユーザーにとってこれを実行する必要ありません。
@z

@x
When Kubernetes is enabled and running, an additional status bar item displays
  at the bottom right of the Docker Desktop Settings dialog.
@y
Kubernetes を有効化して起動すると、Docker Desktop の Settings ダイアログ右下に、新たにステータスバーが表示されます。
@z

@x
The status of Kubernetes shows in the Docker menu and the context points to
  `docker-desktop`.
@y
Kubernetes の状態は Docker メニュー内に表示されます。
Kubernetes のコンテキストは`docker-desktop`となります。
@z

@x
![Docker Menu with Kubernetes](images/kube-context.png){: width="400px"}
@y
![Kubernetes が表示された Docker メニュー](images/kube-context.png){: width="400px"}
@z

@x
> Upgrade Kubernetes
>
> Docker Desktop does not upgrade your Kubernetes cluster automatically after a new update. To upgrade your Kubernetes cluster to the latest version, select **Reset Kubernetes Cluster**.
@y
> Kubernetes のアップグレード
>
> Docker Desktop では新たな更新を行っても、Kubernetes クラスターは自動的にはアップグレードしません。
> Kubernetes クラスターを最新版に更新するには **Reset Kubernetes Cluster**（Kubernetes クラスターのリセット）を選んでください。
@z

@x
## Use the kubectl command
@y
{: #use-the-kubectl-command }
## kubectl コマンドの利用
@z

@x
Kubernetes integration provides the Kubernetes CLI command
at `/usr/local/bin/kubectl` on Mac and at `C:\>Program Files\Docker\Docker\Resources\bin\kubectl.exe` on Windows. This location may not be in your shell's `PATH`
variable, so you may need to type the full path of the command or add it to
the `PATH`.
@y
Kubernetes 統合環境では、Mac の場合は`/usr/local/bin/kubectl`、Windows の場合は`C:\>Program Files\Docker\Docker\Resources\bin\kubectl.exe`に Kubernetes CLI コマンドが提供されています。
このパスは、利用しているシェルの`PATH`変数には含まれていないかもしれません。
そこでコマンド実行時にはフルパスを指定するか、`PATH`設定に加えることが必要になります。
@z

@x
If you have already installed `kubectl` and
pointing to some other environment, such as `minikube` or a GKE cluster, ensure you change the context so that `kubectl` is pointing to `docker-desktop`:
@y
If you have already installed `kubectl` and
pointing to some other environment, such as `minikube` or a GKE cluster, ensure you change the context so that `kubectl` is pointing to `docker-desktop`:
@z

@x
```console
$ kubectl config get-contexts
$ kubectl config use-context docker-desktop
```
@y
```console
$ kubectl config get-contexts
$ kubectl config use-context docker-desktop
```
@z

@x
If you installed `kubectl` using Homebrew, or by some other method, and
experience conflicts, remove `/usr/local/bin/kubectl`.
@y
If you installed `kubectl` using Homebrew, or by some other method, and
experience conflicts, remove `/usr/local/bin/kubectl`.
@z

@x
You can test the command by listing the available nodes:
@y
以下のコマンドを実行すれば、利用可能なノード一覧が得られます。
@z

@x
```console
$ kubectl get nodes

NAME                 STATUS    ROLES     AGE       VERSION
docker-desktop       Ready     master    3h        v1.19.7
```
@y
```console
$ kubectl get nodes

NAME                 STATUS    ROLES     AGE       VERSION
docker-desktop       Ready     master    3h        v1.19.7
```
@z

@x
For more information about `kubectl`, see the
[`kubectl` documentation](https://kubernetes.io/docs/reference/kubectl/overview/){:target="_blank" rel="noopener" class="_"}.
@y
`kubectl`に関する詳細は [`kubectl`のドキュメント](https://kubernetes.io/docs/reference/kubectl/overview/){:target="_blank" rel="noopener" class="_"} を参照してください。
@z

@x
## Disable Kubernetes
@y
{: #disable-kubernetes }
## Kubernetes の無効化
@z

@x
To disable Kubernetes support at any time, clear the **Enable Kubernetes** check box. This stops and removes Kubernetes containers, and also removes the `/usr/local/bin/kubectl` command.
@y
Kubernetes サポートの無効化はいつでも可能です。
これはチェックボックス **Enable Kubernetes**（Kubernetes の有効化）をオフにするだけです。
これにより Kubernetes コンテナーが停止し削除されます。
さらに`/usr/local/bin/kubectl`コマンドも削除されます。
@z
