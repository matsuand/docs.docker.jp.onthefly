%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Compose file build reference
keywords: fig, composition, compose, docker
title: Compose file build reference
toc_max: 4
toc_min: 2
---
@y
---
description: Compose file build reference
keywords: fig, composition, compose, docker
title: Compose file build reference
toc_max: 4
toc_min: 2
---
@z

@x
Compose specification is a platform-neutral way to define multi-container applications. A Compose implementation
focusing on development use-case to run application on local machine will obviously also support (re)building
application from sources. The Compose Build specification allows to define the build process within a Compose file
in a portable way.
@y
Compose specification is a platform-neutral way to define multi-container applications. A Compose implementation
focusing on development use-case to run application on local machine will obviously also support (re)building
application from sources. The Compose Build specification allows to define the build process within a Compose file
in a portable way.
@z

@x
## Definitions
@y
## Definitions
@z

@x
Compose Specification is extended to support an OPTIONAL `build` subsection on services. This section define the
build requirements for service container image. Only a subset of Compose file services MAY define such a Build
subsection, others being created based on `Image` attribute. When a Build subsection is present for a service, it
is *valid* for a Compose file to miss an `Image` attribute for corresponding service, as Compose implementation
can build image from source.
@y
Compose Specification is extended to support an OPTIONAL `build` subsection on services. This section define the
build requirements for service container image. Only a subset of Compose file services MAY define such a Build
subsection, others being created based on `Image` attribute. When a Build subsection is present for a service, it
is *valid* for a Compose file to miss an `Image` attribute for corresponding service, as Compose implementation
can build image from source.
@z

@x
Build can be either specified as a single string defining a context path, or as a detailed build definition.
@y
Build can be either specified as a single string defining a context path, or as a detailed build definition.
@z

@x
In the former case, the whole path is used as a Docker context to execute a docker build, looking for a canonical
`Dockerfile` at context root. Context path can be absolute or relative, and if so relative path MUST be resolved
from Compose file parent folder. As an absolute path prevent the Compose file to be portable, Compose implementation
SHOULD warn user accordingly.
@y
In the former case, the whole path is used as a Docker context to execute a docker build, looking for a canonical
`Dockerfile` at context root. Context path can be absolute or relative, and if so relative path MUST be resolved
from Compose file parent folder. As an absolute path prevent the Compose file to be portable, Compose implementation
SHOULD warn user accordingly.
@z

@x
In the later case, build arguments can be specified, including an alternate `Dockerfile` location. This one can be
absolute or relative path. If Dockerfile path is relative, it MUST be resolved from context path.  As an absolute
path prevent the Compose file to be portable, Compose implementation SHOULD warn user if an absolute alternate
Dockerfile path is used.
@y
In the later case, build arguments can be specified, including an alternate `Dockerfile` location. This one can be
absolute or relative path. If Dockerfile path is relative, it MUST be resolved from context path.  As an absolute
path prevent the Compose file to be portable, Compose implementation SHOULD warn user if an absolute alternate
Dockerfile path is used.
@z

@x
## Consistency with Image
@y
## Consistency with Image
@z

@x
When service definition do include both `Image` attribute and a `Build` section, Compose implementation can't
guarantee a pulled image is strictly equivalent to building the same image from sources. Without any explicit
user directives, Compose implementation with Build support MUST first try to pull Image, then build from source
if image was not found on registry. Compose implementation MAY offer options to customize this behaviour by user
request.
@y
When service definition do include both `Image` attribute and a `Build` section, Compose implementation can't
guarantee a pulled image is strictly equivalent to building the same image from sources. Without any explicit
user directives, Compose implementation with Build support MUST first try to pull Image, then build from source
if image was not found on registry. Compose implementation MAY offer options to customize this behaviour by user
request.
@z

@x
## Publishing built images
@y
## Publishing built images
@z

@x
Compose implementation with Build support SHOULD offer an option to push built images to a registry. Doing so, it
MUST NOT try to push service images without an `Image` attribute. Compose implementation SHOULD warn user about
missing `Image` attribute which prevent image being pushed.
@y
Compose implementation with Build support SHOULD offer an option to push built images to a registry. Doing so, it
MUST NOT try to push service images without an `Image` attribute. Compose implementation SHOULD warn user about
missing `Image` attribute which prevent image being pushed.
@z

@x
Compose implementation MAY offer a mechanism to compute an `Image` attribute for service when not explicitly
declared in yaml file. In such a case, the resulting Compose configuration is considered to have a valid `Image`
attribute, whenever the actual raw yaml file doesn't explicitly declare one.
@y
Compose implementation MAY offer a mechanism to compute an `Image` attribute for service when not explicitly
declared in yaml file. In such a case, the resulting Compose configuration is considered to have a valid `Image`
attribute, whenever the actual raw yaml file doesn't explicitly declare one.
@z

@x
## Illustrative sample
@y
## Illustrative sample
@z

@x
The following sample illustrates Compose specification concepts with a concrete sample application. The sample is non-normative.
@y
The following sample illustrates Compose specification concepts with a concrete sample application. The sample is non-normative.
@z

@x
```yaml
services:
  frontend:
    image: awesome/webapp
    build: ./webapp
@y
```yaml
services:
  frontend:
    image: awesome/webapp
    build: ./webapp
@z

@x
  backend:
    image: awesome/database
    build:
      context: backend
      dockerfile: ../backend.Dockerfile
@y
  backend:
    image: awesome/database
    build:
      context: backend
      dockerfile: ../backend.Dockerfile
@z

@x
  custom:
    build: ~/custom
```
@y
  custom:
    build: ~/custom
```
@z

@x
When used to build service images from source, such a Compose file will create three docker images:
@y
When used to build service images from source, such a Compose file will create three docker images:
@z

@x
* `awesome/webapp` docker image is build using `webapp` sub-directory within Compose file parent folder as docker build context. Lack of a `Dockerfile` within this folder will throw an error.
* `awesome/database` docker image is build using `backend` sub-directory within Compose file parent folder. `backend.Dockerfile` file is used to define build steps, this file is searched relative to context path, which means for this sample `..` will resolve to Compose file parent folder, so `backend.Dockerfile` is a sibling file.
* a docker image is build using `custom` directory within user's HOME as docker context. Compose implementation warn user about non-portable path used to build image.
@y
* `awesome/webapp` docker image is build using `webapp` sub-directory within Compose file parent folder as docker build context. Lack of a `Dockerfile` within this folder will throw an error.
* `awesome/database` docker image is build using `backend` sub-directory within Compose file parent folder. `backend.Dockerfile` file is used to define build steps, this file is searched relative to context path, which means for this sample `..` will resolve to Compose file parent folder, so `backend.Dockerfile` is a sibling file.
* a docker image is build using `custom` directory within user's HOME as docker context. Compose implementation warn user about non-portable path used to build image.
@z

@x
On push, both `awesome/webapp` and `awesome/database` docker images are pushed to (default) registry. `custom` service image is skipped as no `Image` attribute is set and user is warned about this missing attribute.
@y
On push, both `awesome/webapp` and `awesome/database` docker images are pushed to (default) registry. `custom` service image is skipped as no `Image` attribute is set and user is warned about this missing attribute.
@z

@x
## Build definition
@y
## Build definition
@z

@x
The `build` element define configuration options that are applied by Compose implementations to build Docker image from source.
`build` can be specified either as a string containing a path to the build context or a detailed structure:
@y
The `build` element define configuration options that are applied by Compose implementations to build Docker image from source.
`build` can be specified either as a string containing a path to the build context or a detailed structure:
@z

@x
```yml
services:
  webapp:
    build: ./dir
```
@y
```yml
services:
  webapp:
    build: ./dir
```
@z

@x
Using this string syntax, only the build context can be configured as a relative path to the Compose file's parent folder.
This path MUST be a directory and contain a `Dockerfile`.
@y
Using this string syntax, only the build context can be configured as a relative path to the Compose file's parent folder.
This path MUST be a directory and contain a `Dockerfile`.
@z

@x
Alternatively `build` can be an object with fields defined as follow
@y
Alternatively `build` can be an object with fields defined as follow
@z

@x
### context (REQUIRED)
@y
### context (REQUIRED)
@z

@x
`context` defines either a path to a directory containing a Dockerfile, or a url to a git repository.
@y
`context` defines either a path to a directory containing a Dockerfile, or a url to a git repository.
@z

@x
When the value supplied is a relative path, it MUST be interpreted as relative to the location of the Compose file.
Compose implementations MUST warn user about absolute path used to define build context as those prevent Compose file
for being portable.
@y
When the value supplied is a relative path, it MUST be interpreted as relative to the location of the Compose file.
Compose implementations MUST warn user about absolute path used to define build context as those prevent Compose file
for being portable.
@z

@x
```yml
build:
  context: ./dir
```
@y
```yml
build:
  context: ./dir
```
@z

@x
### dockerfile
@y
### dockerfile
@z

@x
`dockerfile` allows to set an alternate Dockerfile. A relative path MUST be resolved from the build context.
Compose implementations MUST warn user about absolute path used to define Dockerfile as those prevent Compose file
for being portable.
@y
`dockerfile` allows to set an alternate Dockerfile. A relative path MUST be resolved from the build context.
Compose implementations MUST warn user about absolute path used to define Dockerfile as those prevent Compose file
for being portable.
@z

@x
```yml
build:
  context: .
  dockerfile: webapp.Dockerfile
```
@y
```yml
build:
  context: .
  dockerfile: webapp.Dockerfile
```
@z

@x
### args
@y
### args
@z

@x
`args` define build arguments, i.e. Dockerfile `ARG` values.
@y
`args` define build arguments, i.e. Dockerfile `ARG` values.
@z

@x
Using following Dockerfile:
@y
Using following Dockerfile:
@z

@x
```Dockerfile
ARG GIT_COMMIT
RUN echo "Based on commit: $GIT_COMMIT"
```
@y
```Dockerfile
ARG GIT_COMMIT
RUN echo "Based on commit: $GIT_COMMIT"
```
@z

@x
`args` can be set in Compose file under the `build` key to define `GIT_COMMIT`. `args` can be set a mapping or a list:
@y
`args` can be set in Compose file under the `build` key to define `GIT_COMMIT`. `args` can be set a mapping or a list:
@z

@x
```yml
build:
  context: .
  args:
    GIT_COMMIT: cdc3b19
```
@y
```yml
build:
  context: .
  args:
    GIT_COMMIT: cdc3b19
```
@z

@x
```yml
build:
  context: .
  args:
    - GIT_COMMIT=cdc3b19
```
@y
```yml
build:
  context: .
  args:
    - GIT_COMMIT=cdc3b19
```
@z

@x
Value can be omitted when specifying a build argument, in which case its value at build time MUST be obtained by user interaction,
otherwise build arg won't be set when building the Docker image.
@y
Value can be omitted when specifying a build argument, in which case its value at build time MUST be obtained by user interaction,
otherwise build arg won't be set when building the Docker image.
@z

@x
```yml
args:
  - GIT_COMMIT
```
@y
```yml
args:
  - GIT_COMMIT
```
@z

@x
### ssh
@y
### ssh
@z

@x
`ssh` defines SSH authentications that the image builder SHOULD use during image build (e.g., cloning private repository)
@y
`ssh` defines SSH authentications that the image builder SHOULD use during image build (e.g., cloning private repository)
@z

@x
`ssh` property syntax can be either:
* `default` - let the builder connect to the ssh-agent.
* `ID=path` - a key/value definition of an ID and the associated path. Can be either a [PEM](https://en.wikipedia.org/wiki/Privacy-Enhanced_Mail) file, or path to ssh-agent socket
@y
`ssh` property syntax can be either:
* `default` - let the builder connect to the ssh-agent.
* `ID=path` - a key/value definition of an ID and the associated path. Can be either a [PEM](https://en.wikipedia.org/wiki/Privacy-Enhanced_Mail) file, or path to ssh-agent socket
@z

@x
Simple `default` sample
```yaml
build:
  context: .
  ssh: 
    - default   # mount the default ssh agent
```
or 
```yaml
build:
  context: .
  ssh: ["default"]   # mount the default ssh agent
```
@y
Simple `default` sample
```yaml
build:
  context: .
  ssh: 
    - default   # mount the default ssh agent
```
or 
```yaml
build:
  context: .
  ssh: ["default"]   # mount the default ssh agent
```
@z

@x
Using a custom id `myproject` with path to a local SSH key:
```yaml
build:
  context: .
  ssh: 
    - myproject=~/.ssh/myproject.pem
```
Image builder can then rely on this to mount SSH key during build.
For illustration, [BuildKit extended syntax](https://github.com/compose-spec/compose-spec/pull/234/%5Bmoby/buildkit@master/frontend/dockerfile/docs/syntax.md#run---mounttypessh%5D(https://github.com/moby/buildkit/blob/master/frontend/dockerfile/docs/syntax.md#run---mounttypessh)) can be used to mount ssh key set by ID and access a secured resource:
@y
Using a custom id `myproject` with path to a local SSH key:
```yaml
build:
  context: .
  ssh: 
    - myproject=~/.ssh/myproject.pem
```
Image builder can then rely on this to mount SSH key during build.
For illustration, [BuildKit extended syntax](https://github.com/compose-spec/compose-spec/pull/234/%5Bmoby/buildkit@master/frontend/dockerfile/docs/syntax.md#run---mounttypessh%5D(https://github.com/moby/buildkit/blob/master/frontend/dockerfile/docs/syntax.md#run---mounttypessh)) can be used to mount ssh key set by ID and access a secured resource:
@z

@x
`RUN --mount=type=ssh,id=myproject git clone ...`
@y
`RUN --mount=type=ssh,id=myproject git clone ...`
@z

@x
### cache_from
@y
### cache_from
@z

@x
`cache_from` defines a list of sources the Image builder SHOULD use for cache resolution.
@y
`cache_from` defines a list of sources the Image builder SHOULD use for cache resolution.
@z

@x
Cache location syntax MUST follow the global format `[NAME|type=TYPE[,KEY=VALUE]]`. Simple `NAME` is actually a shortcut notation for `type=registry,ref=NAME`.
@y
Cache location syntax MUST follow the global format `[NAME|type=TYPE[,KEY=VALUE]]`. Simple `NAME` is actually a shortcut notation for `type=registry,ref=NAME`.
@z

@x
Compose Builder implementations MAY support custom types, the Compose Specification defines canonical types which MUST be supported:
@y
Compose Builder implementations MAY support custom types, the Compose Specification defines canonical types which MUST be supported:
@z

@x
- `registry` to retrieve build cache from an OCI image set by key `ref`
@y
- `registry` to retrieve build cache from an OCI image set by key `ref`
@z

@x
```yml
build:
  context: .
  cache_from:
    - alpine:latest
    - type=local,src=path/to/cache
    - type=gha
```
@y
```yml
build:
  context: .
  cache_from:
    - alpine:latest
    - type=local,src=path/to/cache
    - type=gha
```
@z

@x
Unsupported caches MUST be ignored and not prevent user from building image.
@y
Unsupported caches MUST be ignored and not prevent user from building image.
@z

@x
### cache_to
@y
### cache_to
@z

@x
`cache_to` defines a list of export locations to be used to share build cache with future builds.
@y
`cache_to` defines a list of export locations to be used to share build cache with future builds.
@z

@x
```yml
build:
  context: .
  cache_to: 
   - user/app:cache
   - type=local,dest=path/to/cache
```
@y
```yml
build:
  context: .
  cache_to: 
   - user/app:cache
   - type=local,dest=path/to/cache
```
@z

@x
Cache target is defined using the same `type=TYPE[,KEY=VALUE]` syntax defined by [`cache_from`](#cache_from). 
@y
Cache target is defined using the same `type=TYPE[,KEY=VALUE]` syntax defined by [`cache_from`](#cache_from). 
@z

@x
Unsupported cache target MUST be ignored and not prevent user from building image.
@y
Unsupported cache target MUST be ignored and not prevent user from building image.
@z

@x
### extra_hosts
@y
### extra_hosts
@z

@x
`extra_hosts` adds hostname mappings at build-time. Use the same syntax as [extra_hosts](index.md#extra_hosts).
@y
`extra_hosts` adds hostname mappings at build-time. Use the same syntax as [extra_hosts](index.md#extra_hosts).
@z

@x
```yml
extra_hosts:
  - "somehost:162.242.195.82"
  - "otherhost:50.31.209.229"
```
@y
```yml
extra_hosts:
  - "somehost:162.242.195.82"
  - "otherhost:50.31.209.229"
```
@z

@x
Compose implementations MUST create matching entry with the IP address and hostname in the container's network
configuration, which means for Linux `/etc/hosts` will get extra lines:
@y
Compose implementations MUST create matching entry with the IP address and hostname in the container's network
configuration, which means for Linux `/etc/hosts` will get extra lines:
@z

@x
```
162.242.195.82  somehost
50.31.209.229   otherhost
```
@y
```
162.242.195.82  somehost
50.31.209.229   otherhost
```
@z

@x
### isolation
@y
### isolation
@z

@x
`isolation` specifies a build’s container isolation technology. Like [isolation](index.md#isolation) supported values
are platform-specific.
@y
`isolation` specifies a build’s container isolation technology. Like [isolation](index.md#isolation) supported values
are platform-specific.
@z

@x
### labels
@y
### labels
@z

@x
`labels` add metadata to the resulting image. `labels` can be set either as an array or a map.
@y
`labels` add metadata to the resulting image. `labels` can be set either as an array or a map.
@z

@x
reverse-DNS notation SHOULD be used to prevent labels from conflicting with those used by other software.
@y
reverse-DNS notation SHOULD be used to prevent labels from conflicting with those used by other software.
@z

@x
```yml
build:
  context: .
  labels:
    com.example.description: "Accounting webapp"
    com.example.department: "Finance"
    com.example.label-with-empty-value: ""
```
@y
```yml
build:
  context: .
  labels:
    com.example.description: "Accounting webapp"
    com.example.department: "Finance"
    com.example.label-with-empty-value: ""
```
@z

@x
```yml
build:
  context: .
  labels:
    - "com.example.description=Accounting webapp"
    - "com.example.department=Finance"
    - "com.example.label-with-empty-value"
```
@y
```yml
build:
  context: .
  labels:
    - "com.example.description=Accounting webapp"
    - "com.example.department=Finance"
    - "com.example.label-with-empty-value"
```
@z

@x
### shm_size
@y
### shm_size
@z

@x
`shm_size` set the size of the shared memory (`/dev/shm` partition on Linux) allocated for building Docker image. Specify
as an integer value representing the number of bytes or as a string expressing a [byte value](index.md#specifying-byte-values).
@y
`shm_size` set the size of the shared memory (`/dev/shm` partition on Linux) allocated for building Docker image. Specify
as an integer value representing the number of bytes or as a string expressing a [byte value](index.md#specifying-byte-values).
@z

@x
```yml
build:
  context: .
  shm_size: '2gb'
```
@y
```yml
build:
  context: .
  shm_size: '2gb'
```
@z

@x
```yaml
build:
  context: .
  shm_size: 10000000
```
@y
```yaml
build:
  context: .
  shm_size: 10000000
```
@z

@x
### target
@y
### target
@z

@x
`target` defines the stage to build as defined inside a multi-stage `Dockerfile`.
@y
`target` defines the stage to build as defined inside a multi-stage `Dockerfile`.
@z

@x
```yml
build:
  context: .
  target: prod
```
@y
```yml
build:
  context: .
  target: prod
```
@z

@x
## Implementations
@y
## Implementations
@z

@x
* [docker-compose](https://docs.docker.com/compose)
* [buildX bake](https://docs.docker.com/buildx/working-with-buildx/)
@y
* [docker-compose](https://docs.docker.com/compose)
* [buildX bake](https://docs.docker.com/buildx/working-with-buildx/)
@z
