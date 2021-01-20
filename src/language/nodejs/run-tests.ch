%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: "Run your Tests using Node.js and Mocha frameworks"
keywords: Node.js, build, Mocha, test
description: How to Build and Run your Tests using Node.js and Mocha frameworks
---
@y
---
title: "Run your Tests using Node.js and Mocha frameworks"
keywords: Node.js, build, Mocha, test
description: How to Build and Run your Tests using Node.js and Mocha frameworks
---
@z

@x
{% include_relative nav.html selected="4" %}
@y
{% include_relative nav.html selected="4" %}
@z

@x
Testing is an essential part of modern software development. Testing can mean a lot of things to different development teams. There are unit tests, integration tests and end-to-end testing. In this guide we take a look at running your unit tests in Docker. Let's assume we have defined Mocha tests in a `./test` folder within our application.
@y
Testing is an essential part of modern software development. Testing can mean a lot of things to different development teams. There are unit tests, integration tests and end-to-end testing. In this guide we take a look at running your unit tests in Docker. Let's assume we have defined Mocha tests in a `./test` folder within our application.
@z

@x
### Running locally and testing the application
@y
### Running locally and testing the application
@z

@x
Now that we have our sample application locally, let’s build our Docker image and make sure everything is running properly. Run the following commands to build and then run your Docker image in a container.
@y
Now that we have our sample application locally, let’s build our Docker image and make sure everything is running properly. Run the following commands to build and then run your Docker image in a container.
@z

@x
```shell
$ docker build -t node-docker .
$ docker run -it --rm --name app -p 8080:80 node-docker
```
@y
```shell
$ docker build -t node-docker .
$ docker run -it --rm --name app -p 8080:80 node-docker
```
@z

@x
Now let’s test our application by POSTing a JSON payload and then make an HTTP GET request to make sure our JSON was saved correctly.
@y
Now let’s test our application by POSTing a JSON payload and then make an HTTP GET request to make sure our JSON was saved correctly.
@z

@x
```shell
$ curl --request POST \
  --url http://localhost:8080/services/test \
  --header 'content-type: application/json' \
  --data '{
	"msg": "testing"
}'
```
@y
```shell
$ curl --request POST \
  --url http://localhost:8080/services/test \
  --header 'content-type: application/json' \
  --data '{
	"msg": "testing"
}'
```
@z

@x
Now, perform a GET request to the same endpoint to make sure our JSON payload was saved and retrieved correctly. The “id” and “createDate” will be different for you.
@y
Now, perform a GET request to the same endpoint to make sure our JSON payload was saved and retrieved correctly. The “id” and “createDate” will be different for you.
@z

@x
```shell
$ curl http://localhost:8080/services/test
@y
```shell
$ curl http://localhost:8080/services/test
@z

@x
{"code":"success","payload":[{"msg":"testing","id":"e88acedb-203d-4a7d-8269-1df6c1377512","createDate":"2020-10-11T23:21:16.378Z"}]}
```
@y
{"code":"success","payload":[{"msg":"testing","id":"e88acedb-203d-4a7d-8269-1df6c1377512","createDate":"2020-10-11T23:21:16.378Z"}]}
```
@z

@x
## Install Mocha
@y
## Install Mocha
@z

@x
Run the following command to install Mocha and add it to the developer dependencies:
@y
Run the following command to install Mocha and add it to the developer dependencies:
@z

@x
```shell
$ npm install --save-dev mocha
```
@y
```shell
$ npm install --save-dev mocha
```
@z

@x
## Refactor Dockerfile to run tests
@y
## Refactor Dockerfile to run tests
@z

@x
Okay, now that we know our application is running properly, let’s try and run our tests inside of the container. We’ll use the same docker run command we used above but this time, we’ll override the CMD that is inside of our container with npm run test. This will invoke the command that is in the package.json file under the “script” section. See below.
@y
Okay, now that we know our application is running properly, let’s try and run our tests inside of the container. We’ll use the same docker run command we used above but this time, we’ll override the CMD that is inside of our container with npm run test. This will invoke the command that is in the package.json file under the “script” section. See below.
@z

@x
```shell
{
...
  "scripts": {
    "test": "mocha ./**/*.js",
    "start": "nodemon server.js"
  },
...
}
```
@y
```shell
{
...
  "scripts": {
    "test": "mocha ./**/*.js",
    "start": "nodemon server.js"
  },
...
}
```
@z

@x
Below is the Docker command to start the container and run tests:
@y
Below is the Docker command to start the container and run tests:
@z

@x
```shell
$ docker run -it --rm --name app -p 8080:80 node-docker npm run test
> node-docker@0.1.0 test /code
> mocha ./**/*.js
@y
```shell
$ docker run -it --rm --name app -p 8080:80 node-docker npm run test
> node-docker@0.1.0 test /code
> mocha ./**/*.js
@z

@x
sh: 1: mocha: not found
```
@y
sh: 1: mocha: not found
```
@z

@x
As you can see, we received an error. This error is telling us that the Mocha executable could not be found. Let’s take a look at the Dockerfile.
@y
As you can see, we received an error. This error is telling us that the Mocha executable could not be found. Let’s take a look at the Dockerfile.
@z

@x
```dockerfile
FROM node:14.15.4
@y
```dockerfile
FROM node:14.15.4
@z

@x
WORKDIR /code
@y
WORKDIR /code
@z

@x
COPY package.json package.json
COPY package-lock.json package-lock.json
@y
COPY package.json package.json
COPY package-lock.json package-lock.json
@z

@x
RUN npm ci --production
COPY . .
@y
RUN npm ci --production
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
The error is occurring because we are passing the `--production` flag to the npm ci command when it installs our dependencies. This tells npm to not install packages that are located under the "devDependencies" section in the package.json file. Therefore, Mocha will not be installed inside the image and will not be found when we try to run it.
@y
The error is occurring because we are passing the `--production` flag to the npm ci command when it installs our dependencies. This tells npm to not install packages that are located under the "devDependencies" section in the package.json file. Therefore, Mocha will not be installed inside the image and will not be found when we try to run it.
@z

@x
Since we want to follow best practices and not include anything inside the container that we do not need to run our application we can’t just remove the `--production` flag. We have a couple of options to fix this. One option is to create a second Dockerfile that would only be used to run tests. This has a couple of problems. The primary being keeping two Dockerfiles up-to-date. The second option is to use multi-stage builds. We can create a stage for production and one for testing. This is our preferred solution.
@y
Since we want to follow best practices and not include anything inside the container that we do not need to run our application we can’t just remove the `--production` flag. We have a couple of options to fix this. One option is to create a second Dockerfile that would only be used to run tests. This has a couple of problems. The primary being keeping two Dockerfiles up-to-date. The second option is to use multi-stage builds. We can create a stage for production and one for testing. This is our preferred solution.
@z

@x
### Multi-stage Dockerfile for testing
@y
### Multi-stage Dockerfile for testing
@z

@x
Below is a multi-stage Dockerfile tha we will use to build our production image and our test image. Add the highlighted lines to your Dockerfile.
@y
Below is a multi-stage Dockerfile tha we will use to build our production image and our test image. Add the highlighted lines to your Dockerfile.
@z

@x
```dockerfile
FROM node:14.15.4 as base
@y
```dockerfile
FROM node:14.15.4 as base
@z

@x
WORKDIR /code
@y
WORKDIR /code
@z

@x
COPY package.json package.json
COPY package-lock.json package-lock.json
@y
COPY package.json package.json
COPY package-lock.json package-lock.json
@z

@x
FROM base as test
RUN npm ci
COPY . .
CMD [ "npm", "run", "test" ]
@y
FROM base as test
RUN npm ci
COPY . .
CMD [ "npm", "run", "test" ]
@z

@x
FROM base as prod
RUN npm ci --production
COPY . .
CMD [ "node", "server.js" ]
```
@y
FROM base as prod
RUN npm ci --production
COPY . .
CMD [ "node", "server.js" ]
```
@z

@x
We first add a label to the `FROM node:14.15.4` statement. This allows us to refer to this build stage in other build stages. Next we add a new build stage labeled test. We will use this stage for running our tests.
@y
We first add a label to the `FROM node:14.15.4` statement. This allows us to refer to this build stage in other build stages. Next we add a new build stage labeled test. We will use this stage for running our tests.
@z

@x
Now let’s rebuild our image and run our tests. We will run the same docker build command as above but this time we will add the `--target test` flag so that we specifically run the test build stage.
@y
Now let’s rebuild our image and run our tests. We will run the same docker build command as above but this time we will add the `--target test` flag so that we specifically run the test build stage.
@z

@x
```shell
$ docker build -t node-docker --target test .
[+] Building 0.7s (11/11) FINISHED
...
 => => writing image sha256:049b37303e3355f...9b8a954f
 => => naming to docker.io/library/node-docker
```
@y
```shell
$ docker build -t node-docker --target test .
[+] Building 0.7s (11/11) FINISHED
...
 => => writing image sha256:049b37303e3355f...9b8a954f
 => => naming to docker.io/library/node-docker
```
@z

@x
Now that our test image is built, we can run it in a container and see if our tests pass.
@y
Now that our test image is built, we can run it in a container and see if our tests pass.
@z

@x
```shell
$ docker run -it --rm --name app -p 8080:80 node-docker
> node-docker@0.1.0 test /code
> mocha ./**/*.js
@y
```shell
$ docker run -it --rm --name app -p 8080:80 node-docker
> node-docker@0.1.0 test /code
> mocha ./**/*.js
@z

@x
  Calculator
    adding
      ✓ should return 4 when adding 2 + 2
      ✓ should return 0 when adding zeros
    subtracting
      ✓ should return 4 when subtracting 4 from 8
      ✓ should return 0 when subtracting 8 from 8
@y
  Calculator
    adding
      ✓ should return 4 when adding 2 + 2
      ✓ should return 0 when adding zeros
    subtracting
      ✓ should return 4 when subtracting 4 from 8
      ✓ should return 0 when subtracting 8 from 8
@z

@x
  4 passing (11ms)
```
@y
  4 passing (11ms)
```
@z

@x
I’ve truncated the build output but you can see that the Mocha test runner completed and all our tests passed.
@y
I’ve truncated the build output but you can see that the Mocha test runner completed and all our tests passed.
@z

@x
This is great but at the moment we have to run two docker commands to build and run our tests. We can improve this slightly by using a RUN statement instead of the CMD statement in the test stage. The CMD statement is not executed during the building of the image but is executed when you run the image in a container. While with the RUN statement, our tests will be run during the building of the image and stop the build when they fail.
@y
This is great but at the moment we have to run two docker commands to build and run our tests. We can improve this slightly by using a RUN statement instead of the CMD statement in the test stage. The CMD statement is not executed during the building of the image but is executed when you run the image in a container. While with the RUN statement, our tests will be run during the building of the image and stop the build when they fail.
@z

@x
Update your Dockerfile with the highlighted line below.
@y
Update your Dockerfile with the highlighted line below.
@z

@x
```dockerfile
FROM node:14.15.4 as base
@y
```dockerfile
FROM node:14.15.4 as base
@z

@x
WORKDIR /code
@y
WORKDIR /code
@z

@x
COPY package.json package.json
COPY package-lock.json package-lock.json
@y
COPY package.json package.json
COPY package-lock.json package-lock.json
@z

@x
FROM base as test
RUN npm ci
COPY . .
RUN npm run test
@y
FROM base as test
RUN npm ci
COPY . .
RUN npm run test
@z

@x
FROM base as prod
RUN npm ci --production
COPY . .
CMD [ "node", "server.js" ]
```
@y
FROM base as prod
RUN npm ci --production
COPY . .
CMD [ "node", "server.js" ]
```
@z

@x
Now to run our tests, we just need to run the docker build command as above.
@y
Now to run our tests, we just need to run the docker build command as above.
@z

@x
```dockerfile
$ docker build -t node-docker --target test .
[+] Building 1.2s (13/13) FINISHED
...
 => CACHED [base 2/4] WORKDIR /code
 => CACHED [base 3/4] COPY package.json package.json
 => CACHED [base 4/4] COPY package-lock.json package-lock.json
 => CACHED [test 1/3] RUN npm ci
 => CACHED [test 2/3] COPY . .
 => CACHED [test 3/3] RUN npm run test
 => exporting to image
 => => exporting layers
 => => writing image sha256:bcedeeb7d9dd13d...18ca0a05034ed4dd4
 ```
@y
```dockerfile
$ docker build -t node-docker --target test .
[+] Building 1.2s (13/13) FINISHED
...
 => CACHED [base 2/4] WORKDIR /code
 => CACHED [base 3/4] COPY package.json package.json
 => CACHED [base 4/4] COPY package-lock.json package-lock.json
 => CACHED [test 1/3] RUN npm ci
 => CACHED [test 2/3] COPY . .
 => CACHED [test 3/3] RUN npm run test
 => exporting to image
 => => exporting layers
 => => writing image sha256:bcedeeb7d9dd13d...18ca0a05034ed4dd4
 ```
@z

@x
I’ve truncated the output again for simplicity but you can see that our tests are run and passed. Let’s break one of the tests and observe the output when our tests fail.
@y
I’ve truncated the output again for simplicity but you can see that our tests are run and passed. Let’s break one of the tests and observe the output when our tests fail.
@z

@x
Open the util/math.js file and change line 12 to the following.
@y
Open the util/math.js file and change line 12 to the following.
@z

@x
```shell
11 function subtract( num1, num2 ) {
12   return num2 - num1
13 }
```
@y
```shell
11 function subtract( num1, num2 ) {
12   return num2 - num1
13 }
```
@z

@x
Now, run the same docker build command from above and observe that the build fails and the failing testing information is printed to the console.
@y
Now, run the same docker build command from above and observe that the build fails and the failing testing information is printed to the console.
@z

@x
```shell
$ docker build -t node-docker --target test .
 > [test 3/3] RUN npm run test:
#11 0.509
#11 0.509 > node-docker@0.1.0 test /code
#11 0.509 > mocha ./**/*.js
#11 0.509
#11 0.811
#11 0.813
#11 0.815   Calculator
#11 0.815     adding
#11 0.817       ✓ should return 4 when adding 2 + 2
#11 0.818       ✓ should return 0 when adding zeros
#11 0.818     subtracting
#11 0.822       1) should return 4 when subtracting 4 from 8
#11 0.823       ✓ should return 0 when subtracting 8 from 8
#11 0.823
#11 0.824
#11 0.824   3 passing (14ms)
#11 0.824   1 failing
#11 0.824
#11 0.827   1) Calculator
#11 0.827        subtracting
#11 0.827          should return 4 when subtracting 4 from 8:
#11 0.827
#11 0.827       AssertionError [ERR_ASSERTION]: Expected values to be strictly equal:
#11 0.827
#11 0.827 -4 !== 4
#11 0.827
#11 0.827       + expected - actual
#11 0.827
#11 0.827       --4
#11 0.827       +4
#11 0.827
#11 0.827       at Context.<anonymous> (util/math.test.js:18:14)
#11 0.827       at processImmediate (internal/timers.js:461:21)
...
executor failed running [/bin/sh -c npm run test]: exit code: 1
```
@y
```shell
$ docker build -t node-docker --target test .
 > [test 3/3] RUN npm run test:
#11 0.509
#11 0.509 > node-docker@0.1.0 test /code
#11 0.509 > mocha ./**/*.js
#11 0.509
#11 0.811
#11 0.813
#11 0.815   Calculator
#11 0.815     adding
#11 0.817       ✓ should return 4 when adding 2 + 2
#11 0.818       ✓ should return 0 when adding zeros
#11 0.818     subtracting
#11 0.822       1) should return 4 when subtracting 4 from 8
#11 0.823       ✓ should return 0 when subtracting 8 from 8
#11 0.823
#11 0.824
#11 0.824   3 passing (14ms)
#11 0.824   1 failing
#11 0.824
#11 0.827   1) Calculator
#11 0.827        subtracting
#11 0.827          should return 4 when subtracting 4 from 8:
#11 0.827
#11 0.827       AssertionError [ERR_ASSERTION]: Expected values to be strictly equal:
#11 0.827
#11 0.827 -4 !== 4
#11 0.827
#11 0.827       + expected - actual
#11 0.827
#11 0.827       --4
#11 0.827       +4
#11 0.827
#11 0.827       at Context.<anonymous> (util/math.test.js:18:14)
#11 0.827       at processImmediate (internal/timers.js:461:21)
...
executor failed running [/bin/sh -c npm run test]: exit code: 1
```
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
Help us improve this topic by providing your feedback. Let us know what you think by creating an issue in the [Docker Docs ](https://github.com/docker/docker.github.io/issues/new?title=[Node.js%20docs%20feedback]){:target="_blank" rel="noopener" class="_"} GitHub repository. Alternatively, [create a PR](https://github.com/docker/docker.github.io/pulls){:target="_blank" rel="noopener" class="_"} to suggest updates.
@y
Help us improve this topic by providing your feedback. Let us know what you think by creating an issue in the [Docker Docs ](https://github.com/docker/docker.github.io/issues/new?title=[Node.js%20docs%20feedback]){:target="_blank" rel="noopener" class="_"} GitHub repository. Alternatively, [create a PR](https://github.com/docker/docker.github.io/pulls){:target="_blank" rel="noopener" class="_"} to suggest updates.
@z

@x
<br />
@y
<br />
@z
