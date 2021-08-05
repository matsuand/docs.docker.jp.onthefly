%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
<!-- This text will be included as part of the Deploy your app section in the Language-specific guides -->
@y
<!-- This text will be included as part of the Deploy your app section in the Language-specific guides -->
@z

@x
Now, that we have configured a CI/CD pipleline, let's look at how we can deploy the application. Docker supports deploying containers on Azure ACI and AWS ECS. You can also deploy your application to Kubernetes if you have enabled Kubernetes in Docker Desktop.
@y
これまでに CI/CD パイプラインを設定してきたので、アプリケーションをデプロイする方法を見ていきます。
Docker では Azure ACI と AWS ECS へのコンテナーのデプロイをサポートしています。
Docker Desktop において Kubernetes を有効にしていれば、アプリケーションを Kubernetes にデプロイすることもできます。
@z

@x
## Docker and Azure ACI
@y
{: #docker-and-azure-aci }
## Docker と Azure ACI
@z

@x
The Docker Azure Integration enables developers to use native Docker commands to run applications in Azure Container Instances (ACI) when building cloud-native applications. The new experience provides a tight integration between Docker Desktop and Microsoft Azure allowing developers to quickly run applications using the Docker CLI or VS Code extension, to switch seamlessly from local development to cloud deployment.
@y
Docker Azure 統合環境は、クラウドネイティブなアプリケーションの構築のために、開発者がネイティブな Docker コマンドを使って Azure コンテナーインスタンス（Azure Container Instances; ACI）内でのアプリケーション実行を可能にするものです。
この新たな仕組みを通じて Docker Desktop と Microsoft Azure が緊密に連携し、Docker CLI や VS コード拡張を用いて、開発者がすばやくアプリケーションを実行することができます。
またローカル環境からクラウドデプロイに向けてのシームレスな切り替えも実現します。
@z

@x
For detailed instructions, see [Deploying Docker containers on Azure](/cloud/aci-integration/).
@y
詳しい手順については [Azure での Docker コンテナーのデプロイ]({{ site.baseurl }}/cloud/aci-integration/) を参照してください。
@z

@x
## Docker and AWS ECS
@y
{: #docker-and-aws-ecs }
## Docker と AWS ECS
@z

@x
The Docker ECS Integration enables developers to use native Docker commands in Docker Compose CLI to run applications in Amazon EC2 Container Service (ECS) when building cloud-native applications.
@y
Docker ECS 統合環境は、クラウドネイティブなアプリケーション構築のために、開発者がネイティブな Docker コマンドを使って Amazon EC2 コンテナーサービス（Amazon EC2 Container Service; ECS）内でのアプリケーション実行を可能にするものです。
@z

@x
The integration between Docker and Amazon ECS allows developers to use the Docker Compose CLI to set up an AWS context in one Docker command, allowing you to switch from a local context to a cloud context and run applications quickly and easily simplify multi-container application development on Amazon ECS using Compose files.
@y
Docker と Amazon ECS の統合により、開発者は Docker Compose CLI を使って、ただ 1 つの Docker コマンドから AWS コンテキストが生成できます。
またローカルコンテキストからクラウドコンテキストへの切り替えを通じて、アプリケーションをすばやく実行できます。
また Compose ファイル利用によって、Amazon ECS 上でのマルチコンテナー化したアプリケーション開発を容易にします。
@z

@x
For detailed instructions, see [Deploying Docker containers on ECS](/cloud/ecs-integration/).
@y
詳しい手順については [ECS での Docker コンテナーのデプロイ]({{ site.baseurl }}/cloud/ecs-integration/) を参照してください。
@z

@x
## Kubernetes
@y
## Kubernetes
@z

@x
Docker Desktop includes a standalone Kubernetes server and client, as well as Docker CLI integration that runs on your machine. When you enable Kubernetes, you can test your workloads on Kubernetes.
@y
Docker Desktop にはスタンドアロンの Kubernetes サーバーおよびクライアントが含まれています。
これは Docker CLI 統合としてマシン起動を行います。
Kubernetes を有効にすれば Kubernetes 上において処理テストを行うことができます。
@z

@x
To enable Kubernetes:
@y
Kubernetes の有効化は以下のようにします。
@z

@x
1. From the Docker menu, select **Preferences** (**Settings** on Windows).
2. Select **Kubernetes** and click **Enable Kubernetes**.
@y
1. Docker メニューから **Preferences** (Windows の場合は **Settings**) を選択します。
2. **Kubernetes** 選んで **Enable Kubernetes** をクリックします。
@z

@x
    This starts a Kubernetes single-node cluster when Docker Desktop starts.
@y
    これを行うと、Docker Desktop の起動時に Kuberntes の単一ノードクラスターが起動します。
@z

@x
For detailed information, see [Deploy on Kubernetes](/desktop/kubernetes/) and [Describing apps using Kubernetes YAML](/get-started/kube-deploy/#describing-apps-using-kubernetes-yaml).
@y
詳しくは [Kubernetes でのデプロイ]({{ site.baseurl }}/desktop/kubernetes/) や [Kubernetes YAML を用いたアプリ記述](/get-started/kube-deploy/#describing-apps-using-kubernetes-yaml) を参照してください。
@z
