%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: "Build your Java image"
keywords: Java, build, images, dockerfile
description: Learn how to build your first Docker image by writing a Dockerfile
---
@y
---
title: "Build your Java image"
keywords: Java, build, images, dockerfile
description: Learn how to build your first Docker image by writing a Dockerfile
---
@z

@x
{% include_relative nav.html selected="1" %}
@y
{% include_relative nav.html selected="1" %}
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
Work through the orientation and setup in Get started [Part 1](../../get-started/index.md){:target="_blank" rel="noopener" class="_"} to understand Docker concepts. Refer to the following section for Java prerequisites.
@y
Work through the orientation and setup in Get started [Part 1](../../get-started/index.md){:target="_blank" rel="noopener" class="_"} to understand Docker concepts. Refer to the following section for Java prerequisites.
@z

@x
{% include enable-buildkit.md %}
@y
{% include enable-buildkit.md %}
@z

@x
## Overview
@y
## Overview
@z

@x
Now that we have a good overview of containers and the Docker platform, let’s take a look at building our first image. An image includes everything needed to run an application - the code or binary, runtime, dependencies, and any other file system objects required.
@y
Now that we have a good overview of containers and the Docker platform, let’s take a look at building our first image. An image includes everything needed to run an application - the code or binary, runtime, dependencies, and any other file system objects required.
@z

@x
To complete this tutorial, you need the following:
@y
To complete this tutorial, you need the following:
@z

@x
- Java OpenJDK version 15 or later. [Download and install Java](https://jdk.java.net/){: target="_blank" rel="noopener" class="_"}
- Docker running locally. Follow the instructions to [download and install Docker](../../get-docker.md)
- A Git client
- An IDE or a text editor to edit files. We recommend using [IntelliJ Community Edition](https://www.jetbrains.com/idea/download/){: target="_blank" rel="noopener" class="_"}.
@y
- Java OpenJDK version 15 or later. [Download and install Java](https://jdk.java.net/){: target="_blank" rel="noopener" class="_"}
- Docker running locally. Follow the instructions to [download and install Docker](../../get-docker.md)
- A Git client
- An IDE or a text editor to edit files. We recommend using [IntelliJ Community Edition](https://www.jetbrains.com/idea/download/){: target="_blank" rel="noopener" class="_"}.
@z

@x
## Sample application
@y
## Sample application
@z

@x
Let’s clone the sample application that we'll be using in this module to our local development machine. Run the following commands in a terminal to clone the repo.
@y
Let’s clone the sample application that we'll be using in this module to our local development machine. Run the following commands in a terminal to clone the repo.
@z

@x
```console
$ cd /path/to/working/directory
$ git clone https://github.com/spring-projects/spring-petclinic.git
$ cd spring-petclinic
```
@y
```console
$ cd /path/to/working/directory
$ git clone https://github.com/spring-projects/spring-petclinic.git
$ cd spring-petclinic
```
@z

@x
## Test the application
@y
## Test the application
@z

@x
Let’s start our application and make sure it is running properly. Maven will manage all the project processes (compiling, tests, packaging, etc). The **Spring Pets Clinic** project we cloned earlier contains an embedded version of Maven. Therefore, we don't need to install Maven separately on your local machine.
@y
Let’s start our application and make sure it is running properly. Maven will manage all the project processes (compiling, tests, packaging, etc). The **Spring Pets Clinic** project we cloned earlier contains an embedded version of Maven. Therefore, we don't need to install Maven separately on your local machine.
@z

@x
Open your terminal and navigate to the working directory we created and run the following command:
@y
Open your terminal and navigate to the working directory we created and run the following command:
@z

@x
```console
$ ./mvnw spring-boot:run
```
@y
```console
$ ./mvnw spring-boot:run
```
@z

@x
This downloads the dependencies, builds the project, and starts it.
@y
This downloads the dependencies, builds the project, and starts it.
@z

@x
To test that the application is working properly, open a new browser and navigate to `http://localhost:8080`.
@y
To test that the application is working properly, open a new browser and navigate to `http://localhost:8080`.
@z

@x
Switch back to the terminal where our server is running and you should see the following requests in the server logs. The data will be different on your machine.
@y
Switch back to the terminal where our server is running and you should see the following requests in the server logs. The data will be different on your machine.
@z

@x
```console
o.s.s.petclinic.PetClinicApplication     : Started
PetClinicApplication in 11.743 seconds (JVM running for 12.364)
```
@y
```console
o.s.s.petclinic.PetClinicApplication     : Started
PetClinicApplication in 11.743 seconds (JVM running for 12.364)
```
@z

@x
## Create a Dockerfile for Java
@y
## Create a Dockerfile for Java
@z

@x
Now that our application is running properly, let’s take a look at creating a Dockerfile.
@y
Now that our application is running properly, let’s take a look at creating a Dockerfile.
@z

@x
A Dockerfile is a text document that contains all the commands a user could call on the command line to assemble an image. When we tell Docker to build our image by executing the `docker build` command, Docker reads these instructions and execute them sequentially and creates a Docker image.
@y
A Dockerfile is a text document that contains all the commands a user could call on the command line to assemble an image. When we tell Docker to build our image by executing the `docker build` command, Docker reads these instructions and execute them sequentially and creates a Docker image.
@z

@x
Let’s walk through the steps on creating a Dockerfile for our application. In the root of your working directory, create a file named `Dockerfile` and open this file in your text editor.
@y
Let’s walk through the steps on creating a Dockerfile for our application. In the root of your working directory, create a file named `Dockerfile` and open this file in your text editor.
@z

@x
> **Note**
>
> The name of the Dockerfile is not important but the default filename for many commands is simply `Dockerfile`. Therefore, we’ll use that as our filename throughout this series.
@y
> **Note**
>
> The name of the Dockerfile is not important but the default filename for many commands is simply `Dockerfile`. Therefore, we’ll use that as our filename throughout this series.
@z

@x
The first line to add to the Dockerfile is a [`# syntax` parser directive](/engine/reference/builder/#syntax).
While _optional_, this directive instructs the Docker builder what syntax to use
when parsing the Dockerfile, and allows older Docker versions with BuildKit enabled
to upgrade the parser before starting the build. Parser directives
must appear before any other comment, whitespace, or Dockerfile instruction in
your Dockerfile, and should be the first line in Dockerfiles.
@y
The first line to add to the Dockerfile is a [`# syntax` parser directive](/engine/reference/builder/#syntax).
While _optional_, this directive instructs the Docker builder what syntax to use
when parsing the Dockerfile, and allows older Docker versions with BuildKit enabled
to upgrade the parser before starting the build. Parser directives
must appear before any other comment, whitespace, or Dockerfile instruction in
your Dockerfile, and should be the first line in Dockerfiles.
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
```
@y
```dockerfile
# syntax=docker/dockerfile:1
```
@z

@x
We recommend using `docker/dockerfile:1`, which always points to the latest release
of the version 1 syntax. BuildKit automatically checks for updates of the syntax
before building, making sure you are using the most current version.
@y
We recommend using `docker/dockerfile:1`, which always points to the latest release
of the version 1 syntax. BuildKit automatically checks for updates of the syntax
before building, making sure you are using the most current version.
@z

@x
Next, we need to add a line in our Dockerfile that tells Docker what base image
we would like to use for our application.
@y
Next, we need to add a line in our Dockerfile that tells Docker what base image
we would like to use for our application.
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
@y
```dockerfile
# syntax=docker/dockerfile:1
@z

@x
FROM openjdk:16-alpine3.13
```
@y
FROM openjdk:16-alpine3.13
```
@z

@x
Docker images can be inherited from other images. Therefore, instead of creating our own base image, we’ll use the official Maven image with Java JDK that already has all the tools and packages that we need to run a Java application.
@y
Docker images can be inherited from other images. Therefore, instead of creating our own base image, we’ll use the official Maven image with Java JDK that already has all the tools and packages that we need to run a Java application.
@z

@x
> **Note**
>
> To learn more about creating your own base images, see [Creating base images](https://docs.docker.com/develop/develop-images/baseimages/).
@y
> **Note**
>
> To learn more about creating your own base images, see [Creating base images](https://docs.docker.com/develop/develop-images/baseimages/).
@z

@x
To make things easier when running the rest of our commands, let’s create a working directory. This instructs Docker to use this path as the default location for all subsequent commands. By doing this, we do not have to type out full file paths but can use relative paths based on the working directory.
@y
To make things easier when running the rest of our commands, let’s create a working directory. This instructs Docker to use this path as the default location for all subsequent commands. By doing this, we do not have to type out full file paths but can use relative paths based on the working directory.
@z

@x
```dockerfile
WORKDIR /app
```
@y
```dockerfile
WORKDIR /app
```
@z

@x
Usually, the very first thing you do once you’ve downloaded a project written in Java which is using Maven for project management is to install dependencies.
@y
Usually, the very first thing you do once you’ve downloaded a project written in Java which is using Maven for project management is to install dependencies.
@z

@x
Before we can run `mvnw dependency`, we need to get the Maven wrapper and our `pom.xml` file into our image. We’ll use the `COPY` command to do this. The `COPY` command takes two parameters. The first parameter tells Docker what file(s) you would like to copy into the image. The second parameter tells Docker where you want that file(s) to be copied to. We’ll copy all those files and directories into our working directory - `/app`.
@y
Before we can run `mvnw dependency`, we need to get the Maven wrapper and our `pom.xml` file into our image. We’ll use the `COPY` command to do this. The `COPY` command takes two parameters. The first parameter tells Docker what file(s) you would like to copy into the image. The second parameter tells Docker where you want that file(s) to be copied to. We’ll copy all those files and directories into our working directory - `/app`.
@z

@x
```dockerfile
COPY .mvn/ .mvn
COPY mvnw pom.xml ./
```
@y
```dockerfile
COPY .mvn/ .mvn
COPY mvnw pom.xml ./
```
@z

@x
Once we have our `pom.xml` file inside the image, we can use the `RUN` command to execute the command `mvnw dependency:go-offline`. This works exactly the same way as if we were running `mvnw` (or mvn) dependency locally on our machine, but this time the dependencies will be installed into the image.
@y
Once we have our `pom.xml` file inside the image, we can use the `RUN` command to execute the command `mvnw dependency:go-offline`. This works exactly the same way as if we were running `mvnw` (or mvn) dependency locally on our machine, but this time the dependencies will be installed into the image.
@z

@x
```dockerfile
RUN ./mvnw dependency:go-offline
```
@y
```dockerfile
RUN ./mvnw dependency:go-offline
```
@z

@x
At this point, we have an Alpine version 3.13 image that is based on OpenJDK version 16, and we have also installed our dependencies. The next thing we need to do is to add our source code into the image. We’ll use the `COPY` command just like we did with our `pom.xml` file above.
@y
At this point, we have an Alpine version 3.13 image that is based on OpenJDK version 16, and we have also installed our dependencies. The next thing we need to do is to add our source code into the image. We’ll use the `COPY` command just like we did with our `pom.xml` file above.
@z

@x
```dockerfile
COPY src ./src
```
@y
```dockerfile
COPY src ./src
```
@z

@x
This `COPY` command takes all the files located in the current directory and copies them into the image. Now, all we have to do is to tell Docker what command we want to run when our image is executed inside a container. We do this using the `CMD` command.
@y
This `COPY` command takes all the files located in the current directory and copies them into the image. Now, all we have to do is to tell Docker what command we want to run when our image is executed inside a container. We do this using the `CMD` command.
@z

@x
```dockerfile
CMD ["./mvnw", "spring-boot:run"]
```
@y
```dockerfile
CMD ["./mvnw", "spring-boot:run"]
```
@z

@x
Here's the complete Dockerfile.
@y
Here's the complete Dockerfile.
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
@y
```dockerfile
# syntax=docker/dockerfile:1
@z

@x
FROM openjdk:16-alpine3.13
@y
FROM openjdk:16-alpine3.13
@z

@x
WORKDIR /app
@y
WORKDIR /app
@z

@x
COPY .mvn/ .mvn
COPY mvnw pom.xml ./
RUN ./mvnw dependency:go-offline
@y
COPY .mvn/ .mvn
COPY mvnw pom.xml ./
RUN ./mvnw dependency:go-offline
@z

@x
COPY src ./src
@y
COPY src ./src
@z

@x
CMD ["./mvnw", "spring-boot:run"]
```
@y
CMD ["./mvnw", "spring-boot:run"]
```
@z

@x
### Create a `.dockerignore` file
@y
### Create a `.dockerignore` file
@z

@x
To use a file in the build context, the Dockerfile refers to the file specified in an instruction, for example, a `COPY` instruction. To increase the performance of the build, and to exclude files and directories, we recommend that you create a `.dockerignore` file to the context directory. To improve the context load time, add a `target` directory within the `.dockerignore` file.
@y
To use a file in the build context, the Dockerfile refers to the file specified in an instruction, for example, a `COPY` instruction. To increase the performance of the build, and to exclude files and directories, we recommend that you create a `.dockerignore` file to the context directory. To improve the context load time, add a `target` directory within the `.dockerignore` file.
@z

@x
## Build an image
@y
## Build an image
@z

@x
Now that we’ve created our Dockerfile, let’s build our image. To do this, we use the `docker build` command. The `docker build` command builds Docker images from a Dockerfile and a “context”. A build’s context is the set of files located in the specified PATH or URL. The Docker build process can access any of the files located in this context.
@y
Now that we’ve created our Dockerfile, let’s build our image. To do this, we use the `docker build` command. The `docker build` command builds Docker images from a Dockerfile and a “context”. A build’s context is the set of files located in the specified PATH or URL. The Docker build process can access any of the files located in this context.
@z

@x
The build command optionally takes a `--tag` flag. The tag is used to set the name of the image and an optional tag in the format `name:tag`. We’ll leave off the optional `tag` for now to help simplify things. If we do not pass a tag, Docker uses “latest” as its default tag. You can see this in the last line of the build output.
@y
The build command optionally takes a `--tag` flag. The tag is used to set the name of the image and an optional tag in the format `name:tag`. We’ll leave off the optional `tag` for now to help simplify things. If we do not pass a tag, Docker uses “latest” as its default tag. You can see this in the last line of the build output.
@z

@x
Let’s build our first Docker image.
@y
Let’s build our first Docker image.
@z

@x
```console
$ docker build --tag java-docker .
```
@y
```console
$ docker build --tag java-docker .
```
@z

@x
```console
Sending build context to Docker daemon  5.632kB
Step 1/7 : FROM java:3.7-alpine
Step 2/7 : WORKDIR /app
...
Successfully built a0bb458aabd0
Successfully tagged java-docker:latest
```
@y
```console
Sending build context to Docker daemon  5.632kB
Step 1/7 : FROM java:3.7-alpine
Step 2/7 : WORKDIR /app
...
Successfully built a0bb458aabd0
Successfully tagged java-docker:latest
```
@z

@x
## View local images
@y
## View local images
@z

@x
To see a list of images we have on our local machine, we have two options. One is to use the CLI and the other is to use [Docker Desktop](../../desktop/dashboard.md#explore-your-images). As we are currently working in the terminal let’s take a look at listing images using the CLI.
@y
To see a list of images we have on our local machine, we have two options. One is to use the CLI and the other is to use [Docker Desktop](../../desktop/dashboard.md#explore-your-images). As we are currently working in the terminal let’s take a look at listing images using the CLI.
@z

@x
To list images, simply run the `docker images` command.
@y
To list images, simply run the `docker images` command.
@z

@x
```console
$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED          SIZE
java-docker         latest              b1b5f29f74f0        47 minutes ago   567MB
```
@y
```console
$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED          SIZE
java-docker         latest              b1b5f29f74f0        47 minutes ago   567MB
```
@z

@x
You should see at least the we just built `java-docker:latest`.
@y
You should see at least the we just built `java-docker:latest`.
@z

@x
## Tag images
@y
## Tag images
@z

@x
An image name is made up of slash-separated name components. Name components may contain lowercase letters, digits, and separators. A separator is defined as a period, one or two underscores, or one or more dashes. A name component may not start or end with a separator.
@y
An image name is made up of slash-separated name components. Name components may contain lowercase letters, digits, and separators. A separator is defined as a period, one or two underscores, or one or more dashes. A name component may not start or end with a separator.
@z

@x
An image is made up of a manifest and a list of layers. Do not worry too much about manifests and layers at this point other than a “tag” points to a combination of these artifacts. You can have multiple tags for an image. Let’s create a second tag for the image we built and take a look at its layers.
@y
An image is made up of a manifest and a list of layers. Do not worry too much about manifests and layers at this point other than a “tag” points to a combination of these artifacts. You can have multiple tags for an image. Let’s create a second tag for the image we built and take a look at its layers.
@z

@x
To create a new tag for the image we’ve built above, run the following command:
@y
To create a new tag for the image we’ve built above, run the following command:
@z

@x
```console
$ docker tag java-docker:latest java-docker:v1.0.0
```
@y
```console
$ docker tag java-docker:latest java-docker:v1.0.0
```
@z

@x
The `docker tag` command creates a new tag for an image. It does not create a new image. The tag points to the same image and is just another way to reference the image.
@y
The `docker tag` command creates a new tag for an image. It does not create a new image. The tag points to the same image and is just another way to reference the image.
@z

@x
Now, run the `docker images` command to see a list of our local images.
@y
Now, run the `docker images` command to see a list of our local images.
@z

@x
```console
$ docker images
REPOSITORY    TAG      IMAGE ID		  CREATED		  SIZE
java-docker   latest   b1b5f29f74f0	  59 minutes ago	567MB
java-docker   v1.0.0   b1b5f29f74f0	  59 minutes ago	567MB
```
@y
```console
$ docker images
REPOSITORY    TAG      IMAGE ID		  CREATED		  SIZE
java-docker   latest   b1b5f29f74f0	  59 minutes ago	567MB
java-docker   v1.0.0   b1b5f29f74f0	  59 minutes ago	567MB
```
@z

@x
You can see that we have two images that start with `java-docker`. We know they are the same image because if you take a look at the `IMAGE ID` column, you can see that the values are the same for the two images.
@y
You can see that we have two images that start with `java-docker`. We know they are the same image because if you take a look at the `IMAGE ID` column, you can see that the values are the same for the two images.
@z

@x
Let’s remove the tag that we just created. To do this, we’ll use the `rmi` command. The `rmi` command stands for “remove image”.
@y
Let’s remove the tag that we just created. To do this, we’ll use the `rmi` command. The `rmi` command stands for “remove image”.
@z

@x
```console
$ docker rmi java-docker:v1.0.0
Untagged: java-docker:v1.0.0
```
@y
```console
$ docker rmi java-docker:v1.0.0
Untagged: java-docker:v1.0.0
```
@z

@x
Note that the response from Docker tells us that the image has not been removed but only “untagged”. You can check this by running the `docker images` command.
@y
Note that the response from Docker tells us that the image has not been removed but only “untagged”. You can check this by running the `docker images` command.
@z

@x
```console
$ docker images
REPOSITORY      TAG     IMAGE ID        CREATED              SIZE
java-docker    	latest	b1b5f29f74f0	59 minutes ago	     567MB
```
@y
```console
$ docker images
REPOSITORY      TAG     IMAGE ID        CREATED              SIZE
java-docker    	latest	b1b5f29f74f0	59 minutes ago	     567MB
```
@z

@x
Our image that was tagged with `:v1.0.0` has been removed, but we still have the `java-docker:latest` tag available on our machine.
@y
Our image that was tagged with `:v1.0.0` has been removed, but we still have the `java-docker:latest` tag available on our machine.
@z

@x
## Next steps
@y
## Next steps
@z

@x
In this module, we took a look at setting up our example Java application that we'll use for the rest of the tutorial. We also created a Dockerfile that we used to build our Docker image. Then, we took a look at tagging our images and removing images. In the next module, we’ll take a look at how to:
@y
In this module, we took a look at setting up our example Java application that we'll use for the rest of the tutorial. We also created a Dockerfile that we used to build our Docker image. Then, we took a look at tagging our images and removing images. In the next module, we’ll take a look at how to:
@z

@x
[Run your image as a container](run-containers.md){: .button .primary-btn}
@y
[Run your image as a container](run-containers.md){: .button .primary-btn}
@z

@x
## Feedback
@y
## Feedback
@z

@x
Help us improve this topic by providing your feedback. Let us know what you think by creating an issue in the [Docker Docs](https://github.com/docker/docker.github.io/issues/new?title=[Java%20docs%20feedback]){:target="_blank" rel="noopener" class="_"} GitHub repository. Alternatively, [create a PR](https://github.com/docker/docker.github.io/pulls){:target="_blank" rel="noopener" class="_"} to suggest updates.
@y
Help us improve this topic by providing your feedback. Let us know what you think by creating an issue in the [Docker Docs](https://github.com/docker/docker.github.io/issues/new?title=[Java%20docs%20feedback]){:target="_blank" rel="noopener" class="_"} GitHub repository. Alternatively, [create a PR](https://github.com/docker/docker.github.io/pulls){:target="_blank" rel="noopener" class="_"} to suggest updates.
@z

@x
<br />
@y
<br />
@z
