%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: "Updating our Application"
keywords: get started, setup, orientation, quickstart, intro, concepts, containers, docker desktop
description: Making changes to our example learning application
---
@y
---
title: "Updating our Application"
keywords: get started, setup, orientation, quickstart, intro, concepts, containers, docker desktop
description: Making changes to our example learning application
---
@z

@x
As a small feature request, we've been asked by the product team to
change the "empty text" when we don't have any todo list items. They
would like to transition it to the following:
@y
As a small feature request, we've been asked by the product team to
change the "empty text" when we don't have any todo list items. They
would like to transition it to the following:
@z

@x
> You have no todo items yet! Add one above!
@y
> You have no todo items yet! Add one above!
@z

@x
Pretty simple, right? Let's make the change.
@y
Pretty simple, right? Let's make the change.
@z

@x
## Updating our Source Code
@y
## Updating our Source Code
@z

@x
1. In the `src/static/js/app.js` file, update line 56 to use the new empty text.
@y
1. In the `src/static/js/app.js` file, update line 56 to use the new empty text.
@z

@x
    ```diff
    -                <p className="text-center">No items yet! Add one above!</p>
    +                <p className="text-center">You have no todo items yet! Add one above!</p>
    ```
@y
    ```diff
    -                <p className="text-center">No items yet! Add one above!</p>
    +                <p className="text-center">You have no todo items yet! Add one above!</p>
    ```
@z

@x
1. Let's build our updated version of the image, using the same command we used before.
@y
1. Let's build our updated version of the image, using the same command we used before.
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
1. Let's start a new container using the updated code.
@y
1. Let's start a new container using the updated code.
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
**Uh oh!** You probably saw an error like this (the IDs will be different):
@y
**Uh oh!** You probably saw an error like this (the IDs will be different):
@z

@x
```bash
docker: Error response from daemon: driver failed programming external connectivity on endpoint laughing_burnell 
(bb242b2ca4d67eba76e79474fb36bb5125708ebdabd7f45c8eaf16caaabde9dd): Bind for 0.0.0.0:3000 failed: port is already allocated.
```
@y
```bash
docker: Error response from daemon: driver failed programming external connectivity on endpoint laughing_burnell 
(bb242b2ca4d67eba76e79474fb36bb5125708ebdabd7f45c8eaf16caaabde9dd): Bind for 0.0.0.0:3000 failed: port is already allocated.
```
@z

@x
So, what happened? We aren't able to start the new container because our old container is still
running. The reason this is a problem is because that container is using the host's port 3000 and
only one process on the machine (containers included) can listen to a specific port. To fix this, 
we need to remove the old container.
@y
So, what happened? We aren't able to start the new container because our old container is still
running. The reason this is a problem is because that container is using the host's port 3000 and
only one process on the machine (containers included) can listen to a specific port. To fix this, 
we need to remove the old container.
@z

@x
## Replacing our Old Container
@y
## Replacing our Old Container
@z

@x
To remove a container, it first needs to be stopped. Once it has stopped, it can be removed. We have two
ways that we can remove the old container. Feel free to choose the path that you're most comfortable with.
@y
To remove a container, it first needs to be stopped. Once it has stopped, it can be removed. We have two
ways that we can remove the old container. Feel free to choose the path that you're most comfortable with.
@z

@x
### Removing a container using the CLI
@y
### Removing a container using the CLI
@z

@x
1. Get the ID of the container by using the `docker ps` command.
@y
1. Get the ID of the container by using the `docker ps` command.
@z

@x
    ```bash
    docker ps
    ```
@y
    ```bash
    docker ps
    ```
@z

@x
1. Use the `docker stop` command to stop the container.
@y
1. Use the `docker stop` command to stop the container.
@z

@x
    ```bash
    # Swap out <the-container-id> with the ID from docker ps
    docker stop <the-container-id>
    ```
@y
    ```bash
    # Swap out <the-container-id> with the ID from docker ps
    docker stop <the-container-id>
    ```
@z

@x
1. Once the container has stopped, you can remove it by using the `docker rm` command.
@y
1. Once the container has stopped, you can remove it by using the `docker rm` command.
@z

@x
    ```bash
    docker rm <the-container-id>
    ```
@y
    ```bash
    docker rm <the-container-id>
    ```
@z

@x
>**Note**
>
>You can stop and remove a container in a single command by adding the "force" flag
>to the `docker rm` command. For example: `docker rm -f <the-container-id>`
>
@y
>**Note**
>
>You can stop and remove a container in a single command by adding the "force" flag
>to the `docker rm` command. For example: `docker rm -f <the-container-id>`
>
@z

@x
### Removing a container using the Docker Dashboard
@y
### Removing a container using the Docker Dashboard
@z

@x
If you open the Docker dashboard, you can remove a container with two clicks! It's certainly
much easier than having to look up the container ID and remove it.
@y
If you open the Docker dashboard, you can remove a container with two clicks! It's certainly
much easier than having to look up the container ID and remove it.
@z

@x
1. With the dashboard opened, hover over the app container and you'll see a collection of action
    buttons appear on the right.
@y
1. With the dashboard opened, hover over the app container and you'll see a collection of action
    buttons appear on the right.
@z

@x
1. Click on the trash can icon to delete the container. 
@y
1. Click on the trash can icon to delete the container. 
@z

@x
1. Confirm the removal and you're done!
@y
1. Confirm the removal and you're done!
@z

@x
![Docker Dashboard - removing a container](images/dashboard-removing-container.png)
@y
![Docker Dashboard - removing a container](images/dashboard-removing-container.png)
@z

@x
### Starting our updated app container
@y
### Starting our updated app container
@z

@x
1. Now, start your updated app.
@y
1. Now, start your updated app.
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
1. Refresh your browser on [http://localhost:3000](http://localhost:3000) and you should see your updated help text!
@y
1. Refresh your browser on [http://localhost:3000](http://localhost:3000) and you should see your updated help text!
@z

@x
![Updated application with updated empty text](images/todo-list-updated-empty-text.png){: style="width:55%" }
{: .text-center }
@y
![Updated application with updated empty text](images/todo-list-updated-empty-text.png){: style="width:55%" }
{: .text-center }
@z

@x
## Recap
@y
## Recap
@z

@x
While we were able to build an update, there were two things you might have noticed:
@y
While we were able to build an update, there were two things you might have noticed:
@z

@x
- All of the existing items in our todo list are gone! That's not a very good app! We'll talk about that
shortly.
- There were _a lot_ of steps involved for such a small change. In an upcoming section, we'll talk about 
how to see code updates without needing to rebuild and start a new container every time we make a change.
@y
- All of the existing items in our todo list are gone! That's not a very good app! We'll talk about that
shortly.
- There were _a lot_ of steps involved for such a small change. In an upcoming section, we'll talk about 
how to see code updates without needing to rebuild and start a new container every time we make a change.
@z

@x
Before talking about persistence, we'll quickly see how to share these images with others.
@y
Before talking about persistence, we'll quickly see how to share these images with others.
@z
