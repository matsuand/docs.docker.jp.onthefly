%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: "Using Docker Compose"
keywords: get started, setup, orientation, quickstart, intro, concepts, containers, docker desktop
description: Making our lives easier with Compose for our application
---
@y
---
title: "Using Docker Compose"
keywords: get started, setup, orientation, quickstart, intro, concepts, containers, docker desktop
description: Making our lives easier with Compose for our application
---
@z

@x
[Docker Compose](/compose/) is a tool that was developed to help define and
share multi-container applications. With Compose, we can create a YAML file to define the services
and with a single command, can spin everything up or tear it all down. 
@y
[Docker Compose](/compose/) is a tool that was developed to help define and
share multi-container applications. With Compose, we can create a YAML file to define the services
and with a single command, can spin everything up or tear it all down. 
@z

@x
The _big_ advantage of using Compose is you can define your application stack in a file, keep it at the root of
your project repo (it's now version controlled), and easily enable someone else to contribute to your project. 
Someone would only need to clone your repo and start the compose app. In fact, you might see quite a few projects
on GitHub/GitLab doing exactly this now.
@y
The _big_ advantage of using Compose is you can define your application stack in a file, keep it at the root of
your project repo (it's now version controlled), and easily enable someone else to contribute to your project. 
Someone would only need to clone your repo and start the compose app. In fact, you might see quite a few projects
on GitHub/GitLab doing exactly this now.
@z

@x
So, how do we get started?
@y
So, how do we get started?
@z

@x
## Installing Docker Compose
@y
## Installing Docker Compose
@z

@x
If you installed Docker Desktop/Toolbox for either Windows or Mac, you already have Docker Compose!
Play-with-Docker instances already have Docker Compose installed as well. If you are on 
a Linux machine, you will need to install Docker Compose using 
[the instructions here](/compose/install/). 
@y
If you installed Docker Desktop/Toolbox for either Windows or Mac, you already have Docker Compose!
Play-with-Docker instances already have Docker Compose installed as well. If you are on 
a Linux machine, you will need to install Docker Compose using 
[the instructions here](/compose/install/). 
@z

@x
After installation, you should be able to run the following and see version information.
@y
After installation, you should be able to run the following and see version information.
@z

@x
```bash
docker-compose version
```
@y
```bash
docker-compose version
```
@z

@x
## Creating our Compose File
@y
## Creating our Compose File
@z

@x
1. At the root of the app project, create a file named `docker-compose.yml`.
@y
1. At the root of the app project, create a file named `docker-compose.yml`.
@z

@x
1. In the compose file, we'll start off by defining the schema version. In most cases, it's best to use 
   the latest supported version. You can look at the [Compose file reference](https://docs.docker.com/compose/compose-file/)
   for the current schema versions and the compatibility matrix.
@y
1. In the compose file, we'll start off by defining the schema version. In most cases, it's best to use 
   the latest supported version. You can look at the [Compose file reference](https://docs.docker.com/compose/compose-file/)
   for the current schema versions and the compatibility matrix.
@z

@x
    ```yaml
    version: "3.7"
    ```
@y
    ```yaml
    version: "3.7"
    ```
@z

@x
1. Next, we'll define the list of services (or containers) we want to run as part of our application.
@y
1. Next, we'll define the list of services (or containers) we want to run as part of our application.
@z

@x
    ```yaml hl_lines="3"
    version: "3.7"
@y
    ```yaml hl_lines="3"
    version: "3.7"
@z

@x
    services:
    ```
@y
    services:
    ```
@z

@x
And now, we'll start migrating a service at a time into the compose file.
@y
And now, we'll start migrating a service at a time into the compose file.
@z

@x
## Defining the App Service
@y
## Defining the App Service
@z

@x
To remember, this was the command we were using to define our app container.
@y
To remember, this was the command we were using to define our app container.
@z

@x
```bash
docker run -dp 3000:3000 \
  -w /app -v "$(pwd):/app" \
  --network todo-app \
  -e MYSQL_HOST=mysql \
  -e MYSQL_USER=root \
  -e MYSQL_PASSWORD=secret \
  -e MYSQL_DB=todos \
  node:12-alpine \
  sh -c "yarn install && yarn run dev"
```
@y
```bash
docker run -dp 3000:3000 \
  -w /app -v "$(pwd):/app" \
  --network todo-app \
  -e MYSQL_HOST=mysql \
  -e MYSQL_USER=root \
  -e MYSQL_PASSWORD=secret \
  -e MYSQL_DB=todos \
  node:12-alpine \
  sh -c "yarn install && yarn run dev"
```
@z

@x
If you are using PowerShell then use this command.
@y
If you are using PowerShell then use this command.
@z

@x
```powershell
docker run -dp 3000:3000 `
  -w /app -v "$(pwd):/app" `
  --network todo-app `
  -e MYSQL_HOST=mysql `
  -e MYSQL_USER=root `
  -e MYSQL_PASSWORD=secret `
  -e MYSQL_DB=todos `
  node:12-alpine `
  sh -c "yarn install && yarn run dev"
```
@y
```powershell
docker run -dp 3000:3000 `
  -w /app -v "$(pwd):/app" `
  --network todo-app `
  -e MYSQL_HOST=mysql `
  -e MYSQL_USER=root `
  -e MYSQL_PASSWORD=secret `
  -e MYSQL_DB=todos `
  node:12-alpine `
  sh -c "yarn install && yarn run dev"
```
@z

@x
1. First, let's define the service entry and the image for the container. We can pick any name for the service. 
   The name will automatically become a network alias, which will be useful when defining our MySQL service.
@y
1. First, let's define the service entry and the image for the container. We can pick any name for the service. 
   The name will automatically become a network alias, which will be useful when defining our MySQL service.
@z

@x
    ```yaml hl_lines="4 5"
    version: "3.7"
@y
    ```yaml hl_lines="4 5"
    version: "3.7"
@z

@x
    services:
      app:
        image: node:12-alpine
    ```
@y
    services:
      app:
        image: node:12-alpine
    ```
@z

@x
1. Typically, you will see the command close to the `image` definition, although there is no requirement on ordering.
   So, let's go ahead and move that into our file.
@y
1. Typically, you will see the command close to the `image` definition, although there is no requirement on ordering.
   So, let's go ahead and move that into our file.
@z

@x
    ```yaml hl_lines="6"
    version: "3.7"
@y
    ```yaml hl_lines="6"
    version: "3.7"
@z

@x
    services:
      app:
        image: node:12-alpine
        command: sh -c "yarn install && yarn run dev"
    ```
@y
    services:
      app:
        image: node:12-alpine
        command: sh -c "yarn install && yarn run dev"
    ```
@z

@x
1. Let's migrate the `-p 3000:3000` part of the command by defining the `ports` for the service. We will use the
   [short syntax](https://docs.docker.com/compose/compose-file/#short-syntax-1) here, but there is also a more verbose 
   [long syntax](https://docs.docker.com/compose/compose-file/#long-syntax-1) available as well.
@y
1. Let's migrate the `-p 3000:3000` part of the command by defining the `ports` for the service. We will use the
   [short syntax](https://docs.docker.com/compose/compose-file/#short-syntax-1) here, but there is also a more verbose 
   [long syntax](https://docs.docker.com/compose/compose-file/#long-syntax-1) available as well.
@z

@x
    ```yaml hl_lines="7 8"
    version: "3.7"
@y
    ```yaml hl_lines="7 8"
    version: "3.7"
@z

@x
    services:
      app:
        image: node:12-alpine
        command: sh -c "yarn install && yarn run dev"
        ports:
          - 3000:3000
    ```
@y
    services:
      app:
        image: node:12-alpine
        command: sh -c "yarn install && yarn run dev"
        ports:
          - 3000:3000
    ```
@z

@x
1. Next, we'll migrate both the working directory (`-w /app`) and the volume mapping (`-v "$(pwd):/app"`) by using
   the `working_dir` and `volumes` definitions. Volumes also has a [short](https://docs.docker.com/compose/compose-file/#short-syntax-3) and [long](https://docs.docker.com/compose/compose-file/#long-syntax-3) syntax.
@y
1. Next, we'll migrate both the working directory (`-w /app`) and the volume mapping (`-v "$(pwd):/app"`) by using
   the `working_dir` and `volumes` definitions. Volumes also has a [short](https://docs.docker.com/compose/compose-file/#short-syntax-3) and [long](https://docs.docker.com/compose/compose-file/#long-syntax-3) syntax.
@z

@x
    One advantage of Docker Compose volume definitions is we can use relative paths from the current directory.
@y
    One advantage of Docker Compose volume definitions is we can use relative paths from the current directory.
@z

@x
    ```yaml hl_lines="9 10 11"
    version: "3.7"
@y
    ```yaml hl_lines="9 10 11"
    version: "3.7"
@z

@x
    services:
      app:
        image: node:12-alpine
        command: sh -c "yarn install && yarn run dev"
        ports:
          - 3000:3000
        working_dir: /app
        volumes:
          - ./:/app
    ```
@y
    services:
      app:
        image: node:12-alpine
        command: sh -c "yarn install && yarn run dev"
        ports:
          - 3000:3000
        working_dir: /app
        volumes:
          - ./:/app
    ```
@z

@x
1. Finally, we need to migrate the environment variable definitions using the `environment` key.
@y
1. Finally, we need to migrate the environment variable definitions using the `environment` key.
@z

@x
    ```yaml hl_lines="12 13 14 15 16"
    version: "3.7"
@y
    ```yaml hl_lines="12 13 14 15 16"
    version: "3.7"
@z

@x
    services:
      app:
        image: node:12-alpine
        command: sh -c "yarn install && yarn run dev"
        ports:
          - 3000:3000
        working_dir: /app
        volumes:
          - ./:/app
        environment:
          MYSQL_HOST: mysql
          MYSQL_USER: root
          MYSQL_PASSWORD: secret
          MYSQL_DB: todos
    ```
@y
    services:
      app:
        image: node:12-alpine
        command: sh -c "yarn install && yarn run dev"
        ports:
          - 3000:3000
        working_dir: /app
        volumes:
          - ./:/app
        environment:
          MYSQL_HOST: mysql
          MYSQL_USER: root
          MYSQL_PASSWORD: secret
          MYSQL_DB: todos
    ```
@z

@x
### Defining the MySQL Service
@y
### Defining the MySQL Service
@z

@x
Now, it's time to define the MySQL service. The command that we used for that container was the following:
@y
Now, it's time to define the MySQL service. The command that we used for that container was the following:
@z

@x
```bash
docker run -d \
  --network todo-app --network-alias mysql \
  -v todo-mysql-data:/var/lib/mysql \
  -e MYSQL_ROOT_PASSWORD=secret \
  -e MYSQL_DATABASE=todos \
  mysql:5.7
```
@y
```bash
docker run -d \
  --network todo-app --network-alias mysql \
  -v todo-mysql-data:/var/lib/mysql \
  -e MYSQL_ROOT_PASSWORD=secret \
  -e MYSQL_DATABASE=todos \
  mysql:5.7
```
@z

@x
If you are using PowerShell then use this command.
@y
If you are using PowerShell then use this command.
@z

@x
```powershell
docker run -d `
  --network todo-app --network-alias mysql `
  -v todo-mysql-data:/var/lib/mysql `
  -e MYSQL_ROOT_PASSWORD=secret `
  -e MYSQL_DATABASE=todos `
  mysql:5.7
```
@y
```powershell
docker run -d `
  --network todo-app --network-alias mysql `
  -v todo-mysql-data:/var/lib/mysql `
  -e MYSQL_ROOT_PASSWORD=secret `
  -e MYSQL_DATABASE=todos `
  mysql:5.7
```
@z

@x
1. We will first define the new service and name it `mysql` so it automatically gets the network alias. We'll
   go ahead and specify the image to use as well.
@y
1. We will first define the new service and name it `mysql` so it automatically gets the network alias. We'll
   go ahead and specify the image to use as well.
@z

@x
    ```yaml hl_lines="6 7"
    version: "3.7"
@y
    ```yaml hl_lines="6 7"
    version: "3.7"
@z

@x
    services:
      app:
        # The app service definition
      mysql:
        image: mysql:5.7
    ```
@y
    services:
      app:
        # The app service definition
      mysql:
        image: mysql:5.7
    ```
@z

@x
1. Next, we'll define the volume mapping. When we ran the container with `docker run`, the named volume was created
   automatically. However, that doesn't happen when running with Compose. We need to define the volume in the top-level
   `volumes:` section and then specify the mountpoint in the service config. By simply providing only the volume name,
   the default options are used. There are [many more options available](https://docs.docker.com/compose/compose-file/#volume-configuration-reference) though.
@y
1. Next, we'll define the volume mapping. When we ran the container with `docker run`, the named volume was created
   automatically. However, that doesn't happen when running with Compose. We need to define the volume in the top-level
   `volumes:` section and then specify the mountpoint in the service config. By simply providing only the volume name,
   the default options are used. There are [many more options available](https://docs.docker.com/compose/compose-file/#volume-configuration-reference) though.
@z

@x
    ```yaml hl_lines="8 9 10 11 12"
    version: "3.7"
@y
    ```yaml hl_lines="8 9 10 11 12"
    version: "3.7"
@z

@x
    services:
      app:
        # The app service definition
      mysql:
        image: mysql:5.7
        volumes:
          - todo-mysql-data:/var/lib/mysql
@y
    services:
      app:
        # The app service definition
      mysql:
        image: mysql:5.7
        volumes:
          - todo-mysql-data:/var/lib/mysql
@z

@x
    volumes:
      todo-mysql-data:
    ```
@y
    volumes:
      todo-mysql-data:
    ```
@z

@x
1. Finally, we only need to specify the environment variables.
@y
1. Finally, we only need to specify the environment variables.
@z

@x
    ```yaml hl_lines="10 11 12"
    version: "3.7"
@y
    ```yaml hl_lines="10 11 12"
    version: "3.7"
@z

@x
    services:
      app:
        # The app service definition
      mysql:
        image: mysql:5.7
        volumes:
          - todo-mysql-data:/var/lib/mysql
        environment: 
          MYSQL_ROOT_PASSWORD: secret
          MYSQL_DATABASE: todos
@y
    services:
      app:
        # The app service definition
      mysql:
        image: mysql:5.7
        volumes:
          - todo-mysql-data:/var/lib/mysql
        environment: 
          MYSQL_ROOT_PASSWORD: secret
          MYSQL_DATABASE: todos
@z

@x
    volumes:
      todo-mysql-data:
    ```
@y
    volumes:
      todo-mysql-data:
    ```
@z

@x
At this point, our complete `docker-compose.yml` should look like this:
@y
At this point, our complete `docker-compose.yml` should look like this:
@z

@x
```yaml
version: "3.7"
@y
```yaml
version: "3.7"
@z

@x
services:
  app:
    image: node:12-alpine
    command: sh -c "yarn install && yarn run dev"
    ports:
      - 3000:3000
    working_dir: /app
    volumes:
      - ./:/app
    environment:
      MYSQL_HOST: mysql
      MYSQL_USER: root
      MYSQL_PASSWORD: secret
      MYSQL_DB: todos
@y
services:
  app:
    image: node:12-alpine
    command: sh -c "yarn install && yarn run dev"
    ports:
      - 3000:3000
    working_dir: /app
    volumes:
      - ./:/app
    environment:
      MYSQL_HOST: mysql
      MYSQL_USER: root
      MYSQL_PASSWORD: secret
      MYSQL_DB: todos
@z

@x
  mysql:
    image: mysql:5.7
    volumes:
      - todo-mysql-data:/var/lib/mysql
    environment: 
      MYSQL_ROOT_PASSWORD: secret
      MYSQL_DATABASE: todos
@y
  mysql:
    image: mysql:5.7
    volumes:
      - todo-mysql-data:/var/lib/mysql
    environment: 
      MYSQL_ROOT_PASSWORD: secret
      MYSQL_DATABASE: todos
@z

@x
volumes:
  todo-mysql-data:
```
@y
volumes:
  todo-mysql-data:
```
@z

@x
## Running our Application Stack
@y
## Running our Application Stack
@z

@x
Now that we have our `docker-compose.yml` file, we can start it up!
@y
Now that we have our `docker-compose.yml` file, we can start it up!
@z

@x
1. Make sure no other copies of the app/db are running first (`docker ps` and `docker rm -f <ids>`).
@y
1. Make sure no other copies of the app/db are running first (`docker ps` and `docker rm -f <ids>`).
@z

@x
1. Start up the application stack using the `docker-compose up` command. We'll add the `-d` flag to run everything in the
   background.
@y
1. Start up the application stack using the `docker-compose up` command. We'll add the `-d` flag to run everything in the
   background.
@z

@x
    ```bash
    docker-compose up -d
    ```
@y
    ```bash
    docker-compose up -d
    ```
@z

@x
    When we run this, we should see output like this:
@y
    When we run this, we should see output like this:
@z

@x
    ```plaintext
    Creating network "app_default" with the default driver
    Creating volume "app_todo-mysql-data" with default driver
    Creating app_app_1   ... done
    Creating app_mysql_1 ... done
    ```
@y
    ```plaintext
    Creating network "app_default" with the default driver
    Creating volume "app_todo-mysql-data" with default driver
    Creating app_app_1   ... done
    Creating app_mysql_1 ... done
    ```
@z

@x
    You'll notice that the volume was created as well as a network! By default, Docker Compose automatically creates a 
    network specifically for the application stack (which is why we didn't define one in the compose file).
@y
    You'll notice that the volume was created as well as a network! By default, Docker Compose automatically creates a 
    network specifically for the application stack (which is why we didn't define one in the compose file).
@z

@x
1. Let's look at the logs using the `docker-compose logs -f` command. You'll see the logs from each of the services interleaved
    into a single stream. This is incredibly useful when you want to watch for timing-related issues. The `-f` flag "follows" the
    log, so will give you live output as it's generated.
@y
1. Let's look at the logs using the `docker-compose logs -f` command. You'll see the logs from each of the services interleaved
    into a single stream. This is incredibly useful when you want to watch for timing-related issues. The `-f` flag "follows" the
    log, so will give you live output as it's generated.
@z

@x
    If you don't already, you'll see output that looks like this...
@y
    If you don't already, you'll see output that looks like this...
@z

@x
    ```plaintext
    mysql_1  | 2019-10-03T03:07:16.083639Z 0 [Note] mysqld: ready for connections.
    mysql_1  | Version: '5.7.27'  socket: '/var/run/mysqld/mysqld.sock'  port: 3306  MySQL Community Server (GPL)
    app_1    | Connected to mysql db at host mysql
    app_1    | Listening on port 3000
    ```
@y
    ```plaintext
    mysql_1  | 2019-10-03T03:07:16.083639Z 0 [Note] mysqld: ready for connections.
    mysql_1  | Version: '5.7.27'  socket: '/var/run/mysqld/mysqld.sock'  port: 3306  MySQL Community Server (GPL)
    app_1    | Connected to mysql db at host mysql
    app_1    | Listening on port 3000
    ```
@z

@x
    The service name is displayed at the beginning of the line (often colored) to help distinguish messages. If you want to
    view the logs for a specific service, you can add the service name to the end of the logs command (for example,
    `docker-compose logs -f app`).
@y
    The service name is displayed at the beginning of the line (often colored) to help distinguish messages. If you want to
    view the logs for a specific service, you can add the service name to the end of the logs command (for example,
    `docker-compose logs -f app`).
@z

@x
>**Pro tip**  Waiting for the DB before starting the app
>
>When the app is starting up, it actually sits and waits for MySQL to be up and ready before trying to connect to it.
>Docker doesn't have any built-in support to wait for another container to be fully up, running, and ready
>before starting another container. For Node-based projects, you can use the 
>[wait-port](https://github.com/dwmkerr/wait-port) dependency. Similar projects exist for other languages/frameworks.
@y
>**Pro tip**  Waiting for the DB before starting the app
>
>When the app is starting up, it actually sits and waits for MySQL to be up and ready before trying to connect to it.
>Docker doesn't have any built-in support to wait for another container to be fully up, running, and ready
>before starting another container. For Node-based projects, you can use the 
>[wait-port](https://github.com/dwmkerr/wait-port) dependency. Similar projects exist for other languages/frameworks.
@z

@x
1. At this point, you should be able to open your app and see it running. And hey! We're down to a single command!
@y
1. At this point, you should be able to open your app and see it running. And hey! We're down to a single command!
@z

@x
## Seeing our App Stack in Docker Dashboard
@y
## Seeing our App Stack in Docker Dashboard
@z

@x
If we look at the Docker Dashboard, we'll see that there is a group named **app**. This is the "project name" from Docker
Compose and used to group the containers together. By default, the project name is simply the name of the directory that the
`docker-compose.yml` was located in.
@y
If we look at the Docker Dashboard, we'll see that there is a group named **app**. This is the "project name" from Docker
Compose and used to group the containers together. By default, the project name is simply the name of the directory that the
`docker-compose.yml` was located in.
@z

@x
![Docker Dashboard with app project](images/dashboard-app-project-collapsed.png)
@y
![Docker Dashboard with app project](images/dashboard-app-project-collapsed.png)
@z

@x
If you twirl down the app, you will see the two containers we defined in the compose file. The names are also a little
more descriptive, as they follow the pattern of `<project-name>_<service-name>_<replica-number>`. So, it's very easy to
quickly see what container is our app and which container is the mysql database.
@y
If you twirl down the app, you will see the two containers we defined in the compose file. The names are also a little
more descriptive, as they follow the pattern of `<project-name>_<service-name>_<replica-number>`. So, it's very easy to
quickly see what container is our app and which container is the mysql database.
@z

@x
![Docker Dashboard with app project expanded](images/dashboard-app-project-expanded.png)
@y
![Docker Dashboard with app project expanded](images/dashboard-app-project-expanded.png)
@z

@x
## Tearing it All Down
@y
## Tearing it All Down
@z

@x
When you're ready to tear it all down, simply run `docker-compose down` or hit the trash can on the Docker Dashboard 
for the entire app. The containers will stop and the network will be removed.
@y
When you're ready to tear it all down, simply run `docker-compose down` or hit the trash can on the Docker Dashboard 
for the entire app. The containers will stop and the network will be removed.
@z

@x
>**Warning** 
>Removing Volumes
>By default, named volumes in your compose file are NOT removed when running `docker-compose down`. If you want to
>remove the volumes, you will need to add the `--volumes` flag.
>
>The Docker Dashboard does _not_ remove volumes when you delete the app stack.
@y
>**Warning** 
>Removing Volumes
>By default, named volumes in your compose file are NOT removed when running `docker-compose down`. If you want to
>remove the volumes, you will need to add the `--volumes` flag.
>
>The Docker Dashboard does _not_ remove volumes when you delete the app stack.
@z

@x
Once torn down, you can switch to another project, run `docker-compose up` and be ready to contribute to that project! It really
doesn't get much simpler than that!
@y
Once torn down, you can switch to another project, run `docker-compose up` and be ready to contribute to that project! It really
doesn't get much simpler than that!
@z

@x
## Recap
@y
## Recap
@z

@x
In this section, we learned about Docker Compose and how it helps us dramatically simplify the defining and
sharing of multi-service applications. We created a Compose file by translating the commands we were
using into the appropriate compose format.
@y
In this section, we learned about Docker Compose and how it helps us dramatically simplify the defining and
sharing of multi-service applications. We created a Compose file by translating the commands we were
using into the appropriate compose format.
@z

@x
At this point, we're starting to wrap up the tutorial. However, there are a few best practices about
image building we want to cover, as there is a big issue with the Dockerfile we've been using. So,
let's take a look!
@y
At this point, we're starting to wrap up the tutorial. However, there are a few best practices about
image building we want to cover, as there is a big issue with the Dockerfile we've been using. So,
let's take a look!
@z
