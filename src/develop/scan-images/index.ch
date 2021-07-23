%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Best practices for scanning images
description: Scan images best practices guide
keywords: docker scan, scan, images, snyk, vulnerability
---
@y
---
title: イメージスキャンのベストプラクティス
description: Scan images best practices guide
keywords: docker scan, scan, images, snyk, vulnerability
---
@z

@x
{% include upgrade-cta.html
  body="Did you know that Docker subscribers receive 200 Snyk vulnerability scans as part of their subscription? Click [here](https://snyk.co/udvnv) to activate your free monthly scans. Upgrade your existing plan to start scanning your images for vulnerabilities."
  header-text="This feature requires a Pro or a Team plan"
  target-url="https://www.docker.com/pricing?utm_source=docker&utm_medium=webreferral&utm_campaign=docs_driven_upgrade_scan"
%}
@y
{% include upgrade-cta.html
  body="Docker プランの購入者であれば、購入機能の一部として Snyk によるぜい弱性スキャンを 200 回行うことができます。ご存じでしたか？ [こちら](https://snyk.co/udvnv) をクリックすれば、無償の月次スキャンを有効にすることができます。既存のプランをアップグレードして、イメージに対するぜい弱性スキャンを始めてください。"
  header-text="この機能を利用するには Pro プランまたは Team プランが必要です。"
  target-url="https://www.docker.com/pricing?utm_source=docker&utm_medium=webreferral&utm_campaign=docs_driven_upgrade_scan"
%}
@z

@x
This page contains recommendations and best practices for scanning and building secure images.
@y
このページでは、イメージをスキャンしてセキュアなイメージをビルドするための、推奨するベストプラクティスを示します。
@z

@x
Docker and Snyk have partnered together to bring security natively into the development workflow by providing a simple and streamlined approach for developers to build and deploy secure containers. Container security spans multiple teams - developers, security, and operations. Additionally, there are multiple layers of security that apply to containers:
@y
Docker と Snyk が協力し、開発ワークフロー内にネイティブに、セキュリティを取り込む機能を提供しています。
ここにおいては、開発者が安全なコンテナー構築およびデプロイができるように、シンプルかつ合理的なアプローチを採用しています。
コンテナーのセキュリティは、開発部門、セキュリティ部門、運用部門といった複数チームに影響します。
さらにコンテナーに適用するセキュリティには、いくつもの対象があります。
@z

@x
- The container image and the software running inside
- The interaction between a container, the host operating system, and other containers on the same host
- The host operating system
- Container networking and storage
@y
- コンテナーイメージと、その中で動作するソフトウェア。
- コンテナー、ホストオペレーティングシステム、同一ホスト上の別コンテナーとの通信。
- ホストオペレーティングシステム。
- コンテナーネットワークとストレージ。
@z

@x
Including the vulnerability scanning options into the Docker platform extends the existing, familiar process of vulnerability detection, and allows for remediation of vulnerabilities earlier in the development process. The process of simple and continuous checks, for example, by checking images in the background using [Synk Advisor](https://snyk.io/advisor/docker){:target="_blank" rel="noopener" class="_"}, can lead to fewer vulnerabilities checked into Docker Hub. This can result in a shorter CI cycle and a more reliable deployment into production.
@y
Docker プラットフォームへのオプションとしてぜい弱性スキャン機能を含めておけば、すでに使い慣れたぜい弱性検出が、さらに拡張されます。
そして開発プロセスの初期段階において、ぜい弱性への対処が可能となります。
たとえば [Synk Advisor](https://snyk.io/advisor/docker){:target="_blank" rel="noopener" class="_"} を使えば、イメージのチェックはバックグラウンドで行われます。
このようにスキャンチェックが簡単かつ継続的に行われるので、Docker Hub 内にぜい弱性を取り込むことが少なくなります。
こうして CI のサイクルをより短く、そして本番環境へのデプロイはより信頼できるようになります。
@z

@x
![Developer's security journey](/images/dev-security-journey.png){:width="700px"}
@y
![Developer's security journey](/images/dev-security-journey.png){:width="700px"}
@z

@x
## Scanning images
@y
{: #scanning-images }
## イメージのスキャン
@z

@x
You can trigger scans automatically by pushing an image to Docker Hub. You can achieve this either through the `docker scan` command in the CLI, or through Docker Hub.
@y
Docker Hub に対してイメージをプッシュすれば、スキャンを自動実行することができます。
イメージのスキャンは Docker Hub を通じてだけでなく、CLI から`docker scan`コマンドを使うことでも実現できます。
@z

@x
### Scan using the CLI
@y
{: #scan-using-the-cli }
### CLI を使ったスキャン
@z

@x
After you’ve built an image and before you push your image to Docker Hub, run the `docker scan` command. For detailed instructions on how to scan images using the CLI, see [docker scan](../../engine/scan/index.md).
@y
イメージのビルドを終えて Docker Hub へのプッシュを行う前に、`docker scan`コマンドを実行します。
CLI を使ってイメージスキャンを行う詳細については [docker scan](../../engine/scan/index.md) を参照してください。
@z

@x
![Docker Scan CL](/images/docker-scan-cli.png){:width="700px"}
@y
![Docker スキャン CL](/images/docker-scan-cli.png){:width="700px"}
@z

@x
### Scan using Docker Hub
@y
{: #scan-using-docker-hub }
### Docker Hub を利用したスキャン
@z

@x
You can trigger scans, view, and inspect vulnerabilities through Docker Hub. For detailed information, see [Hub Vulnerability Scanning](../../docker-hub/vulnerability-scanning.md).
@y
イメージのスキャン、結果参照、ぜい弱性の確認は、Docker Hub を通じて行うことができます。
詳しくは [Docker Hub ぜい弱性スキャン](../../docker-hub/vulnerability-scanning.md) を参照してください。
@z

@x
> **Note**
>
> Docker Hub Vulnerability Scanning is available for developers subscribed to a Pro or a Team plan. For more information about the pricing plans, see [Docker Pricing](https://www.docker.com/pricing?utm_source=docker&utm_medium=webreferral&utm_campaign=docs_driven_upgrade){:target="_blank" rel="noopener" class="_"}.
@y
> **メモ**
>
> Docker Hub のぜい弱性スキャンは、Pro プランまたは Team プランを購入している開発者が利用できます。
> 価格プランに関する詳細は [Docker Pricing](https://www.docker.com/pricing?utm_source=docker&utm_medium=webreferral&utm_campaign=docs_driven_upgrade){:target="_blank" rel="noopener" class="_"} を参照してください。
@z

@x
![Hub Vulnerability scanning](/images/hub-hvs.png){:width="700px"}
@y
![Docker Hub ぜい弱性スキャン](/images/hub-hvs.png){:width="700px"}
@z

@x
### View the scan summary in Docker Desktop
@y
{: #view-the-scan-summary-in-docker-desktop }
### Docker Desktop でのスキャン概要の参照
@z

@x
Docker Desktop provides you a snapshot of your vulnerabilities status on the Docker Dashboard. Hover over the image and click **View in Hub** to view a detailed vulnerability report in Docker Hub.
@y
Docker Desktop は、ぜい弱性に関する状態を Docker ダッシュボードから参照する機能を提供しています。
イメージ上にマウス移動して **View in Hub**（Hub の参照）をクリックすると、Docker Hub 内において、詳細なぜい弱性報告を見ることができます。
@z

@x
![Hub Vulnerability scan summary](/images/hvs-scan-summary.png){:width="700px"}
@y
![Docker Hub ぜい弱性スキャンの概要](/images/hvs-scan-summary.png){:width="700px"}
@z

@x
## Best practices
@y
{: #best-practices }
## ベストプラクティス
@z

@x
As a developer, you can take a few simple steps to improve the security of your container. This includes:
@y
開発者としては、単純な作業をいくつか行うだけで、コンテナーのセキュリティを向上させることができます。
具体的には以下のようなことです。
@z

@x
1. Choosing the right base image from a trusted source and keeping it small
2. Using multi-stage builds
3. Rebuilding images
4. Scanning images during development
5. Scanning images during production
@y
1. 信頼できる提供元からの適切なベースイメージを選び、コンテナーサイズを小さく保ちます。
2. マルチステージビルドを採用します。
3. イメージを再ビルドします。
4. 開発段階でのイメージスキャンを行います。
5. 本番稼働中にイメージスキャンを行います。
@z

@x
Now, let’s take a detailed look at each of these best practices:
@y
そこでベストプラクティスの個々の手順を詳細に見ていきます。
@z

@x
### Choose the right base image
@y
{: #choose-the-right-base-image }
### 適切なベースイメージの選択
@z

@x
The first step towards achieving a secure image is to choose the right base image. When choosing an image, ensure it is built from a trusted source and keep it small.
@y
セキュアなイメージを得るために最初に為すべきなのは、適切なベースイメージを選ぶことです。
イメージを選ぶにあたっては、信頼できる提供元のものを用いてビルドし、イメージサイズを小さく保ちます。
@z

@x
Docker Hub has more than 8.3 million repositories. Some of these images are [Official Images](../../docker-hub/official_images.md), which are published by Docker as a curated set of Docker open source and drop-in solution repositories. Docker also offers images that are published by [Verified Publishers](../../docker-hub/publish/index.md). These high-quality images are published and maintained by the organizations partnering with Docker, with Docker verifying the authenticity of the content in their repositories. When you pick your base image, look out for the **Official Image** and **Verified Publisher** badges.
@y
Docker Hub には 830 万を超えるリポジトリが存在しています。
その中には [公式イメージ](../../docker-hub/official_images.md) を提供しているものがあります。
これは Docker が提供する公開オープンソースであり、気軽に利用できるリポジトリです。
Docker ではさらに [検証済公開者](../../docker-hub/publish/index.md) が構築するイメージも提供しています。
そのイメージは高品質なものであり、Docker と共同開発を行う組織が公開および保守を行っています。
そして Docker を使って、リポジトリ内のコンテンツの信頼性検証が行われています。
ベースイメージを選び出す際には、**Official Image**（公式イメージ）や **Verified Publisher**（検証済公開者）というバッチがついているかどうかの確認を行ってください。
@z

@x
![Docker Hub Official and Verified Publisher images](/images/hub-official-images.png){:width="700px"}
@y
![Docker Hub 公式イメージおよび検証済公開者によるイメージ](/images/hub-official-images.png){:width="700px"}
@z

@x
When building your own image from a Dockerfile, ensure you choose a minimal base image that matches your requirements. A smaller base image not just offers portability and fast downloads, but also shrinks the size of your image and minimizes the number of vulnerabilities introduced through the dependencies.
@y
Dockerfile から独自のイメージを構築する際には、仕様を満たす最小限のベースイメージを選ぶようにしてください。
小さなベースイメージを選んでおけば、移植性に優れ、ダウンロードも早くなります。
さらにイメージサイズは小さく抑えられ、依存パッケージからもたらされるぜい弱性の数も少なくて済みます。
@z

@x
We also recommend that you use two types of base images: the first image for development and unit testing and the second one for testing during the latest stages of development and production. In the later stages of development, your image may not even require some build tools such as compilers, build systems, or any debugging tools. A small image with minimal dependencies can considerably lower the attack surface.
@y
またベースイメージは 2 種類を利用することをお勧めします。
1 つは開発およびテスト用のイメージであり、もう 1 つは開発および本番の最終段階でのテスト用イメージです。
開発の後半になると、コンパイラー、ビルドシステム、デバッグツールといったビルドツールなどが、イメージにおいて不要になるかもしれません。
依存パッケージを最低限に抑えた最小イメージであれば、攻撃対象を相当少なくすることができます。
@z

@x
### Use multi-stage builds
@y
{: #use-multi-stage-builds }
### マルチステージビルドの利用
@z

@x
Multi-stage builds are designed to create an optimized Dockerfile that is easy to read and maintain. With a multi-stage build, you can use multiple images and selectively copy only the artifacts needed from a particular image.
@y
マルチステージビルドは、Dockerfile を最適化して、読みやすく保守しやすくする目的で設計されています。
マルチステージビルドでは複数のイメージを利用して、特定のイメージから必要な成果のみを選択してコピーすることができます。
@z

@x
You can use multiple `FROM` statements in your Dockerfile, and you can use a different base image for each `FROM`. You can also selectively copy artifacts from one stage to another, leaving behind things you don’t need in the final image. This can result in a concise final image.
@y
Dockerfile には、複数の`FROM`命令を記述します。
その`FROM`命令に対しては、それぞれ異なるベースイメージの指定が可能です。
1 つのステージから別のステージへ、作り出した内容を選び出してコピーできるので、最終イメージに不要なものは使い捨てにできます。
そうすれば、最終イメージをコンパクトにすることができます。
@z

@x
This method of creating a tiny image does not only significantly reduce complexity, but also the change of implementing vulnerable artifacts in your image. Therefore, instead of images that are built on images, that again are built on other images, multi-stage builds allow you to 'cherry pick' your artifacts without inheriting the vulnerabilities from the base images on which they rely on.
@y
小さなイメージを生成するこの方法を取れば、複雑さが大幅に減ります。
またイメージ内に実装されているぜい弱な成果物を修正することにもつながります。
したがって複数イメージからなるイメージ、つまり別のイメージからビルドされたイメージを用いるのとは別に、マルチステージビルドを採用すれば、元のベースイメージからぜい弱性を受け継ぐことなく、成果を「cherry pick」することができます。
@z

@x
For detailed information on how to configure multi-stage builds, see [multi-stage builds](../develop-images/multistage-build.md).
@y
マルチステージビルドの設定方法の詳細は [マルチステージビルド](../develop-images/multistage-build.md) を参照してください。
@z

@x
### Rebuild images
@y
{: #rebuild-images }
### イメージの再ビルド
@z

@x
A Docker image is built  from a Dockerfile. A Dockerfile contains a set of instructions which allows you to automate the steps you would normally (manually) take to create an image. Additionally, it can include some imported libraries and install custom software. These appear as instructions in the Dockerfile.
@y
Docker イメージは Dockerfile からビルドされます。
Dockerfile には一連の命令が記述されていて、イメージ生成を（手動で）行ったとした場合に実施する処理手順が、自動的に実施されます。
さらにライブラリをインポートしたり、カスタムソフトウェアをインストールしたりすることができます。
そういったことが Dockerfile 内の命令として表されています。
@z

@x
Building your image is a snapshot of that image, at that moment in time. When you depend on a base image without a tag, you’ll get a different base image every time you rebuild. Also, when you install packages using a package installer, rebuilding can change the image drastically. For example, a Dockerfile containing the following entries can potentially have a different binary with every rebuild.
@y
イメージをビルドするというのは、その時点でのイメージのスナップショットを得ることです。
依存しているベースイメージにタグがなかった場合、イメージの再ビルド時には、毎回別イメージを取得することになります。
さらにパッケージインストーラーを利用してパッケージをインストールしている場合、イメージの再ビルドによって、イメージは大幅に変更されます。
たとえば、以下のような命令を含む Dockerfile では、再ビルドを行うたびに、潜在的に別バイナリを用いることになります。
@z

@x
```dockerfile
FROM ubuntu:latest
RUN apt-get -y update && apt-get install -y python
```
@y
```dockerfile
FROM ubuntu:latest
RUN apt-get -y update && apt-get install -y python
```
@z

@x
We recommend that you rebuild your Docker image regularly to prevent known vulnerabilities that have been addressed. When rebuilding, use the option `--no-cache` to avoid cache hits and to ensure a fresh download.
@y
Docker イメージは定期的に再ビルドすることを推奨します。
公開されている既知の脆弱性を回避するためです。
再ビルドの際には`--no-cache`オプションを用いることで、キャッシュ利用を行わず、最新のダウンロードを利用できるようになります。
@z

@x
For example:
@y
たとえば以下です。
@z

@x
```console
$ docker build --no-cache -t myImage:myTag myPath/
```
@y
```console
$ docker build --no-cache -t myImage:myTag myPath/
```
@z

@x
Consider the following best practices when rebuilding an image:
@y
イメージ再ビルドの際には、以下のベストプラクティスを考えてください。
@z

@x
- Each container should have only one responsibility.
- Containers should be immutable, lightweight, and fast.
- Don’t store data in your container. Use a shared data store instead.
- Containers should be easy to destroy and rebuild.
- Use a small base image (such as Linux Alpine).  Smaller images are easier to distribute.
- Avoid installing unnecessary packages. This keeps the image clean and safe.
- Avoid cache hits when building.
- Auto-scan your image before deploying to avoid pushing vulnerable containers to production.
- Scan your images daily both during development and production for vulnerabilities Based on that, automate the rebuild of images if necessary.
@y
- 各コンテナーが担うべき責任は、ただ 1 つとすべきです。
- コンテナーは不変なものであり、軽量で高速である必要があります。
- コンテナー内にデータを保存しないでください。
  代わりに共有データストレージを利用してください。
- コンテナーの削除と再ビルドは、いつでも簡単にできます。
- ベースイメージには (Liux Alpine のような) 小さなものを用いてください。
  小さければ、それだけ配布がしやすくなります。
- 不要な依存パッケージはインストールしないようにしてください。
  イメージをきれいに、そして安全に保つようにします。
- ビルド時にはキャッシュを無効にしてください。
- デプロイ前には、イメージの自動スキャン機能を利用してください。
  これにより、ぜい弱なコンテナーを本番環境に導入することが避けられます。
- 開発中および本番稼働中は、イメージにぜい弱性がないかを毎日スキャンするようにしてください。
  必要であれば、イメージ再ビルドの自動化を行ってください。
@z

@x
For detailed best practices and methods for building efficient images, see [Dockerfile best practices](../develop-images/dockerfile_best-practices.md).
@y
イメージビルドを効率的に行うベストプラクティスや手法については、[Dockerfile ベストプラクティス](../develop-images/dockerfile_best-practices.md) を参照してください。
@z

@x
### Scan images during development
@y
{: #scan-images-during-development }
### 開発段階でのイメージスキャン
@z

@x
Creating an image from a Dockerfile and even rebuilding an image can introduce new vulnerabilities in your system. Scanning your Docker images during development should be part of your workflow to catch vulnerabilities earlier in your development. You should scan images at all stages of the development cycle, and ideally consider automating scans. For example, consider configuring automated scans during the build process, before pushing the image to Docker Hub (or any other registry), and finally before pushing it to a production environment.
@y
Dockerfile からイメージ生成や再ビルドを行うときは、システム内にぜい弱性を持ち込む可能性があります。
開発作業中での Docker イメージスキャンは、ワークフローの一部として組み入れて、開発当初よりぜい弱性検出に努める必要があります。
イメージスキャンは、開発のどの段階においても実施すべきであり、理想的には自動スキャンを検討すべきです。
たとえばビルド作業において自動スキャンを組み入れるなら、Docker Hub (あるいは別のレジストリ) にイメージをプッシュする前に行うようにし、最終的には本番環境に投入する前に行うようにします。
@z

@x
### Scan images during production
@y
{: #scan-images-during-production }
### 本番稼働中のイメージスキャン
@z

@x
Actively checking your container can save you a lot of hassle when a new vulnerability is discovered, which otherwise can put your production system at risk.
@y
コンテナーを積極的にチェックしていれば、新たなぜい弱性が発見されたときに、多くの手間ひまを省くことができます。
それを行わないでいると、本番環境が危険にさらされる可能性があります。
@z

@x
Periodically scanning your Docker image is possible by using the Snyk monitor capabilities for containers. Snyk creates a snapshot of the image’s dependencies for continuous monitoring. Additionally, you should also activate runtime monitoring. Scanning for unused modules and packages inside your runtime gives insight into how to shrink images. Removing unused components prevents unnecessary vulnerabilities from entering both system and application libraries. This also makes an image more easily maintainable.
@y
コンテナーに対しては Synk 監視機能を利用することで、Docker イメージの定期的なスキャンが可能になります。
Snyk は監視を継続的に行って、イメージの依存パッケージに対するスナップショットを生成します。
さらに実行時の監視を有効にすることもできます。
ランタイム内部に未使用のモジュールやパッケージがスキャンされると、それはつまりイメージ縮小の可能性を知らせてくれる契機となります。
未使用のコンポーネントを取り除いておけば、システムおよびアプリケーションライブラリの双方に、不要なぜい弱性を導入しなくて済みます。
こうすることが、イメージをより保守しやすくすることでもあるのです。
@z

@x
## Conclusion
@y
{: #conclusion }
## 結論
@z

@x
Building secure images is a continuous process. Consider the recommendations and best practices highlighted in this guide to plan and build efficient, scalable, and secure images.
@y
セキュアなイメージビルドは、継続的に行うべきものです。
このガイドにおいて取り上げた推奨内容やベストプラクティスを考慮して、効率のよい、スケール変更が容易なセキュアイメージ作りを計画してビルドしてください。
@z

@x
Let’s recap what we’ve learnt in this guide:
@y
このガイドを通じて学んだ内容をまとめます。
@z

@x
- Start with a base image that you trust. Remember the Official image and Verified Publisher badges when you choose your base images.
- Secure your code and its dependencies.
- Select a minimal base image which contains only the required packages.
- Use multi-stage builds to optimize your image.
- Ensure you carefully monitor and manage the tools and dependencies you add to your image.
- Ensure you scan images at multiple stages during your development lifecycle.
- Check your images frequently for vulnerabilities.
@y
- 信頼できるベースイメージから始めてください。
  ベースイメージを選択する際には、Official image (公式イメージ) あるいは Verified Publisher (検証済公開者) のバッチがあるかどうかの確認を忘れないでください。
- コードや依存パッケージはセキュアなものとしてください。
- ベースイメージは、必要最小限のパッケージを含んだものを選んでください。
- イメージを最適化するため、マルチステージビルドを用いてください。
- イメージに追加する依存パッケージやツールに関しては、注意深く監視し管理してください。
- 開発ライフサイクルのあるゆる段階において、イメージスキャンを行ってください。
- イメージにぜい弱性がないかどうかを頻繁に確認してください。
@z

@x
## Further reading
@y
{: #further-reading }
## さらに読むもの
@z

@x
You can also take a look at the following articles from Snyk:
@y
Snyk が提供している以下の投稿も確認してください。
@z

@x
- [Container Security Guide](https://snyk.io/learn/container-security/){:target="_blank" rel="noopener" class="_"}
- [Docker Vulnerability Scanning Cheat Sheet](https://goto.docker.com/rs/929-FJL-178/images/cheat-sheet-docker-desktop-vulnerability-scanning-CLI.pdf){:target="_blank" rel="noopener" class="_"}
@y
- [Container Security Guide](https://snyk.io/learn/container-security/){:target="_blank" rel="noopener" class="_"} (コンテナーセキュリティガイド)
- [Docker Vulnerability Scanning Cheat Sheet](https://goto.docker.com/rs/929-FJL-178/images/cheat-sheet-docker-desktop-vulnerability-scanning-CLI.pdf){:target="_blank" rel="noopener" class="_"} (Docker ぜい弱性スキャンのチートシート)
@z
