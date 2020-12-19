%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: "Persisting our DB"
keywords: get started, setup, orientation, quickstart, intro, concepts, containers, docker desktop
description: Making our DB persistent in our application
---
@y
---
title: "Persisting our DB"
keywords: get started, setup, orientation, quickstart, intro, concepts, containers, docker desktop
description: Making our DB persistent in our application
---
@z

@x
In case you didn't notice, our todo list is being wiped clean every single time
we launch the container. Why is this? Let's dive into how the container is working.
@y
In case you didn't notice, our todo list is being wiped clean every single time
we launch the container. Why is this? Let's dive into how the container is working.
@z

@x
## The Container's Filesystem
@y
## The Container's Filesystem
@z

@x
When a container runs, it uses the various layers from an image for its filesystem.
Each container also gets its own "scratch space" to create/update/remove files. Any
changes won't be seen in another container, _even if_ they are using the same image.
@y
When a container runs, it uses the various layers from an image for its filesystem.
Each container also gets its own "scratch space" to create/update/remove files. Any
changes won't be seen in another container, _even if_ they are using the same image.
@z

@x
### Seeing this in Practice
@y
### Seeing this in Practice
@z

@x
To see this in action, we're going to start two containers and create a file in each.
What you'll see is that the files created in one container aren't available in another.
@y
To see this in action, we're going to start two containers and create a file in each.
What you'll see is that the files created in one container aren't available in another.
@z

@x
1. Start a `ubuntu` container that will create a file named `/data.txt` with a random number
   between 1 and 10000.
@y
1. Start a `ubuntu` container that will create a file named `/data.txt` with a random number
   between 1 and 10000.
@z

@x
    ```bash
    docker run -d ubuntu bash -c "shuf -i 1-10000 -n 1 -o /data.txt && tail -f /dev/null"
    ```
@y
    ```bash
    docker run -d ubuntu bash -c "shuf -i 1-10000 -n 1 -o /data.txt && tail -f /dev/null"
    ```
@z

@x
    In case you're curious about the command, we're starting a bash shell and invoking two
    commands (why we have the `&&`). The first portion picks a single random number and writes
    it to `/data.txt`. The second command is simply watching a file to keep the container running.
@y
    In case you're curious about the command, we're starting a bash shell and invoking two
    commands (why we have the `&&`). The first portion picks a single random number and writes
    it to `/data.txt`. The second command is simply watching a file to keep the container running.
@z

@x
1. Validate we can see the output by `exec`'ing into the container. To do so, open the Dashboard and click the first action of the container that is running the `ubuntu` image.
@y
1. Validate we can see the output by `exec`'ing into the container. To do so, open the Dashboard and click the first action of the container that is running the `ubuntu` image.
@z

@x
    ![Dashboard open CLI into ubuntu container](images/dashboard-open-cli-ubuntu.png){: style=width:75% }
{: .text-center }
@y
    ![Dashboard open CLI into ubuntu container](images/dashboard-open-cli-ubuntu.png){: style=width:75% }
{: .text-center }
@z

@x
    You will see a terminal that is running a shell in the ubuntu container. Run the following command to see the content of the `/data.txt` file. Close this terminal afterwards again.
@y
    You will see a terminal that is running a shell in the ubuntu container. Run the following command to see the content of the `/data.txt` file. Close this terminal afterwards again.
@z

@x
    ```bash
    cat /data.txt
    ```
@y
    ```bash
    cat /data.txt
    ```
@z

@x
    If you prefer the command line you can use the `docker exec` command to do the same. You need to get the
   container's ID (use `docker ps` to get it) and get the content with the following command.
@y
    If you prefer the command line you can use the `docker exec` command to do the same. You need to get the
   container's ID (use `docker ps` to get it) and get the content with the following command.
@z

@x
    ```bash
    docker exec <container-id> cat /data.txt
    ```
@y
    ```bash
    docker exec <container-id> cat /data.txt
    ```
@z

@x
    You should see a random number!
@y
    You should see a random number!
@z

@x
1. Now, let's start another `ubuntu` container (the same image) and we'll see we don't have the same
   file.
@y
1. Now, let's start another `ubuntu` container (the same image) and we'll see we don't have the same
   file.
@z

@x
    ```bash
    docker run -it ubuntu ls /
    ```
@y
    ```bash
    docker run -it ubuntu ls /
    ```
@z

@x
    And look! There's no `data.txt` file there! That's because it was written to the scratch space for
    only the first container.
@y
    And look! There's no `data.txt` file there! That's because it was written to the scratch space for
    only the first container.
@z

@x
1. Go ahead and remove the first container using the `docker rm -f` command.
@y
1. Go ahead and remove the first container using the `docker rm -f` command.
@z

@x
## Container Volumes
@y
## Container Volumes
@z

@x
With the previous experiment, we saw that each container starts from the image definition each time it starts. 
While containers can create, update, and delete files, those changes are lost when the container is removed 
and all changes are isolated to that container. With volumes, we can change all of this.
@y
With the previous experiment, we saw that each container starts from the image definition each time it starts. 
While containers can create, update, and delete files, those changes are lost when the container is removed 
and all changes are isolated to that container. With volumes, we can change all of this.
@z

@x
[Volumes](/storage/volumes/) provide the ability to connect specific filesystem paths of 
the container back to the host machine. If a directory in the container is mounted, changes in that
directory are also seen on the host machine. If we mount that same directory across container restarts, we'd see
the same files.
@y
[Volumes](/storage/volumes/) provide the ability to connect specific filesystem paths of 
the container back to the host machine. If a directory in the container is mounted, changes in that
directory are also seen on the host machine. If we mount that same directory across container restarts, we'd see
the same files.
@z

@x
There are two main types of volumes. We will eventually use both, but we will start with **named volumes**.
@y
There are two main types of volumes. We will eventually use both, but we will start with **named volumes**.
@z

@x
## Persisting our Todo Data
@y
## Persisting our Todo Data
@z

@x
By default, the todo app stores its data in a [SQLite Database](https://www.sqlite.org/index.html) at
`/etc/todos/todo.db`. If you're not familiar with SQLite, no worries! It's simply a relational database in 
which all of the data is stored in a single file. While this isn't the best for large-scale applications,
it works for small demos. We'll talk about switching this to a different database engine later.
@y
By default, the todo app stores its data in a [SQLite Database](https://www.sqlite.org/index.html) at
`/etc/todos/todo.db`. If you're not familiar with SQLite, no worries! It's simply a relational database in 
which all of the data is stored in a single file. While this isn't the best for large-scale applications,
it works for small demos. We'll talk about switching this to a different database engine later.
@z

@x
With the database being a single file, if we can persist that file on the host and make it available to the
next container, it should be able to pick up where the last one left off. By creating a volume and attaching
(often called "mounting") it to the directory the data is stored in, we can persist the data. As our container 
writes to the `todo.db` file, it will be persisted to the host in the volume.
@y
With the database being a single file, if we can persist that file on the host and make it available to the
next container, it should be able to pick up where the last one left off. By creating a volume and attaching
(often called "mounting") it to the directory the data is stored in, we can persist the data. As our container 
writes to the `todo.db` file, it will be persisted to the host in the volume.
@z

@x
As mentioned, we are going to use a **named volume**. Think of a named volume as simply a bucket of data. 
Docker maintains the physical location on the disk and you only need to remember the name of the volume. 
Every time you use the volume, Docker will make sure the correct data is provided.
@y
As mentioned, we are going to use a **named volume**. Think of a named volume as simply a bucket of data. 
Docker maintains the physical location on the disk and you only need to remember the name of the volume. 
Every time you use the volume, Docker will make sure the correct data is provided.
@z

@x
1. Create a volume by using the `docker volume create` command.
@y
1. Create a volume by using the `docker volume create` command.
@z

@x
    ```bash
    docker volume create todo-db
    ```
@y
    ```bash
    docker volume create todo-db
    ```
@z

@x
1. Stop the todo app container once again in the Dashboard (or with `docker rm -f <id>`), as it is still running without using the persistent volume.
@y
1. Stop the todo app container once again in the Dashboard (or with `docker rm -f <id>`), as it is still running without using the persistent volume.
@z

@x
1. Start the todo app container, but add the `-v` flag to specify a volume mount. We will use the named volume and mount
   it to `/etc/todos`, which will capture all files created at the path.
@y
1. Start the todo app container, but add the `-v` flag to specify a volume mount. We will use the named volume and mount
   it to `/etc/todos`, which will capture all files created at the path.
@z

@x
    ```bash
    docker run -dp 3000:3000 -v todo-db:/etc/todos getting-started
    ```
@y
    ```bash
    docker run -dp 3000:3000 -v todo-db:/etc/todos getting-started
    ```
@z

@x
1. Once the container starts up, open the app and add a few items to your todo list.
@y
1. Once the container starts up, open the app and add a few items to your todo list.
@z

@x
    ![Items added to todo list](images/items-added.png){: style="width: 55%; " }
    {: .text-center }
@y
    ![Items added to todo list](images/items-added.png){: style="width: 55%; " }
    {: .text-center }
@z

@x
1. Remove the container for the todo app. Use the Dashboard or `docker ps` to get the ID and then `docker rm -f <id>` to remove it.
@y
1. Remove the container for the todo app. Use the Dashboard or `docker ps` to get the ID and then `docker rm -f <id>` to remove it.
@z

@x
1. Start a new container using the same command from above.
@y
1. Start a new container using the same command from above.
@z

@x
1. Open the app. You should see your items still in your list!
@y
1. Open the app. You should see your items still in your list!
@z

@x
1. Go ahead and remove the container when you're done checking out your list.
@y
1. Go ahead and remove the container when you're done checking out your list.
@z

@x
Hooray! You've now learned how to persist data!
@y
Hooray! You've now learned how to persist data!
@z

@x
>**Pro-tip**
>
>While named volumes and bind mounts (which we'll talk about in a minute) are the two main types of volumes supported
>by a default Docker engine installation, there are many volume driver plugins available to support NFS, SFTP, NetApp, 
>and more! This will be especially important once you start running containers on multiple hosts in a clustered
>environment with Swarm, Kubernetes, etc.
>
@y
>**Pro-tip**
>
>While named volumes and bind mounts (which we'll talk about in a minute) are the two main types of volumes supported
>by a default Docker engine installation, there are many volume driver plugins available to support NFS, SFTP, NetApp, 
>and more! This will be especially important once you start running containers on multiple hosts in a clustered
>environment with Swarm, Kubernetes, etc.
>
@z

@x
## Diving into our Volume
@y
## Diving into our Volume
@z

@x
A lot of people frequently ask "Where is Docker _actually_ storing my data when I use a named volume?" If you want to know, 
you can use the `docker volume inspect` command.
@y
A lot of people frequently ask "Where is Docker _actually_ storing my data when I use a named volume?" If you want to know, 
you can use the `docker volume inspect` command.
@z

@x
```bash
docker volume inspect todo-db
[
    {
        "CreatedAt": "2019-09-26T02:18:36Z",
        "Driver": "local",
        "Labels": {},
        "Mountpoint": "/var/lib/docker/volumes/todo-db/_data",
        "Name": "todo-db",
        "Options": {},
        "Scope": "local"
    }
]
```
@y
```bash
docker volume inspect todo-db
[
    {
        "CreatedAt": "2019-09-26T02:18:36Z",
        "Driver": "local",
        "Labels": {},
        "Mountpoint": "/var/lib/docker/volumes/todo-db/_data",
        "Name": "todo-db",
        "Options": {},
        "Scope": "local"
    }
]
```
@z

@x
The `Mountpoint` is the actual location on the disk where the data is stored. Note that on most machines, you will
need to have root access to access this directory from the host. But, that's where it is!
@y
The `Mountpoint` is the actual location on the disk where the data is stored. Note that on most machines, you will
need to have root access to access this directory from the host. But, that's where it is!
@z

@x
>**Accessing Volume data directly on Docker Desktop**
>
>While running in Docker Desktop, the Docker commands are actually running inside a small VM on your machine.
>If you wanted to look at the actual contents of the Mountpoint directory, you would need to first get inside
>of the VM.
@y
>**Accessing Volume data directly on Docker Desktop**
>
>While running in Docker Desktop, the Docker commands are actually running inside a small VM on your machine.
>If you wanted to look at the actual contents of the Mountpoint directory, you would need to first get inside
>of the VM.
@z

@x
## Recap
@y
## Recap
@z

@x
At this point, we have a functioning application that can survive restarts! We can show it off to our investors and
hope they can catch our vision!
@y
At this point, we have a functioning application that can survive restarts! We can show it off to our investors and
hope they can catch our vision!
@z

@x
However, we saw earlier that rebuilding images for every change takes quite a bit of time. There's got to be a better
way to make changes, right? With bind mounts (which we hinted at earlier), there is a better way! Let's take a look at that now!
@y
However, we saw earlier that rebuilding images for every change takes quite a bit of time. There's got to be a better
way to make changes, right? With bind mounts (which we hinted at earlier), there is a better way! Let's take a look at that now!
@z
