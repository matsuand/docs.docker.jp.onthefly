%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: "Run your tests"
keywords: Java, build, test
description: How to build and run your Tests
---
@y
---
title: "Run your tests"
keywords: Java, build, test
description: How to build and run your Tests
---
@z

@x
{% include_relative nav.html selected="4" %}
@y
{% include_relative nav.html selected="4" %}
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
Work through the steps to build an image and run it as a containerized application in [Use your container for development](develop.md).
@y
Work through the steps to build an image and run it as a containerized application in [Use your container for development](develop.md).
@z

@x
## Introduction
@y
## Introduction
@z

@x
Testing is an essential part of modern software development. Testing can mean a lot of things to different development teams. There are unit tests, integration tests and end-to-end testing. In this guide we take a look at running your unit tests in Docker.
@y
Testing is an essential part of modern software development. Testing can mean a lot of things to different development teams. There are unit tests, integration tests and end-to-end testing. In this guide we take a look at running your unit tests in Docker.
@z

@x
## Refactor Dockerfile to run tests
@y
## Refactor Dockerfile to run tests
@z

@x
The **Spring Pet Clinic** source code has already tests defined in the test directory `src/test/java/org/springframework/samples/petclinic`. You just need to update the JaCoCo version in your `pom.xml` to ensure your tests work with JDK v15 or higher with `<jacoco.version>0.8.6</jacoco.version>`, so we can use the following Docker command to start the container and run tests:
@y
The **Spring Pet Clinic** source code has already tests defined in the test directory `src/test/java/org/springframework/samples/petclinic`. You just need to update the JaCoCo version in your `pom.xml` to ensure your tests work with JDK v15 or higher with `<jacoco.version>0.8.6</jacoco.version>`, so we can use the following Docker command to start the container and run tests:
@z

@x
```console
$ docker run -it --rm --name springboot-test java-docker ./mvnw test
...
[INFO] Results:
[INFO]
[WARNING] Tests run: 40, Failures: 0, Errors: 0, Skipped: 1
[INFO]
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time:  01:49 min
```
@y
```console
$ docker run -it --rm --name springboot-test java-docker ./mvnw test
...
[INFO] Results:
[INFO]
[WARNING] Tests run: 40, Failures: 0, Errors: 0, Skipped: 1
[INFO]
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time:  01:49 min
```
@z

@x
### Multi-stage Dockerfile for testing
@y
### Multi-stage Dockerfile for testing
@z

@x
Let’s take a look at pulling the testing commands into our Dockerfile. Below is a multi-stage Dockerfile that we will use to build our production image and our test image. Add the highlighted lines to your Dockerfile
@y
Let’s take a look at pulling the testing commands into our Dockerfile. Below is a multi-stage Dockerfile that we will use to build our production image and our test image. Add the highlighted lines to your Dockerfile
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
@y
```dockerfile
# syntax=docker/dockerfile:1
@z

@x
FROM openjdk:16-alpine3.13 as base
@y
FROM openjdk:16-alpine3.13 as base
@z

@x
WORKDIR /app
@y
WORKDIR /app
@z

@x
COPY .mvn/ .mvn
COPY mvnw pom.xml ./
RUN ./mvnw dependency:go-offline
COPY src ./src
@y
COPY .mvn/ .mvn
COPY mvnw pom.xml ./
RUN ./mvnw dependency:go-offline
COPY src ./src
@z

@x
FROM base as test
CMD ["./mvnw", "test"]
@y
FROM base as test
CMD ["./mvnw", "test"]
@z

@x
FROM base as development
CMD ["./mvnw", "spring-boot:run", "-Dspring-boot.run.profiles=mysql", "-Dspring-boot.run.jvmArguments='-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:8000'"]
@y
FROM base as development
CMD ["./mvnw", "spring-boot:run", "-Dspring-boot.run.profiles=mysql", "-Dspring-boot.run.jvmArguments='-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:8000'"]
@z

@x
FROM base as build
RUN ./mvnw package
@y
FROM base as build
RUN ./mvnw package
@z

@x
FROM openjdk:11-jre-slim as production
EXPOSE 8080
@y
FROM openjdk:11-jre-slim as production
EXPOSE 8080
@z

@x
COPY --from=build /app/target/spring-petclinic-*.jar /spring-petclinic.jar
@y
COPY --from=build /app/target/spring-petclinic-*.jar /spring-petclinic.jar
@z

@x
CMD ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "/spring-petclinic.jar"]
```
@y
CMD ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "/spring-petclinic.jar"]
```
@z

@x
We first add a label to the `FROM openjdk:16-alpine3.13` statement. This allows us to refer to this build stage in other build stages. Next, we added a new build stage labeled `test`. We'll use this stage for running our tests.
@y
We first add a label to the `FROM openjdk:16-alpine3.13` statement. This allows us to refer to this build stage in other build stages. Next, we added a new build stage labeled `test`. We'll use this stage for running our tests.
@z

@x
Now let’s rebuild our image and run our tests. We will run the `docker build` command as above, but this time we will add the `--target test` flag so that we specifically run the test build stage.
@y
Now let’s rebuild our image and run our tests. We will run the `docker build` command as above, but this time we will add the `--target test` flag so that we specifically run the test build stage.
@z

@x
```console
$ docker build -t java-docker --target test .
[+] Building 0.7s (6/6) FINISHED
...
 => => writing image sha256:967ac80cb7799a5d12a4bdfc67c37b5a6533c6e418c903907d3e86b7d4ebf89a
 => => naming to docker.io/library/java-docker
```
@y
```console
$ docker build -t java-docker --target test .
[+] Building 0.7s (6/6) FINISHED
...
 => => writing image sha256:967ac80cb7799a5d12a4bdfc67c37b5a6533c6e418c903907d3e86b7d4ebf89a
 => => naming to docker.io/library/java-docker
```
@z

@x
Now that our test image is built, we can run it as a container and see if our tests pass.
@y
Now that our test image is built, we can run it as a container and see if our tests pass.
@z

@x
```console
$ docker run -it --rm --name springboot-test java-docker
[INFO] Scanning for projects...
[INFO]
[INFO] ------------< org.springframework.samples:spring-petclinic >------------
[INFO] Building petclinic 2.4.2
...
@y
```console
$ docker run -it --rm --name springboot-test java-docker
[INFO] Scanning for projects...
[INFO]
[INFO] ------------< org.springframework.samples:spring-petclinic >------------
[INFO] Building petclinic 2.4.2
...
@z

@x
[INFO] Results:
[INFO]
[WARNING] Tests run: 40, Failures: 0, Errors: 0, Skipped: 1
[INFO]
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time:  01:22 min
```
@y
[INFO] Results:
[INFO]
[WARNING] Tests run: 40, Failures: 0, Errors: 0, Skipped: 1
[INFO]
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time:  01:22 min
```
@z

@x
The build output is truncated, but you can see that the Maven test runner was successful and all our tests passed.
@y
The build output is truncated, but you can see that the Maven test runner was successful and all our tests passed.
@z

@x
This is great. However, we'll have to run two Docker commands to build and run our tests. We can improve this slightly by using a `RUN` statement instead of the `CMD` statement in the test stage. The `CMD` statement is not executed during the building of the image, but is executed when you run the image in a container. When using the `RUN` statement, our tests run when building the image, and stop the build when they fail.
@y
This is great. However, we'll have to run two Docker commands to build and run our tests. We can improve this slightly by using a `RUN` statement instead of the `CMD` statement in the test stage. The `CMD` statement is not executed during the building of the image, but is executed when you run the image in a container. When using the `RUN` statement, our tests run when building the image, and stop the build when they fail.
@z

@x
Update your Dockerfile with the highlighted line below.
@y
Update your Dockerfile with the highlighted line below.
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
@y
```dockerfile
# syntax=docker/dockerfile:1
@z

@x
FROM openjdk:16-alpine3.13 as base
@y
FROM openjdk:16-alpine3.13 as base
@z

@x
WORKDIR /app
@y
WORKDIR /app
@z

@x
COPY .mvn/ .mvn
COPY mvnw pom.xml ./
RUN ./mvnw dependency:go-offline
COPY src ./src
@y
COPY .mvn/ .mvn
COPY mvnw pom.xml ./
RUN ./mvnw dependency:go-offline
COPY src ./src
@z

@x
FROM base as test
RUN ["./mvnw", "test"]
@y
FROM base as test
RUN ["./mvnw", "test"]
@z

@x
FROM base as development
CMD ["./mvnw", "spring-boot:run", "-Dspring-boot.run.profiles=mysql", "-Dspring-boot.run.jvmArguments='-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:8000'"]
@y
FROM base as development
CMD ["./mvnw", "spring-boot:run", "-Dspring-boot.run.profiles=mysql", "-Dspring-boot.run.jvmArguments='-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:8000'"]
@z

@x
FROM base as build
RUN ./mvnw package
@y
FROM base as build
RUN ./mvnw package
@z

@x
FROM openjdk:11-jre-slim as production
EXPOSE 8080
@y
FROM openjdk:11-jre-slim as production
EXPOSE 8080
@z

@x
COPY --from=build /app/target/spring-petclinic-*.jar /spring-petclinic.jar
@y
COPY --from=build /app/target/spring-petclinic-*.jar /spring-petclinic.jar
@z

@x
CMD ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "/spring-petclinic.jar"]
```
@y
CMD ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "/spring-petclinic.jar"]
```
@z

@x
Now, to run our tests, we just need to run the `docker build` command as above.
@y
Now, to run our tests, we just need to run the `docker build` command as above.
@z

@x
```console
$ docker build -t java-docker --target test .
[+] Building 27.6s (11/12)
 => CACHED [base 3/6] COPY .mvn/ .mvn
 => CACHED [base 4/6] COPY mvnw pom.xml ./
 => CACHED [base 5/6] RUN ./mvnw dependency:go-offline
 => CACHED [base 6/6] COPY src ./src
 => [test 1/1] RUN ["./mvnw", "test"]
 => exporting to image
 => => exporting layers
=> => writing image sha256:10cb585a7f289a04539e95d583ae97bcf8725959a6bd32c2f5632d0e7c1d16a0
=> => naming to docker.io/library/java-docker
```
@y
```console
$ docker build -t java-docker --target test .
[+] Building 27.6s (11/12)
 => CACHED [base 3/6] COPY .mvn/ .mvn
 => CACHED [base 4/6] COPY mvnw pom.xml ./
 => CACHED [base 5/6] RUN ./mvnw dependency:go-offline
 => CACHED [base 6/6] COPY src ./src
 => [test 1/1] RUN ["./mvnw", "test"]
 => exporting to image
 => => exporting layers
=> => writing image sha256:10cb585a7f289a04539e95d583ae97bcf8725959a6bd32c2f5632d0e7c1d16a0
=> => naming to docker.io/library/java-docker
```
@z

@x
The build output is truncated for simplicity, but you can see that our tests ran succesfully and passed. Let’s break one of the tests and observe the output when our tests fail.
@y
The build output is truncated for simplicity, but you can see that our tests ran succesfully and passed. Let’s break one of the tests and observe the output when our tests fail.
@z

@x
Open the `src/test/java/org/springframework/samples/petclinic/model/ValidatorTests.java` file and change **line 57** to the following.
@y
Open the `src/test/java/org/springframework/samples/petclinic/model/ValidatorTests.java` file and change **line 57** to the following.
@z

@x
```shell
55   ConstraintViolation<Person> violation = constraintViolations.iterator().next();
56   assertThat(violation.getPropertyPath().toString()).isEqualTo("firstName");
57   assertThat(violation.getMessage()).isEqualTo("must be empty");
58 }
```
@y
```shell
55   ConstraintViolation<Person> violation = constraintViolations.iterator().next();
56   assertThat(violation.getPropertyPath().toString()).isEqualTo("firstName");
57   assertThat(violation.getMessage()).isEqualTo("must be empty");
58 }
```
@z

@x
Now, run the `docker build` command from above and observe that the build fails and the failing testing information is printed to the console.
@y
Now, run the `docker build` command from above and observe that the build fails and the failing testing information is printed to the console.
@z

@x
```console
$ docker build -t java-docker --target test .
 => [base 6/6] COPY src ./src
 => ERROR [test 1/1] RUN ["./mvnw", "test"]
...
------
executor failed running [./mvnw test]: exit code: 1
```
@y
```console
$ docker build -t java-docker --target test .
 => [base 6/6] COPY src ./src
 => ERROR [test 1/1] RUN ["./mvnw", "test"]
...
------
executor failed running [./mvnw test]: exit code: 1
```
@z

@x
### Multi-stage Dockerfile for development
@y
### Multi-stage Dockerfile for development
@z

@x
The new version of the Dockerfile produces a final image which is ready for production, but as you can notice, you also have a dedicated step to produce a development container.
@y
The new version of the Dockerfile produces a final image which is ready for production, but as you can notice, you also have a dedicated step to produce a development container.
@z

@x
```dockerfile
FROM base as development
CMD ["./mvnw", "spring-boot:run", "-Dspring-boot.run.profiles=mysql", "-Dspring-boot.run.jvmArguments='-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:8000'"]
```
@y
```dockerfile
FROM base as development
CMD ["./mvnw", "spring-boot:run", "-Dspring-boot.run.profiles=mysql", "-Dspring-boot.run.jvmArguments='-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:8000'"]
```
@z

@x
We can now update our `docker-compose.dev.yml` to use this specific target to build the `petclinic` service and remove the `command` definition as follows:
@y
We can now update our `docker-compose.dev.yml` to use this specific target to build the `petclinic` service and remove the `command` definition as follows:
@z

@x
```dockerfile
services:
 petclinic:
   build:
     context: .
     target: development
   ports:
     - 8000:8000
     - 8080:8080
   environment:
     - SERVER_PORT=8080
     - MYSQL_URL=jdbc:mysql://mysqlserver/petclinic
   volumes:
     - ./:/app
```
@y
```dockerfile
services:
 petclinic:
   build:
     context: .
     target: development
   ports:
     - 8000:8000
     - 8080:8080
   environment:
     - SERVER_PORT=8080
     - MYSQL_URL=jdbc:mysql://mysqlserver/petclinic
   volumes:
     - ./:/app
```
@z

@x
Now, let's run the Compose application. You should now see that application behaves as previously and you can still debug it.
@y
Now, let's run the Compose application. You should now see that application behaves as previously and you can still debug it.
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
## Next steps
@y
## Next steps
@z

@x
In this module, we took a look at running tests as part of our Docker image build process.
@y
In this module, we took a look at running tests as part of our Docker image build process.
@z

@x
In the next module, we’ll take a look at how to set up a CI/CD pipeline using GitHub Actions. See:
@y
In the next module, we’ll take a look at how to set up a CI/CD pipeline using GitHub Actions. See:
@z

@x
[Configure CI/CD](configure-ci-cd.md){: .button .primary-btn}
@y
[Configure CI/CD](configure-ci-cd.md){: .button .primary-btn}
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

@x
<br />
@y
<br />
@z
