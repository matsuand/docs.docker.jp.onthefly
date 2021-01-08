%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: How to deploy a stack to a swarm
keywords: guide, swarm mode, composefile, stack, compose, deploy
title: Deploy a stack to a swarm
---
@y
---
description: How to deploy a stack to a swarm
keywords: guide, swarm mode, composefile, stack, compose, deploy
title: Deploy a stack to a swarm
---
@z

@x
When running Docker Engine in swarm mode, you can use `docker stack deploy` to
deploy a complete application stack to the swarm. The `deploy` command accepts
a stack description in the form of a [Compose file](../../compose/compose-file/compose-file-v3.md).
@y
When running Docker Engine in swarm mode, you can use `docker stack deploy` to
deploy a complete application stack to the swarm. The `deploy` command accepts
a stack description in the form of a [Compose file](../../compose/compose-file/compose-file-v3.md).
@z

@x
The `docker stack deploy` command supports any Compose file of version "3.0" or
above. If you have an older version, see the [upgrade guide](../../compose/compose-file/compose-versioning.md#upgrading).
@y
The `docker stack deploy` command supports any Compose file of version "3.0" or
above. If you have an older version, see the [upgrade guide](../../compose/compose-file/compose-versioning.md#upgrading).
@z

@x
To run through this tutorial, you need:
@y
To run through this tutorial, you need:
@z

@x
1.  A Docker Engine running in [swarm mode](swarm-mode.md).
    If you're not familiar with swarm mode, you might want to read
    [Swarm mode key concepts](key-concepts.md)
    and [How services work](how-swarm-mode-works/services.md).
@y
1.  A Docker Engine running in [swarm mode](swarm-mode.md).
    If you're not familiar with swarm mode, you might want to read
    [Swarm mode key concepts](key-concepts.md)
    and [How services work](how-swarm-mode-works/services.md).
@z

@x
    > **Note**
    >
    > If you're trying things out on a local development environment,
    > you can put your engine into swarm mode with `docker swarm init`.
    >
    > If you've already got a multi-node swarm running, keep in mind that all
    > `docker stack` and `docker service` commands must be run from a manager
    > node.
@y
    > **Note**
    >
    > If you're trying things out on a local development environment,
    > you can put your engine into swarm mode with `docker swarm init`.
    >
    > If you've already got a multi-node swarm running, keep in mind that all
    > `docker stack` and `docker service` commands must be run from a manager
    > node.
@z

@x
2.  A current version of [Docker Compose](../../compose/install.md).
@y
2.  A current version of [Docker Compose](../../compose/install.md).
@z

@x
## Set up a Docker registry
@y
## Set up a Docker registry
@z

@x
Because a swarm consists of multiple Docker Engines, a registry is required to
distribute images to all of them. You can use the
[Docker Hub](https://hub.docker.com) or maintain your own. Here's how to create
a throwaway registry, which you can discard afterward.
@y
Because a swarm consists of multiple Docker Engines, a registry is required to
distribute images to all of them. You can use the
[Docker Hub](https://hub.docker.com) or maintain your own. Here's how to create
a throwaway registry, which you can discard afterward.
@z

@x
1.  Start the registry as a service on your swarm:
@y
1.  Start the registry as a service on your swarm:
@z

@x
    ```bash
    $ docker service create --name registry --publish published=5000,target=5000 registry:2
    ```
@y
    ```bash
    $ docker service create --name registry --publish published=5000,target=5000 registry:2
    ```
@z

@x
2.  Check its status with `docker service ls`:
@y
2.  Check its status with `docker service ls`:
@z

@x
    ```bash
    $ docker service ls
@y
    ```bash
    $ docker service ls
@z

@x
    ID            NAME      REPLICAS  IMAGE                                                                               COMMAND
    l7791tpuwkco  registry  1/1       registry:2@sha256:1152291c7f93a4ea2ddc95e46d142c31e743b6dd70e194af9e6ebe530f782c17
    ```
@y
    ID            NAME      REPLICAS  IMAGE                                                                               COMMAND
    l7791tpuwkco  registry  1/1       registry:2@sha256:1152291c7f93a4ea2ddc95e46d142c31e743b6dd70e194af9e6ebe530f782c17
    ```
@z

@x
    Once it reads `1/1` under `REPLICAS`, it's running. If it reads `0/1`, it's
    probably still pulling the image.
@y
    Once it reads `1/1` under `REPLICAS`, it's running. If it reads `0/1`, it's
    probably still pulling the image.
@z

@x
3.  Check that it's working with `curl`:
@y
3.  Check that it's working with `curl`:
@z

@x
    ```bash
    $ curl http://localhost:5000/v2/
@y
    ```bash
    $ curl http://localhost:5000/v2/
@z

@x
    {}
    ```
@y
    {}
    ```
@z

@x
## Create the example application
@y
## Create the example application
@z

@x
The app used in this guide is based on the hit counter app in the
[Get started with Docker Compose](../../compose/gettingstarted.md) guide. It consists
of a Python app which maintains a counter in a Redis instance and increments the
counter whenever you visit it.
@y
The app used in this guide is based on the hit counter app in the
[Get started with Docker Compose](../../compose/gettingstarted.md) guide. It consists
of a Python app which maintains a counter in a Redis instance and increments the
counter whenever you visit it.
@z

@x
1.  Create a directory for the project:
@y
1.  Create a directory for the project:
@z

@x
    ```bash
    $ mkdir stackdemo
    $ cd stackdemo
    ```
@y
    ```bash
    $ mkdir stackdemo
    $ cd stackdemo
    ```
@z

@x
2.  Create a file called `app.py` in the project directory and paste this in:
@y
2.  Create a file called `app.py` in the project directory and paste this in:
@z

@x
    ```python
    from flask import Flask
    from redis import Redis
@y
    ```python
    from flask import Flask
    from redis import Redis
@z

@x
    app = Flask(__name__)
    redis = Redis(host='redis', port=6379)
@y
    app = Flask(__name__)
    redis = Redis(host='redis', port=6379)
@z

@x
    @app.route('/')
    def hello():
        count = redis.incr('hits')
        return 'Hello World! I have been seen {} times.\n'.format(count)
@y
    @app.route('/')
    def hello():
        count = redis.incr('hits')
        return 'Hello World! I have been seen {} times.\n'.format(count)
@z

@x
    if __name__ == "__main__":
        app.run(host="0.0.0.0", port=8000, debug=True)
    ```
@y
    if __name__ == "__main__":
        app.run(host="0.0.0.0", port=8000, debug=True)
    ```
@z

@x
3.  Create a file called `requirements.txt` and paste these two lines in:
@y
3.  Create a file called `requirements.txt` and paste these two lines in:
@z

@x
    ```none
    flask
    redis
    ```
@y
    ```none
    flask
    redis
    ```
@z

@x
4.  Create a file called `Dockerfile` and paste this in:
@y
4.  Create a file called `Dockerfile` and paste this in:
@z

@x
    ```dockerfile
    FROM python:3.4-alpine
    ADD . /code
    WORKDIR /code
    RUN pip install -r requirements.txt
    CMD ["python", "app.py"]
    ```
@y
    ```dockerfile
    FROM python:3.4-alpine
    ADD . /code
    WORKDIR /code
    RUN pip install -r requirements.txt
    CMD ["python", "app.py"]
    ```
@z

@x
5.  Create a file called `docker-compose.yml` and paste this in:
@y
5.  Create a file called `docker-compose.yml` and paste this in:
@z

@x
    ```none
    version: "{{ site.compose_file_v3 }}"
@y
    ```none
    version: "{{ site.compose_file_v3 }}"
@z

@x
    services:
      web:
        image: 127.0.0.1:5000/stackdemo
        build: .
        ports:
          - "8000:8000"
      redis:
        image: redis:alpine
    ```
@y
    services:
      web:
        image: 127.0.0.1:5000/stackdemo
        build: .
        ports:
          - "8000:8000"
      redis:
        image: redis:alpine
    ```
@z

@x
    The image for the web app is built using the Dockerfile defined
    above. It's also tagged with `127.0.0.1:5000` - the address of the registry
    created earlier. This is important when distributing the app to the
    swarm.
@y
    The image for the web app is built using the Dockerfile defined
    above. It's also tagged with `127.0.0.1:5000` - the address of the registry
    created earlier. This is important when distributing the app to the
    swarm.
@z

@x
## Test the app with Compose
@y
## Test the app with Compose
@z

@x
1.  Start the app with `docker-compose up`. This builds the web app image,
    pulls the Redis image if you don't already have it, and creates two
    containers.
@y
1.  Start the app with `docker-compose up`. This builds the web app image,
    pulls the Redis image if you don't already have it, and creates two
    containers.
@z

@x
    You see a warning about the Engine being in swarm mode. This is because
    Compose doesn't take advantage of swarm mode, and deploys everything to a
    single node. You can safely ignore this.
@y
    You see a warning about the Engine being in swarm mode. This is because
    Compose doesn't take advantage of swarm mode, and deploys everything to a
    single node. You can safely ignore this.
@z

@x
    ```none
    $ docker-compose up -d
@y
    ```none
    $ docker-compose up -d
@z

@x
    WARNING: The Docker Engine you're using is running in swarm mode.
@y
    WARNING: The Docker Engine you're using is running in swarm mode.
@z

@x
    Compose does not use swarm mode to deploy services to multiple nodes in
    a swarm. All containers are scheduled on the current node.
@y
    Compose does not use swarm mode to deploy services to multiple nodes in
    a swarm. All containers are scheduled on the current node.
@z

@x
    To deploy your application across the swarm, use `docker stack deploy`.
@y
    To deploy your application across the swarm, use `docker stack deploy`.
@z

@x
    Creating network "stackdemo_default" with the default driver
    Building web
    ...(build output)...
    Creating stackdemo_redis_1
    Creating stackdemo_web_1
    ```
@y
    Creating network "stackdemo_default" with the default driver
    Building web
    ...(build output)...
    Creating stackdemo_redis_1
    Creating stackdemo_web_1
    ```
@z

@x
2.  Check that the app is running with `docker-compose ps`:
@y
2.  Check that the app is running with `docker-compose ps`:
@z

@x
    ```bash
    $ docker-compose ps
@y
    ```bash
    $ docker-compose ps
@z

@x
          Name                     Command               State           Ports
    -----------------------------------------------------------------------------------
    stackdemo_redis_1   docker-entrypoint.sh redis ...   Up      6379/tcp
    stackdemo_web_1     python app.py                    Up      0.0.0.0:8000->8000/tcp
    ```
@y
          Name                     Command               State           Ports
    -----------------------------------------------------------------------------------
    stackdemo_redis_1   docker-entrypoint.sh redis ...   Up      6379/tcp
    stackdemo_web_1     python app.py                    Up      0.0.0.0:8000->8000/tcp
    ```
@z

@x
    You can test the app with `curl`:
@y
    You can test the app with `curl`:
@z

@x
    ```bash
    $ curl http://localhost:8000
    Hello World! I have been seen 1 times.
@y
    ```bash
    $ curl http://localhost:8000
    Hello World! I have been seen 1 times.
@z

@x
    $ curl http://localhost:8000
    Hello World! I have been seen 2 times.
@y
    $ curl http://localhost:8000
    Hello World! I have been seen 2 times.
@z

@x
    $ curl http://localhost:8000
    Hello World! I have been seen 3 times.
    ```
@y
    $ curl http://localhost:8000
    Hello World! I have been seen 3 times.
    ```
@z

@x
3.  Bring the app down:
@y
3.  Bring the app down:
@z

@x
    ```bash
    $ docker-compose down --volumes
@y
    ```bash
    $ docker-compose down --volumes
@z

@x
    Stopping stackdemo_web_1 ... done
    Stopping stackdemo_redis_1 ... done
    Removing stackdemo_web_1 ... done
    Removing stackdemo_redis_1 ... done
    Removing network stackdemo_default
    ```
@y
    Stopping stackdemo_web_1 ... done
    Stopping stackdemo_redis_1 ... done
    Removing stackdemo_web_1 ... done
    Removing stackdemo_redis_1 ... done
    Removing network stackdemo_default
    ```
@z

@x
## Push the generated image to the registry
@y
## Push the generated image to the registry
@z

@x
To distribute the web app's image across the swarm, it needs to be pushed to the
registry you set up earlier. With Compose, this is very simple:
@y
To distribute the web app's image across the swarm, it needs to be pushed to the
registry you set up earlier. With Compose, this is very simple:
@z

@x
```bash
$ docker-compose push
@y
```bash
$ docker-compose push
@z

@x
Pushing web (127.0.0.1:5000/stackdemo:latest)...
The push refers to a repository [127.0.0.1:5000/stackdemo]
5b5a49501a76: Pushed
be44185ce609: Pushed
bd7330a79bcf: Pushed
c9fc143a069a: Pushed
011b303988d2: Pushed
latest: digest: sha256:a81840ebf5ac24b42c1c676cbda3b2cb144580ee347c07e1bc80e35e5ca76507 size: 1372
```
@y
Pushing web (127.0.0.1:5000/stackdemo:latest)...
The push refers to a repository [127.0.0.1:5000/stackdemo]
5b5a49501a76: Pushed
be44185ce609: Pushed
bd7330a79bcf: Pushed
c9fc143a069a: Pushed
011b303988d2: Pushed
latest: digest: sha256:a81840ebf5ac24b42c1c676cbda3b2cb144580ee347c07e1bc80e35e5ca76507 size: 1372
```
@z

@x
The stack is now ready to be deployed.
@y
The stack is now ready to be deployed.
@z

@x
## Deploy the stack to the swarm
@y
## Deploy the stack to the swarm
@z

@x
1.  Create the stack with `docker stack deploy`:
@y
1.  Create the stack with `docker stack deploy`:
@z

@x
    ```bash
    $ docker stack deploy --compose-file docker-compose.yml stackdemo
@y
    ```bash
    $ docker stack deploy --compose-file docker-compose.yml stackdemo
@z

@x
    Ignoring unsupported options: build
@y
    Ignoring unsupported options: build
@z

@x
    Creating network stackdemo_default
    Creating service stackdemo_web
    Creating service stackdemo_redis
    ```
@y
    Creating network stackdemo_default
    Creating service stackdemo_web
    Creating service stackdemo_redis
    ```
@z

@x
    The last argument is a name for the stack. Each network, volume and service
    name is prefixed with the stack name.
@y
    The last argument is a name for the stack. Each network, volume and service
    name is prefixed with the stack name.
@z

@x
2.  Check that it's running with `docker stack services stackdemo`:
@y
2.  Check that it's running with `docker stack services stackdemo`:
@z

@x
    ```bash
    $ docker stack services stackdemo
@y
    ```bash
    $ docker stack services stackdemo
@z

@x
    ID            NAME             MODE        REPLICAS  IMAGE
    orvjk2263y1p  stackdemo_redis  replicated  1/1       redis:3.2-alpine@sha256:f1ed3708f538b537eb9c2a7dd50dc90a706f7debd7e1196c9264edeea521a86d
    s1nf0xy8t1un  stackdemo_web    replicated  1/1       127.0.0.1:5000/stackdemo@sha256:adb070e0805d04ba2f92c724298370b7a4eb19860222120d43e0f6351ddbc26f
    ```
@y
    ID            NAME             MODE        REPLICAS  IMAGE
    orvjk2263y1p  stackdemo_redis  replicated  1/1       redis:3.2-alpine@sha256:f1ed3708f538b537eb9c2a7dd50dc90a706f7debd7e1196c9264edeea521a86d
    s1nf0xy8t1un  stackdemo_web    replicated  1/1       127.0.0.1:5000/stackdemo@sha256:adb070e0805d04ba2f92c724298370b7a4eb19860222120d43e0f6351ddbc26f
    ```
@z

@x
    Once it's running, you should see `1/1` under `REPLICAS` for both services.
    This might take some time if you have a multi-node swarm, as images need to
    be pulled.
@y
    Once it's running, you should see `1/1` under `REPLICAS` for both services.
    This might take some time if you have a multi-node swarm, as images need to
    be pulled.
@z

@x
    As before, you can test the app with `curl`:
@y
    As before, you can test the app with `curl`:
@z

@x
    ```bash
    $ curl http://localhost:8000
    Hello World! I have been seen 1 times.
@y
    ```bash
    $ curl http://localhost:8000
    Hello World! I have been seen 1 times.
@z

@x
    $ curl http://localhost:8000
    Hello World! I have been seen 2 times.
@y
    $ curl http://localhost:8000
    Hello World! I have been seen 2 times.
@z

@x
    $ curl http://localhost:8000
    Hello World! I have been seen 3 times.
    ```
@y
    $ curl http://localhost:8000
    Hello World! I have been seen 3 times.
    ```
@z

@x
    Thanks to Docker's built-in routing mesh, you can access any node in the
    swarm on port 8000 and get routed to the app:
@y
    Thanks to Docker's built-in routing mesh, you can access any node in the
    swarm on port 8000 and get routed to the app:
@z

@x
    ```bash
    $ curl http://address-of-other-node:8000
    Hello World! I have been seen 4 times.
    ```
@y
    ```bash
    $ curl http://address-of-other-node:8000
    Hello World! I have been seen 4 times.
    ```
@z

@x
3.  Bring the stack down with `docker stack rm`:
@y
3.  Bring the stack down with `docker stack rm`:
@z

@x
    ```bash
    $ docker stack rm stackdemo
@y
    ```bash
    $ docker stack rm stackdemo
@z

@x
    Removing service stackdemo_web
    Removing service stackdemo_redis
    Removing network stackdemo_default
    ```
@y
    Removing service stackdemo_web
    Removing service stackdemo_redis
    Removing network stackdemo_default
    ```
@z

@x
4.  Bring the registry down with `docker service rm`:
@y
4.  Bring the registry down with `docker service rm`:
@z

@x
    ```bash
    $ docker service rm registry
    ```
@y
    ```bash
    $ docker service rm registry
    ```
@z

@x
5.  If you're just testing things out on a local machine and want to bring your
    Docker Engine out of swarm mode, use `docker swarm leave`:
@y
5.  If you're just testing things out on a local machine and want to bring your
    Docker Engine out of swarm mode, use `docker swarm leave`:
@z

@x
    ```bash
    $ docker swarm leave --force
@y
    ```bash
    $ docker swarm leave --force
@z

@x
    Node left the swarm.
    ```
@y
    Node left the swarm.
    ```
@z
