%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Docker Compose FAQ
keywords: documentation, docs,  docker, compose, faq
title: Frequently asked questions
---
@y
---
description: Docker Compose FAQ
keywords: documentation, docs,  docker, compose, faq
title: よくたずねられる質問
---
@z

@x
If you don’t see your question here, feel free to drop by
[#docker-compose](https://dockercommunity.slack.com/archives/C2X82D9PA) on the
[Docker Community Slack](https://dockr.ly/slack).
@y
If you don’t see your question here, feel free to drop by
[#docker-compose](https://dockercommunity.slack.com/archives/C2X82D9PA) on the
[Docker Community Slack](https://dockr.ly/slack).
@z

@x
## Can I control service startup order?
@y
## サービスの起動順は制御できますか？
{: #can-i-control-service-startup-order }
@z

@x
Yes - see [Controlling startup order](startup-order.md).
@y
はい。
[起動順の制御](startup-order.md) を参照してください。
@z

@x
## Why do my services take 10 seconds to recreate or stop?
@y
{: #why-do-my-services-take-10-seconds-to-recreate-or-stop }
## サービスの再生成や停止に 10 秒もかかるのはなぜ？
@z

@x
Compose stop attempts to stop a container by sending a `SIGTERM`. It then waits
for a [default timeout of 10 seconds](reference/stop.md).  After the timeout,
a `SIGKILL` is sent to the container to forcefully kill it.  If you
are waiting for this timeout, it means that your containers aren't shutting down
when they receive the `SIGTERM` signal.
@y
Compose stop attempts to stop a container by sending a `SIGTERM`. It then waits
for a [default timeout of 10 seconds](reference/stop.md).  After the timeout,
a `SIGKILL` is sent to the container to forcefully kill it.  If you
are waiting for this timeout, it means that your containers aren't shutting down
when they receive the `SIGTERM` signal.
@z

@x
There has already been a lot written about this problem of
[processes handling signals](https://medium.com/@gchudnov/trapping-signals-in-docker-containers-7a57fdda7d86)
in containers.
@y
There has already been a lot written about this problem of
[processes handling signals](https://medium.com/@gchudnov/trapping-signals-in-docker-containers-7a57fdda7d86)
in containers.
@z

@x
To fix this problem, try the following:
@y
To fix this problem, try the following:
@z

@x
* Make sure you're using the exec form of `CMD` and `ENTRYPOINT`
in your Dockerfile.
@y
* Make sure you're using the exec form of `CMD` and `ENTRYPOINT`
in your Dockerfile.
@z

@x
  For example use `["program", "arg1", "arg2"]` not `"program arg1 arg2"`.
  Using the string form causes Docker to run your process using `bash` which
  doesn't handle signals properly. Compose always uses the JSON form, so don't
  worry if you override the command or entrypoint in your Compose file.
@y
  For example use `["program", "arg1", "arg2"]` not `"program arg1 arg2"`.
  Using the string form causes Docker to run your process using `bash` which
  doesn't handle signals properly. Compose always uses the JSON form, so don't
  worry if you override the command or entrypoint in your Compose file.
@z

@x
* If you are able, modify the application that you're running to
add an explicit signal handler for `SIGTERM`.
@y
* If you are able, modify the application that you're running to
add an explicit signal handler for `SIGTERM`.
@z

@x
* Set the `stop_signal` to a signal which the application knows how to handle:
@y
* Set the `stop_signal` to a signal which the application knows how to handle:
@z

@x
```yaml
services:
  web:
    build: .
    stop_signal: SIGINT
```
@y
```yaml
services:
  web:
    build: .
    stop_signal: SIGINT
```
@z

@x
* If you can't modify the application, wrap the application in a lightweight init
system (like [s6](https://skarnet.org/software/s6/)) or a signal proxy (like
[dumb-init](https://github.com/Yelp/dumb-init) or
[tini](https://github.com/krallin/tini)).  Either of these wrappers takes care of
handling `SIGTERM` properly.
@y
* If you can't modify the application, wrap the application in a lightweight init
system (like [s6](https://skarnet.org/software/s6/)) or a signal proxy (like
[dumb-init](https://github.com/Yelp/dumb-init) or
[tini](https://github.com/krallin/tini)).  Either of these wrappers take care of
handling `SIGTERM` properly.
@z

@x
## How do I run multiple copies of a Compose file on the same host?
@y
{: #how-do-i-run-multiple-copies-of-a-compose-file-on-the-same-host }
## 1 つのホスト上で Compose ファイルを複数稼動させるには？
@z

@x
Compose uses the project name to create unique identifiers for all of a
project's  containers and other resources. To run multiple copies of a project,
set a custom project name using the [`-p` command line option](reference/index.md)
or the [`COMPOSE_PROJECT_NAME` environment variable](reference/envvars.md#compose_project_name).
@y
Compose uses the project name to create unique identifiers for all of a
project's  containers and other resources. To run multiple copies of a project,
set a custom project name using the [`-p` command line option](reference/index.md)
or the [`COMPOSE_PROJECT_NAME` environment variable](reference/envvars.md#compose_project_name).
@z

@x
## What's the difference between `up`, `run`, and `start`?
@y
{: #whats-the-difference-between-up-run-and-start }
## What's the difference between `up`, `run`, and `start`?
@z

@x
Typically, you want `docker-compose up`. Use `up` to start or restart all the
services defined in a `docker-compose.yml`. In the default "attached"
mode, you see all the logs from all the containers. In "detached" mode (`-d`),
Compose exits after starting the containers, but the containers continue to run
in the background.
@y
Typically, you want `docker-compose up`. Use `up` to start or restart all the
services defined in a `docker-compose.yml`. In the default "attached"
mode, you see all the logs from all the containers. In "detached" mode (`-d`),
Compose exits after starting the containers, but the containers continue to run
in the background.
@z

@x
The `docker-compose run` command is for running "one-off" or "adhoc" tasks. It
requires the service name you want to run and only starts containers for services
that the running service depends on. Use `run` to run tests or perform
an administrative task such as removing or adding data to a data volume
container. The `run` command acts like `docker run -ti` in that it opens an
interactive terminal to the container and returns an exit status matching the
exit status of the process in the container.
@y
The `docker-compose run` command is for running "one-off" or "adhoc" tasks. It
requires the service name you want to run and only starts containers for services
that the running service depends on. Use `run` to run tests or perform
an administrative task such as removing or adding data to a data volume
container. The `run` command acts like `docker run -ti` in that it opens an
interactive terminal to the container and returns an exit status matching the
exit status of the process in the container.
@z

@x
The `docker-compose start` command is useful only to restart containers
that were previously created, but were stopped. It never creates new
containers.
@y
The `docker-compose start` command is useful only to restart containers
that were previously created, but were stopped. It never creates new
containers.
@z

@x
## Can I use json instead of yaml for my Compose file?
@y
## Can I use json instead of yaml for my Compose file?
@z

@x
Yes. [Yaml is a superset of json](https://stackoverflow.com/a/1729545/444646) so
any JSON file should be valid Yaml.  To use a JSON file with Compose,
specify the filename to use, for example:
@y
Yes. [Yaml is a superset of json](https://stackoverflow.com/a/1729545/444646) so
any JSON file should be valid Yaml.  To use a JSON file with Compose,
specify the filename to use, for example:
@z

@x
```console
$ docker-compose -f docker-compose.json up
```
@y
```console
$ docker-compose -f docker-compose.json up
```
@z

@x
## Should I include my code with `COPY`/`ADD` or a volume?
@y
## Should I include my code with `COPY`/`ADD` or a volume?
@z

@x
You can add your code to the image using `COPY` or `ADD` directive in a
`Dockerfile`.  This is useful if you need to relocate your code along with the
Docker image, for example when you're sending code to another environment
(production, CI, etc).
@y
You can add your code to the image using `COPY` or `ADD` directive in a
`Dockerfile`.  This is useful if you need to relocate your code along with the
Docker image, for example when you're sending code to another environment
(production, CI, etc).
@z

@x
You should use a `volume` if you want to make changes to your code and see them
reflected immediately, for example when you're developing code and your server
supports hot code reloading or live-reload.
@y
You should use a `volume` if you want to make changes to your code and see them
reflected immediately, for example when you're developing code and your server
supports hot code reloading or live-reload.
@z

@x
There may be cases where you want to use both. You can have the image
include the code using a `COPY`, and use a `volume` in your Compose file to
include the code from the host during development. The volume overrides
the directory contents of the image.
@y
There may be cases where you want to use both. You can have the image
include the code using a `COPY`, and use a `volume` in your Compose file to
include the code from the host during development. The volume overrides
the directory contents of the image.
@z

@x
## Where can I find example compose files?
@y
## Where can I find example compose files?
@z

@x
There are [many examples of Compose files on
GitHub](https://github.com/search?q=in%3Apath+docker-compose.yml+extension%3Ayml&type=Code).
@y
There are [many examples of Compose files on
GitHub](https://github.com/search?q=in%3Apath+docker-compose.yml+extension%3Ayml&type=Code).
@z

@x
## Compose documentation
@y
{: #compose-documentation }
## Compose ドキュメント
@z

@x
- [User guide](index.md)
- [Installing Compose](install.md)
- [Getting Started](gettingstarted.md)
- [Command line reference](reference/index.md)
- [Compose file reference](compose-file/index.md)
- [Sample apps with Compose](samples-for-compose.md)
@y
- [ユーザーガイド](index.md)
- [Compose のインストール](install.md)
- [はじめよう](gettingstarted.md)
- [コマンドラインリファレンス](reference/index.md)
- [Compose ファイルリファレンス](compose-file/index.md)
- [Compose を使ったサンプルアプリ](samples-for-compose.md)
@z
