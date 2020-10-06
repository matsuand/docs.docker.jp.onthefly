%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Explains what the Registry is, basic use cases and requirements
keywords: registry, on-prem, images, tags, repository, distribution, use cases, requirements
title: About Registry
---
@y
---
description: Explains what the Registry is, basic use cases and requirements
keywords: registry, on-prem, images, tags, repository, distribution, use cases, requirements
title: Registry について
---
@z

@x
{% include registry.md %}
@y
{% include registry.md %}
@z

@x
A registry is a storage and content delivery system, holding named Docker
images, available in different tagged versions.
@y
{% comment %}
A registry is a storage and content delivery system, holding named Docker
images, available in different tagged versions.
{% endcomment %}
Registry とは、名前つき Docker イメージを保持し、さまざまなタグバージョンを入手可能とする、保存および配信システムです。
@z

@x
  > Example: the image `distribution/registry`, with tags `2.0` and `2.1`.
@y
  {% comment %}
  > Example: the image `distribution/registry`, with tags `2.0` and `2.1`.
  {% endcomment %}
  > 例: `distribution/registry` というイメージに対して、`2.0` や `2.1` といったタグづけを行います。
@z

@x
Users interact with a registry by using docker push and pull commands.
@y
{% comment %}
Users interact with a registry by using docker push and pull commands.
{% endcomment %}
Registry のユーザーは Docker のプッシュやプルを行うコマンドを使って、対話的に操作を行います。
@z

@x
  > Example: `docker pull registry-1.docker.io/distribution/registry:2.1`.
@y
  {% comment %}
  > Example: `docker pull registry-1.docker.io/distribution/registry:2.1`.
  {% endcomment %}
  > 例: `docker pull registry-1.docker.io/distribution/registry:2.1`
@z

@x
Storage itself is delegated to drivers. The default storage driver is the local
posix filesystem, which is suitable for development or small deployments.
Additional cloud-based storage drivers like S3, Microsoft Azure, OpenStack Swift,
and Aliyun OSS are also supported. People looking into using other storage
backends may do so by writing their own driver implementing the
[Storage API](storage-drivers/index.md).
@y
{% comment %}
Storage itself is delegated to drivers. The default storage driver is the local
posix filesystem, which is suitable for development or small deployments.
Additional cloud-based storage drivers like S3, Microsoft Azure, OpenStack Swift,
and Aliyun OSS are also supported. People looking into using other storage
backends may do so by writing their own driver implementing the
[Storage API](storage-drivers/index.md).
{% endcomment %}
ストレージ機能そのものの実現はドライバーに委ねられています。
デフォルトのストレージドライバーは、ローカルの Posix ファイルシステムです。
これは開発環境、あるいはごく小さなデプロイ環境に適しています。
ストレージドライバーを追加する機能がサポートされているので、S3、Microsoft Azure、OpenStack Swift、Aliyun OSS といったものが利用されます。
これ以外のストレージバックエンドを求めて、独自に [ストレージ API](storage-drivers/index.md) を使ってドライバーを構築する方もいます。
@z

@x
Since securing access to your hosted images is paramount, the Registry natively
supports TLS and basic authentication.
@y
{% comment %}
Since securing access to your hosted images is paramount, the Registry natively
supports TLS and basic authentication.
{% endcomment %}
配信するイメージへのアクセスは、セキュアであることが重要です。
このため Registry では、TLS と基本的な認証機能がネイティブにサポートされています。
@z

@x
The Registry GitHub repository includes additional information about advanced
authentication and authorization methods. Only very large or public deployments
are expected to extend the Registry in this way.
@y
{% comment %}
The Registry GitHub repository includes additional information about advanced
authentication and authorization methods. Only very large or public deployments
are expected to extend the Registry in this way.
{% endcomment %}
Registry GitHub リポジトリには、さらに高度な認証機能や承認手法が含まれています。
Registry が大規模であったり公開デプロイされるものの場合には、こういった機能を通じて拡張することが求められます。
@z

@x
Finally, the Registry ships with a robust [notification system](notifications.md),
calling webhooks in response to activity, and both extensive logging and reporting,
mostly useful for large installations that want to collect metrics.
@y
{% comment %}
Finally, the Registry ships with a robust [notification system](notifications.md),
calling webhooks in response to activity, and both extensive logging and reporting,
mostly useful for large installations that want to collect metrics.
{% endcomment %}
また Registry には [通知システム](notifications.md)、処理に応じたウェブフック呼び出し、拡張可能なログ機能やレポート機能があります。
メトリックス収集を行う大規模システムに適応することができます。
@z

@x
## Understanding image naming
@y
{% comment %}
## Understanding image naming
{% endcomment %}
{: #understanding-image-naming }
## イメージ名の理解
@z

@x
Image names as used in typical docker commands reflect their origin:
@y
{% comment %}
Image names as used in typical docker commands reflect their origin:
{% endcomment %}
一般的な Docker コマンドにおいて用いられるイメージ名は、生成元にちなんでいます。
@z

@x
 * `docker pull ubuntu` instructs docker to pull an image named `ubuntu` from the official Docker Hub. This is simply a shortcut for the longer `docker pull docker.io/library/ubuntu` command
 * `docker pull myregistrydomain:port/foo/bar` instructs docker to contact the registry located at `myregistrydomain:port` to find the image `foo/bar`
@y
 {% comment %}
 * `docker pull ubuntu` instructs docker to pull an image named `ubuntu` from the official Docker Hub. This is simply a shortcut for the longer `docker pull docker.io/library/ubuntu` command
 * `docker pull myregistrydomain:port/foo/bar` instructs docker to contact the registry located at `myregistrydomain:port` to find the image `foo/bar`
 {% endcomment %}
 * コマンド `docker pull ubuntu` は、公式の Docker Hub から `ubuntu` という名のイメージをプルするものです。
   これは、より長いコマンド `docker pull docker.io/library/ubuntu` のショートカットです。
 * コマンド `docker pull myregistrydomain:port/foo/bar` は、`myregistrydomain:port` にあるレジストリにアクセスして、イメージ `foo/bar` をプルします。
@z

@x
You can find out more about the various Docker commands dealing with images in
the [official Docker engine documentation](../engine/reference/commandline/cli.md).
@y
{% comment %}
You can find out more about the various Docker commands dealing with images in
the [official Docker engine documentation](../engine/reference/commandline/cli.md).
{% endcomment %}
Docker コマンドの中でイメージを取り扱うコマンドは、これ以上にさまざまなものがあります。
詳しくは [Docker Engine ドキュメント](../engine/reference/commandline/cli.md) を参照してください。
@z

@x
## Use cases
@y
{% comment %}
## Use cases
{% endcomment %}
{: #use-cases }
## 利用例
@z

@x
Running your own Registry is a great solution to integrate with and complement
your CI/CD system. In a typical workflow, a commit to your source revision
control system would trigger a build on your CI system, which would then push a
new image to your Registry if the build is successful. A notification from the
Registry would then trigger a deployment on a staging environment, or notify
other systems that a new image is available.
@y
{% comment %}
Running your own Registry is a great solution to integrate with and complement
your CI/CD system. In a typical workflow, a commit to your source revision
control system would trigger a build on your CI system, which would then push a
new image to your Registry if the build is successful. A notification from the
Registry would then trigger a deployment on a staging environment, or notify
other systems that a new image is available.
{% endcomment %}
独自のレジストリを稼動させることにすれば、CI/CD システムと統合し補完するような優れたソリューションとなります。
ごく普通のワークフローとして、リビジョン管理システム上のソースコードをコミットすると、CI システム上においてビルドを行うといったことが可能です。
ビルドが成功すれば、新たなイメージを Registry にプッシュするという流れになります。
Registry からの通知をもとにして、ステージング環境へのデプロイを行うこともできます。
あるいは新たなイメージが利用可能になったことを、他システムに通知することもできます。
@z

@x
It's also an essential component if you want to quickly deploy a new image over
a large cluster of machines.
@y
{% comment %}
It's also an essential component if you want to quickly deploy a new image over
a large cluster of machines.
{% endcomment %}
また極めて重要な機能として、大量のマシンに向けて新たなイメージをすばやくデプロイすることができます。
@z

@x
Finally, it's the best way to distribute images inside an isolated network.
@y
{% comment %}
Finally, it's the best way to distribute images inside an isolated network.
{% endcomment %}
そして独立したネットワーク環境にイメージを配布する最善の方法が提供されます。
@z

@x
## Requirements
@y
{% comment %}
## Requirements
{% endcomment %}
{: #requirements }
## 必要事項
@z

@x
You absolutely need to be familiar with Docker, specifically with regard to
pushing and pulling images. You must understand the difference between the
daemon and the cli, and at least grasp basic concepts about networking.
@y
{% comment %}
You absolutely need to be familiar with Docker, specifically with regard to
pushing and pulling images. You must understand the difference between the
daemon and the cli, and at least grasp basic concepts about networking.
{% endcomment %}
Docker には十分に慣れていることが必要です。
特にイメージのプッシュやプルに関する知識が必要です。
デーモンと CLI の差異について理解した上に、さらに最低でもネットワークに関する基本的な知識も必要です。
@z

@x
Also, while just starting a registry is fairly easy, operating it in a
production environment requires operational skills, just like any other service.
You are expected to be familiar with systems availability and scalability,
logging and log processing, systems monitoring, and security 101. Strong
understanding of http and overall network communications, plus familiarity with
golang are certainly useful as well for advanced operations or hacking.
@y
{% comment %}
Also, while just starting a registry is fairly easy, operating it in a
production environment requires operational skills, just like any other service.
You are expected to be familiar with systems availability and scalability,
logging and log processing, systems monitoring, and security 101. Strong
understanding of http and overall network communications, plus familiarity with
golang are certainly useful as well for advanced operations or hacking.
{% endcomment %}
レジストリを使い始めることはとても簡単なことですが、さらにこれを本番環境において用いるためには、操作スキルが求められます。
他のサービスを利用する際にも必要となるスキルです。
当然のことながら、システムの可用性、スケーラビリティー、ログ出力やログ処理、システム監視、セキュリティの初歩については、理解しているべきものです。
特に HTTP や全般的なネットワーク通信については十分理解できていて、さらに Go 言語を理解していれば確実に役立ちます。
高度な操作やハッキングを行うのであれば、さらに有用です。
@z

@x
## Next
@y
{% comment %}
## Next
{% endcomment %}
{: #next }
## 次は
@z

@x
Dive into [deploying your registry](deploying.md)
@y
{% comment %}
Dive into [deploying your registry](deploying.md)
{% endcomment %}
[Registry のデプロイ](deploying.md) に進んでください。
@z
