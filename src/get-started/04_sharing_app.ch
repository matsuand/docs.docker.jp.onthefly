%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: "Sharing Our Application"
keywords: get started, setup, orientation, quickstart, intro, concepts, containers, docker desktop, docker hub, sharing 
description: Sharing our image we built for our example application so we can run it else where and other developers can use it
---
@y
---
title: "Sharing Our Application"
keywords: get started, setup, orientation, quickstart, intro, concepts, containers, docker desktop, docker hub, sharing 
description: Sharing our image we built for our example application so we can run it else where and other developers can use it
---
@z

@x
Now that we've built an image, let's share it! To share Docker images, you have to use a Docker
registry. The default registry is Docker Hub and is where all of the images we've used have come from.
@y
Now that we've built an image, let's share it! To share Docker images, you have to use a Docker
registry. The default registry is Docker Hub and is where all of the images we've used have come from.
@z

@x
## Create a Repo
@y
## Create a Repo
@z

@x
To push an image, we first need to create a repo on Docker Hub.
@y
To push an image, we first need to create a repo on Docker Hub.
@z

@x
1. Go to [Docker Hub](https://hub.docker.com) and log in if you need to.
@y
1. Go to [Docker Hub](https://hub.docker.com) and log in if you need to.
@z

@x
1. Click the **Create Repository** button.
@y
1. Click the **Create Repository** button.
@z

@x
1. For the repo name, use `getting-started`. Make sure the Visibility is `Public`.
@y
1. For the repo name, use `getting-started`. Make sure the Visibility is `Public`.
@z

@x
1. Click the **Create** button!
@y
1. Click the **Create** button!
@z

@x
If you look on the right-side of the page, you'll see a section named **Docker commands**. This gives
an example command that you will need to run to push to this repo.
@y
If you look on the right-side of the page, you'll see a section named **Docker commands**. This gives
an example command that you will need to run to push to this repo.
@z

@x
![Docker command with push example](images/push-command.png){: style=width:75% }
{: .text-center }
@y
![Docker command with push example](images/push-command.png){: style=width:75% }
{: .text-center }
@z

@x
## Pushing our Image
@y
## Pushing our Image
@z

@x
1. In the command line, try running the push command you see on Docker Hub. Note that your command
   will be using your namespace, not "docker".
@y
1. In the command line, try running the push command you see on Docker Hub. Note that your command
   will be using your namespace, not "docker".
@z

@x
    ```plaintext
    $ docker push docker/getting-started
    The push refers to repository [docker.io/docker/getting-started]
    An image does not exist locally with the tag: docker/getting-started
    ```
@y
    ```plaintext
    $ docker push docker/getting-started
    The push refers to repository [docker.io/docker/getting-started]
    An image does not exist locally with the tag: docker/getting-started
    ```
@z

@x
    Why did it fail? The push command was looking for an image named docker/getting-started, but
    didn't find one. If you run `docker image ls`, you won't see one either.
@y
    Why did it fail? The push command was looking for an image named docker/getting-started, but
    didn't find one. If you run `docker image ls`, you won't see one either.
@z

@x
    To fix this, we need to "tag" our existing image we've built to give it another name.
@y
    To fix this, we need to "tag" our existing image we've built to give it another name.
@z

@x
1. Login to the Docker Hub using the command `docker login -u YOUR-USER-NAME`.
@y
1. Login to the Docker Hub using the command `docker login -u YOUR-USER-NAME`.
@z

@x
1. Use the `docker tag` command to give the `getting-started` image a new name. Be sure to swap out
   `YOUR-USER-NAME` with your Docker ID.
@y
1. Use the `docker tag` command to give the `getting-started` image a new name. Be sure to swap out
   `YOUR-USER-NAME` with your Docker ID.
@z

@x
    ```bash
    docker tag getting-started YOUR-USER-NAME/getting-started
    ```
@y
    ```bash
    docker tag getting-started YOUR-USER-NAME/getting-started
    ```
@z

@x
1. Now try your push command again. If you're copying the value from Docker Hub, you can drop the 
   `tagname` portion, as we didn't add a tag to the image name. If you don't specify a tag, Docker
   will use a tag called `latest`.
@y
1. Now try your push command again. If you're copying the value from Docker Hub, you can drop the 
   `tagname` portion, as we didn't add a tag to the image name. If you don't specify a tag, Docker
   will use a tag called `latest`.
@z

@x
    ```bash
    docker push YOUR-USER-NAME/getting-started
    ```
@y
    ```bash
    docker push YOUR-USER-NAME/getting-started
    ```
@z

@x
## Running our Image on a New Instance
@y
## Running our Image on a New Instance
@z

@x
Now that our image has been built and pushed into a registry, let's try running our app on a brand
new instance that has never seen this container image! To do this, we will use Play with Docker.
@y
Now that our image has been built and pushed into a registry, let's try running our app on a brand
new instance that has never seen this container image! To do this, we will use Play with Docker.
@z

@x
1. Open your browser to [Play with Docker](http://play-with-docker.com).
@y
1. Open your browser to [Play with Docker](http://play-with-docker.com).
@z

@x
1. Log in with your Docker Hub account.
@y
1. Log in with your Docker Hub account.
@z

@x
1. Once you're logged in, click on the "+ ADD NEW INSTANCE" link in the left side bar. (If you don't see it, make your browser a little wider.) After a few seconds, a terminal window will be opened in your browser.
@y
1. Once you're logged in, click on the "+ ADD NEW INSTANCE" link in the left side bar. (If you don't see it, make your browser a little wider.) After a few seconds, a terminal window will be opened in your browser.
@z

@x
    ![Play with Docker add new instance](images/pwd-add-new-instance.png){: style=width:75% }
{: .text-center }
@y
    ![Play with Docker add new instance](images/pwd-add-new-instance.png){: style=width:75% }
{: .text-center }
@z

@x
1. In the terminal, start your freshly pushed app.
@y
1. In the terminal, start your freshly pushed app.
@z

@x
    ```bash
    docker run -dp 3000:3000 YOUR-USER-NAME/getting-started
    ```
@y
    ```bash
    docker run -dp 3000:3000 YOUR-USER-NAME/getting-started
    ```
@z

@x
    You should see the image get pulled down and eventually start up!
@y
    You should see the image get pulled down and eventually start up!
@z

@x
1. Click on the 3000 badge when it comes up and you should see the app with your modifications! Hooray!
    If the 3000 badge doesn't show up, you can click on the "Open Port" button and type in 3000.
@y
1. Click on the 3000 badge when it comes up and you should see the app with your modifications! Hooray!
    If the 3000 badge doesn't show up, you can click on the "Open Port" button and type in 3000.
@z

@x
## Recap
@y
## Recap
@z

@x
In this section, we learned how to share our images by pushing them to a registry. We then went to a
brand new instance and were able to run the freshly pushed image. This is quite common in CI pipelines,
where the pipeline will create the image and push it to a registry and then the production environment
can use the latest version of the image.
@y
In this section, we learned how to share our images by pushing them to a registry. We then went to a
brand new instance and were able to run the freshly pushed image. This is quite common in CI pipelines,
where the pipeline will create the image and push it to a registry and then the production environment
can use the latest version of the image.
@z

@x
Now that we have that figured out, let's circle back around to what we noticed at the end of the last
section. As a reminder, we noticed that when we restarted the app, we lost all of our todo list items.
That's obviously not a great user experience, so let's learn how we can persist the data across 
restarts!
@y
Now that we have that figured out, let's circle back around to what we noticed at the end of the last
section. As a reminder, we noticed that when we restarted the app, we lost all of our todo list items.
That's obviously not a great user experience, so let's learn how we can persist the data across 
restarts!
@z
