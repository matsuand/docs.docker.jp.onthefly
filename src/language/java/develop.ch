%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: "Use containers for development"
keywords: Java, local, development, run,
description: Learn how to develop your application locally.
---
@y
---
title: "Use containers for development"
keywords: Java, local, development, run,
description: Learn how to develop your application locally.
---
@z

@x
{% include_relative nav.html selected="3" %}
@y
{% include_relative nav.html selected="3" %}
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
Work through the steps to build an image and run it as a containerized application in [Run your image as a container](run-containers.md).
@y
Work through the steps to build an image and run it as a containerized application in [Run your image as a container](run-containers.md).
@z

@x
## Introduction
@y
## Introduction
@z

@x
In this module, we’ll walk through setting up a local development environment for the application we built in the previous modules. We’ll use Docker to build our images and Docker Compose to make everything a whole lot easier.
@y
In this module, we’ll walk through setting up a local development environment for the application we built in the previous modules. We’ll use Docker to build our images and Docker Compose to make everything a whole lot easier.
@z

@x
## Run a database in a container
@y
## Run a database in a container
@z

@x
First, we’ll take a look at running a database in a container and how we use volumes and networking to persist our data and allow our application to talk with the database. Then we’ll pull everything together into a Compose file which allows us to setup and run a local development environment with one command. Finally, we’ll take a look at connecting a debugger to our application running inside a container.
@y
First, we’ll take a look at running a database in a container and how we use volumes and networking to persist our data and allow our application to talk with the database. Then we’ll pull everything together into a Compose file which allows us to setup and run a local development environment with one command. Finally, we’ll take a look at connecting a debugger to our application running inside a container.
@z

@x
Instead of downloading MySQL, installing, configuring, and then running the MySQL database as a service, we can use the Docker Official Image for MySQL and run it in a container.
@y
Instead of downloading MySQL, installing, configuring, and then running the MySQL database as a service, we can use the Docker Official Image for MySQL and run it in a container.
@z

@x
Before we run MySQL in a container, we'll create a couple of volumes that Docker can manage to store our persistent data and configuration. Let’s use the managed volumes feature that Docker provides instead of using bind mounts. You can read all about [Using volumes](../../storage/volumes.md) in our documentation.
@y
Before we run MySQL in a container, we'll create a couple of volumes that Docker can manage to store our persistent data and configuration. Let’s use the managed volumes feature that Docker provides instead of using bind mounts. You can read all about [Using volumes](../../storage/volumes.md) in our documentation.
@z

@x
Let’s create our volumes now. We’ll create one for the data and one for configuration of MySQL.
@y
Let’s create our volumes now. We’ll create one for the data and one for configuration of MySQL.
@z

@x
```console
$ docker volume create mysql_data
$ docker volume create mysql_config
```
@y
```console
$ docker volume create mysql_data
$ docker volume create mysql_config
```
@z

@x
Now we’ll create a network that our application and database will use to talk to each other. The network is called a user-defined bridge network and gives us a nice DNS lookup service which we can use when creating our connection string.
@y
Now we’ll create a network that our application and database will use to talk to each other. The network is called a user-defined bridge network and gives us a nice DNS lookup service which we can use when creating our connection string.
@z

@x
```console
$ docker network create mysqlnet
```
@y
```console
$ docker network create mysqlnet
```
@z

@x
Now, let's run MySQL in a container and attach to the volumes and network we created above. Docker pulls the image from Hub and runs it locally.
@y
Now, let's run MySQL in a container and attach to the volumes and network we created above. Docker pulls the image from Hub and runs it locally.
@z

@x
```console
$ docker run -it --rm -d -v mysql_data:/var/lib/mysql \
-v mysql_config:/etc/mysql/conf.d \
--network mysqlnet \
--name mysqlserver \
-e MYSQL_USER=petclinic -e MYSQL_PASSWORD=petclinic \
-e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=petclinic \
-p 3306:3306 mysql:8.0.23
```
@y
```console
$ docker run -it --rm -d -v mysql_data:/var/lib/mysql \
-v mysql_config:/etc/mysql/conf.d \
--network mysqlnet \
--name mysqlserver \
-e MYSQL_USER=petclinic -e MYSQL_PASSWORD=petclinic \
-e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=petclinic \
-p 3306:3306 mysql:8.0.23
```
@z

@x
Okay, now that we have a running MySQL, let’s update our Dockerfile to activate the MySQL Spring profile defined in the application and switch from an in-memory H2 database to the MySQL server we just created.
@y
Okay, now that we have a running MySQL, let’s update our Dockerfile to activate the MySQL Spring profile defined in the application and switch from an in-memory H2 database to the MySQL server we just created.
@z

@x
We only need to add the MySQL profile as an argument to the `CMD` definition.
@y
We only need to add the MySQL profile as an argument to the `CMD` definition.
@z

@x
```dockerfile
CMD ["./mvnw", "spring-boot:run", "-Dspring-boot.run.profiles=mysql"]
```
@y
```dockerfile
CMD ["./mvnw", "spring-boot:run", "-Dspring-boot.run.profiles=mysql"]
```
@z

@x
Let's build our image
@y
Let's build our image
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
Now, let’s run our container. This time, we need to set the `MYSQL_URL` environment variable so that our application knows what connection string to use to access the database. We’ll do this using the `docker run` command.
@y
Now, let’s run our container. This time, we need to set the `MYSQL_URL` environment variable so that our application knows what connection string to use to access the database. We’ll do this using the `docker run` command.
@z

@x
```console
$ docker run --rm -d \
--name springboot-server \
--network mysqlnet \
-e MYSQL_URL=jdbc:mysql://mysqlserver/petclinic \
-p 8080:8080 java-docker
```
@y
```console
$ docker run --rm -d \
--name springboot-server \
--network mysqlnet \
-e MYSQL_URL=jdbc:mysql://mysqlserver/petclinic \
-p 8080:8080 java-docker
```
@z

@x
Let’s test that our application is connected to the database and is able to list Veterinarians.
@y
Let’s test that our application is connected to the database and is able to list Veterinarians.
@z

@x
```console
$ curl  --request GET \
  --url http://localhost:8080/vets \
  --header 'content-type: application/json'
```
@y
```console
$ curl  --request GET \
  --url http://localhost:8080/vets \
  --header 'content-type: application/json'
```
@z

@x
You should receive the following json back from our service.
@y
You should receive the following json back from our service.
@z

@x
```json
{"vetList":[{"id":1,"firstName":"James","lastName":"Carter","specialties":[],"nrOfSpecialties":0,"new":false},{"id":2,"firstName":"Helen","lastName":"Leary","specialties":[{"id":1,"name":"radiology","new":false}],"nrOfSpecialties":1,"new":false},{"id":3,"firstName":"Linda","lastName":"Douglas","specialties":[{"id":3,"name":"dentistry","new":false},{"id":2,"name":"surgery","new":false}],"nrOfSpecialties":2,"new":false},{"id":4,"firstName":"Rafael","lastName":"Ortega","specialties":[{"id":2,"name":"surgery","new":false}],"nrOfSpecialties":1,"new":false},{"id":5,"firstName":"Henry","lastName":"Stevens","specialties":[{"id":1,"name":"radiology","new":false}],"nrOfSpecialties":1,"new":false},{"id":6,"firstName":"Sharon","lastName":"Jenkins","specialties":[],"nrOfSpecialties":0,"new":false}]}
```
@y
```json
{"vetList":[{"id":1,"firstName":"James","lastName":"Carter","specialties":[],"nrOfSpecialties":0,"new":false},{"id":2,"firstName":"Helen","lastName":"Leary","specialties":[{"id":1,"name":"radiology","new":false}],"nrOfSpecialties":1,"new":false},{"id":3,"firstName":"Linda","lastName":"Douglas","specialties":[{"id":3,"name":"dentistry","new":false},{"id":2,"name":"surgery","new":false}],"nrOfSpecialties":2,"new":false},{"id":4,"firstName":"Rafael","lastName":"Ortega","specialties":[{"id":2,"name":"surgery","new":false}],"nrOfSpecialties":1,"new":false},{"id":5,"firstName":"Henry","lastName":"Stevens","specialties":[{"id":1,"name":"radiology","new":false}],"nrOfSpecialties":1,"new":false},{"id":6,"firstName":"Sharon","lastName":"Jenkins","specialties":[],"nrOfSpecialties":0,"new":false}]}
```
@z

@x
## Use Compose to develop locally
@y
## Use Compose to develop locally
@z

@x
In this section, we’ll create a Compose file to start our `java-docker` and the MySQL database using a single command. We’ll also set up the Compose file to start the `java-docker` application in debug mode so that we can connect a debugger to the running Java process.
@y
In this section, we’ll create a Compose file to start our `java-docker` and the MySQL database using a single command. We’ll also set up the Compose file to start the `java-docker` application in debug mode so that we can connect a debugger to the running Java process.
@z

@x
Open the `petclinic` in your IDE or a text editor and create a new file named `docker-compose.dev.yml`. Copy and paste the following commands into the file.
@y
Open the `petclinic` in your IDE or a text editor and create a new file named `docker-compose.dev.yml`. Copy and paste the following commands into the file.
@z

@x
```yaml
version: '3.8'
services:
  petclinic:
    build:
      context: .
    ports:
      - 8000:8000
      - 8080:8080
    environment:
      - SERVER_PORT=8080
      - MYSQL_URL=jdbc:mysql://mysqlserver/petclinic
    volumes:
      - ./:/app
    command: ./mvnw spring-boot:run -Dspring-boot.run.profiles=mysql -Dspring-boot.run.jvmArguments="-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:8000"
@y
```yaml
version: '3.8'
services:
  petclinic:
    build:
      context: .
    ports:
      - 8000:8000
      - 8080:8080
    environment:
      - SERVER_PORT=8080
      - MYSQL_URL=jdbc:mysql://mysqlserver/petclinic
    volumes:
      - ./:/app
    command: ./mvnw spring-boot:run -Dspring-boot.run.profiles=mysql -Dspring-boot.run.jvmArguments="-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:8000"
@z

@x
  mysqlserver:
    image: mysql:8.0.23
    ports:
      - 3306:3306
    environment:
      - MYSQL_ROOT_PASSWORD=
      - MYSQL_ALLOW_EMPTY_PASSWORD=true
      - MYSQL_USER=petclinic
      - MYSQL_PASSWORD=petclinic
      - MYSQL_DATABASE=petclinic
    volumes:
      - mysql_data:/var/lib/mysql
      - mysql_config:/etc/mysql/conf.d
volumes:
  mysql_data:
  mysql_config:
```
@y
  mysqlserver:
    image: mysql:8.0.23
    ports:
      - 3306:3306
    environment:
      - MYSQL_ROOT_PASSWORD=
      - MYSQL_ALLOW_EMPTY_PASSWORD=true
      - MYSQL_USER=petclinic
      - MYSQL_PASSWORD=petclinic
      - MYSQL_DATABASE=petclinic
    volumes:
      - mysql_data:/var/lib/mysql
      - mysql_config:/etc/mysql/conf.d
volumes:
  mysql_data:
  mysql_config:
```
@z

@x
This Compose file is super convenient as we do not have to type all the parameters to pass to the `docker run` command. We can declaratively do that using a Compose file.
@y
This Compose file is super convenient as we do not have to type all the parameters to pass to the `docker run` command. We can declaratively do that using a Compose file.
@z

@x
We expose port 8000 and declare the debug configuration for the JVM so that we can attach a debugger.
@y
We expose port 8000 and declare the debug configuration for the JVM so that we can attach a debugger.
@z

@x
Another really cool feature of using a Compose file is that we have service resolution set up to use the service names. Therefore, we are now able to use `mysqlserver` in our connection string. The reason we use `mysqlserver` is because that is what we've named our MySQL service as in the Compose file.
@y
Another really cool feature of using a Compose file is that we have service resolution set up to use the service names. Therefore, we are now able to use `mysqlserver` in our connection string. The reason we use `mysqlserver` is because that is what we've named our MySQL service as in the Compose file.
@z

@x
Now, to start our application and to confirm that it is running properly.
@y
Now, to start our application and to confirm that it is running properly.
@z

@x
```console
$ docker-compose -f docker-compose.dev.yml up --build
```
@y
```console
$ docker-compose -f docker-compose.dev.yml up --build
```
@z

@x
We pass the `--build` flag so Docker will compile our image and then starts the containers. You should see similar output if it runs successfully:
@y
We pass the `--build` flag so Docker will compile our image and then starts the containers. You should see similar output if it runs successfully:
@z

@x
![Java Compose output](images/java-compose-output.png)
@y
![Java Compose output](images/java-compose-output.png)
@z

@x
Now let’s test our API endpoint. Run the following curl commands:
@y
Now let’s test our API endpoint. Run the following curl commands:
@z

@x
```console
$ curl  --request GET \
  --url http://localhost:8080/vets \
  --header 'content-type: application/json'
```
@y
```console
$ curl  --request GET \
  --url http://localhost:8080/vets \
  --header 'content-type: application/json'
```
@z

@x
You should receive the following response:
@y
You should receive the following response:
@z

@x
```json
{"vetList":[{"id":1,"firstName":"James","lastName":"Carter","specialties":[],"nrOfSpecialties":0,"new":false},{"id":2,"firstName":"Helen","lastName":"Leary","specialties":[{"id":1,"name":"radiology","new":false}],"nrOfSpecialties":1,"new":false},{"id":3,"firstName":"Linda","lastName":"Douglas","specialties":[{"id":3,"name":"dentistry","new":false},{"id":2,"name":"surgery","new":false}],"nrOfSpecialties":2,"new":false},{"id":4,"firstName":"Rafael","lastName":"Ortega","specialties":[{"id":2,"name":"surgery","new":false}],"nrOfSpecialties":1,"new":false},{"id":5,"firstName":"Henry","lastName":"Stevens","specialties":[{"id":1,"name":"radiology","new":false}],"nrOfSpecialties":1,"new":false},{"id":6,"firstName":"Sharon","lastName":"Jenkins","specialties":[],"nrOfSpecialties":0,"new":false}]}
```
@y
```json
{"vetList":[{"id":1,"firstName":"James","lastName":"Carter","specialties":[],"nrOfSpecialties":0,"new":false},{"id":2,"firstName":"Helen","lastName":"Leary","specialties":[{"id":1,"name":"radiology","new":false}],"nrOfSpecialties":1,"new":false},{"id":3,"firstName":"Linda","lastName":"Douglas","specialties":[{"id":3,"name":"dentistry","new":false},{"id":2,"name":"surgery","new":false}],"nrOfSpecialties":2,"new":false},{"id":4,"firstName":"Rafael","lastName":"Ortega","specialties":[{"id":2,"name":"surgery","new":false}],"nrOfSpecialties":1,"new":false},{"id":5,"firstName":"Henry","lastName":"Stevens","specialties":[{"id":1,"name":"radiology","new":false}],"nrOfSpecialties":1,"new":false},{"id":6,"firstName":"Sharon","lastName":"Jenkins","specialties":[],"nrOfSpecialties":0,"new":false}]}
```
@z

@x
## Connect a Debugger
@y
## Connect a Debugger
@z

@x
We’ll use the debugger that comes with the IntelliJ IDEA. You can use the community version of this IDE. Open your project in IntelliJ IDEA and then go to the **Run** menu > **Edit Configuration**. Add a new Remote JVM Debug configuration similar to the following:
@y
We’ll use the debugger that comes with the IntelliJ IDEA. You can use the community version of this IDE. Open your project in IntelliJ IDEA and then go to the **Run** menu > **Edit Configuration**. Add a new Remote JVM Debug configuration similar to the following:
@z

@x
![Java Connect a Debugger](images/connect-debugger.png)
@y
![Java Connect a Debugger](images/connect-debugger.png)
@z

@x
Let's set a breakpoint
@y
Let's set a breakpoint
@z

@x
Open the following file `src/main/java/org/springframework/samples/petclinic/vet/VetController.java` and add a breakpoint inside the `showResourcesVetList` function.
@y
Open the following file `src/main/java/org/springframework/samples/petclinic/vet/VetController.java` and add a breakpoint inside the `showResourcesVetList` function.
@z

@x
Start your debug session, **Run** menu and then **Debug _NameOfYourConfiguration_**
@y
Start your debug session, **Run** menu and then **Debug _NameOfYourConfiguration_**
@z

@x
![Debug menu](images/debug-menu.png)
@y
![Debug menu](images/debug-menu.png)
@z

@x
You should now see the connection in the logs of your Compose application.
@y
You should now see the connection in the logs of your Compose application.
@z

@x
![Compose log file ](images/compose-logs.png)
@y
![Compose log file ](images/compose-logs.png)
@z

@x
We can now call the server endpoint.
@y
We can now call the server endpoint.
@z

@x
```console
$ curl --request GET --url http://localhost:8080/vets
```
@y
```console
$ curl --request GET --url http://localhost:8080/vets
```
@z

@x
You should have seen the code break on the marked line and now you are able to use the debugger just like you would normally. You can also inspect and watch variables, set conditional breakpoints, view stack traces and a do bunch of other stuff.
@y
You should have seen the code break on the marked line and now you are able to use the debugger just like you would normally. You can also inspect and watch variables, set conditional breakpoints, view stack traces and a do bunch of other stuff.
@z

@x
![Debugger code breakpoint](images/debugger-breakpoint.png)
@y
![Debugger code breakpoint](images/debugger-breakpoint.png)
@z

@x
You can also activate the live reload option provided by SpringBoot Dev Tools. Check out the [SpringBoot documentation](https://docs.spring.io/spring-boot/docs/current/reference/html/using-spring-boot.html#using-boot-devtools-remote){:target="_blank" rel="noopener" class="_"} for information on how to connect to a remote application.
@y
You can also activate the live reload option provided by SpringBoot Dev Tools. Check out the [SpringBoot documentation](https://docs.spring.io/spring-boot/docs/current/reference/html/using-spring-boot.html#using-boot-devtools-remote){:target="_blank" rel="noopener" class="_"} for information on how to connect to a remote application.
@z

@x
## Next steps
@y
## Next steps
@z

@x
In this module, we took a look at creating a general development image that we can use pretty much like our normal command line. We also set up our Compose file to expose the debugging port and configure Spring Boot to live reload our changes.
@y
In this module, we took a look at creating a general development image that we can use pretty much like our normal command line. We also set up our Compose file to expose the debugging port and configure Spring Boot to live reload our changes.
@z

@x
In the next module, we’ll take a look at how to run unit tests in Docker. See
@y
In the next module, we’ll take a look at how to run unit tests in Docker. See
@z

@x
[Run your tests](run-tests.md){: .button .primary-btn}
@y
[Run your tests](run-tests.md){: .button .primary-btn}
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
