%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
{% assign platform = include.platform %}
@y
{% assign platform = include.platform %}
@z

@x
{% comment %}

Include a chunk of this file, using variables already set in the file
where you want to reuse the chunk.

Usage: {% include kubernetes-mac-win.md platform="mac" %}

{% endcomment %}
@y
{% comment %}

Include a chunk of this file, using variables already set in the file
where you want to reuse the chunk.

Usage: {% include kubernetes-mac-win.md platform="mac" %}

{% endcomment %}
@z

@x
{% if platform == "mac" %}
  {% assign product = "Docker Desktop for Mac" %}
@y
{% if platform == "mac" %}
  {% assign product = "Docker Desktop for Mac" %}
@z

@x
  {% capture min-version %}{{ product }} 18.06.0-ce-mac70 CE{% endcapture %}
@y
  {% capture min-version %}{{ product }} 18.06.0-ce-mac70 CE{% endcapture %}
@z

@x
  {% capture version-caveat %}
  **Kubernetes is only available in {{ min-version }} and higher.**
  {% endcapture %}
@y
  {% capture version-caveat %}
  **Kubernetes is only available in {{ min-version }} and higher.**
  {% endcapture %}
@z

@x
  {% capture local-kubectl-warning %}
> If you independently installed the Kubernetes CLI, `kubectl`, make sure that
> it is pointing to `docker-desktop` and not some other context such as
> `minikube` or a GKE cluster. Run: `kubectl config use-context docker-desktop`.
> If you experience conflicts with an existing `kubectl` installation, remove `/usr/local/bin/kubectl`.
@y
  {% capture local-kubectl-warning %}
> If you independently installed the Kubernetes CLI, `kubectl`, make sure that
> it is pointing to `docker-desktop` and not some other context such as
> `minikube` or a GKE cluster. Run: `kubectl config use-context docker-desktop`.
> If you experience conflicts with an existing `kubectl` installation, remove `/usr/local/bin/kubectl`.
@z

@x
  {% endcapture %}
@y
  {% endcapture %}
@z

@x
  {% assign kubectl-path = "/usr/local/bin/kubectl" %}
@y
  {% assign kubectl-path = "/usr/local/bin/kubectl" %}
@z

@x
{% elsif platform == "windows" %}
  {% assign product = "Docker Desktop for Windows" %}
@y
{% elsif platform == "windows" %}
  {% assign product = "Docker Desktop for Windows" %}
@z

@x
  {% capture min-version %}{{ product }} 18.06.0-ce-win70 CE{% endcapture %}
@y
  {% capture min-version %}{{ product }} 18.06.0-ce-win70 CE{% endcapture %}
@z

@x
  {% capture version-caveat %}
  **Kubernetes is only available in {{ min-version }} and higher.**
  {% endcapture %}
@y
  {% capture version-caveat %}
  **Kubernetes is only available in {{ min-version }} and higher.**
  {% endcapture %}
@z

@x
  {% capture local-kubectl-warning %}
  If you installed `kubectl` by another method, and experience conflicts, remove it.
  {% endcapture %}
@y
  {% capture local-kubectl-warning %}
  If you installed `kubectl` by another method, and experience conflicts, remove it.
  {% endcapture %}
@z

@x
  {% assign kubectl-path = "C:\>Program Files\Docker\Docker\Resources\bin\kubectl.exe" %}
@y
  {% assign kubectl-path = "C:\>Program Files\Docker\Docker\Resources\bin\kubectl.exe" %}
@z

@x
{% endif %}
@y
{% endif %}
@z

@x
Docker Desktop includes a standalone Kubernetes server and client,
as well as Docker CLI integration. The Kubernetes server runs locally within
your Docker instance, is not configurable, and is a single-node cluster.
@y
Docker Desktop には Docker CLI 統合環境に加えて、Kubernetes のスタンドアロンサーバーとクライアントが含まれます。
Kubernetes サーバーは Docker インスタンス内にローカルに実行されます。
設定変更することはできず、単一ノードクラスターとして動作します。
@z

@x
The Kubernetes server runs within a Docker container on your local system, and
is only for local testing. When Kubernetes support is enabled, you can deploy
your workloads, in parallel, on Kubernetes, Swarm, and as standalone containers.
Enabling or disabling the Kubernetes server does not affect your other
workloads.
@y
Kubernetes サーバーは、ローカルシステム内の Docker コンテナー内部で稼動します。
ローカル環境でのテスト用として利用するものです。
Kubernetes サポートが有効である場合、Kubernetes と Swarm へ同時並行により開発内容をデプロイし、スタンドアロンコンテナーとすることができます。
Kubernetes サーバーの有効、無効は、他の開発内容へは影響しません。
@z

@x
See [{{ product }} > Getting started](/docker-for-{{ platform }}/#kubernetes) to
enable Kubernetes and begin testing the deployment of your workloads on
Kubernetes.
@y
Kubernetes 有効化の方法、Kubernetes に開発内容をデプロイしてテストを行う方法については [{{ product }} > はじめよう](/docker-for-{{ platform }}/#kubernetes) を参照してください。
@z

@x
{{ kubectl-warning }}
@y
{{ kubectl-warning }}
@z

@x
## Use the kubectl command
@y
{: #use-the-kubectl-command }
## kubectl コマンドの利用
@z

@x
The {{ platform }} Kubernetes integration provides the Kubernetes CLI command
at `{{ kubectl-path }}`. This location may not be in your shell's `PATH`
variable, so you may need to type the full path of the command or add it to
the `PATH`. For more information about `kubectl`, see the
[official `kubectl` documentation](https://kubernetes.io/docs/reference/kubectl/overview/).
You can test the command by listing the available nodes:
@y
{{ platform }} における Kubernetes 統合環境では、`{{ kubectl-path }}`に Kubernetes CLI コマンドが提供されています。
このパスは、利用しているシェルの`PATH`変数には含まれていないかもしれません。
そこでコマンド実行時にはフルパスを指定するか、`PATH`設定に加えることが必要になります。
`kubectl`に関する詳細は [公式の`kubectl`ドキュメント](https://kubernetes.io/docs/reference/kubectl/overview/) を参照してください。
以下のコマンドを実行すれば、利用可能なノード一覧が得られます。
@z

@x
```bash
kubectl get nodes
@y
```bash
kubectl get nodes
@z

@x
NAME                 STATUS    ROLES     AGE       VERSION
docker-desktop       Ready     master    3h        v1.8.2
```
@y
NAME                 STATUS    ROLES     AGE       VERSION
docker-desktop       Ready     master    3h        v1.8.2
```
@z
