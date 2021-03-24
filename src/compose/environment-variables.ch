%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Environment variables in Compose
description: How to set, use and manage environment variables in Compose
keywords: compose, orchestration, environment, env file
redirect_from:
- /compose/env
- /compose/link-env-deprecated
---
@y
---
title: Compose における環境変数
description: Compose において環境変数を設定、利用、管理する方法について説明。
keywords: compose, orchestration, environment, env file
redirect_from:
- /compose/env
- /compose/link-env-deprecated
---
@z

@x
There are multiple parts of Compose that deal with environment variables in one
sense or another. This page should help you find the information you need.
@y
Compose の複数の場面において環境変数がさまざまに用いられています。
このページでは環境変数について必要となる情報を示します。
@z

@x
## Substitute environment variables in Compose files
@y
{: #substitute-environment-variables-in-compose-files }
## Compose ファイル内での環境変数の利用
@z

@x
It's possible to use environment variables in your shell to populate values
inside a Compose file:
@y
シェル内にて環境変数を設定し、その値を Compose ファイルにおいて読み込ませることができます。
@z

@x
```yaml
web:
  image: "webapp:${TAG}"
```
@y
```yaml
web:
  image: "webapp:${TAG}"
```
@z

@x
If you have multiple environment variables, you can substitute them by adding
them to a default environment variable file named `.env` or by providing a
path to your environment variables file using the `--env-file` command line option.
@y
環境変数が複数ある場合、`.env`という名前のファイルに環境変数のデフォルト値を設定することができます。
あるいはコマンドラインオプション`--env-file`を使って環境変数ファイルへのパスを指定して利用することもできます。
@z

@x
### The “.env” file
@y
{: #the-env-file }
### `.env`ファイル
@z

@x
You can set default values for any environment variables referenced in the
Compose file, or used to configure Compose, in an [environment file](env-file.md)
named `.env`. The `.env` file path is as follows:
@y
Compose ファイルが参照する環境変数、あるいは Compose の設定に用いられる環境変数のデフォルト値を設定することができます。
これは`.env`という [環境ファイル](env-file.md) にて行います。
`.env`ファイルのパスは以下のとおりです。
@z

@x
  - Starting with `+v1.28`, `.env.` file is placed at the base of the project directory 
  - For previous versions, it is placed in the current working directory where the
  Docker Compose command is executed unless a `--project-directory` is defined which
  overrides the path for the `.env` file. This inconsistency is addressed
  in `+v1.28` by limiting the filepath to the project directory.
@y
  - Compose バージョン`v1.28`以降は、`.env.`ファイルはプロジェクトのベースディレクトリに置くようになりました。
  - それ以前のバージョンの場合は、Docker Compose コマンドが実行されたカレントワーキングディレクトリに置きます。
    ただし`--project-directory`を指定すれば`.env`ファイルへのパスをオーバーライドすることができます。
    この不整合は、`v1.28`以降においてそのファイルパスをプロジェクトディレクトリに置くことで解消されます。
@z

@x
```shell
$ cat .env
TAG=v1.5

$ cat docker-compose.yml
version: '3'
services:
  web:
    image: "webapp:${TAG}"
```
@y
```shell
$ cat .env
TAG=v1.5

$ cat docker-compose.yml
version: '3'
services:
  web:
    image: "webapp:${TAG}"
```
@z

@x
When you run `docker-compose up`, the `web` service defined above uses the
image `webapp:v1.5`. You can verify this with the
[config command](reference/config.md), which prints your resolved application
config to the terminal:
@y
`docker-compose up`を実行すると、上で定義されている`web`サービスは`webapp:v1.5`というイメージを利用します。
このことは [config コマンド](reference/config.md)を使って確認できます。
このコマンドは変数を置換した後のアプリケーション設定を端末画面に出力します。
@z

@x
```shell
$ docker-compose config

version: '3'
services:
  web:
    image: 'webapp:v1.5'
```
@y
```shell
$ docker-compose config

version: '3'
services:
  web:
    image: 'webapp:v1.5'
```
@z

@x
Values in the shell take precedence over those specified in the `.env` file.
@y
シェル内にて設定される値は、`.env`ファイル内のものよりも優先されます。
@z

@x
If you set `TAG` to a different value in your shell, the substitution in `image`
uses that instead:
@y
たとえばシェル上において`TAG`を異なる値に設定していたら、それを使って変数置換された`image`が用いられることになります。
@z

@x
```shell
$ export TAG=v2.0
$ docker-compose config

version: '3'
services:
  web:
    image: 'webapp:v2.0'
```
@y
```shell
$ export TAG=v2.0
$ docker-compose config

version: '3'
services:
  web:
    image: 'webapp:v2.0'
```
@z

@x
You can override the environment file path using a command line argument `--env-file`.
@y
環境ファイルへのパスは、コマンドライン引数に`--env-file`を指定することでオーバーライドすることができます。
@z

@x
### Using the “--env-file”  option 
@y
{: #using-the---env-file--option }
### `--env-file`オプションの利用
@z

@x
By passing the file as an argument, you can store it anywhere and name it 
appropriately, for example, `.env.ci`, `.env.dev`, `.env.prod`. Passing the file path is 
done using the `--env-file` option:
@y
ファイル名を引数に与えれば、どこにある何というファイルであっても指定できます。
たとえば`.env.ci`、`.env.dev`、`.env.prod`などでも可能です。
ファイルパスの指定は`--env-file`オプションを使って行います。
@z

@x
```shell
docker-compose --env-file ./config/.env.dev up 
```
@y
```shell
docker-compose --env-file ./config/.env.dev up 
```
@z

@x
This file path is relative to the current working directory where the Docker Compose
command is executed.
@y
このファイルパスは、Docker Compose コマンドを実行したカレントなワーキングディレクトリからの相対パスです。
@z

@x
```shell
$ cat .env
TAG=v1.5

$ cat ./config/.env.dev
TAG=v1.6


$ cat docker-compose.yml
version: '3'
services:
  web:
    image: "webapp:${TAG}"
```
@y
```shell
$ cat .env
TAG=v1.5

$ cat ./config/.env.dev
TAG=v1.6


$ cat docker-compose.yml
version: '3'
services:
  web:
    image: "webapp:${TAG}"
```
@z

@x
The `.env` file is loaded by default:
@y
デフォルトでは`.env`ファイルがロードされます。
@z

@x
```shell
$ docker-compose config 
version: '3'
services:
  web:
    image: 'webapp:v1.5'
```
@y
```shell
$ docker-compose config 
version: '3'
services:
  web:
    image: 'webapp:v1.5'
```
@z

@x
Passing the `--env-file ` argument overrides the default file path:
@y
`--env-file `引数を受け渡せば、デフォルトのファイルパスをオーバーライドします。
@z

@x
```shell
$ docker-compose --env-file ./config/.env.dev config 
version: '3'
services:
  web:
    image: 'webapp:v1.6'
```
@y
```shell
$ docker-compose --env-file ./config/.env.dev config 
version: '3'
services:
  web:
    image: 'webapp:v1.6'
```
@z

@x
When an invalid file path is being passed as `--env-file` argument, Compose returns an error:
@y
ファイルパスとして不適切なものが`--env-file`引数として指定された場合、Compopse は以下のようなエラーを返します。
@z

@x
```
$ docker-compose --env-file ./doesnotexist/.env.dev  config
ERROR: Couldn't find env file: /home/user/./doesnotexist/.env.dev
```
@y
```
$ docker-compose --env-file ./doesnotexist/.env.dev  config
ERROR: Couldn't find env file: /home/user/./doesnotexist/.env.dev
```
@z

@x
For more information, see the
[Variable substitution](compose-file/compose-file-v3.md#variable-substitution) section in the
Compose file reference.
@y
詳しくは Compose ファイルリファレンスの [変数の置換](compose-file/compose-file-v3.md#variable-substitution) の項を参照してください。
@z

@x
## Set environment variables in containers
@y
{: #set-environment-variables-in-containers }
## コンテナー内での環境変数の設定
@z

@x
You can set environment variables in a service's containers with the
['environment' key](compose-file/compose-file-v3.md#environment), just like with
`docker run -e VARIABLE=VALUE ...`:
@y
サービスコンテナーにおいて、たとえば`docker run -e VARIABLE=VALUE ...`のように [`environment`キー](compose-file/compose-file-v3.md#environment) を使って、環境変数を設定することができます。
@z

@x
```yaml
web:
  environment:
    - DEBUG=1
```
@y
```yaml
web:
  environment:
    - DEBUG=1
```
@z

@x
## Pass environment variables to containers
@y
{: #pass-environment-variables-to-containers }
## コンテナーへの環境変数の受け渡し
@z

@x
You can pass environment variables from your shell straight through to a
service's containers with the ['environment' key](compose-file/compose-file-v3.md#environment)
by not giving them a value, just like with `docker run -e VARIABLE ...`:
@y
シェル内の環境変数を [`environment`キー](compose-file/compose-file-v3.md#environment) を使って、直接サービスコンテナーに受け渡すことができます。この場合には値を渡すのではなく`docker run -e 変数名 ...`のようにできます。
@z

@x
```yaml
web:
  environment:
    - DEBUG
```
@y
```yaml
web:
  environment:
    - DEBUG
```
@z

@x
The value of the `DEBUG` variable in the container is taken from the value for
the same variable in the shell in which Compose is run.
@y
コンテナー内の`DEBUG`変数は、シェル内の`DEBUG`変数の値が用いられます。
このシェルとは Compose が起動しているシェルのことです。
@z

@x
## The “env_file” configuration option
@y
{: #the-env_file-configuration-option }
## 設定オプション`env_file`
@z

@x
You can pass multiple environment variables from an external file through to
a service's containers with the ['env_file' option](compose-file/compose-file-v3.md#env_file),
just like with `docker run --env-file=FILE ...`:
@y
外部ファイルから複数の環境変数をサービスコンテナーに受け渡すには [``env_file``オプション](compose-file/compose-file-v3.md#env_file) を利用することができます。
`docker run --env-file=FILE ...`のようにすることもできます。
@z

@x
```yaml
web:
  env_file:
    - web-variables.env
```
@y
```yaml
web:
  env_file:
    - web-variables.env
```
@z

@x
## Set environment variables with 'docker-compose run'
@y
{: #set-environment-variables-with-docker-compose-run }
## `docker-compose run`実行時の環境変数の設定
@z

@x
Similar to `docker run -e`, you can set environment variables on a one-off
container with `docker-compose run -e`:
@y
`docker run -e`と同じように、`docker-compose run -e`の実行によるコンテナーに対しても環境変数を実行することができます。
@z

@x
```shell
docker-compose run -e DEBUG=1 web python console.py
```
@y
```shell
docker-compose run -e DEBUG=1 web python console.py
```
@z

@x
You can also pass a variable from the shell by not giving it a value:
@y
シェル変数を受け渡す際には、値は直接受け渡さずに以下のようにできます。
@z

@x
```shell
docker-compose run -e DEBUG web python console.py
```
@y
```shell
docker-compose run -e DEBUG web python console.py
```
@z

@x
The value of the `DEBUG` variable in the container is taken from the value for
the same variable in the shell in which Compose is run.
@y
コンテナー内の`DEBUG`変数は、シェル内の`DEBUG`変数の値が用いられます。
このシェルとは Compose が起動しているシェルのことです。
@z

@x
When you set the same environment variable in multiple files, here's the
priority used by Compose to choose which value to use:
@y
環境変数を複数のファイルなどに設定していた場合に、Compose が値を採用する優先順位は以下のとおりです。
@z

@x
1. Compose file
2. Shell environment variables
3. Environment file
4. Dockerfile
5. Variable is not defined
@y
1. Compose ファイル
2. シェル内の環境変数
3. 環境ファイル
4. Dockerfile
5. 未定義の変数
@z

@x
In the example below, we set the same environment variable on an Environment
file, and the Compose file:
@y
以下の例では同一の環境変数を、環境ファイルと Compose ファイルに設定しています。
@z

@x
```shell
$ cat ./Docker/api/api.env
NODE_ENV=test
@y
```shell
$ cat ./Docker/api/api.env
NODE_ENV=test
@z

@x
$ cat docker-compose.yml
version: '3'
services:
  api:
    image: 'node:6-alpine'
    env_file:
     - ./Docker/api/api.env
    environment:
     - NODE_ENV=production
```
@y
$ cat docker-compose.yml
version: '3'
services:
  api:
    image: 'node:6-alpine'
    env_file:
     - ./Docker/api/api.env
    environment:
     - NODE_ENV=production
```
@z

@x
When you run the container, the environment variable defined in the Compose
file takes precedence.
@y
コンテナーを実行すると Compose ファイルに定義された環境変数が優先されます。
@z

@x
```shell
$ docker-compose exec api node
@y
```shell
$ docker-compose exec api node
@z

@x
> process.env.NODE_ENV
'production'
```
@y
> process.env.NODE_ENV
'production'
```
@z

@x
Having any `ARG` or `ENV` setting in a `Dockerfile` evaluates only if there is
no Docker Compose entry for `environment` or `env_file`.
@y
`Dockerfile`ファイル内の`ARG`や`ENV`は、`environment`や`env_file`による Docker Composeの設定がある場合は評価されません。
@z

@x
> Specifics for NodeJS containers
>
> If you have a `package.json` entry for `script:start` like
> `NODE_ENV=test node server.js`, then this overrules any setting in your
> `docker-compose.yml` file.
@y
> NodeJS コンテナーの仕様
>
> `script:start`に対して`package.json`のエントリーを含む場合、たとえば`NODE_ENV=test node server.js`のような場合には、`docker-compose.yml`ファイルでの設定よりもこちらの設定が優先されます。
@z

@x
## Configure Compose using environment variables
@y
{: #configure-compose-using-environment-variables }
## 環境変数を用いた Compose の設定
@z

@x
Several environment variables are available for you to configure the Docker
Compose command-line behavior. They begin with `COMPOSE_` or `DOCKER_`, and are
documented in [CLI Environment Variables](reference/envvars.md).
@y
Docker Compose のコマンドラインからの処理設定を行うことができる環境変数がいくつかあります。
そういった変数は先頭が`COMPOSE_`や`DOCKER_`で始まります。
詳しくは [CLI 環境変数](reference/envvars.md)を参照してください。
@z
