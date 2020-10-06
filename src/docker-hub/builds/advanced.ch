%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Automated builds
keywords: automated, build, images
title: Advanced options for Autobuild and Autotest
redirect_from:
- /docker-cloud/builds/advanced/
---
@y
---
description: Automated builds
keywords: automated, build, images
title: Advanced options for Autobuild and Autotest
redirect_from:
- /docker-cloud/builds/advanced/
---
@z

@x
The following options allow you to customize your automated build and automated test processes.
@y
The following options allow you to customize your automated build and automated test processes.
@z

@x
## Environment variables for building and testing
@y
## Environment variables for building and testing
@z

@x
Several utility environment variables are set by the build process, and are
available during automated builds, automated tests, and while executing
hooks.
@y
Several utility environment variables are set by the build process, and are
available during automated builds, automated tests, and while executing
hooks.
@z

@x
> **Note**: These environment variables are only available to the build and test
processes and do not affect your service's run environment.
@y
> **Note**: These environment variables are only available to the build and test
processes and do not affect your service's run environment.
@z

@x
* `SOURCE_BRANCH`: the name of the branch or the tag that is currently being tested.
* `SOURCE_COMMIT`: the SHA1 hash of the commit being tested.
* `COMMIT_MSG`: the message from the commit being tested and built.
* `DOCKER_REPO`: the name of the Docker repository being built.
* `DOCKERFILE_PATH`: the dockerfile currently being built.
* `DOCKER_TAG`: the Docker repository tag being built.
* `IMAGE_NAME`: the name and tag of the Docker repository being built. (This variable is a combination of `DOCKER_REPO`:`DOCKER_TAG`.)
@y
* `SOURCE_BRANCH`: the name of the branch or the tag that is currently being tested.
* `SOURCE_COMMIT`: the SHA1 hash of the commit being tested.
* `COMMIT_MSG`: the message from the commit being tested and built.
* `DOCKER_REPO`: the name of the Docker repository being built.
* `DOCKERFILE_PATH`: the dockerfile currently being built.
* `DOCKER_TAG`: the Docker repository tag being built.
* `IMAGE_NAME`: the name and tag of the Docker repository being built. (This variable is a combination of `DOCKER_REPO`:`DOCKER_TAG`.)
@z

@x
If you are using these build environment variables in a
`docker-compose.test.yml` file for automated testing, declare them in your `sut`
service's environment as shown below.
@y
If you are using these build environment variables in a
`docker-compose.test.yml` file for automated testing, declare them in your `sut`
service's environment as shown below.
@z

@x
```none
sut:
  build: .
  command: run_tests.sh
  environment:
    - SOURCE_BRANCH
```
@y
```none
sut:
  build: .
  command: run_tests.sh
  environment:
    - SOURCE_BRANCH
```
@z

@x
## Override build, test or push commands
@y
## Override build, test or push commands
@z

@x
Docker Hub allows you to override and customize the `build`, `test` and `push`
commands during automated build and test processes using hooks. For example, you
might use a build hook to set build arguments used only during the build
process. (You can also set up [custom build phase hooks](#custom-build-phase-hooks) to perform actions in between these commands.)
@y
Docker Hub allows you to override and customize the `build`, `test` and `push`
commands during automated build and test processes using hooks. For example, you
might use a build hook to set build arguments used only during the build
process. (You can also set up [custom build phase hooks](#custom-build-phase-hooks) to perform actions in between these commands.)
@z

@x
**Use these hooks with caution.** The contents of these hook files replace the
basic `docker` commands, so you must include a similar build, test or push
command in the hook or your automated process does not complete.
@y
**Use these hooks with caution.** The contents of these hook files replace the
basic `docker` commands, so you must include a similar build, test or push
command in the hook or your automated process does not complete.
@z

@x
To override these phases, create a folder called `hooks` in your source code
repository at the same directory level as your Dockerfile. Create a file called
`hooks/build`, `hooks/test`, or `hooks/push` and include commands that the
builder process can execute, such as `docker` and `bash` commands (prefixed appropriately with `#!/bin/bash`).
@y
To override these phases, create a folder called `hooks` in your source code
repository at the same directory level as your Dockerfile. Create a file called
`hooks/build`, `hooks/test`, or `hooks/push` and include commands that the
builder process can execute, such as `docker` and `bash` commands (prefixed appropriately with `#!/bin/bash`).
@z

@x
## Custom build phase hooks
@y
## Custom build phase hooks
@z

@x
You can run custom commands between phases of the build process by creating
hooks. Hooks allow you to provide extra instructions to the autobuild and
autotest processes.
@y
You can run custom commands between phases of the build process by creating
hooks. Hooks allow you to provide extra instructions to the autobuild and
autotest processes.
@z

@x
Create a folder called `hooks` in your source code repository at the same
directory level as your Dockerfile. Place files that define the hooks in that
folder. Hook files can include both `docker` commands, and `bash` commands as long as they are prefixed appropriately with `#!/bin/bash`. The builder executes the commands in the files before and after each step.
@y
Create a folder called `hooks` in your source code repository at the same
directory level as your Dockerfile. Place files that define the hooks in that
folder. Hook files can include both `docker` commands, and `bash` commands as long as they are prefixed appropriately with `#!/bin/bash`. The builder executes the commands in the files before and after each step.
@z

@x
The following hooks are available:
@y
The following hooks are available:
@z

@x
* `hooks/post_checkout`
* `hooks/pre_build`
* `hooks/post_build`
* `hooks/pre_test`
* `hooks/post_test`
* `hooks/pre_push` (only used when executing a build rule or [automated build](index.md) )
* `hooks/post_push` (only used when executing a build rule or [automated build](index.md) )
@y
* `hooks/post_checkout`
* `hooks/pre_build`
* `hooks/post_build`
* `hooks/pre_test`
* `hooks/post_test`
* `hooks/pre_push` (only used when executing a build rule or [automated build](index.md) )
* `hooks/post_push` (only used when executing a build rule or [automated build](index.md) )
@z

@x
### Build hook examples
@y
### Build hook examples
@z

@x
#### Override the "build" phase to set variables
@y
#### Override the "build" phase to set variables
@z

@x
Docker Hub allows you to define build environment variables either in the hook files, or from the automated build interface (which you can then reference in hooks).
@y
Docker Hub allows you to define build environment variables either in the hook files, or from the automated build interface (which you can then reference in hooks).
@z

@x
In the following example, we define a build hook that uses `docker build` arguments to set the variable `CUSTOM` based on the value of variable we defined using the Docker Hub build settings. `$DOCKERFILE_PATH` is a variable that we provide with the name of the Dockerfile we wish to build, and `$IMAGE_NAME` is the name of the image being built.
@y
In the following example, we define a build hook that uses `docker build` arguments to set the variable `CUSTOM` based on the value of variable we defined using the Docker Hub build settings. `$DOCKERFILE_PATH` is a variable that we provide with the name of the Dockerfile we wish to build, and `$IMAGE_NAME` is the name of the image being built.
@z

@x
```none
docker build --build-arg CUSTOM=$VAR -f $DOCKERFILE_PATH -t $IMAGE_NAME .
```
@y
```none
docker build --build-arg CUSTOM=$VAR -f $DOCKERFILE_PATH -t $IMAGE_NAME .
```
@z

@x
> **Caution**: A `hooks/build` file overrides the basic [docker build](/engine/reference/commandline/build/) command
used by the builder, so you must include a similar build command in the hook or
the automated build fails.
@y
> **Caution**: A `hooks/build` file overrides the basic [docker build](/engine/reference/commandline/build/) command
used by the builder, so you must include a similar build command in the hook or
the automated build fails.
@z

@x
To learn more about Docker build-time variables, see the [docker build documentation](/engine/reference/commandline/build/#set-build-time-variables-build-arg).
@y
To learn more about Docker build-time variables, see the [docker build documentation](/engine/reference/commandline/build/#set-build-time-variables-build-arg).
@z

@x
#### Two-phase build
@y
#### Two-phase build
@z

@x
If your build process requires a component that is not a dependency for your application, you can use a pre-build hook (refers to the `hooks/pre_build` file) to collect and compile required components. In the example below, the hook uses a Docker container to compile a Golang binary that is required before the build.
@y
If your build process requires a component that is not a dependency for your application, you can use a pre-build hook (refers to the `hooks/pre_build` file) to collect and compile required components. In the example below, the hook uses a Docker container to compile a Golang binary that is required before the build.
@z

@x
```bash
#!/bin/bash
echo "=> Building the binary"
docker run --privileged \
  -v $(pwd):/src \
  -v /var/run/docker.sock:/var/run/docker.sock \
  centurylink/golang-builder
```
@y
```bash
#!/bin/bash
echo "=> Building the binary"
docker run --privileged \
  -v $(pwd):/src \
  -v /var/run/docker.sock:/var/run/docker.sock \
  centurylink/golang-builder
```
@z

@x
#### Push to multiple repos
@y
#### Push to multiple repos
@z

@x
By default the build process pushes the image only to the repository where the build settings are configured. If you need to push the same image to multiple repositories, you can set up a `post_push` hook to add additional tags and push to more repositories.
@y
By default the build process pushes the image only to the repository where the build settings are configured. If you need to push the same image to multiple repositories, you can set up a `post_push` hook to add additional tags and push to more repositories.
@z

@x
```none
docker tag $IMAGE_NAME $DOCKER_REPO:$SOURCE_COMMIT
docker push $DOCKER_REPO:$SOURCE_COMMIT
```
@y
```none
docker tag $IMAGE_NAME $DOCKER_REPO:$SOURCE_COMMIT
docker push $DOCKER_REPO:$SOURCE_COMMIT
```
@z

@x
## Source Repository / Branch Clones
@y
## Source Repository / Branch Clones
@z

@x
When Docker Hub pulls a branch from a source code repository, it performs
a shallow clone (only the tip of the specified branch).  This has the advantage
of minimizing the amount of data transfer necessary from the repository and
speeding up the build because it pulls only the minimal code necessary.
@y
When Docker Hub pulls a branch from a source code repository, it performs
a shallow clone (only the tip of the specified branch).  This has the advantage
of minimizing the amount of data transfer necessary from the repository and
speeding up the build because it pulls only the minimal code necessary.
@z

@x
Because of this, if you need to perform a custom action that relies on a different
branch (such as a `post_push` hook), you can't checkout that branch, unless
you do one of the following:
@y
Because of this, if you need to perform a custom action that relies on a different
branch (such as a `post_push` hook), you can't checkout that branch, unless
you do one of the following:
@z

@x
* You can get a shallow checkout of the target branch by doing the following:
@y
* You can get a shallow checkout of the target branch by doing the following:
@z

@x
		git fetch origin branch:mytargetbranch --depth 1
@y
		git fetch origin branch:mytargetbranch --depth 1
@z

@x
* You can also "unshallow" the clone, which fetches the whole Git history (and potentially
takes a long time / moves a lot of data) by using the `--unshallow` flag on the fetch:
@y
* You can also "unshallow" the clone, which fetches the whole Git history (and potentially
takes a long time / moves a lot of data) by using the `--unshallow` flag on the fetch:
@z

@x
		git fetch --unshallow origin
@y
		git fetch --unshallow origin
@z
