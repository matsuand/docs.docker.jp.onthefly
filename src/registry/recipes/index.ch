%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Fun stuff to do with your registry
keywords: registry, on-prem, images, tags, repository, distribution, recipes, advanced
title: Recipes overview
---
@y
---
description: Fun stuff to do with your registry
keywords: registry, on-prem, images, tags, repository, distribution, recipes, advanced
title: Recipes overview
---
@z

@x
{% include registry.md %}
@y
{% include registry.md %}
@z

@x
This list of "recipes" provides end-to-end scenarios for exotic or otherwise advanced use-cases.
These recipes are not useful for most standard set-ups.
@y
This list of "recipes" provides end-to-end scenarios for exotic or otherwise advanced use-cases.
These recipes are not useful for most standard set-ups.
@z

@x
## Requirements
@y
## Requirements
@z

@x
Before following these steps, work through the [deployment guide](../deploying.md).
@y
Before following these steps, work through the [deployment guide](../deploying.md).
@z

@x
At this point, it's assumed that:
@y
At this point, it's assumed that:
@z

@x
 * you understand Docker security requirements, and how to configure your docker engines properly
 * you have installed Docker Compose
 * it's HIGHLY recommended that you get a certificate from a known CA instead of self-signed certificates
 * inside the current directory, you have a X509 `domain.crt` and `domain.key`, for the CN `myregistrydomain.com`
 * be sure you have stopped and removed any previously running registry (typically `docker container stop registry && docker container rm -v registry`)
@y
 * you understand Docker security requirements, and how to configure your docker engines properly
 * you have installed Docker Compose
 * it's HIGHLY recommended that you get a certificate from a known CA instead of self-signed certificates
 * inside the current directory, you have a X509 `domain.crt` and `domain.key`, for the CN `myregistrydomain.com`
 * be sure you have stopped and removed any previously running registry (typically `docker container stop registry && docker container rm -v registry`)
@z

@x
## The List
@y
## The List
@z

@x
 * [using Apache as an authenticating proxy](apache.md)
 * [using Nginx as an authenticating proxy](nginx.md)
 * [running a Registry on macOS](osx-setup-guide.md)
 * [mirror the Docker Hub](mirror.md)
@y
 * [using Apache as an authenticating proxy](apache.md)
 * [using Nginx as an authenticating proxy](nginx.md)
 * [running a Registry on macOS](osx-setup-guide.md)
 * [mirror the Docker Hub](mirror.md)
@z
