%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: "Our Application"
keywords: get started, setup, orientation, quickstart, intro, concepts, containers, docker desktop
description: overview of our simple applicaiton for learning docker
---
@y
---
title: "Our Application"
keywords: get started, setup, orientation, quickstart, intro, concepts, containers, docker desktop
description: overview of our simple applicaiton for learning docker
---
@z

@x
For the rest of this tutorial, we will be working with a simple todo
list manager that is running in Node.js. If you're not familiar with Node.js,
don't worry! No real JavaScript experience is needed!
@y
For the rest of this tutorial, we will be working with a simple todo
list manager that is running in Node.js. If you're not familiar with Node.js,
don't worry! No real JavaScript experience is needed!
@z

@x
At this point, your development team is quite small and you're simply
building an app to prove out your MVP (minimum viable product). You want
to show how it works and what it's capable of doing without needing to
think about how it will work for a large team, multiple developers, etc.
@y
At this point, your development team is quite small and you're simply
building an app to prove out your MVP (minimum viable product). You want
to show how it works and what it's capable of doing without needing to
think about how it will work for a large team, multiple developers, etc.
@z

@x
![Todo List Manager Screenshot](images/todo-list-sample.png){: style="width:50%;" }
@y
![Todo List Manager Screenshot](images/todo-list-sample.png){: style="width:50%;" }
@z

@x
## Getting our App
@y
## Getting our App
@z

@x
Before we can run the application, we need to get the application source code onto 
our machine. For real projects, you will typically clone the repo. But, for this tutorial,
we have created a ZIP file containing the application.
@y
Before we can run the application, we need to get the application source code onto 
our machine. For real projects, you will typically clone the repo. But, for this tutorial,
we have created a ZIP file containing the application.
@z

@x
1. [Download the App contents](https://github.com/docker/getting-started/tree/master/app). You can either pull the entire project or download it as a zip and extract the app folder out to get started with
@y
1. [Download the App contents](https://github.com/docker/getting-started/tree/master/app). You can either pull the entire project or download it as a zip and extract the app folder out to get started with
@z

@x
1. Once extracted, use your favorite code editor to open the project. If you're in need of
    an editor, you can use [Visual Studio Code](https://code.visualstudio.com/). You should
    see the `package.json` and two subdirectories (`src` and `spec`).
@y
1. Once extracted, use your favorite code editor to open the project. If you're in need of
    an editor, you can use [Visual Studio Code](https://code.visualstudio.com/). You should
    see the `package.json` and two subdirectories (`src` and `spec`).
@z

@x
    ![Screenshot of Visual Studio Code opened with the app loaded](images/ide-screenshot.png){: style="width:650px;margin-top:20px;"}
    {: .text-center }
@y
    ![Screenshot of Visual Studio Code opened with the app loaded](images/ide-screenshot.png){: style="width:650px;margin-top:20px;"}
    {: .text-center }
@z

@x
## Building the App's Container Image
@y
## Building the App's Container Image
@z

@x
In order to build the application, we need to use a `Dockerfile`. A
Dockerfile is simply a text-based script of instructions that is used to
create a container image. If you've created Dockerfiles before, you might
see a few flaws in the Dockerfile below. But, don't worry! We'll go over them.
@y
In order to build the application, we need to use a `Dockerfile`. A
Dockerfile is simply a text-based script of instructions that is used to
create a container image. If you've created Dockerfiles before, you might
see a few flaws in the Dockerfile below. But, don't worry! We'll go over them.
@z

@x
1. Create a file named `Dockerfile` in the same folder as the file `package.json` with the following contents.
@y
1. Create a file named `Dockerfile` in the same folder as the file `package.json` with the following contents.
@z

@x
    ```dockerfile
    FROM node:12-alpine
    WORKDIR /app
    COPY . .
    RUN yarn install --production
    CMD ["node", "src/index.js"]
    ```
@y
    ```dockerfile
    FROM node:12-alpine
    WORKDIR /app
    COPY . .
    RUN yarn install --production
    CMD ["node", "src/index.js"]
    ```
@z

@x
    Please check that the file `Dockerfile` has no file extension like `.txt`. Some editors may append this file extension automatically and this would result in an error in the next step.
@y
    Please check that the file `Dockerfile` has no file extension like `.txt`. Some editors may append this file extension automatically and this would result in an error in the next step.
@z

@x
1. If you haven't already done so, open a terminal and go to the `app` directory with the `Dockerfile`. Now build the container image using the `docker build` command.
@y
1. If you haven't already done so, open a terminal and go to the `app` directory with the `Dockerfile`. Now build the container image using the `docker build` command.
@z

@x
    ```bash
    docker build -t getting-started .
    ```
@y
    ```bash
    docker build -t getting-started .
    ```
@z

@x
    This command used the Dockerfile to build a new container image. You might
    have noticed that a lot of "layers" were downloaded. This is because we instructed
    the builder that we wanted to start from the `node:12-alpine` image. But, since we
    didn't have that on our machine, that image needed to be downloaded.
@y
    This command used the Dockerfile to build a new container image. You might
    have noticed that a lot of "layers" were downloaded. This is because we instructed
    the builder that we wanted to start from the `node:12-alpine` image. But, since we
    didn't have that on our machine, that image needed to be downloaded.
@z

@x
    After the image was downloaded, we copied in our application and used `yarn` to 
    install our application's dependencies. The `CMD` directive specifies the default 
    command to run when starting a container from this image.
@y
    After the image was downloaded, we copied in our application and used `yarn` to 
    install our application's dependencies. The `CMD` directive specifies the default 
    command to run when starting a container from this image.
@z

@x
    Finally, the `-t` flag tags our image. Think of this simply as a human-readable name
    for the final image. Since we named the image `getting-started`, we can refer to that
    image when we run a container.
@y
    Finally, the `-t` flag tags our image. Think of this simply as a human-readable name
    for the final image. Since we named the image `getting-started`, we can refer to that
    image when we run a container.
@z

@x
    The `.` at the end of the `docker build` command tells that Docker should look for the `Dockerfile` in the current directory.
@y
    The `.` at the end of the `docker build` command tells that Docker should look for the `Dockerfile` in the current directory.
@z

@x
## Starting an App Container
@y
## Starting an App Container
@z

@x
Now that we have an image, let's run the application! To do so, we will use the `docker run`
command (remember that from earlier?).
@y
Now that we have an image, let's run the application! To do so, we will use the `docker run`
command (remember that from earlier?).
@z

@x
1. Start your container using the `docker run` command and specify the name of the image we 
    just created:
@y
1. Start your container using the `docker run` command and specify the name of the image we 
    just created:
@z

@x
    ```bash
    docker run -dp 3000:3000 getting-started
    ```
@y
    ```bash
    docker run -dp 3000:3000 getting-started
    ```
@z

@x
    Remember the `-d` and `-p` flags? We're running the new container in "detached" mode (in the 
    background) and creating a mapping between the host's port 3000 to the container's port 3000.
    Without the port mapping, we wouldn't be able to access the application.
@y
    Remember the `-d` and `-p` flags? We're running the new container in "detached" mode (in the 
    background) and creating a mapping between the host's port 3000 to the container's port 3000.
    Without the port mapping, we wouldn't be able to access the application.
@z

@x
1. After a few seconds, open your web browser to [http://localhost:3000](http://localhost:3000).
    You should see our app!
@y
1. After a few seconds, open your web browser to [http://localhost:3000](http://localhost:3000).
    You should see our app!
@z

@x
    ![Empty Todo List](images/todo-list-empty.png){: style="width:450px;margin-top:20px;"}
    {: .text-center }
@y
    ![Empty Todo List](images/todo-list-empty.png){: style="width:450px;margin-top:20px;"}
    {: .text-center }
@z

@x
1. Go ahead and add an item or two and see that it works as you expect. You can mark items as
   complete and remove items. Your frontend is successfully storing items in the backend!
   Pretty quick and easy, huh?
@y
1. Go ahead and add an item or two and see that it works as you expect. You can mark items as
   complete and remove items. Your frontend is successfully storing items in the backend!
   Pretty quick and easy, huh?
@z

@x
At this point, you should have a running todo list manager with a few items, all built by you!
Now, let's make a few changes and learn about managing our containers.
@y
At this point, you should have a running todo list manager with a few items, all built by you!
Now, let's make a few changes and learn about managing our containers.
@z

@x
If you take a quick look at the Docker Dashboard, you should see your two containers running now 
(this tutorial and your freshly launched app container)!
@y
If you take a quick look at the Docker Dashboard, you should see your two containers running now 
(this tutorial and your freshly launched app container)!
@z

@x
![Docker Dashboard with tutorial and app containers running](images/dashboard-two-containers.png)
@y
![Docker Dashboard with tutorial and app containers running](images/dashboard-two-containers.png)
@z

@x
## Recap
@y
## Recap
@z

@x
In this short section, we learned the very basics about building a container image and created a
Dockerfile to do so. Once we built an image, we started the container and saw the running app!
@y
In this short section, we learned the very basics about building a container image and created a
Dockerfile to do so. Once we built an image, we started the container and saw the running app!
@z

@x
Next, we're going to make a modification to our app and learn how to update our running application
with a new image. Along the way, we'll learn a few other useful commands.
@y
Next, we're going to make a modification to our app and learn how to update our running application
with a new image. Along the way, we'll learn a few other useful commands.
@z
