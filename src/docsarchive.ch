%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: View the docs archives
---
@y
---
title: View the docs archives
---
@z

@x
This page lists the various ways you can view the docs as they were when a
prior version of Docker was shipped.
@y
This page lists the various ways you can view the docs as they were when a
prior version of Docker was shipped.
@z

@x
To view the docs offline on your local machine, run:
@y
To view the docs offline on your local machine, run:
@z

@x
```
docker run -ti -p 4000:4000 {{ archive.image }}
```
@y
```
docker run -ti -p 4000:4000 {{ archive.image }}
```
@z

@x
## Accessing unsupported archived documentation
@y
## Accessing unsupported archived documentation
@z

@x
If you are using a version of the documentation that is no longer supported,
you can still access that documentation in the following ways:
@y
If you are using a version of the documentation that is no longer supported,
you can still access that documentation in the following ways:
@z

@x
- By entering your version number and selecting it from the branch selection list for this repo
- By directly accessing the Github URL for your version. For example, https://github.com/docker/docker.github.io/tree/v1.9 for `v1.9`
- By running a container of the specific [tag for your documentation version](https://hub.docker.com/r/docs/docker.github.io)
  in Docker Hub. For example, run the following to access `v1.9`:
@y
- By entering your version number and selecting it from the branch selection list for this repo
- By directly accessing the Github URL for your version. For example, https://github.com/docker/docker.github.io/tree/v1.9 for `v1.9`
- By running a container of the specific [tag for your documentation version](https://hub.docker.com/r/docs/docker.github.io)
  in Docker Hub. For example, run the following to access `v1.9`:
@z

@x
  ```bash
  docker run  -it -p 4000:4000 docs/docker.github.io:v1.9
  ```
@y
  ```bash
  docker run  -it -p 4000:4000 docs/docker.github.io:v1.9
  ```
@z
