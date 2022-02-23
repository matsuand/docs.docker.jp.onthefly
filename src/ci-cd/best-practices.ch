%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Best practices for using Docker Hub for CI/CD
keywords: CI/CD, GitHub Actions,
title: Best practices for using Docker Hub for CI/CD
---
@y
---
description: CI/CD のために Docker Hub を用いる際のベストプラクティス
keywords: CI/CD, GitHub Actions,
title: CI/CD のために Docker Hub を用いる際のベストプラクティス
---
@z

@x
According to the [2020 Jetbrains developer survey](https://www.jetbrains.com/lp/devecosystem-2020/){:target="_blank" rel="noopener" class="_"} , 44% of developers are now using some form of continuous integration and deployment with Docker containers. We understand that a large number of developers have got this set up using Docker Hub as their container registry for part of their workflow. This guide contains some best practices for doing this and provides guidance on how to get started.
@y
[Jetbrains 社の2020 年度開発動向調査](https://www.jetbrains.com/lp/devecosystem-2020/){:target="_blank" rel="noopener" class="_"} によると、現時点において 44 % の開発者が、何らかの形で Docker コンテナーを用いた継続的インテグレーション開発を行っています。
このような環境構築を採用する開発者の多くは、作業フローの一部としてコンテナー登録のため Docker Hub を利用しているものと思われます。
本ガイドではこれを行うベストプラクティス、そして手始めとして行うガイダンスを示します。
@z

@x
We have also heard feedback that given the changes [Docker introduced](https://www.docker.com/blog/scaling-docker-to-serve-millions-more-developers-network-egress/){:target="_blank" rel="noopener" class="_"} relating to network egress and the number of pulls for free users, that there are questions around the best way to use Docker Hub as part of CI/CD workflows without hitting these limits. This guide covers best practices that improve your experience and uses a sensible consumption of Docker Hub which mitigates the risk of hitting these limits, and contains tips on how to increase the limits depending on your use case.
@y
今までにうかがったフィードバックにおいて、以下のようなものもありました。
[Docker が行った変更](https://www.docker.com/blog/scaling-docker-to-serve-millions-more-developers-network-egress/){:target="_blank" rel="noopener" class="_"} として、ネットワーク出力に関すること、そして無償ユーザーが可能な最大プル数に関することがありました。
CI/CD ワークフローの一部として Docker Hub を利用するにあたって、それらの制限による影響を受けずに Docker Hub を利用する最良の方法はどういったものか、という質問でした。
本ガイドでは Docker Hub の経験を活かして適切に活用し、そういった制限に抵触するリスクを軽減させるベストプラクティスを提供します。
またユースケースによってはその制限を緩和するためのヒントにも触れます。
@z

@x
## Inner and outer loops
@y
{: #inner-and-outer-loops }
## 内部ループと外部ループ
@z

@x
To get started, one of the most important things when working with Docker and any CI/CD is to understand when you need to test with the CI, and when you can do this locally. At Docker, we think about how developers work in terms of their inner loop (code, build, run, test) and their outer loop (push changes, CI build, CI test, deployment).
@y
Docker を利用していずれの CI/CD を構築する際にも重要になるのが、CI に対するテストをローカル環境においていつ実施すべきかを考えることです。
Docker を用いる際、内部ループ（inner loop）（コーディング、ビルド、実行、テスト）という観点、および外部ループ（outer loop）（変更のプッシュ、CI ビルド、CI テスト、デプロイ）という観点で、それぞれどのように開発者は作業を進めるのか、われわれは常にそのことを考慮しています。
@z

@x
![CI/CD inner and outer loop](images/inner-outer-loop.png)
@y
![CI/CD 内部ループと外部ループ](../images/inner-outer-loop.png)
@z

@x
Before you think about optimizing your CI/CD, it is important to think about your inner loop and how it relates to the outer loop (the CI). We know that most users don't prefer 'debugging through the CI’. Therefore, it is better if your inner loop and outer loop are as similar as possible. We recommend that you run unit tests as part of your `docker build` command by adding a target for them in your Dockerfile. This way, as you are making changes and rebuilding locally, you can run the same unit tests you would run in the CI on your local machine using a simple command.
@y
CI/CD の最適化を図る前にまず重要なのは、内部ループについて考えることであり、それが外部ループ（つまりは CI）とどのように関連させるかを考えることです。
たいていのユーザーは「CI を通じたデバッグ」を好まないのは承知しています。
したがって内部ループと外部ループは、できるだけ同じようなものにすることが望まれます。
そこでお勧めするのは、Dockerfile 内にターゲットを追加して、`docker build`コマンドの一部としてユニットテストを実行することです。
こうしておけば、システムの変更とビルドはローカルで行ない、CI 上で実行するユニットテストは、同じものをローカル上で単純なコマンドを使って実施できることになります。
@z

@x
The blog post [Go development with Docker](https://www.docker.com/blog/tag/go-env-series/){:target="_blank" rel="noopener" class="_"} is a great example of how you can use tests in your Docker project and re-use them in the CI. This also creates a shorter feedback loop on issues and reduces the amount of pulls and builds your CI needs to do.
@y
ブログ投稿「[Go development with Docker](https://www.docker.com/blog/tag/go-env-series/){:target="_blank" rel="noopener" class="_"}」では、Docker プロジェクトにおいてテストをどのように行うか、そしてそれを CI 上でどのように再利用するかが、実によく示されています。
この例では、問題に対するフィードバックを短くして、CI の実行に必要となるプル操作やビルド処理の数を軽減しています。
@z

@x
## Optimizing CI/CD deployments
@y
{: #optimizing-cicd-deployments }
## CI/CD デプロイメントの最適化
@z

@x
Once you get into your actual outer loop and Docker Hub, there are a few things you can do to get the most of your CI and deliver the fastest Docker experience.
@y
実際の外部ループや Docker Hub への作業へ入ったら、CI を最大限に活用して Docker による最速の方法を実現させるための作業がいくつかあります。
@z

@x
First and foremost, stay secure. When you are setting up your CI, ensure you are using a Docker Hub access token, rather than your password.
@y
何よりもまずはセキュアであることです。
CI を構築するにあたって Docker Hub に対しては、パスワードを用いるのでなく、アクセストークンを用いるようにします。
@z

@x
  > **Note**
  >
  > You can create new access tokens from your [Security](https://hub.docker.com/settings/security){:target="_blank" rel="noopener" class="_"}  page on Docker Hub.
@y
  > **メモ**
  >
  > 新たなアクセストークンは Docker Hub の [Security](https://hub.docker.com/settings/security){:target="_blank" rel="noopener" class="_"} ページにおいて生成します。
@z

@x
Once you have created access tokens and have added it to a secrets store on your platform, you need to consider when to push and pull in your CI/CD, along with where from, depending on the change you are making.
@y
アクセストークンを生成して、プラットフォーム内の機密情報の保存場所に置いたら、次に考えるべきことは、CI/CD におけるシステム変更に対して、プッシュやプルをどのタイミングで行うのか、どこからそれを行うのかということです。
@z

@x
The first thing you can do to reduce the build time and reduce your number of calls is make use of the **build cache** to reuse layers you have already pulled. You can do this on many platforms by using buildX (buildkits) caching functionality and whatever cache your platform provides. For example, see [Optimizing the GitHub Actions workflow using build cache](../github-actions#optimizing-the-workflow).
@y
まずできることとして、ビルド時間や処理実行回数を軽減させるために、すでにプルを行ったレイヤーの再利用を図る **ビルドキャッシュ** を活用します。
これは多くのプラットフォーム上において buildX（buildkits）のキャッシュ機能を利用することで実現でき、プラットフォーム自体が提供するどのようなキャッシュであれ利用します。
たとえば「[Optimizing the GitHub Actions workflow using build cache](../github-actions#optimizing-the-workflow)（ビルドキャッシュを利用した GitHub アクションの最適化）」を参照してください。
@z

@x
The other change you may want to make is only have your release images go to Docker Hub. This would mean setting up functions to push your PR images to a more local image store to be quickly pulled and tested, rather than promoting them all the way up to production.
@y
システム変更を行う際に、リリースイメージを単に Docker Hub に置きたいだけのときがあります。
そのような場合であれば、PR イメージを本番環境にまでリリースするのではなく、もっと身近にあるローカルな保存場所を利用して、すばやくプルやテストを行った上でその PR イメージをプッシュする段取りを築きさえすればよいということになります。
@z

@x
## Next steps
@y
{: #next-steps }
## 次のステップ
@z

@x
We know there are a lot more tips and tricks for using Docker in CI.
However, we think these are some of the important things, considering the [Docker Hub rate limits](../docker-hub/download-rate-limit.md).
@y
CI に対して Docker を利用するためのヒントやコツは、さらにあると考えられます。
そして最近の Docker Hub では [ダウンロード率制限](../docker-hub/download-rate-limit.md) があることを考えると、そういったものがテクニックの一部として重要になってきます。
@z

@x
  > **Note**
  >
  > If you are still experiencing issues with pull limits after you are authenticated, you can consider upgrading to a [Docker subscription](https://www.docker.com/pricing){:target="_blank" rel="noopener" class="_"}.
@y
  > **メモ**
  >
  > 認証を行った後にまだプル回数に対する制限にお悩みの場合は、[Docker サブスクリプション](https://www.docker.com/pricing){:target="_blank" rel="noopener" class="_"} にアップグレードすることを考えてみてください。
@z

@x
For information on how to configure GitHub Actions CI/CD pipeline, see [Configure GitHub Actions](github-actions.md).
@y
CI/CD と GitHub アクションの連携をどのように行うかについては [GitHub アクションの設定](github-actions.md) を参照してください。
@z
