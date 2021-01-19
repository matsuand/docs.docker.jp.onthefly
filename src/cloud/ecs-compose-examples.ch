%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: ECS integration composefile examples
description: Examples of ECS compose files
keywords: Docker, Amazon, Integration, ECS, Compose, cli, deploy, cloud, sample
---
# Compose file samples - ECS specific
@y
---
title: ECS integration composefile examples
description: Examples of ECS compose files
keywords: Docker, Amazon, Integration, ECS, Compose, cli, deploy, cloud, sample
---
# Compose file samples - ECS specific
@z

@x
## Service
@y
## Service
@z

@x
A service mapping may define a Docker image and runtime constraints and container requirements.
@y
A service mapping may define a Docker image and runtime constraints and container requirements.
@z

@x
```yaml
services:
  test:
    image: "image"
    command: "command"
    entrypoint: "entrypoint"
    environment:
      - "FOO=BAR"
    cap_add:
      - SYS_PTRACE
    cap_drop:
      - SYSLOG
    init: true
    user: "user"
    working_dir: "working_dir"
```
@y
```yaml
services:
  test:
    image: "image"
    command: "command"
    entrypoint: "entrypoint"
    environment:
      - "FOO=BAR"
    cap_add:
      - SYS_PTRACE
    cap_drop:
      - SYSLOG
    init: true
    user: "user"
    working_dir: "working_dir"
```
@z

@x
###### Task size
@y
###### Task size
@z

@x
Set resource limits that will get translated to Fargate task size values:
@y
Set resource limits that will get translated to Fargate task size values:
@z

@x
```yaml
services:
  test:
    image: nginx
    deploy:
      resources:
        limits:
          cpus: '0.5'
          memory: 2048M
```
@y
```yaml
services:
  test:
    image: nginx
    deploy:
      resources:
        limits:
          cpus: '0.5'
          memory: 2048M
```
@z

@x
###### IAM roles
@y
###### IAM roles
@z

@x
Assign an existing user role to a task:
@y
Assign an existing user role to a task:
@z

@x
```yaml
services:
  test:
    x-aws-policies:
      - "arn:aws:iam::aws:policy/AmazonS3FullAccess"
```
@y
```yaml
services:
  test:
    x-aws-policies:
      - "arn:aws:iam::aws:policy/AmazonS3FullAccess"
```
@z

@x
###### IAM policies
@y
###### IAM policies
@z

@x
Assign an in-line IAM policy to a task:
@y
Assign an in-line IAM policy to a task:
@z

@x
```yaml
services:
  test:
    x-aws-role:
        Version: '2012-10-17'
        Statement:
        - Effect: Allow
          Action: sqs:*
          Resource: arn:aws:sqs:us-east-1:12345678:myqueue
```
@y
```yaml
services:
  test:
    x-aws-role:
        Version: '2012-10-17'
        Statement:
        - Effect: Allow
          Action: sqs:*
          Resource: arn:aws:sqs:us-east-1:12345678:myqueue
```
@z

@x
###### Logging
Pass options to awslogs driver
```yaml
services:
  foo:
    image: nginx
    logging:
      options:
        awslogs-datetime-pattern: "FOO"
@y
###### Logging
Pass options to awslogs driver
```yaml
services:
  foo:
    image: nginx
    logging:
      options:
        awslogs-datetime-pattern: "FOO"
@z

@x
x-aws-logs_retention: 10
```
@y
x-aws-logs_retention: 10
```
@z

@x
###### Autoscaling
@y
###### Autoscaling
@z

@x
Set a CPU percent target
```yaml
services:
  foo:
    image: nginx
    deploy:
      x-aws-autoscaling: 75
```
@y
Set a CPU percent target
```yaml
services:
  foo:
    image: nginx
    deploy:
      x-aws-autoscaling: 75
```
@z

@x
###### GPU
Set `generic_resources` for services that require accelerators as GPUs.
```yaml
services:
  learning:
    image: tensorflow/tensorflow:latest-gpus
    deploy:
      resources:
        reservations:
          memory: 32Gb
          cpus: "32"
          generic_resources:
          - discrete_resource_spec:
            kind: gpus
            value: 2
```
@y
###### GPU
Set `generic_resources` for services that require accelerators as GPUs.
```yaml
services:
  learning:
    image: tensorflow/tensorflow:latest-gpus
    deploy:
      resources:
        reservations:
          memory: 32Gb
          cpus: "32"
          generic_resources:
          - discrete_resource_spec:
            kind: gpus
            value: 2
```
@z

@x
##### Load Balancers
@y
##### Load Balancers
@z

@x
When a service in the compose file exposes a port, a load balancer is being created and configured to distribute the traffic between all containers.
@y
When a service in the compose file exposes a port, a load balancer is being created and configured to distribute the traffic between all containers.
@z

@x
There are 2 types of Load Balancers that can be created. For a service exposing a non-http port/protocol, a __Network Load Balancer (NLB)__ is created. Services with http/https ports/protocols get an __Application Load Balancer (ALB)__.
@y
There are 2 types of Load Balancers that can be created. For a service exposing a non-http port/protocol, a __Network Load Balancer (NLB)__ is created. Services with http/https ports/protocols get an __Application Load Balancer (ALB)__.
@z

@x
 There is only one load balancer created/configured for a Compose stack. If there are both http/non-http ports configured for services in a compose stack, an NLB is created.
@y
 There is only one load balancer created/configured for a Compose stack. If there are both http/non-http ports configured for services in a compose stack, an NLB is created.
@z

@x
The compose file below configured only the http port,therefore, on deployment it gets an ALB created.
@y
The compose file below configured only the http port,therefore, on deployment it gets an ALB created.
@z

@x
```yaml
services:
  app:
    image: nginx
    ports:
      - 80:80
```
NLB is created for non-http port
```yaml
services:
  app:
    image: nginx
    ports:
      - 8080:8080
```
@y
```yaml
services:
  app:
    image: nginx
    ports:
      - 80:80
```
NLB is created for non-http port
```yaml
services:
  app:
    image: nginx
    ports:
      - 8080:8080
```
@z

@x
To use the http protocol with custom ports and get an ALB, use the `x-aws-protocol` port property.
```yaml
services:
  test:
    image: nginx
    ports:
      - target: 8080
        x-aws-protocol: http
```
@y
To use the http protocol with custom ports and get an ALB, use the `x-aws-protocol` port property.
```yaml
services:
  test:
    image: nginx
    ports:
      - target: 8080
        x-aws-protocol: http
```
@z

@x
To re-use an external load balancer and avoid creating a dedicated one, set the top-level property `x-aws-loadbalancer` as below:
```yaml
x-aws-loadbalancer: "LoadBalancerName"
services:
  app:
    image: nginx
    ports:
      - 80:80
```
@y
To re-use an external load balancer and avoid creating a dedicated one, set the top-level property `x-aws-loadbalancer` as below:
```yaml
x-aws-loadbalancer: "LoadBalancerName"
services:
  app:
    image: nginx
    ports:
      - 80:80
```
@z

@x
Similarly, an external `VPC` and `Cluster` can be reused:
@y
Similarly, an external `VPC` and `Cluster` can be reused:
@z

@x
```yaml
x-aws-vpc: "vpc-25435e"
x-aws-cluster: "ClusterName"
@y
```yaml
x-aws-vpc: "vpc-25435e"
x-aws-cluster: "ClusterName"
@z

@x
services:
  app:
    image: nginx
    ports:
      - 80:80
```
@y
services:
  app:
    image: nginx
    ports:
      - 80:80
```
@z

@x
Keep in mind, that external resources are not managed as part of the compose stack's lifecycle.
@y
Keep in mind, that external resources are not managed as part of the compose stack's lifecycle.
@z

@x
## Volumes
@y
## Volumes
@z

@x
```yaml
services:
  app:
    image: nginx
    volumes:
      - data:/test
volumes:
  data:
```
To use of an external volume that has been previously created, set its id/ARN as the name:
@y
```yaml
services:
  app:
    image: nginx
    volumes:
      - data:/test
volumes:
  data:
```
To use of an external volume that has been previously created, set its id/ARN as the name:
@z

@x
```yaml
services:
  app:
    image: nginx
    volumes:
      - data:/test
@y
```yaml
services:
  app:
    image: nginx
    volumes:
      - data:/test
@z

@x
volumes:
  data:
    external: true
    name: "fs-f534645"
```
@y
volumes:
  data:
    external: true
    name: "fs-f534645"
```
@z

@x
Customize volume configuration via `driver_opts`
@y
Customize volume configuration via `driver_opts`
@z

@x
```yaml
services:
  test:
    image: nginx
volumes:
  db-data:
    driver_opts:
        backup_policy: ENABLED
        lifecycle_policy: AFTER_30_DAYS
        performance_mode: maxIO
        throughput_mode: provisioned
        provisioned_throughput: 1024
```
@y
```yaml
services:
  test:
    image: nginx
volumes:
  db-data:
    driver_opts:
        backup_policy: ENABLED
        lifecycle_policy: AFTER_30_DAYS
        performance_mode: maxIO
        throughput_mode: provisioned
        provisioned_throughput: 1024
```
@z

@x
## Networks
@y
## Networks
@z

@x
Networks are mapped to security groups.
```yaml
services:
  test:
    image: nginx
networks:
  default:
```
Using an external network/security group:
```yaml
services:
  test:
    image: nginx
networks:
  default:
    external: true
    name: sg-123abc
```
@y
Networks are mapped to security groups.
```yaml
services:
  test:
    image: nginx
networks:
  default:
```
Using an external network/security group:
```yaml
services:
  test:
    image: nginx
networks:
  default:
    external: true
    name: sg-123abc
```
@z

@x
## Secrets
Secrets are stored in __AWS SecretsManager__ as strings and are mounted to containers  under `/run/secrets/`.
```yaml
services:
  app:
    image: nginx
    ports:
      - 80:80
    secrets:
      - mysecret
@y
## Secrets
Secrets are stored in __AWS SecretsManager__ as strings and are mounted to containers  under `/run/secrets/`.
```yaml
services:
  app:
    image: nginx
    ports:
      - 80:80
    secrets:
      - mysecret
@z

@x
secrets:
  mysecret:
    file: ./secrets/mysecret.txt
```
@y
secrets:
  mysecret:
    file: ./secrets/mysecret.txt
```
@z

@x
When using external secrets, set a valid secret `ARN` under the `name` property:
@y
When using external secrets, set a valid secret `ARN` under the `name` property:
@z

@x
```yaml
services:
  app:
    image: nginx
    secrets:
      - foo_bar
@y
```yaml
services:
  app:
    image: nginx
    secrets:
      - foo_bar
@z

@x
secrets:
  foo_bar:
    name: "arn:aws:secretsmanager:eu-west-3:xxx:secret:foo_bar"
    external: true
```
@y
secrets:
  foo_bar:
    name: "arn:aws:secretsmanager:eu-west-3:xxx:secret:foo_bar"
    external: true
```
@z

@x
## Access private images
When a service is configured with an image from a private repository on Docker Hub, make sure you have configured pull credentials correctly before deploying the Compose stack.
@y
## Access private images
When a service is configured with an image from a private repository on Docker Hub, make sure you have configured pull credentials correctly before deploying the Compose stack.
@z

@x
To create a pull credential, create a file with the following content:
```sh
$ cat creds.json
{
  "username":"DockerHubID",
  "password":"GeneratedHubTokenOrPassword"
}
```
To create the pull credential and retrieve the `ARN/ID` to use in the compose file run:
```sh
$ docker secret create pullcred /path/to/creds.json
arn:aws:secretsmanager:eu-west-3:xxx:secret:pullcred
```
@y
To create a pull credential, create a file with the following content:
```sh
$ cat creds.json
{
  "username":"DockerHubID",
  "password":"GeneratedHubTokenOrPassword"
}
```
To create the pull credential and retrieve the `ARN/ID` to use in the compose file run:
```sh
$ docker secret create pullcred /path/to/creds.json
arn:aws:secretsmanager:eu-west-3:xxx:secret:pullcred
```
@z

@x
Use the `ARN` in the output to set the `x-aws-pull_credentials` service property as below:
```yaml
services:
  app:
    image: DockerHubID/privateimage
    x-aws-pull_credentials: arn:aws:secretsmanager:eu-west-3:xxx:secret:pullcred
    ports:
      - 80:80
```
@y
Use the `ARN` in the output to set the `x-aws-pull_credentials` service property as below:
```yaml
services:
  app:
    image: DockerHubID/privateimage
    x-aws-pull_credentials: arn:aws:secretsmanager:eu-west-3:xxx:secret:pullcred
    ports:
      - 80:80
```
@z
