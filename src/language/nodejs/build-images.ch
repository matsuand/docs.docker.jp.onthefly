%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: "Build your Node image"
keywords: containers, images, node.js, node, dockerfiles, node, coding, build, push, run
description: Learn how to build your first Docker image by writing a Dockerfile
redirect_from:
- /get-started/nodejs/build-images/
---
@y
---
title: "Build your Node image"
keywords: containers, images, node.js, node, dockerfiles, node, coding, build, push, run
description: Learn how to build your first Docker image by writing a Dockerfile
redirect_from:
- /get-started/nodejs/build-images/
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
Work through the orientation and setup in Get started [Part 1](/get-started/) to understand Docker concepts.
@y
Work through the orientation and setup in Get started [Part 1](/get-started/) to understand Docker concepts.
@z

@x
## Overview
@y
## Overview
@z

@x
Now that we have a good overview of containers and the Docker platform, let’s take a look at building our first image. An image includes everything you need to run an application - the code or binary, runtime, dependencies, and any other file system objects required.
@y
Now that we have a good overview of containers and the Docker platform, let’s take a look at building our first image. An image includes everything you need to run an application - the code or binary, runtime, dependencies, and any other file system objects required.
@z

@x
To complete this tutorial, you need the following:
@y
To complete this tutorial, you need the following:
@z

@x
- Node.js version 12.18 or later. [Download Node.js](https://nodejs.org/en/){: target="_blank" rel="noopener" class="_"}
- Docker running locally: Follow the instructions to [download and install Docker](https://docs.docker.com/desktop/).
- An IDE or a text editor to edit files. We recommend using Visual Studio Code.
@y
- Node.js version 12.18 or later. [Download Node.js](https://nodejs.org/en/){: target="_blank" rel="noopener" class="_"}
- Docker running locally: Follow the instructions to [download and install Docker](https://docs.docker.com/desktop/).
- An IDE or a text editor to edit files. We recommend using Visual Studio Code.
@z

@x
## Sample application
@y
## Sample application
@z

@x
Let’s create a simple Node.js application that we can use as our example. Create a directory on your local machine named `node-docker` and follow the steps below to create a simple REST API.
@y
Let’s create a simple Node.js application that we can use as our example. Create a directory on your local machine named `node-docker` and follow the steps below to create a simple REST API.
@z

@x
```shell
$ cd [path to your node-docker directory]
$ npm init -y
$ npm install ronin-server ronin-mocks
$ touch server.js
```
@y
```shell
$ cd [path to your node-docker directory]
$ npm init -y
$ npm install ronin-server ronin-mocks
$ touch server.js
```
@z

@x
Now, let’s add some code to handle our REST requests. We’ll use a mock server so we can focus on Dockerizing the application.
@y
Now, let’s add some code to handle our REST requests. We’ll use a mock server so we can focus on Dockerizing the application.
@z

@x
Open this working directory in your IDE and add the following code into the `server.js` file.
@y
Open this working directory in your IDE and add the following code into the `server.js` file.
@z

@x
```node
const ronin     = require( 'ronin-server' )
const mocks     = require( 'ronin-mocks' )
@y
```node
const ronin     = require( 'ronin-server' )
const mocks     = require( 'ronin-mocks' )
@z

@x
const server = ronin.server()
@y
const server = ronin.server()
@z

@x
server.use( '/', mocks.server( server.Router(), false, true ) )
server.start()
```
@y
server.use( '/', mocks.server( server.Router(), false, true ) )
server.start()
```
@z

@x
The mocking server is called `Ronin.js` and will listen on port 8000 by default. You can make POST requests to the root (/) endpoint and any JSON structure you send to the server will be saved in memory. You can also send GET requests to the same endpoint and receive an array of JSON objects that you have previously POSTed.
@y
The mocking server is called `Ronin.js` and will listen on port 8000 by default. You can make POST requests to the root (/) endpoint and any JSON structure you send to the server will be saved in memory. You can also send GET requests to the same endpoint and receive an array of JSON objects that you have previously POSTed.
@z

@x
## Test application
@y
## Test application
@z

@x
Let’s start our application and make sure it’s running properly. Open your terminal and navigate to your working directory you created.
@y
Let’s start our application and make sure it’s running properly. Open your terminal and navigate to your working directory you created.
@z

@x
```shell
$ node server.js
```
@y
```shell
$ node server.js
```
@z

@x
To test that the application is working properly, we’ll first POST some JSON to the API and then make a GET request to see that the data has been saved. Open a new terminal and run the following curl commands:
@y
To test that the application is working properly, we’ll first POST some JSON to the API and then make a GET request to see that the data has been saved. Open a new terminal and run the following curl commands:
@z

@x
```shell
$ curl --request POST \
  --url http://localhost:8000/test \
  --header 'content-type: application/json' \
  --data '{"msg": "testing" }'
{"code":"success","payload":[{"msg":"testing","id":"31f23305-f5d0-4b4f-a16f-6f4c8ec93cf1","createDate":"2020-08-28T21:53:07.157Z"}]}
@y
```shell
$ curl --request POST \
  --url http://localhost:8000/test \
  --header 'content-type: application/json' \
  --data '{"msg": "testing" }'
{"code":"success","payload":[{"msg":"testing","id":"31f23305-f5d0-4b4f-a16f-6f4c8ec93cf1","createDate":"2020-08-28T21:53:07.157Z"}]}
@z

@x
$ curl http://localhost:8000/test
{"code":"success","meta":{"total":1,"count":1},"payload":[{"msg":"testing","id":"31f23305-f5d0-4b4f-a16f-6f4c8ec93cf1","createDate":"2020-08-28T21:53:07.157Z"}]}
```
@y
$ curl http://localhost:8000/test
{"code":"success","meta":{"total":1,"count":1},"payload":[{"msg":"testing","id":"31f23305-f5d0-4b4f-a16f-6f4c8ec93cf1","createDate":"2020-08-28T21:53:07.157Z"}]}
```
@z

@x
Switch back to the terminal where our server is running. You should now see the following requests in the server logs.
@y
Switch back to the terminal where our server is running. You should now see the following requests in the server logs.
@z

@x
```node
2020-XX-31T16:35:08:4260  INFO: POST /test
2020-XX-31T16:35:21:3560  INFO: GET /test
```
@y
```node
2020-XX-31T16:35:08:4260  INFO: POST /test
2020-XX-31T16:35:21:3560  INFO: GET /test
```
@z

@x
## Create a Dockerfile for Node.js
@y
## Create a Dockerfile for Node.js
@z

@x
A Dockerfile is a text document that contains all the commands a user could call on the command line to assemble an image. When we tell Docker to build our image by executing the `docker build` command, Docker reads these instructions and executes them one by one and creates a Docker image as a result.
@y
A Dockerfile is a text document that contains all the commands a user could call on the command line to assemble an image. When we tell Docker to build our image by executing the `docker build` command, Docker reads these instructions and executes them one by one and creates a Docker image as a result.
@z

@x
Let’s walk through the process of creating a Dockerfile for our application. In the root of your working directory, create a file named `Dockerfile` and open this file in your text editor.
@y
Let’s walk through the process of creating a Dockerfile for our application. In the root of your working directory, create a file named `Dockerfile` and open this file in your text editor.
@z

@x
> **Note**
>
> The name of the Dockerfile is not important but the default filename for many commands is simply `Dockerfile`. So, we’ll use that as our filename throughout this series.
@y
> **Note**
>
> The name of the Dockerfile is not important but the default filename for many commands is simply `Dockerfile`. So, we’ll use that as our filename throughout this series.
@z

@x
The first thing we need to do is to add a line in our Dockerfile that tells Docker what base image we would like to use for our application.
@y
The first thing we need to do is to add a line in our Dockerfile that tells Docker what base image we would like to use for our application.
@z

@x
```dockerfile
FROM node:12.18.1
```
@y
```dockerfile
FROM node:12.18.1
```
@z

@x
Docker images can be inherited from other images. Therefore, instead of creating our own base image, we’ll use the official Node.js image that already has all the tools and packages that we need to run a Node.js application. You can think of this in the same way you would think about class inheritance in object oriented programming. For example, if we were able to create Docker images in JavaScript, we might write something like the following.
@y
Docker images can be inherited from other images. Therefore, instead of creating our own base image, we’ll use the official Node.js image that already has all the tools and packages that we need to run a Node.js application. You can think of this in the same way you would think about class inheritance in object oriented programming. For example, if we were able to create Docker images in JavaScript, we might write something like the following.
@z

@x
`class MyImage extends NodeBaseImage {}`
@y
`class MyImage extends NodeBaseImage {}`
@z

@x
This would create a class called `MyImage` that inherited functionality from the base class `NodeBaseImage`.
@y
This would create a class called `MyImage` that inherited functionality from the base class `NodeBaseImage`.
@z

@x
In the same way, when we use the `FROM` command, we tell Docker to include in our image all the functionality from the `node:12.18.1` image.
@y
In the same way, when we use the `FROM` command, we tell Docker to include in our image all the functionality from the `node:12.18.1` image.
@z

@x
> **Note**
>
> If you want to learn more about creating your own base images, see [Creating base images](https://docs.docker.com/develop/develop-images/baseimages/).
@y
> **Note**
>
> If you want to learn more about creating your own base images, see [Creating base images](https://docs.docker.com/develop/develop-images/baseimages/).
@z

@x
The `NODE_ENV` environment variable specifies the environment in which an application is running (usually, development or production). One of the simplest things you can do to improve performance is to set `NODE_ENV` to `production`.
@y
The `NODE_ENV` environment variable specifies the environment in which an application is running (usually, development or production). One of the simplest things you can do to improve performance is to set `NODE_ENV` to `production`.
@z

@x
```dockerfile
ENV NODE_ENV=production
```
@y
```dockerfile
ENV NODE_ENV=production
```
@z

@x
To make things easier when running the rest of our commands, let’s create a working directory. This instructs Docker to use this path as the default location for all subsequent commands. This way we do not have to type out full file paths but can use relative paths based on the working directory.
@y
To make things easier when running the rest of our commands, let’s create a working directory. This instructs Docker to use this path as the default location for all subsequent commands. This way we do not have to type out full file paths but can use relative paths based on the working directory.
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
Usually the very first thing you do once you’ve downloaded a project written in Node.js is to install npm packages. This will ensure that your application has all its dependencies installed into the `node_modules` directory where the Node runtime will be able to find them.
@y
Usually the very first thing you do once you’ve downloaded a project written in Node.js is to install npm packages. This will ensure that your application has all its dependencies installed into the `node_modules` directory where the Node runtime will be able to find them.
@z

@x
Before we can run `npm install`, we need to get our `package.json` and `package-lock.json` files into our images. We use the `COPY` command to do this. The  `COPY` command takes two parameters. The first parameter tells Docker what file(s) you would like to copy into the image. The second parameter tells Docker where you want that file(s) to be copied to. We’ll copy the `package.json` and `package-lock.json` file into our working directory `/app`.
@y
Before we can run `npm install`, we need to get our `package.json` and `package-lock.json` files into our images. We use the `COPY` command to do this. The  `COPY` command takes two parameters. The first parameter tells Docker what file(s) you would like to copy into the image. The second parameter tells Docker where you want that file(s) to be copied to. We’ll copy the `package.json` and `package-lock.json` file into our working directory `/app`.
@z

@x
```dockerfile
COPY ["package.json", "package-lock.json*", "./"]
```
@y
```dockerfile
COPY ["package.json", "package-lock.json*", "./"]
```
@z

@x
Once we have our `package.json` files inside the image, we can use the `RUN` command to execute the command npm install. This works exactly the same as if we were running npm install locally on our machine, but this time these Node modules will be installed into the `node_modules` directory inside our image.
@y
Once we have our `package.json` files inside the image, we can use the `RUN` command to execute the command npm install. This works exactly the same as if we were running npm install locally on our machine, but this time these Node modules will be installed into the `node_modules` directory inside our image.
@z

@x
```dockerfile
RUN npm install --production
```
@y
```dockerfile
RUN npm install --production
```
@z

@x
At this point, we have an image that is based on node version 12.18.1 and we have installed our dependencies. The next thing we need to do is to add our source code into the image. We’ll use the COPY command just like we did with our `package.json` files above.
@y
At this point, we have an image that is based on node version 12.18.1 and we have installed our dependencies. The next thing we need to do is to add our source code into the image. We’ll use the COPY command just like we did with our `package.json` files above.
@z

@x
```dockerfile
COPY . .
```
@y
```dockerfile
COPY . .
```
@z

@x
The COPY command takes all the files located in the current directory and copies them into the image. Now, all we have to do is to tell Docker what command we want to run when our image is run inside of a container. We do this with the `CMD` command.
@y
The COPY command takes all the files located in the current directory and copies them into the image. Now, all we have to do is to tell Docker what command we want to run when our image is run inside of a container. We do this with the `CMD` command.
@z

@x
```dockerfile
CMD [ "node", "server.js" ]
```
@y
```dockerfile
CMD [ "node", "server.js" ]
```
@z

@x
Here's the complete Dockerfile.
@y
Here's the complete Dockerfile.
@z

@x
```dockerfile
FROM node:12.18.1
ENV NODE_ENV=production
@y
```dockerfile
FROM node:12.18.1
ENV NODE_ENV=production
@z

@x
WORKDIR /app
@y
WORKDIR /app
@z

@x
COPY ["package.json", "package-lock.json*", "./"]
@y
COPY ["package.json", "package-lock.json*", "./"]
@z

@x
RUN npm install --production
@y
RUN npm install --production
@z

@x
COPY . .
@y
COPY . .
@z

@x
CMD [ "node", "server.js" ]
```
@y
CMD [ "node", "server.js" ]
```
@z

@x
## Build image
@y
## Build image
@z

@x
Now that we’ve created our Dockerfile, let’s build our image. To do this, we use the `docker build` command. The `docker build` command builds Docker images from a Dockerfile and a “context”. A build’s context is the set of files located in the specified PATH or URL. The Docker build process can access any of the files located in the context.
@y
Now that we’ve created our Dockerfile, let’s build our image. To do this, we use the `docker build` command. The `docker build` command builds Docker images from a Dockerfile and a “context”. A build’s context is the set of files located in the specified PATH or URL. The Docker build process can access any of the files located in the context.
@z

@x
The build command optionally takes a `--tag` flag. The tag is used to set the name of the image and an optional tag in the format `‘name:tag’`. We’ll leave off the optional “tag” for now to help simplify things. If you do not pass a tag, Docker will use “latest” as its default tag. You’ll see this in the last line of the build output.
@y
The build command optionally takes a `--tag` flag. The tag is used to set the name of the image and an optional tag in the format `‘name:tag’`. We’ll leave off the optional “tag” for now to help simplify things. If you do not pass a tag, Docker will use “latest” as its default tag. You’ll see this in the last line of the build output.
@z

@x
Let’s build our first Docker image.
@y
Let’s build our first Docker image.
@z

@x
```shell
$ docker build --tag node-docker .
```
@y
```shell
$ docker build --tag node-docker .
```
@z

@x
```shell
Sending build context to Docker daemon  82.94kB
Step 1/7 : FROM node:12.18.1
---> f5be1883c8e0
Step 2/7 : WORKDIR /code
...
Successfully built e03018e56163
Successfully tagged node-docker:latest
```
@y
```shell
Sending build context to Docker daemon  82.94kB
Step 1/7 : FROM node:12.18.1
---> f5be1883c8e0
Step 2/7 : WORKDIR /code
...
Successfully built e03018e56163
Successfully tagged node-docker:latest
```
@z

@x
## Viewing local images
@y
## Viewing local images
@z

@x
To see a list of images we have on our local machine, we have two options. One is to use the CLI and the other is to use Docker Desktop. Since we are currently working in the terminal let’s take a look at listing images with the CLI.
@y
To see a list of images we have on our local machine, we have two options. One is to use the CLI and the other is to use Docker Desktop. Since we are currently working in the terminal let’s take a look at listing images with the CLI.
@z

@x
To list images, simply run the `images` command.
@y
To list images, simply run the `images` command.
@z

@x
```shell
$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED              SIZE
node-docker         latest              3809733582bc        About a minute ago   945MB
node                12.18.1             f5be1883c8e0        2 months ago         918MB
```
@y
```shell
$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED              SIZE
node-docker         latest              3809733582bc        About a minute ago   945MB
node                12.18.1             f5be1883c8e0        2 months ago         918MB
```
@z

@x
You should see at least two images listed. One for the base image `node:12.18.1` and the other for our image we just build `node-docker:latest`.
@y
You should see at least two images listed. One for the base image `node:12.18.1` and the other for our image we just build `node-docker:latest`.
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
An image is made up of a manifest and a list of layers. In simple terms, a “tag” points to a combination of these artifacts. You can have multiple tags for an image. Let’s create a second tag for the image we built and take a look at its layers.
@y
An image is made up of a manifest and a list of layers. In simple terms, a “tag” points to a combination of these artifacts. You can have multiple tags for an image. Let’s create a second tag for the image we built and take a look at its layers.
@z

@x
To create a new tag for the image we built above, run the following command.
@y
To create a new tag for the image we built above, run the following command.
@z

@x
```shell
$ docker tag node-docker:latest node-docker:v1.0.0
```
@y
```shell
$ docker tag node-docker:latest node-docker:v1.0.0
```
@z

@x
The Docker tag command creates a new tag for an image. It does not create a new image. The tag points to the same image and is just another way to reference the image.
@y
The Docker tag command creates a new tag for an image. It does not create a new image. The tag points to the same image and is just another way to reference the image.
@z

@x
Now run the `docker images` command to see a list of our local images.
@y
Now run the `docker images` command to see a list of our local images.
@z

@x
```
$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
node-docker         latest              3809733582bc        24 minutes ago      945MB
node-docker         v1.0.0              3809733582bc        24 minutes ago      945MB
node                12.18.1             f5be1883c8e0        2 months ago        918MB
```
@y
```
$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
node-docker         latest              3809733582bc        24 minutes ago      945MB
node-docker         v1.0.0              3809733582bc        24 minutes ago      945MB
node                12.18.1             f5be1883c8e0        2 months ago        918MB
```
@z

@x
You can see that we have two images that start with `node-docker`. We know they are the same image because if you look at the IMAGE ID column, you can see that the values are the same for the two images.
@y
You can see that we have two images that start with `node-docker`. We know they are the same image because if you look at the IMAGE ID column, you can see that the values are the same for the two images.
@z

@x
Let’s remove the tag that we just created. To do this, we’ll use the rmi command. The rmi command stands for “remove image”.
@y
Let’s remove the tag that we just created. To do this, we’ll use the rmi command. The rmi command stands for “remove image”.
@z

@x
```shell
$ docker rmi node-docker:v1.0.0
Untagged: node-docker:v1.0.0
```
@y
```shell
$ docker rmi node-docker:v1.0.0
Untagged: node-docker:v1.0.0
```
@z

@x
Notice that the response from Docker tells us that the image has not been removed but only “untagged”. Verify this by running the images command.
@y
Notice that the response from Docker tells us that the image has not been removed but only “untagged”. Verify this by running the images command.
@z

@x
```shell
$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
node-docker         latest              3809733582bc        32 minutes ago      945MB
node                12.18.1             f5be1883c8e0        2 months ago        918MB
```
@y
```shell
$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
node-docker         latest              3809733582bc        32 minutes ago      945MB
node                12.18.1             f5be1883c8e0        2 months ago        918MB
```
@z

@x
Our image that was tagged with `:v1.0.0` has been removed but we still have the `node-docker:latest` tag available on our machine.
@y
Our image that was tagged with `:v1.0.0` has been removed but we still have the `node-docker:latest` tag available on our machine.
@z

@x
## Next steps
@y
## Next steps
@z

@x
In this module, we took a look at setting up our example Node application that we will use for the rest of the tutorial. We also created a Dockerfile that we used to build our Docker image. Then, we took a look at tagging our images and removing images. In the next module, we’ll take a look at how to:
@y
In this module, we took a look at setting up our example Node application that we will use for the rest of the tutorial. We also created a Dockerfile that we used to build our Docker image. Then, we took a look at tagging our images and removing images. In the next module, we’ll take a look at how to:
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
Help us improve this topic by providing your feedback. Let us know what you think by creating an issue in the [Docker Docs ](https://github.com/docker/docker.github.io/issues/new?title=[Node.js%20docs%20feedback]){:target="_blank" rel="noopener" class="_"} GitHub repository. Alternatively, [create a PR](https://github.com/docker/docker.github.io/pulls){:target="_blank" rel="noopener" class="_"} to suggest updates.
@y
Help us improve this topic by providing your feedback. Let us know what you think by creating an issue in the [Docker Docs ](https://github.com/docker/docker.github.io/issues/new?title=[Node.js%20docs%20feedback]){:target="_blank" rel="noopener" class="_"} GitHub repository. Alternatively, [create a PR](https://github.com/docker/docker.github.io/pulls){:target="_blank" rel="noopener" class="_"} to suggest updates.
@z

@x
<br />
@y
<br />
@z
