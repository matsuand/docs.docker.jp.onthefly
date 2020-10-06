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
Usage: push [options] [SERVICE...]

Options:
    --ignore-push-failures  Push what it can and ignores images with push failures.
```
@y
{% comment %}
```none
Usage: push [options] [SERVICE...]

Options:
    --ignore-push-failures  Push what it can and ignores images with push failures.
```
{% endcomment %}
```none
利用方法: push [オプション] [SERVICE...]

オプション:
    --ignore-push-failures  可能なものはプッシュし、失敗するものは無視します。
```
@z

@x
Pushes images for services to their respective `registry/repository`.
@y
{% comment %}
Pushes images for services to their respective `registry/repository`.
{% endcomment %}
サービスのイメージを、それぞれの `registry/repository` に対してプッシュします。
@z

@x
The following assumptions are made:
@y
{% comment %}
The following assumptions are made:
{% endcomment %}
以下のことを前提としています。
@z

@x
- You are pushing an image you have built locally
@y
{% comment %}
- You are pushing an image you have built locally
{% endcomment %}
- ローカルにビルド済のイメージをプッシュするものとします。
@z

@x
- You have access to the build key
@y
{% comment %}
- You have access to the build key
{% endcomment %}
- ビルドキーに対してアクセス権を有しているものとします。
@z

@x
## Example
@y
{% comment %}
## Example
{% endcomment %}
## 例
{: #example }
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
{% comment %}
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
{% endcomment %}
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
