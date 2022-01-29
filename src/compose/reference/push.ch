%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Pushes service images.
keywords: fig, composition, compose, docker, orchestration, cli,  push
title: docker-compose push
notoc: true
---
@y
---
description: サービスのイメージをプッシュします。
keywords: fig, composition, compose, docker, orchestration, cli,  push
title: docker-compose push
notoc: true
---
@z

@x
```none
Usage: docker-compose push [options] [SERVICE...]

Options:
    --ignore-push-failures  Push what it can and ignores images with push failures.
```
@y
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" href="#origin">英語表記</a></li>
  <li><a data-toggle="tab" href="#japanese">日本語訳</a></li>
</ul>
<div class="tab-content">
  <div id="origin" class="tab-pane fade in active">
{% capture original-content %}
```none
Usage: docker-compose push [options] [SERVICE...]

Options:
    --ignore-push-failures  Push what it can and ignores images with push failures.
```
{% endcapture %}
{{ original-content | markdownify }}
</div>
<div id="japanese" class="tab-pane fade" markdown="1">
{% capture japanese-content %}
```none
利用方法: docker-compose push [オプション] [サービス名...]

オプション:
    --ignore-push-failures  可能なものはプッシュし、失敗するものは無視します。
```
{% endcapture %}
{{ japanese-content | markdownify }}
</div>
</div>
@z

@x
Pushes images for services to their respective `registry/repository`.
@y
サービスのイメージをそれぞれの`registry/repository`に対してプッシュします。
@z

@x
The following assumptions are made:
@y
以下のことを前提としています。
@z

@x
- You are pushing an image you have built locally
@y
- ローカルにビルド済のイメージをプッシュするものとします。
@z

@x
- You have access to the build key
@y
- ビルドキーに対してアクセス権を有しているものとします。
@z

@x
## Example
@y
{: #example }
## 利用例
@z

@x
```yaml
version: '3'
services:
  service1:
    build: .
    image: localhost:5000/yourimage  # goes to local registry

  service2:
    build: .
    image: your-dockerid/yourimage  # goes to your repository on Docker Hub
```
@y
```yaml
version: '3'
services:
  service1:
    build: .
    image: localhost:5000/yourimage  # ローカルレジストリへ

  service2:
    build: .
    image: youruser/yourimage  # 自ユーザーの DockerHub レジストリへ
```
@z
