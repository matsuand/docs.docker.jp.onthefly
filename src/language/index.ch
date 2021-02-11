%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: :Language-specific getting started guides overview
keywords: guides, docker, language, node, java, python
title: Overview
toc_min: 1
toc_max: 2
---
@y
---
description: :Language-specific getting started guides overview
keywords: guides, docker, language, node, java, python
title: 概要
toc_min: 1
toc_max: 2
---
@z

@x
The language-specific getting started guides walk you through the process of setting up your development environment and start containerizing language-specific applications using Docker. The learning modules contain best practices and guidelines that explain how to create a new Dockerfile in your preferred language, what to include in the Docker image, how to develop and run your Docker image, set up a CI/CD pipeline, and finally provides information on how to push the application you've developed to the cloud.
@y
プログラミング言語別の初級ガイドでは、開発環境の構築手順を示した上で、各言語に基づき Docker を使ってアプリケーションのコンテナー化を行います。
この学習モジュールにおいては、さまざまなベストプラクティスやガイドを示します。
好みのプログラミング言語を使った Dockerfile の新規生成、Docker イメージに含めるべきもの、Docker イメージの開発と実行、CI/CD パイプラインの設定、開発したアプリケーションのクラウドへのプッシュ方法、などなどです。
@z

@x
In addition to the language-specific modules, Docker documentation also provides guidelines to build and efficiently manage your development environment. You can find information on the best practices for writing Dockerfiles, building and managing images efficiently, gaining performance improvements by building images using BuildKit, etc. You can also find specific instructions on how to keep your images small, and how to persist application data, how to use multi-stage builds, etc.
@y
プログラミング言語に特有の情報に加えて、この Docker ドキュメントでは開発環境の構築および効率的な管理方法についてのガイドも示します。
この中には Dockerfile 記述のベストプラクティス、イメージビルドと効率的な管理、BuildKit を使ってイメージビルドを行う性能改善方法、なども含まれています。
またイメージサイズを小さくするための命令記述、アプリケーションデータの保存方法、マルチステージビルドの利用方法についてもふれています。
@z

@x
For more information, refer to the following topics:
@y
詳しくは以下のトピックを参照してください。
@z

@x
* [Best practices for writing Dockerfiles](../develop/develop-images/dockerfile_best-practices.md)
* [Docker development best practices](../develop/dev-best-practices.md)
* [Build images with BuildKit](../develop/develop-images/build_enhancements.md)
* [Manage images](../develop/develop-images/image_management.md)
@y
* [Dockerfile 記述のベストプラクティス](../develop/develop-images/dockerfile_best-practices.md)
* [Docker 開発のベストプラクティス](../develop/dev-best-practices.md)
* [BuildKit を使ったイメージビルド](../develop/develop-images/build_enhancements.md)
* [イメージの管理](../develop/develop-images/image_management.md)
@z

@x
## Language-specific getting started guides
@y
{: #language-specific-getting-started-guides }
## プログラミング言語別の初級ガイド
@z

@x
Learn how to set up your Docker environment and start containerizing your applications. Choose a language below to get started.
@y
Docker 環境の構築とアプリケーションのコンテナー化について学んでください。
以下の中からプログラミング言語を選んでください。
@z

@x
<div class="component-container">
    <!--start row-->
    <div class="row" style="display: flex; align-items: center">
        <div class="col-sm-12 col-md-12 col-lg-4 block" style="margin: 0 10px;box-shadow: 0 3px 6px #0b214a17, 0 -2px 2px #0b214a08; height: 140px; display: flex; align-items: center">
                <div class="component-icon">
                    <a href="/language/nodejs/"><img src="/language/images/nodejs.png" alt="Develop with Node"></a>
                </div>
        </div>
        <div class="col-sm-12 col-md-12 col-lg-4 block" style="margin: 0 10px;box-shadow: 0 3px 6px #0b214a17, 0 -2px 2px #0b214a08; height: 140px; display: flex; align-items: center">
        <a href="/language/python/">
                <div class="component-icon">
                    <img src="/language/images/python.png" alt="Develop with Python">
                </div>
            </a>
        </div>
        <div class="col-sm-12 col-md-12 col-lg-4 block" style="margin: 0 10px;box-shadow: 0 3px 6px #0b214a17, 0 -2px 2px #0b214a08; height: 140px; display: flex; align-items: center">
                <div class="component-icon">
                    <a href="/language/java/"><img src="/language/images/java.png" alt="Develop with Java"></a>
                </div>
        </div>
    </div>
</div>
@y
<div class="component-container">
    <!--start row-->
    <div class="row" style="display: flex; align-items: center">
        <div class="col-sm-12 col-md-12 col-lg-4 block" style="margin: 0 10px;box-shadow: 0 3px 6px #0b214a17, 0 -2px 2px #0b214a08; height: 140px; display: flex; align-items: center">
                <div class="component-icon">
                    <a href="{{ site.baseurl }}/language/nodejs/"><img src="{{ site.baseurl }}/language/images/nodejs.png" alt="Develop with Node"></a>
                </div>
        </div>
        <div class="col-sm-12 col-md-12 col-lg-4 block" style="margin: 0 10px;box-shadow: 0 3px 6px #0b214a17, 0 -2px 2px #0b214a08; height: 140px; display: flex; align-items: center">
        <a href="{{ site.baseurl }}/language/python/">
                <div class="component-icon">
                    <img src="{{ site.baseurl }}/language/images/python.png" alt="Develop with Python">
                </div>
            </a>
        </div>
        <div class="col-sm-12 col-md-12 col-lg-4 block" style="margin: 0 10px;box-shadow: 0 3px 6px #0b214a17, 0 -2px 2px #0b214a08; height: 140px; display: flex; align-items: center">
                <div class="component-icon">
                    <a href="{{ site.baseurl }}/language/java/"><img src="{{ site.baseurl }}/language/images/java.png" alt="Develop with Java"></a>
                </div>
        </div>
    </div>
</div>
@z

@x
To request a guide in other programming languages, create an issue in the [Docker Docs github repository](https://github.com/docker/docker.github.io/issues/new?title=Language-specific%20guides%20request){:target="_blank" rel="noopener" class="_"}.
@y
他のプログラミング言語に対するガイドをご要望であれば、[Docker Docs github リポジトリ](https://github.com/docker/docker.github.io/issues/new?title=Language-specific%20guides%20request){:target="_blank" rel="noopener" class="_"} に issue をあげてください。
@z

@x
<br />
@y
<br />
@z
