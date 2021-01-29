%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: "Use containers for development"
keywords: python, local, development, run,
description: Learn how to develop your application locally.
---
@y
---
title: "Use containers for development"
keywords: python, local, development, run,
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
Let’s create our volumes now. We’ll create one for the data and one for configuration of MongoDB.
@y
Let’s create our volumes now. We’ll create one for the data and one for configuration of MongoDB.
@z

@x
```shell
$ docker volume create mysql
$ docker volume create mysql_config
```
@y
```shell
$ docker volume create mysql
$ docker volume create mysql_config
```
@z

@x
Now we’ll create a network that our application and database will use to talk to each other. The network is called a user-defined bridge network and gives us a nice DNS lookup service which we can use when creating our connection string.
@y
Now we’ll create a network that our application and database will use to talk to each other. The network is called a user-defined bridge network and gives us a nice DNS lookup service which we can use when creating our connection string.
@z

@x
```shell
$ docker network create mysqlnet
```
@y
```shell
$ docker network create mysqlnet
```
@z

@x
Now we can run MySQL in a container and attach to the volumes and network we created above. Docker pulls the image from Hub and run it for you locally.
@y
Now we can run MySQL in a container and attach to the volumes and network we created above. Docker pulls the image from Hub and run it for you locally.
@z

@x
```shell
$ docker run -it --rm -d -v mysql:/var/lib/mysql \
  -v mysql_config:/etc/mysql -p 3306:3306 \
  --network mysqlnet \
  --name mysqldb \
  -e MYSQL_ALLOW_EMPTY_PASSWORD=true \
  mysql
```
@y
```shell
$ docker run -it --rm -d -v mysql:/var/lib/mysql \
  -v mysql_config:/etc/mysql -p 3306:3306 \
  --network mysqlnet \
  --name mysqldb \
  -e MYSQL_ALLOW_EMPTY_PASSWORD=true \
  mysql
```
@z

@x
Now, let’s make sure that our MySQL database is running and that we can connect to it. Connect to the running MySQL database inside the container using the following command:
@y
Now, let’s make sure that our MySQL database is running and that we can connect to it. Connect to the running MySQL database inside the container using the following command:
@z

@x
```shell
$ docker run -it --network mysqlnet --rm mysql mysql -hmysqldb
Enter password: ********
@y
```shell
$ docker run -it --network mysqlnet --rm mysql mysql -hmysqldb
Enter password: ********
@z

@x
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.23 MySQL Community Server - GPL
@y
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.23 MySQL Community Server - GPL
@z

@x
Copyright (c) 2000, 2021, Oracle and/or its affiliates.
@y
Copyright (c) 2000, 2021, Oracle and/or its affiliates.
@z

@x
Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.
@y
Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.
@z

@x
Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.
@y
Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.
@z

@x
mysql>
```
@y
mysql>
```
@z

@x
### Connect the application to the database
@y
### Connect the application to the database
@z

@x
In the above command, we used the same MySQL image to connect to the database but this time, we passed the ‘mysql’ command to the container with the `-h` flag containing the name of our MySQL container name. Press CTRL-D to exit the MySQL  interactive terminal.
@y
In the above command, we used the same MySQL image to connect to the database but this time, we passed the ‘mysql’ command to the container with the `-h` flag containing the name of our MySQL container name. Press CTRL-D to exit the MySQL  interactive terminal.
@z

@x
Next, we'll update the sample application we created in the [Build images](build-images.md#sample-application) module. To see the directory structure of the Python app, see [Python application directory structure](build-images.md#directory-structure).
@y
Next, we'll update the sample application we created in the [Build images](build-images.md#sample-application) module. To see the directory structure of the Python app, see [Python application directory structure](build-images.md#directory-structure).
@z

@x
Okay, now that we have a running MySQL, let’s update the`app.py` to use MySQL as a datastore. Let’s also add some routes to our server. One for fetching records and one for inserting records.
@y
Okay, now that we have a running MySQL, let’s update the`app.py` to use MySQL as a datastore. Let’s also add some routes to our server. One for fetching records and one for inserting records.
@z

@x
```shell
import mysql.connector
import json
from flask import Flask
@y
```shell
import mysql.connector
import json
from flask import Flask
@z

@x
app = Flask(__name__)
@y
app = Flask(__name__)
@z

@x
@app.route('/')
def hello_world():
  return 'Hello, Docker!'
@y
@app.route('/')
def hello_world():
  return 'Hello, Docker!'
@z

@x
@app.route('/widgets')
def get_widgets() :
  mydb = mysql.connector.connect(
    host="mysqldb",
    user="root",
    password="p@ssw0rd1",
    database="inventory"
  )
  cursor = mydb.cursor()
@y
@app.route('/widgets')
def get_widgets() :
  mydb = mysql.connector.connect(
    host="mysqldb",
    user="root",
    password="p@ssw0rd1",
    database="inventory"
  )
  cursor = mydb.cursor()
@z

@x
  cursor.execute("SELECT * FROM widgets")
@y
  cursor.execute("SELECT * FROM widgets")
@z

@x
  row_headers=[x[0] for x in cursor.description] #this will extract row headers
@y
  row_headers=[x[0] for x in cursor.description] #this will extract row headers
@z

@x
  results = cursor.fetchall()
  json_data=[]
  for result in results:
    json_data.append(dict(zip(row_headers,result)))
@y
  results = cursor.fetchall()
  json_data=[]
  for result in results:
    json_data.append(dict(zip(row_headers,result)))
@z

@x
  cursor.close()
@y
  cursor.close()
@z

@x
  return json.dumps(json_data)
@y
  return json.dumps(json_data)
@z

@x
@app.route('/db')
def db_init():
  mydb = mysql.connector.connect(
    host="mysqldb",
    user="root",
    password="p@ssw0rd1"
  )
  cursor = mydb.cursor()
@y
@app.route('/db')
def db_init():
  mydb = mysql.connector.connect(
    host="mysqldb",
    user="root",
    password="p@ssw0rd1"
  )
  cursor = mydb.cursor()
@z

@x
  cursor.execute("DROP DATABASE IF EXISTS inventory")
  cursor.execute("CREATE DATABASE inventory")
  cursor.close()
@y
  cursor.execute("DROP DATABASE IF EXISTS inventory")
  cursor.execute("CREATE DATABASE inventory")
  cursor.close()
@z

@x
  mydb = mysql.connector.connect(
    host="mysqldb",
    user="root",
    password="p@ssw0rd1",
    database="inventory"
  )
  cursor = mydb.cursor()
@y
  mydb = mysql.connector.connect(
    host="mysqldb",
    user="root",
    password="p@ssw0rd1",
    database="inventory"
  )
  cursor = mydb.cursor()
@z

@x
  cursor.execute("DROP TABLE IF EXISTS widgets")
  cursor.execute("CREATE TABLE widgets (name VARCHAR(255), description VARCHAR(255))")
  cursor.close()
@y
  cursor.execute("DROP TABLE IF EXISTS widgets")
  cursor.execute("CREATE TABLE widgets (name VARCHAR(255), description VARCHAR(255))")
  cursor.close()
@z

@x
  return 'init database'
@y
  return 'init database'
@z

@x
if __name__ == "__main__":
  app.run(host ='0.0.0.0')
```
@y
if __name__ == "__main__":
  app.run(host ='0.0.0.0')
```
@z

@x
We’ve added the MySQL module and updated the code to connect to the database server, created a database and table. We also created a couple of routes to save widgets and fetch widgets. We now need to rebuild our image so it contains our changes.
@y
We’ve added the MySQL module and updated the code to connect to the database server, created a database and table. We also created a couple of routes to save widgets and fetch widgets. We now need to rebuild our image so it contains our changes.
@z

@x
First, let’s add the `mysql-connector-python `module to our application using pip.
@y
First, let’s add the `mysql-connector-python `module to our application using pip.
@z

@x
```shell
$ pip3 install mysql-connector-python
$ pip3 freeze -r requirements.txt
```
@y
```shell
$ pip3 install mysql-connector-python
$ pip3 freeze -r requirements.txt
```
@z

@x
Now we can build our image.
@y
Now we can build our image.
@z

@x
```shell
$ docker build --tag python-docker .
```
@y
```shell
$ docker build --tag python-docker .
```
@z

@x
Now, let’s add the container to the database network and then run our container. This allows us to access the database by its container name.
@y
Now, let’s add the container to the database network and then run our container. This allows us to access the database by its container name.
@z

@x
```shell
$ docker run \
  -it --rm -d \
  --network mysqlnet \
  --name rest-server \
  -p 5000:5000 \
  python-docker
```
@y
```shell
$ docker run \
  -it --rm -d \
  --network mysqlnet \
  --name rest-server \
  -p 5000:5000 \
  python-docker
```
@z

@x
Let’s test that our application is connected to the database and is able to add a note.
@y
Let’s test that our application is connected to the database and is able to add a note.
@z

@x
```shell
$ curl http://localhost:5000/initdb
$ curl --request POST \
  --url http://localhost:5000/widgets \
  --header 'Content-Type: application/x-www-form-urlencoded' \
  --data 'name=widget01' \
  --data 'description=this is a test widget'
```
@y
```shell
$ curl http://localhost:5000/initdb
$ curl --request POST \
  --url http://localhost:5000/widgets \
  --header 'Content-Type: application/x-www-form-urlencoded' \
  --data 'name=widget01' \
  --data 'description=this is a test widget'
```
@z

@x
You should receive the following JSON back from our service.
@y
You should receive the following JSON back from our service.
@z

@x
```shell
[{"name": "widget01", "description": "this is a test widget"}]
```
@y
```shell
[{"name": "widget01", "description": "this is a test widget"}]
```
@z

@x
## Use Compose to develop locally
@y
## Use Compose to develop locally
@z

@x
In this section, we’ll create a Compose file to start our python-docker and the MySQL database using a single command. We’ll also set up the Compose file to start the `python-docker` application in debug mode so that we can connect a debugger to the running process.
@y
In this section, we’ll create a Compose file to start our python-docker and the MySQL database using a single command. We’ll also set up the Compose file to start the `python-docker` application in debug mode so that we can connect a debugger to the running process.
@z

@x
Open the `python-docker` code in your IDE or a text editor and create a new file named `docker-compose.dev.yml`. Copy and paste the following commands into the file.
@y
Open the `python-docker` code in your IDE or a text editor and create a new file named `docker-compose.dev.yml`. Copy and paste the following commands into the file.
@z

@x
```yaml
version: '3.8'
@y
```yaml
version: '3.8'
@z

@x
services:
 web:
  build:
   context: .
  ports:
  - 5000:5000
  volumes:
  - ./:/app
@y
services:
 web:
  build:
   context: .
  ports:
  - 5000:5000
  volumes:
  - ./:/app
@z

@x
 mysqldb:
  image: mysql
  ports:
  - 3306:3306
  environment:
  - MYSQL_ROOT_PASSWORD=p@ssw0rd1
  volumes:
  - mysql:/var/lib/mysql
  - mysql_config:/etc/mysql
@y
 mysqldb:
  image: mysql
  ports:
  - 3306:3306
  environment:
  - MYSQL_ROOT_PASSWORD=p@ssw0rd1
  volumes:
  - mysql:/var/lib/mysql
  - mysql_config:/etc/mysql
@z

@x
volumes:
  mysql:
  mysql_config:
```
@y
volumes:
  mysql:
  mysql_config:
```
@z

@x
This Compose file is super convenient as we do not have to type all the parameters to pass to the `docker run` command. We can declaratively do that using a Compose file.
@y
This Compose file is super convenient as we do not have to type all the parameters to pass to the `docker run` command. We can declaratively do that using a Compose file.
@z

@x
We expose port 5000 so that we can reach the dev web server inside the container. We also map our local source code into the running container to make changes in our text editor and have those changes picked up in the container.
@y
We expose port 5000 so that we can reach the dev web server inside the container. We also map our local source code into the running container to make changes in our text editor and have those changes picked up in the container.
@z

@x
Another really cool feature of using a Compose file is that we have service resolution set up to use the service names. Therefore, we are now able to use “mysqldb” in our connection string. The reason we use “mysqldb” is because that is what we've named our MySQL service as in the Compose file.
@y
Another really cool feature of using a Compose file is that we have service resolution set up to use the service names. Therefore, we are now able to use “mysqldb” in our connection string. The reason we use “mysqldb” is because that is what we've named our MySQL service as in the Compose file.
@z

@x
Now, to start our application and to confirm that it is running properly, run the following command:
@y
Now, to start our application and to confirm that it is running properly, run the following command:
@z

@x
```shell
$ docker-compose -f docker-compose.dev.yml up --build
```
@y
```shell
$ docker-compose -f docker-compose.dev.yml up --build
```
@z

@x
We pass the `--build` flag so Docker will compile our image and then starts the containers.
@y
We pass the `--build` flag so Docker will compile our image and then starts the containers.
@z

@x
Now let’s test our API endpoint. Run the following curl command:
@y
Now let’s test our API endpoint. Run the following curl command:
@z

@x
```shell
$ curl --request GET --url http://localhost:8080/widgets
```
@y
```shell
$ curl --request GET --url http://localhost:8080/widgets
```
@z

@x
You should receive the following response:
@y
You should receive the following response:
@z

@x
```shell
[]
```
@y
```shell
[]
```
@z

@x
This is because our database is empty.
@y
This is because our database is empty.
@z

@x
## Next steps
@y
## Next steps
@z

@x
In this module, we took a look at creating a general development image that we can use pretty much like our normal command line. We also set up our Compose file to map our source code into the running container and exposed the debugging port.
@y
In this module, we took a look at creating a general development image that we can use pretty much like our normal command line. We also set up our Compose file to map our source code into the running container and exposed the debugging port.
@z

@x
In the next module, we’ll take a look at how to set up a CI/CD pipeline using GitHub Actions. See:
@y
In the next module, we’ll take a look at how to set up a CI/CD pipeline using GitHub Actions. See:
@z

@x
[Configure CI/CD](configure-ci-cd.md){: .button .outline-btn}
@y
[Configure CI/CD](configure-ci-cd.md){: .button .outline-btn}
@z

@x
## Feedback
@y
## Feedback
@z

@x
Help us improve this topic by providing your feedback. Let us know what you think by creating an issue in the [Docker Docs ](https://github.com/docker/docker.github.io/issues/new?title=[Python%20docs%20feedback]){:target="_blank" rel="noopener" class="_"} GitHub repository. Alternatively, [create a PR](https://github.com/docker/docker.github.io/pulls){:target="_blank" rel="noopener" class="_"} to suggest updates.
@y
Help us improve this topic by providing your feedback. Let us know what you think by creating an issue in the [Docker Docs ](https://github.com/docker/docker.github.io/issues/new?title=[Python%20docs%20feedback]){:target="_blank" rel="noopener" class="_"} GitHub repository. Alternatively, [create a PR](https://github.com/docker/docker.github.io/pulls){:target="_blank" rel="noopener" class="_"} to suggest updates.
@z
