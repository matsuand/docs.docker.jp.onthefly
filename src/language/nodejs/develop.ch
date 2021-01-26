%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: "Use containers for development"
keywords: get started, NodeJS, local, development
description: Learn how to develop your application locally.
redirect_from:
- /get-started/nodejs/develop/
---
@y
---
title: "開発向けのコンテナー利用"
keywords: get started, NodeJS, local, development
description: Learn how to develop your application locally.
redirect_from:
- /get-started/nodejs/develop/
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
## Local database and containers
@y
## Local database and containers
@z

@x
First, we’ll take a look at running a database in a container and how we use volumes and networking to persist our data and allow our application to talk with the database. Then we’ll pull everything together into a compose file which will allow us to setup and run a local development environment with one command. Finally, we’ll take a look at connecting a debugger to our application running inside a container.
@y
First, we’ll take a look at running a database in a container and how we use volumes and networking to persist our data and allow our application to talk with the database. Then we’ll pull everything together into a compose file which will allow us to setup and run a local development environment with one command. Finally, we’ll take a look at connecting a debugger to our application running inside a container.
@z

@x
Instead of downloading MongoDB, installing, configuring and then running the Mongo database as a service, we can use the Docker Official Image for MongoDB and run it in a container.
@y
Instead of downloading MongoDB, installing, configuring and then running the Mongo database as a service, we can use the Docker Official Image for MongoDB and run it in a container.
@z

@x
Before we run MongoDB in a container, we want to create a couple of volumes that Docker can manage to store our persistent data and configuration. Let's use the managed volumes feature that docker provides instead of using bind mounts. You can read all about volumes in our documentation.
@y
Before we run MongoDB in a container, we want to create a couple of volumes that Docker can manage to store our persistent data and configuration. Let's use the managed volumes feature that docker provides instead of using bind mounts. You can read all about volumes in our documentation.
@z

@x
Let’s create our volumes now. We’ll create one for the data and one for configuration of MongoDB.
@y
Let’s create our volumes now. We’ll create one for the data and one for configuration of MongoDB.
@z

@x
```shell
$ docker volume create mongodb
$ docker volume create mongodb_config
```
@y
```shell
$ docker volume create mongodb
$ docker volume create mongodb_config
```
@z

@x
Now we’ll create a network that our application and database will use to talk with each other. The network is called a user-defined bridge network and gives us a nice DNS lookup service which we can use when creating our connection string.
@y
Now we’ll create a network that our application and database will use to talk with each other. The network is called a user-defined bridge network and gives us a nice DNS lookup service which we can use when creating our connection string.
@z

@x
```shell
$ docker network create mongodb
```
@y
```shell
$ docker network create mongodb
```
@z

@x
Now we can run MongoDB in a container and attach to the volumes and network we created above. Docker will pull the image from Hub and run it for you locally.
@y
Now we can run MongoDB in a container and attach to the volumes and network we created above. Docker will pull the image from Hub and run it for you locally.
@z

@x
```shell
$ docker run -it --rm -d -v mongodb:/data/db \
  -v mongodb_config:/data/configdb -p 27017:27017 \
  --network mongodb \
  --name mongodb \
  mongo
```
@y
```shell
$ docker run -it --rm -d -v mongodb:/data/db \
  -v mongodb_config:/data/configdb -p 27017:27017 \
  --network mongodb \
  --name mongodb \
  mongo
```
@z

@x
Okay, now that we have a running MongoDB, let’s update `server.js` to use MongoDB and not an in-memory data store.
@y
Okay, now that we have a running MongoDB, let’s update `server.js` to use MongoDB and not an in-memory data store.
@z

@x
```javascript
const ronin     = require( 'ronin-server' )
const mocks     = require( 'ronin-mocks' )
const database  = require( 'ronin-database' )
const server = ronin.server()
@y
```javascript
const ronin     = require( 'ronin-server' )
const mocks     = require( 'ronin-mocks' )
const database  = require( 'ronin-database' )
const server = ronin.server()
@z

@x
database.connect( process.env.CONNECTIONSTRING )
server.use( '/', mocks.server( server.Router(), false, false ) )
server.start()
```
@y
database.connect( process.env.CONNECTIONSTRING )
server.use( '/', mocks.server( server.Router(), false, false ) )
server.start()
```
@z

@x
We’ve add the `ronin-database` module and we updated the code to connect to the database and set the in-memory flag to false. We now need to rebuild our image so it contains our changes.
@y
We’ve add the `ronin-database` module and we updated the code to connect to the database and set the in-memory flag to false. We now need to rebuild our image so it contains our changes.
@z

@x
First let’s add the `ronin-database` module to our application using npm.
@y
First let’s add the `ronin-database` module to our application using npm.
@z

@x
```shell
$ npm install ronin-database
```
@y
```shell
$ npm install ronin-database
```
@z

@x
Now we can build our image.
@y
Now we can build our image.
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
Now, let’s run our container. But this time we’ll need to set the `CONNECTIONSTRING` environment variable so our application knows what connection string to use to access the database. We’ll do this right in the `docker run` command.
@y
Now, let’s run our container. But this time we’ll need to set the `CONNECTIONSTRING` environment variable so our application knows what connection string to use to access the database. We’ll do this right in the `docker run` command.
@z

@x
```shell
$ docker run \
  -it --rm -d \
  --network mongodb \
  --name rest-server \
  -p 8000:8000 \
  -e CONNECTIONSTRING=mongodb://mongodb:27017/yoda_notes \
  node-docker
```
@y
```shell
$ docker run \
  -it --rm -d \
  --network mongodb \
  --name rest-server \
  -p 8000:8000 \
  -e CONNECTIONSTRING=mongodb://mongodb:27017/yoda_notes \
  node-docker
```
@z

@x
Let’s test that our application is connected to the database and is able to add a note.
@y
Let’s test that our application is connected to the database and is able to add a note.
@z

@x
```shell
$ curl --request POST \
  --url http://localhost:8000/notes \
  --header 'content-type: application/json' \
  --data '{
"name": "this is a note",
"text": "this is a note that I wanted to take while I was working on writing a blog post.",
"owner": "peter"
}'
```
@y
```shell
$ curl --request POST \
  --url http://localhost:8000/notes \
  --header 'content-type: application/json' \
  --data '{
"name": "this is a note",
"text": "this is a note that I wanted to take while I was working on writing a blog post.",
"owner": "peter"
}'
```
@z

@x
You should receive the following json back from our service.
@y
You should receive the following json back from our service.
@z

@x
```json
{"code":"success","payload":{"_id":"5efd0a1552cd422b59d4f994","name":"this is a note","text":"this is a note that I wanted to take while I was working on writing a blog post.","owner":"peter","createDate":"2020-07-01T22:11:33.256Z"}}
```
@y
```json
{"code":"success","payload":{"_id":"5efd0a1552cd422b59d4f994","name":"this is a note","text":"this is a note that I wanted to take while I was working on writing a blog post.","owner":"peter","createDate":"2020-07-01T22:11:33.256Z"}}
```
@z

@x
## Use Compose to develop locally
@y
## Use Compose to develop locally
@z

@x
In this section, we’ll create a Compose file to start our node-docker and the MongoDB with one command. We’ll also set up the Compose file to start the node-docker in debug mode so that we can connect a debugger to the running node process.
@y
In this section, we’ll create a Compose file to start our node-docker and the MongoDB with one command. We’ll also set up the Compose file to start the node-docker in debug mode so that we can connect a debugger to the running node process.
@z

@x
Open the notes-service in your IDE or text editor and create a new file named `docker-compose.dev.yml`. Copy and paste the below commands into the file.
@y
Open the notes-service in your IDE or text editor and create a new file named `docker-compose.dev.yml`. Copy and paste the below commands into the file.
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
 notes:
  build:
   context: .
  ports:
   - 8080:8080
   - 9229:9229
  environment:
   - SERVER_PORT=8080
   - CONNECTIONSTRING=mongodb://mongo:27017/notes
  volumes:
   - ./:/code
  command: npm run debug
@y
services:
 notes:
  build:
   context: .
  ports:
   - 8080:8080
   - 9229:9229
  environment:
   - SERVER_PORT=8080
   - CONNECTIONSTRING=mongodb://mongo:27017/notes
  volumes:
   - ./:/code
  command: npm run debug
@z

@x
 mongo:
  image: mongo:4.2.8
  ports:
   - 27017:27017
  volumes:
   - mongodb:/data/db
   - mongodb_config:/data/configdb
volumes:
 mongodb:
 mongodb_config:
```
@y
 mongo:
  image: mongo:4.2.8
  ports:
   - 27017:27017
  volumes:
   - mongodb:/data/db
   - mongodb_config:/data/configdb
volumes:
 mongodb:
 mongodb_config:
```
@z

@x
This Compose file is super convenient as we do not have to type all the parameters to pass to the `docker run` command. We can declaratively do that in the Compose file.
@y
This Compose file is super convenient as we do not have to type all the parameters to pass to the `docker run` command. We can declaratively do that in the Compose file.
@z

@x
We are exposing `port 9229` so that we can attach a debugger. We are also mapping our local source code into the running container so that we can make changes in our text editor and have those changes picked up in the container.
@y
We are exposing `port 9229` so that we can attach a debugger. We are also mapping our local source code into the running container so that we can make changes in our text editor and have those changes picked up in the container.
@z

@x
One other really cool feature of using a Compose file is that we have service resolution set up to use the service names. So we are now able to use `“mongo”` in our connection string. The reason we use mongo is because that is what we have named our MongoDB service in the Compose file as.
@y
One other really cool feature of using a Compose file is that we have service resolution set up to use the service names. So we are now able to use `“mongo”` in our connection string. The reason we use mongo is because that is what we have named our MongoDB service in the Compose file as.
@z

@x
To start our application in debug mode, we need to add a line to our `package.json` file to tell npm how to start our application in debug mode.
@y
To start our application in debug mode, we need to add a line to our `package.json` file to tell npm how to start our application in debug mode.
@z

@x
Open the `package.json` file and add the following line to the scripts section:
@y
Open the `package.json` file and add the following line to the scripts section:
@z

@x
```json
  "debug": "nodemon --inspect=0.0.0.0:9229 server.js"
```
@y
```json
  "debug": "nodemon --inspect=0.0.0.0:9229 server.js"
```
@z

@x
As you can see, we are going to use nodemon. Nodemon starts our server in debug mode and also watches for files that have changed, and restarts our server. Let’s run the following command in a terminal to install nodemon into our project directory.
@y
As you can see, we are going to use nodemon. Nodemon starts our server in debug mode and also watches for files that have changed, and restarts our server. Let’s run the following command in a terminal to install nodemon into our project directory.
@z

@x
```json
$ npm install nodemon
```
@y
```json
$ npm install nodemon
```
@z

@x
Let’s start our application and confirm that it is running properly.
@y
Let’s start our application and confirm that it is running properly.
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
We pass the `--build` flag so Docker will compile our image and then starts it.
@y
We pass the `--build` flag so Docker will compile our image and then starts it.
@z

@x
If all goes will you should see something similar:
@y
If all goes will you should see something similar:
@z

@x
  ![node-compile](images/node-compile.png){:width="800px"}
@y
  ![node-compile](images/node-compile.png){:width="800px"}
@z

@x
Now let’s test our API endpoint. Run the following curl command:
@y
Now let’s test our API endpoint. Run the following curl command:
@z

@x
```shell
$ curl --request GET --url http://localhost:8080/services/m/notes
```
@y
```shell
$ curl --request GET --url http://localhost:8080/services/m/notes
```
@z

@x
You should receive the following response:
@y
You should receive the following response:
@z

@x
```json
{"code":"success","meta":{"total":0,"count":0},"payload":[]}
```
@y
```json
{"code":"success","meta":{"total":0,"count":0},"payload":[]}
```
@z

@x
## Connect a debugger
@y
## Connect a debugger
@z

@x
We’ll use the debugger that comes with the Chrome browser. Open Chrome on your machine and then type the following into the address bar.
@y
We’ll use the debugger that comes with the Chrome browser. Open Chrome on your machine and then type the following into the address bar.
@z

@x
`about:inspect`
@y
`about:inspect`
@z

@x
It opens the following screen.
@y
It opens the following screen.
@z

@x
  ![Chrome-inspect](images/chrome-inspect.png){:width="800px"}
@y
  ![Chrome-inspect](images/chrome-inspect.png){:width="800px"}
@z

@x
Click the **Open dedicated DevTools for Node** link. This opens the DevTools that are connected to the running Node.js process inside our container.
@y
Click the **Open dedicated DevTools for Node** link. This opens the DevTools that are connected to the running Node.js process inside our container.
@z

@x
Let’s change the source code and then set a breakpoint.
@y
Let’s change the source code and then set a breakpoint.
@z

@x
Add the following code to the server.js file on line 19 and save the file.
@y
Add the following code to the server.js file on line 19 and save the file.
@z

@x
```node
 server.use( '/foo', (req, res) => {
   return res.json({ "foo": "bar" })
 })
```
@y
```node
 server.use( '/foo', (req, res) => {
   return res.json({ "foo": "bar" })
 })
```
@z

@x
If you take a look at the terminal where our Compose application is running, you’ll see that nodemon noticed the changes and reloaded our application.
@y
If you take a look at the terminal where our Compose application is running, you’ll see that nodemon noticed the changes and reloaded our application.
@z

@x
 ![nodemon](images/nodemon.png){:width="800px"}
@y
 ![nodemon](images/nodemon.png){:width="800px"}
@z

@x
Navigate back to the Chrome DevTools and set a breakpoint on line 20 and then run the following curl command to trigger the breakpoint.
@y
Navigate back to the Chrome DevTools and set a breakpoint on line 20 and then run the following curl command to trigger the breakpoint.
@z

@x
```shell
$ curl --request GET --url http://localhost:8080/foo
```
@y
```shell
$ curl --request GET --url http://localhost:8080/foo
```
@z

@x
You should have seen the code break on line 20 and now you are able to use the debugger just like you would normally. You can inspect and watch variables, set conditional breakpoints, view stack traces, etc.
@y
You should have seen the code break on line 20 and now you are able to use the debugger just like you would normally. You can inspect and watch variables, set conditional breakpoints, view stack traces, etc.
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
In the next module, we’ll take a look at how to run unit tests in Docker. See:
@y
In the next module, we’ll take a look at how to run unit tests in Docker. See:
@z

@x
[Run your tests](run-tests.md){: .button .outline-btn}
@y
[Run your tests](run-tests.md){: .button .outline-btn}
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
