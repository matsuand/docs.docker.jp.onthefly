%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: "Build your Go image"
keywords: containers, images, go, golang, dockerfiles, coding, build, push, run
description: Learn how to build your first Docker image by writing a Dockerfile
redirect_from:
- /get-started/golang/build-images/
---
@y
---
title: "Build your Go image"
keywords: containers, images, go, golang, dockerfiles, coding, build, push, run
description: Learn how to build your first Docker image by writing a Dockerfile
redirect_from:
- /get-started/golang/build-images/
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
* Some understanding of Go and its toolchain. This is not a tutorial on Go. If you are new to the language, the [Go website](https://golang.org/){: target="_blank" rel="noopener" class="_"} is a good starting point, so go (pun intended) check it out.
* Some awareness of basic Docker concepts. If unsure, work through the orientation and setup in Get started [Part 1](../../get-started/index.md).
@y
* Some understanding of Go and its toolchain. This is not a tutorial on Go. If you are new to the language, the [Go website](https://golang.org/){: target="_blank" rel="noopener" class="_"} is a good starting point, so go (pun intended) check it out.
* Some awareness of basic Docker concepts. If unsure, work through the orientation and setup in Get started [Part 1](../../get-started/index.md).
@z

@x
## Overview
@y
## Overview
@z

@x
Now that we have a good overview of containers and the Docker platform, let’s take a look at building our first image. An image includes everything you need to run an application – the code or binary, runtime, dependencies, and any other file system objects required.
@y
Now that we have a good overview of containers and the Docker platform, let’s take a look at building our first image. An image includes everything you need to run an application – the code or binary, runtime, dependencies, and any other file system objects required.
@z

@x
To complete this tutorial, you need the following:
@y
To complete this tutorial, you need the following:
@z

@x
- Go version 1.16 or later. You might want to [download and install Go](https://golang.org/dl/) first.
- Docker running locally. Follow the instructions to [download and install Docker](https://docs.docker.com/desktop/).
- An IDE or a text editor to edit files. We recommend using [Visual Studio Code](https://code.visualstudio.com/){: target="_blank" rel="noopener" class="_"}.
@y
- Go version 1.16 or later. You might want to [download and install Go](https://golang.org/dl/) first.
- Docker running locally. Follow the instructions to [download and install Docker](https://docs.docker.com/desktop/).
- An IDE or a text editor to edit files. We recommend using [Visual Studio Code](https://code.visualstudio.com/){: target="_blank" rel="noopener" class="_"}.
@z

@x
## Meet the example application
@y
## Meet the example application
@z

@x
To avoid losing focus on Docker's features, the sample application is a minimal HTTP server that has only three features:
@y
To avoid losing focus on Docker's features, the sample application is a minimal HTTP server that has only three features:
@z

@x
* It responds with a text message containing a heart symbol ("<3") on requests to `/`.
* It responds with `{"Status" : "OK"}` JSON to the health check request on requests to `/ping`.
* The port it listens on is configurable using the environment variable `HTTP_PORT`. The default value is `8080`.
@y
* It responds with a text message containing a heart symbol ("<3") on requests to `/`.
* It responds with `{"Status" : "OK"}` JSON to the health check request on requests to `/ping`.
* The port it listens on is configurable using the environment variable `HTTP_PORT`. The default value is `8080`.
@z

@x
Thus, it somewhat mimics enough basic properties of a REST microservice to be useful for our learning of Docker.
@y
Thus, it somewhat mimics enough basic properties of a REST microservice to be useful for our learning of Docker.
@z

@x
The source code for the application is in the [olliefr/docker-gs-ping](https://github.com/olliefr/docker-gs-ping){: target="_blank" rel="noopener" class="_"} GitHub repo. Please feel free to clone or fork it.
@y
The source code for the application is in the [olliefr/docker-gs-ping](https://github.com/olliefr/docker-gs-ping){: target="_blank" rel="noopener" class="_"} GitHub repo. Please feel free to clone or fork it.
@z

@x
For our present study, we clone it to our local machine:
@y
For our present study, we clone it to our local machine:
@z

@x
```console
$ git clone https://github.com/olliefr/docker-gs-ping
```
@y
```console
$ git clone https://github.com/olliefr/docker-gs-ping
```
@z

@x
The application's `main.go` file is fairly straightforward, if you are familiar with Go:
@y
The application's `main.go` file is fairly straightforward, if you are familiar with Go:
@z

@x
{% raw %}
```go
package main
@y
{% raw %}
```go
package main
@z

@x
import (
	"net/http"
	"os"
@y
import (
	"net/http"
	"os"
@z

@x
	"github.com/labstack/echo/v4"
	"github.com/labstack/echo/v4/middleware"
)
@y
	"github.com/labstack/echo/v4"
	"github.com/labstack/echo/v4/middleware"
)
@z

@x
func main() {
@y
func main() {
@z

@x
	e := echo.New()
@y
	e := echo.New()
@z

@x
	e.Use(middleware.Logger())
	e.Use(middleware.Recover())
@y
	e.Use(middleware.Logger())
	e.Use(middleware.Recover())
@z

@x
	e.GET("/", func(c echo.Context) error {
		return c.HTML(http.StatusOK, "Hello, Docker! <3")
	})
@y
	e.GET("/", func(c echo.Context) error {
		return c.HTML(http.StatusOK, "Hello, Docker! <3")
	})
@z

@x
	e.GET("/ping", func(c echo.Context) error {
		return c.JSON(http.StatusOK, struct{ Status string }{Status: "OK"})
	})
@y
	e.GET("/ping", func(c echo.Context) error {
		return c.JSON(http.StatusOK, struct{ Status string }{Status: "OK"})
	})
@z

@x
	httpPort := os.Getenv("HTTP_PORT")
	if httpPort == "" {
		httpPort = "8080"
	}
@y
	httpPort := os.Getenv("HTTP_PORT")
	if httpPort == "" {
		httpPort = "8080"
	}
@z

@x
	e.Logger.Fatal(e.Start(":" + httpPort))
}
```
{% endraw %}
@y
	e.Logger.Fatal(e.Start(":" + httpPort))
}
```
{% endraw %}
@z

@x
## Smoke test the application
@y
## Smoke test the application
@z

@x
Let’s start our application and make sure it’s running properly. Open your terminal and navigate to the directory into which you cloned the project's repo. From now on, we'll refer to this directory as the **working directory**.
@y
Let’s start our application and make sure it’s running properly. Open your terminal and navigate to the directory into which you cloned the project's repo. From now on, we'll refer to this directory as the **working directory**.
@z

@x
```console
$ go run main.go
```
@y
```console
$ go run main.go
```
@z

@x
This should compile and start the server as a foreground application, outputting the banner, as illustrated in the next figure.
@y
This should compile and start the server as a foreground application, outputting the banner, as illustrated in the next figure.
@z

@x
```
   ____    __
  / __/___/ /  ___
 / _// __/ _ \/ _ \
/___/\__/_//_/\___/ v4.2.2
High performance, minimalist Go web framework
https://echo.labstack.com
____________________________________O/_______
                                    O\
⇨ http server started on [::]:8080
```
@y
```
   ____    __
  / __/___/ /  ___
 / _// __/ _ \/ _ \
/___/\__/_//_/\___/ v4.2.2
High performance, minimalist Go web framework
https://echo.labstack.com
____________________________________O/_______
                                    O\
⇨ http server started on [::]:8080
```
@z

@x
Let's run a quick _smoke test_ on the application. **In a new terminal**, run a request using `curl`. Alternatively, you can use your favourite web browser as well.
@y
Let's run a quick _smoke test_ on the application. **In a new terminal**, run a request using `curl`. Alternatively, you can use your favourite web browser as well.
@z

@x
```console
$ curl http://localhost:8080/
Hello, Docker! <3
```
@y
```console
$ curl http://localhost:8080/
Hello, Docker! <3
```
@z

@x
So, the application responds with a greeting, just as the first business requirement says it should. Great.
@y
So, the application responds with a greeting, just as the first business requirement says it should. Great.
@z

@x
Having established that the server is running and is accessible, let's proceed to "dockerizing" it.
@y
Having established that the server is running and is accessible, let's proceed to "dockerizing" it.
@z

@x
## Create a Dockerfile for the application
@y
## Create a Dockerfile for the application
@z

@x
A `Dockerfile` is a text document that contains the instructions for building a Docker image. When we tell Docker to build our image by executing the `docker build` command, Docker reads these instructions and executes them one by one and creates a Docker image as a result.
@y
A `Dockerfile` is a text document that contains the instructions for building a Docker image. When we tell Docker to build our image by executing the `docker build` command, Docker reads these instructions and executes them one by one and creates a Docker image as a result.
@z

@x
Let’s walk through the process of creating a `Dockerfile` for our application. In the root of your working directory, create a file named `Dockerfile` and open this file in your text editor.
@y
Let’s walk through the process of creating a `Dockerfile` for our application. In the root of your working directory, create a file named `Dockerfile` and open this file in your text editor.
@z

@x
> **Note**
>
> The name of the file is not _that_ important but the default filename for many commands is simply `Dockerfile`. So, we’ll use that as our filename throughout this series.
@y
> **Note**
>
> The name of the file is not _that_ important but the default filename for many commands is simply `Dockerfile`. So, we’ll use that as our filename throughout this series.
@z

@x
The first thing we need to do is to add a line in our Dockerfile that tells Docker what base image we would like to use for our application.
@y
The first thing we need to do is to add a line in our Dockerfile that tells Docker what base image we would like to use for our application.
@z

@x
```dockerfile
FROM golang:1.16-alpine
```
@y
```dockerfile
FROM golang:1.16-alpine
```
@z

@x
Docker images can be inherited from other images. Therefore, instead of creating our own base image, we’ll use the official Go image that already has all the tools and packages to compile and run a Go application. You can think of this in the same way you would think about class inheritance in object oriented programming or functional composition in functional programming.
@y
Docker images can be inherited from other images. Therefore, instead of creating our own base image, we’ll use the official Go image that already has all the tools and packages to compile and run a Go application. You can think of this in the same way you would think about class inheritance in object oriented programming or functional composition in functional programming.
@z

@x
When we have used that `FROM` command, we told Docker to include in our image all the functionality from the `golang:1.16-alpine` image. All of our consequent commands would build on top of that "base" image.
@y
When we have used that `FROM` command, we told Docker to include in our image all the functionality from the `golang:1.16-alpine` image. All of our consequent commands would build on top of that "base" image.
@z

@x
> **Note**
>
> If you want to learn more about creating your own base images, see [creating base images](https://docs.docker.com/develop/develop-images/baseimages/) section of the guide.
@y
> **Note**
>
> If you want to learn more about creating your own base images, see [creating base images](https://docs.docker.com/develop/develop-images/baseimages/) section of the guide.
@z

@x
To make things easier when running the rest of our commands, let’s create a directory _inside_ the image that we are building. This also instructs Docker to use this directory as the default _destination_ for all subsequent commands. This way we do not have to type out full file paths but can use relative paths based on this directory.
@y
To make things easier when running the rest of our commands, let’s create a directory _inside_ the image that we are building. This also instructs Docker to use this directory as the default _destination_ for all subsequent commands. This way we do not have to type out full file paths but can use relative paths based on this directory.
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
Usually the very first thing you do once you’ve downloaded a project written in Go is to install the modules necessary to compile it.
@y
Usually the very first thing you do once you’ve downloaded a project written in Go is to install the modules necessary to compile it.
@z

@x
But before we can run `go mod download` inside our image, we need to get our `go.mod` and `go.sum` files copied into it. We use the `COPY` command to do this. 
@y
But before we can run `go mod download` inside our image, we need to get our `go.mod` and `go.sum` files copied into it. We use the `COPY` command to do this. 
@z

@x
In its simplest form, the `COPY` command takes two parameters. The first parameter tells Docker what file you would like to copy into the image. The second parameter tells Docker where you want that file to be copied to. 
@y
In its simplest form, the `COPY` command takes two parameters. The first parameter tells Docker what file you would like to copy into the image. The second parameter tells Docker where you want that file to be copied to. 
@z

@x
We’ll copy the `go.mod` and `go.sum` file into our working directory `/app` which, owing to our use of `WORKDIR`, is the current directory (`.`) inside the image.
@y
We’ll copy the `go.mod` and `go.sum` file into our working directory `/app` which, owing to our use of `WORKDIR`, is the current directory (`.`) inside the image.
@z

@x
```dockerfile
COPY go.mod ./
COPY go.sum ./
```
@y
```dockerfile
COPY go.mod ./
COPY go.sum ./
```
@z

@x
Now that we have the module files inside the Docker image that we are building, we can use the `RUN` command to execute the command `go mod download` there as well. This works exactly the same as if we were running `go` locally on our machine, but this time these Go modules will be installed into the a directory inside our image.
@y
Now that we have the module files inside the Docker image that we are building, we can use the `RUN` command to execute the command `go mod download` there as well. This works exactly the same as if we were running `go` locally on our machine, but this time these Go modules will be installed into the a directory inside our image.
@z

@x
```dockerfile
RUN go mod download
```
@y
```dockerfile
RUN go mod download
```
@z

@x
At this point, we have an image that is based on Go environment version 1.16 (or a later minor version, since we had specified `1.16` as our tag in the `FROM` command) and we have installed our dependencies. 
@y
At this point, we have an image that is based on Go environment version 1.16 (or a later minor version, since we had specified `1.16` as our tag in the `FROM` command) and we have installed our dependencies. 
@z

@x
The next thing we need to do is to copy our source code into the image. We’ll use the `COPY` command just like we did with our module files before.
@y
The next thing we need to do is to copy our source code into the image. We’ll use the `COPY` command just like we did with our module files before.
@z

@x
```dockerfile
COPY *.go ./
```
@y
```dockerfile
COPY *.go ./
```
@z

@x
This `COPY` command uses a wildcard to copy all files with `.go` extension located in the current directory on the host (the directory where the `Dockerfile` is located) into the current directory inside the image. 
@y
This `COPY` command uses a wildcard to copy all files with `.go` extension located in the current directory on the host (the directory where the `Dockerfile` is located) into the current directory inside the image. 
@z

@x
Now, we would like to compile our application. To that end, we use the familiar `RUN` command:
@y
Now, we would like to compile our application. To that end, we use the familiar `RUN` command:
@z

@x
```dockerfile
RUN go build -o /docker-gs-ping
```
@y
```dockerfile
RUN go build -o /docker-gs-ping
```
@z

@x
This should be familiar. The result of that command will be a static application binary named `docker-gs-ping` and located in the root of the filesystem of the image that we are building. We could have put the binary into any other place we desire inside that image, the root directory has no special meaning in this regard. It's just convenient to use it to keep the file paths short for improved readability.
@y
This should be familiar. The result of that command will be a static application binary named `docker-gs-ping` and located in the root of the filesystem of the image that we are building. We could have put the binary into any other place we desire inside that image, the root directory has no special meaning in this regard. It's just convenient to use it to keep the file paths short for improved readability.
@z

@x
Now, all that is left to do is to tell Docker what command to execute when our image is used to start a container. 
@y
Now, all that is left to do is to tell Docker what command to execute when our image is used to start a container. 
@z

@x
We do this with the `CMD` command:
@y
We do this with the `CMD` command:
@z

@x
```dockerfile
CMD [ "/docker-gs-ping" ]
```
@y
```dockerfile
CMD [ "/docker-gs-ping" ]
```
@z

@x
Here's the complete `Dockerfile`:
@y
Here's the complete `Dockerfile`:
@z

@x
```dockerfile
FROM golang:1.16-alpine
@y
```dockerfile
FROM golang:1.16-alpine
@z

@x
WORKDIR /app
@y
WORKDIR /app
@z

@x
COPY go.mod ./
COPY go.sum ./
RUN go mod download
@y
COPY go.mod ./
COPY go.sum ./
RUN go mod download
@z

@x
COPY *.go ./
@y
COPY *.go ./
@z

@x
RUN go build -o /docker-gs-ping
@y
RUN go build -o /docker-gs-ping
@z

@x
EXPOSE 8080
@y
EXPOSE 8080
@z

@x
CMD [ "/docker-gs-ping" ]
```
@y
CMD [ "/docker-gs-ping" ]
```
@z

@x
The `Dockerfile` may also contain _comments_. They always begin with a `#` symbol and make no difference to Docker. The comments are there for the convenience of humans tasked to maintain the `Dockerfile`:
@y
The `Dockerfile` may also contain _comments_. They always begin with a `#` symbol and make no difference to Docker. The comments are there for the convenience of humans tasked to maintain the `Dockerfile`:
@z

@x
```dockerfile
# Alpine is chosen for its small footprint
# compared to Ubuntu
FROM golang:1.16-alpine
@y
```dockerfile
# Alpine is chosen for its small footprint
# compared to Ubuntu
FROM golang:1.16-alpine
@z

@x
WORKDIR /app
@y
WORKDIR /app
@z

@x
# Download necessary Go modules
COPY go.mod ./
COPY go.sum ./
RUN go mod download
@y
# Download necessary Go modules
COPY go.mod ./
COPY go.sum ./
RUN go mod download
@z

@x
# ... the rest of the Dockerfile is ...
# ...   omitted from this example   ...
```
@y
# ... the rest of the Dockerfile is ...
# ...   omitted from this example   ...
```
@z

@x
## Build the image
@y
## Build the image
@z

@x
Now that we've created our `Dockerfile`, let’s build an image from it. The `docker build` command creates Docker images from the `Dockerfile` and a "context". A build _context_ is the set of files located in the specified path or URL. The Docker build process can access any of the files located in the context.
@y
Now that we've created our `Dockerfile`, let’s build an image from it. The `docker build` command creates Docker images from the `Dockerfile` and a "context". A build _context_ is the set of files located in the specified path or URL. The Docker build process can access any of the files located in the context.
@z

@x
The build command optionally takes a `--tag` flag. This flag is used to label the image with a string value, which is easy for humans to read and recognise. If you do not pass a `--tag`, Docker will use `latest` as the default value.
@y
The build command optionally takes a `--tag` flag. This flag is used to label the image with a string value, which is easy for humans to read and recognise. If you do not pass a `--tag`, Docker will use `latest` as the default value.
@z

@x
Let's build our first Docker image!
@y
Let's build our first Docker image!
@z

@x
```console
$ docker build --tag docker-gs-ping .
```
@y
```console
$ docker build --tag docker-gs-ping .
```
@z

@x
```
[+] Building 3.6s (12/12) FINISHED
 => [internal] load build definition from Dockerfile                                      0.1s
 => => transferring dockerfile: 38B                                                       0.0s
 => [internal] load .dockerignore                                                         0.1s
 => => transferring context: 2B                                                           0.0s
 => [internal] load metadata for docker.io/library/golang:1.16-alpine                     3.0s
 => [1/7] FROM docker.io/library/golang:1.16-alpine@sha256:49c07aa83790aca732250c2258b59  0.0s
 => => resolve docker.io/library/golang:1.16-alpine@sha256:49c07aa83790aca732250c2258b59  0.0s
 => [internal] load build context                                                         0.1s
 => => transferring context: 114B                                                         0.0s
 => CACHED [2/7] WORKDIR /app                                                             0.0s
 => CACHED [3/7] COPY go.mod .                                                            0.0s
 => CACHED [4/7] COPY go.sum .                                                            0.0s
 => CACHED [5/7] RUN go mod download                                                      0.0s
 => CACHED [6/7] COPY *.go .                                                              0.0s
 => CACHED [7/7] RUN go build -o /docker-gs-ping                                          0.0s
 => exporting to image                                                                    0.1s
 => => exporting layers                                                                   0.0s
 => => writing image sha256:336a3f164d0f079f2e42cd1d38f24ab9110d47d481f1db7f2a0b0d2859ec  0.0s
 => => naming to docker.io/library/docker-gs-ping                                         0.0s
@y
```
[+] Building 3.6s (12/12) FINISHED
 => [internal] load build definition from Dockerfile                                      0.1s
 => => transferring dockerfile: 38B                                                       0.0s
 => [internal] load .dockerignore                                                         0.1s
 => => transferring context: 2B                                                           0.0s
 => [internal] load metadata for docker.io/library/golang:1.16-alpine                     3.0s
 => [1/7] FROM docker.io/library/golang:1.16-alpine@sha256:49c07aa83790aca732250c2258b59  0.0s
 => => resolve docker.io/library/golang:1.16-alpine@sha256:49c07aa83790aca732250c2258b59  0.0s
 => [internal] load build context                                                         0.1s
 => => transferring context: 114B                                                         0.0s
 => CACHED [2/7] WORKDIR /app                                                             0.0s
 => CACHED [3/7] COPY go.mod .                                                            0.0s
 => CACHED [4/7] COPY go.sum .                                                            0.0s
 => CACHED [5/7] RUN go mod download                                                      0.0s
 => CACHED [6/7] COPY *.go .                                                              0.0s
 => CACHED [7/7] RUN go build -o /docker-gs-ping                                          0.0s
 => exporting to image                                                                    0.1s
 => => exporting layers                                                                   0.0s
 => => writing image sha256:336a3f164d0f079f2e42cd1d38f24ab9110d47d481f1db7f2a0b0d2859ec  0.0s
 => => naming to docker.io/library/docker-gs-ping                                         0.0s
@z

@x
Use 'docker scan' to run Snyk tests against images to find vulnerabilities and learn how to fix them
```
@y
Use 'docker scan' to run Snyk tests against images to find vulnerabilities and learn how to fix them
```
@z

@x
Your exact output will vary, but provided there aren't any errors, you should see the `FINISHED` line in the build output. This means Docker has successfully built our image and assigned a `docker-gs-ping` tag to it.
@y
Your exact output will vary, but provided there aren't any errors, you should see the `FINISHED` line in the build output. This means Docker has successfully built our image and assigned a `docker-gs-ping` tag to it.
@z

@x
## View local images
@y
## View local images
@z

@x
To see the list of images we have on our local machine, we have two options. One is to use the CLI and the other is to use [Docker Desktop](../../desktop/index.md). Since we are currently working in the terminal, let’s take a look at listing images with the CLI.
@y
To see the list of images we have on our local machine, we have two options. One is to use the CLI and the other is to use [Docker Desktop](../../desktop/index.md). Since we are currently working in the terminal, let’s take a look at listing images with the CLI.
@z

@x
To list images, simply run the `images` command:
@y
To list images, simply run the `images` command:
@z

@x
```console
$ docker images
```
@y
```console
$ docker images
```
@z

@x
```
REPOSITORY       TAG       IMAGE ID       CREATED          SIZE
docker-gs-ping   latest    336a3f164d0f   39 minutes ago   540MB
postgres         13.2      c5ec7353d87d   7 weeks ago      314MB
```
@y
```
REPOSITORY       TAG       IMAGE ID       CREATED          SIZE
docker-gs-ping   latest    336a3f164d0f   39 minutes ago   540MB
postgres         13.2      c5ec7353d87d   7 weeks ago      314MB
```
@z

@x
Your exact output may vary, but you should see `docker-gs-ping` image with the `latest` tag.
@y
Your exact output may vary, but you should see `docker-gs-ping` image with the `latest` tag.
@z

@x
## Tag images
@y
## Tag images
@z

@x
An image name is made up of slash-separated name components. Name components may contain lowercase letters, digits and separators. A separator is defined as a period, one or two underscores, or one or more dashes. A name component may not start or end with a separator.
@y
An image name is made up of slash-separated name components. Name components may contain lowercase letters, digits and separators. A separator is defined as a period, one or two underscores, or one or more dashes. A name component may not start or end with a separator.
@z

@x
An image is made up of a manifest and a list of layers. In simple terms, a “tag” points to a combination of these artifacts. You can have multiple tags for the image and, in fact, most images have multiple tags. Let’s create a second tag for the image we had built and take a look at its layers.
@y
An image is made up of a manifest and a list of layers. In simple terms, a “tag” points to a combination of these artifacts. You can have multiple tags for the image and, in fact, most images have multiple tags. Let’s create a second tag for the image we had built and take a look at its layers.
@z

@x
To create a new tag for our image, run the following command.
@y
To create a new tag for our image, run the following command.
@z

@x
```console
$ docker tag docker-gs-ping:latest docker-gs-ping:v1.0
```
@y
```console
$ docker tag docker-gs-ping:latest docker-gs-ping:v1.0
```
@z

@x
The Docker `tag` command creates a new tag for the image. It does not create a new image. The tag points to the same image and is just another way to reference the image.
@y
The Docker `tag` command creates a new tag for the image. It does not create a new image. The tag points to the same image and is just another way to reference the image.
@z

@x
Now run the `docker images` command to see the updated list of local images:
@y
Now run the `docker images` command to see the updated list of local images:
@z

@x
```console
$ docker images
```
@y
```console
$ docker images
```
@z

@x
```
REPOSITORY       TAG       IMAGE ID       CREATED          SIZE
docker-gs-ping   latest    336a3f164d0f   43 minutes ago   540MB
docker-gs-ping   v1.0      336a3f164d0f   43 minutes ago   540MB
postgres         13.2      c5ec7353d87d   7 weeks ago      314MB
```
@y
```
REPOSITORY       TAG       IMAGE ID       CREATED          SIZE
docker-gs-ping   latest    336a3f164d0f   43 minutes ago   540MB
docker-gs-ping   v1.0      336a3f164d0f   43 minutes ago   540MB
postgres         13.2      c5ec7353d87d   7 weeks ago      314MB
```
@z

@x
You can see that we have two images that start with `docker-gs-ping`. We know they are the same image because if you look at the `IMAGE ID` column, you can see that the values are the same for the two images. This value is a unique identifier Docker uses internally to identify the image.
@y
You can see that we have two images that start with `docker-gs-ping`. We know they are the same image because if you look at the `IMAGE ID` column, you can see that the values are the same for the two images. This value is a unique identifier Docker uses internally to identify the image.
@z

@x
Let’s remove the tag that we had just created. To do this, we’ll use the `rmi` command, which stands for "remove image":
@y
Let’s remove the tag that we had just created. To do this, we’ll use the `rmi` command, which stands for "remove image":
@z

@x
```console
$ docker rmi docker-gs-ping:v1.0
Untagged: docker-gs-ping:v1.0
```
@y
```console
$ docker rmi docker-gs-ping:v1.0
Untagged: docker-gs-ping:v1.0
```
@z

@x
Notice that the response from Docker tells us that the image has not been removed but only "untagged". Verify this by running the images command:
@y
Notice that the response from Docker tells us that the image has not been removed but only "untagged". Verify this by running the images command:
@z

@x
```console
$ docker images
```
@y
```console
$ docker images
```
@z

@x
```
REPOSITORY       TAG       IMAGE ID       CREATED          SIZE
docker-gs-ping   latest    336a3f164d0f   45 minutes ago   540MB
postgres         13.2      c5ec7353d87d   7 weeks ago      314MB
```
@y
```
REPOSITORY       TAG       IMAGE ID       CREATED          SIZE
docker-gs-ping   latest    336a3f164d0f   45 minutes ago   540MB
postgres         13.2      c5ec7353d87d   7 weeks ago      314MB
```
@z

@x
The tag `v1.0` has been removed but we still have the `docker-gs-ping:latest` tag available on our machine, so the image is there.
@y
The tag `v1.0` has been removed but we still have the `docker-gs-ping:latest` tag available on our machine, so the image is there.
@z

@x
## Multi-stage builds
@y
## Multi-stage builds
@z

@x
You may have noticed that our `docker-gs-ping` image stands at 540MB, which you may think is a lot. You may also be wondering whether our dockerized application still needs the full suite of Go tools, including the compiler, after the application binary had been compiled.
@y
You may have noticed that our `docker-gs-ping` image stands at 540MB, which you may think is a lot. You may also be wondering whether our dockerized application still needs the full suite of Go tools, including the compiler, after the application binary had been compiled.
@z

@x
These are legit concerns. Both can be solved by using _multi-stage builds_. The following example is provided with little explanation because this would derail us from our current concerns, but please feel free to explore on your own later. The main idea is that we use one image to produce some artefacts, which are then placed into another, much smaller image, containing only the parts necessary for running the artefacts that we'd built.
@y
These are legit concerns. Both can be solved by using _multi-stage builds_. The following example is provided with little explanation because this would derail us from our current concerns, but please feel free to explore on your own later. The main idea is that we use one image to produce some artefacts, which are then placed into another, much smaller image, containing only the parts necessary for running the artefacts that we'd built.
@z

@x
The `Dockerfile.multistage` in the sample application's repo has the following content:
@y
The `Dockerfile.multistage` in the sample application's repo has the following content:
@z

@x
{% raw %}
```dockerfile
##
## Build
##
@y
{% raw %}
```dockerfile
##
## Build
##
@z

@x
FROM golang:1.16-buster AS build
@y
FROM golang:1.16-buster AS build
@z

@x
WORKDIR /app
@y
WORKDIR /app
@z

@x
COPY go.mod ./
COPY go.sum ./
RUN go mod download
@y
COPY go.mod ./
COPY go.sum ./
RUN go mod download
@z

@x
COPY *.go ./
@y
COPY *.go ./
@z

@x
RUN go build -o /docker-gs-ping
@y
RUN go build -o /docker-gs-ping
@z

@x
##
## Deploy
##
@y
##
## Deploy
##
@z

@x
FROM gcr.io/distroless/base-debian10
@y
FROM gcr.io/distroless/base-debian10
@z

@x
WORKDIR /
@y
WORKDIR /
@z

@x
COPY --from=build /docker-gs-ping /docker-gs-ping
@y
COPY --from=build /docker-gs-ping /docker-gs-ping
@z

@x
EXPOSE 8080
@y
EXPOSE 8080
@z

@x
USER nonroot:nonroot
@y
USER nonroot:nonroot
@z

@x
ENTRYPOINT ["/docker-gs-ping"]
```
{% endraw %}
@y
ENTRYPOINT ["/docker-gs-ping"]
```
{% endraw %}
@z

@x
Since we have two dockerfiles now, we have to tell Docker that we want to build using our new Dockerfile. We also tag the new image with `multistage` but this word has no special meaning, we only do so that we could compare this new image to the one we've built previously, that is the one we tagged with `latest`:
@y
Since we have two dockerfiles now, we have to tell Docker that we want to build using our new Dockerfile. We also tag the new image with `multistage` but this word has no special meaning, we only do so that we could compare this new image to the one we've built previously, that is the one we tagged with `latest`:
@z

@x
```console
$ docker build -t docker-gs-ping:multistage -f Dockerfile.multistage .
```
@y
```console
$ docker build -t docker-gs-ping:multistage -f Dockerfile.multistage .
```
@z

@x
Comparing the sizes of `docker-gs-ping:multistage` and `docker-gs-ping:latest` we see an order-of-magnitude difference!
@y
Comparing the sizes of `docker-gs-ping:multistage` and `docker-gs-ping:latest` we see an order-of-magnitude difference!
@z

@x
```
REPOSITORY       TAG          IMAGE ID       CREATED              SIZE
docker-gs-ping   multistage   e3fdde09f172   About a minute ago   27.1MB
docker-gs-ping   latest       336a3f164d0f   About an hour ago    540MB
```
@y
```
REPOSITORY       TAG          IMAGE ID       CREATED              SIZE
docker-gs-ping   multistage   e3fdde09f172   About a minute ago   27.1MB
docker-gs-ping   latest       336a3f164d0f   About an hour ago    540MB
```
@z

@x
This is due to the fact that the ["distroless" base image](https://github.com/GoogleContainerTools/distroless) that we have used to deploy our Go application is very barebones and is meant for lean deployments of static binaries.
@y
This is due to the fact that the ["distroless" base image](https://github.com/GoogleContainerTools/distroless) that we have used to deploy our Go application is very barebones and is meant for lean deployments of static binaries.
@z

@x
For more information on multi-stage builds, please feel free to check out [other parts](../../develop/develop-images/multistage-build.md) of Docker documentation. This is, however, not essential for our progress here, so we'll leave it at that.
@y
For more information on multi-stage builds, please feel free to check out [other parts](../../develop/develop-images/multistage-build.md) of Docker documentation. This is, however, not essential for our progress here, so we'll leave it at that.
@z

@x
## Next steps
@y
## Next steps
@z

@x
In this module, we took a look at setting up our example Go application that we will use for much of the rest of the tutorial. We also created a `Dockerfile` that we used to build our Docker image. Then, we took a look at tagging our images and removing images and tags. In the next module, we’ll take a look at how to:
@y
In this module, we took a look at setting up our example Go application that we will use for much of the rest of the tutorial. We also created a `Dockerfile` that we used to build our Docker image. Then, we took a look at tagging our images and removing images and tags. In the next module, we’ll take a look at how to:
@z

@x
[Run your image as a container](run-containers.md){: .button .outline-btn}
@y
[Run your image as a container](run-containers.md){: .button .outline-btn}
@z

@x
## Feedback
@y
## Feedback
@z

@x
Help us improve this topic by providing your feedback. Let us know what you think by creating an issue in the [Docker Docs ](https://github.com/docker/docker.github.io/issues/new?title=[Golang%20docs%20feedback]){:target="_blank" rel="noopener" class="_"} GitHub repository. Alternatively, [create a PR](https://github.com/docker/docker.github.io/pulls){:target="_blank" rel="noopener" class="_"} to suggest updates.
@y
Help us improve this topic by providing your feedback. Let us know what you think by creating an issue in the [Docker Docs ](https://github.com/docker/docker.github.io/issues/new?title=[Golang%20docs%20feedback]){:target="_blank" rel="noopener" class="_"} GitHub repository. Alternatively, [create a PR](https://github.com/docker/docker.github.io/pulls){:target="_blank" rel="noopener" class="_"} to suggest updates.
@z

@x
<br />
@y
<br />
@z
