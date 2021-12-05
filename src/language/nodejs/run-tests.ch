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
title: "Node.js と Mocha フレームワークを用いたテスト実行"
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
## Prerequisites
@y
{: #prerequisites }
## 前提条件
@z

@x
Work through the steps to build an image and run it as a containerized application in [Use your container for development](develop.md).
@y
[開発向けコンテナーの利用](develop.md) において、イメージビルドを行いコンテナー化アプリケーションを実行していること。
@z

@x
## Introduction
@y
{: #introduction }
## はじめに
@z

@x
Testing is an essential part of modern software development. Testing can mean a lot of things to different development teams. There are unit tests, integration tests and end-to-end testing. In this guide we take a look at running your unit tests in Docker.
@y
最近のソフトウェア開発においてテストは重要な工程です。
テストは、さまざまな開発チームによって実に多くのことを実施します。
ユニットテスト、結合テスト、総合テスト（end-to-end testing）です。
本ガイドでは Docker においてユニットテストを実行していきます。
前提として、アプリケーション内の`./test`フォルダーには Mocha テストが定義されているものとします。
@z


@x
## Create a test
@y
{: #create-a-test }
## テストの生成
@z

@x
Let's define a Mocha test in a `./test` directory within our application.
@y
そこでアプリケーション内の`./test`ディレクトリに Mocha テストを定義します。
@z

@x
```console
$ mkdir -p test
```
@y
```console
$ mkdir -p test
```
@z

@x
Save the following code in `./test/test.js`.
@y
以下のコードを`./test/test.js`として保存します。
@z

@x
```javascript
var assert = require('assert');
describe('Array', function() {
  describe('#indexOf()', function() {
    it('should return -1 when the value is not present', function() {
      assert.equal([1, 2, 3].indexOf(4), -1);
    });
  });
});
```
@y
```javascript
var assert = require('assert');
describe('Array', function() {
  describe('#indexOf()', function() {
    it('should return -1 when the value is not present', function() {
      assert.equal([1, 2, 3].indexOf(4), -1);
    });
  });
});
```
@z

@x
### Running locally and testing the application
@y
{: #running-locally-and-testing-the-application }
### アプリケーションのローカル実行とテスト
@z

@x
Let’s build our Docker image and confirm everything is running properly. Run the following command to build and run your Docker image in a container.
@y
Docker イメージをビルドして正常動作することを確認します。
以下のコマンドを入力して、Docker イメージをコンテナーとして実行します。
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
Now let’s test our application by POSTing a JSON payload and then make an HTTP GET request to make sure our JSON was saved correctly.
@y
そこでアプリケーションに対して JSON データを POST して、HTTP GET リクエストを取得します。
これによって JSON データが正しく返ってくることを確認します。
@z

@x
```console
$ curl --request POST \
  --url http://localhost:8000/test \
  --header 'content-type: application/json' \
  --data '{"msg": "testing"}'
```
@y
```console
$ curl --request POST \
  --url http://localhost:8000/test \
  --header 'content-type: application/json' \
  --data '{"msg": "testing"}'
```
@z

@x
Now, perform a GET request to the same endpoint to make sure our JSON payload was saved and retrieved correctly. The “id” and “createDate” will be different for you.
@y
同じエンドポイントに対して GET リクエストを実行して、JSON データが正しく返されることを確認します。
以下において「id」や「createDate」は、処理環境によって異なります。
@z

@x
```console
$ curl http://localhost:8000/test
@y
```console
$ curl http://localhost:8000/test
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
{: #install-mocha }
## Mocha のインストール
@z

@x
Run the following command to install Mocha and add it to the developer dependencies:
@y
以下のコマンドを実行して Mocha をインストールします。
そして開発用の依存パッケージを追加します。
@z

@x
```console
$ npm install --save-dev mocha
```
@y
```console
$ npm install --save-dev mocha
```
@z

@x
## Update package.json and Dockerfile to run tests
@y
{: #update-package-json-and-dockerfile-to-run-tests }
## テスト実行のための package.json と Dockerfile の変更
@z

@x
Okay, now that we know our application is running properly, let’s try and run our tests inside of the container. We’ll use the same docker run command we used above but this time, we’ll override the CMD that is inside of our container with npm run test. This will invoke the command that is in the package.json file under the “script” section. See below.
@y
さて、アプリケーションは正しく動作することがわかりました。
そこでコンテナー内部においてテストを実行してみます。
先ほどと同じ docker run コマンドを用いますが、ただし今回の場合、コンテナー内部にある CMD をオーバーライドして npm run test を実行するようにします。
このコマンドは、package.json ファイルの「script」セクションのもとにあるコマンドを起動します。
以下を見てください。
@z

@x
```javascript
{
...
  "scripts": {
    "test": "mocha ./**/*.js",
    "start": "nodemon --inspect=0.0.0.0:9229 server.js"
  },
...
}
```
@y
```javascript
{
...
  "scripts": {
    "test": "mocha ./**/*.js",
    "start": "nodemon --inspect=0.0.0.0:9229 server.js"
  },
...
}
```
@z

@x
Below is the Docker command to start the container and run tests:
@y
そして以下の Docker コマンドによって、コンテナーを起動してテストを実行します。
@z

@x
```console
$ docker-compose -f docker-compose.dev.yml run notes npm run test
Creating node-docker_notes_run ... 
@y
```console
$ docker-compose -f docker-compose.dev.yml run notes npm run test
Creating node-docker_notes_run ... 
@z

@x
> node-docker@1.0.0 test /code
> mocha ./**/*.js
@y
> node-docker@1.0.0 test /code
> mocha ./**/*.js
@z

@x
  Array
    #indexOf()
      ✓ should return -1 when the value is not present
@y
  Array
    #indexOf()
      ✓ should return -1 when the value is not present
@z

@x
  1 passing (11ms)

```
@y
  1 passing (11ms)

```
@z

@x
### Multi-stage Dockerfile for testing
@y
{: #multi-stage-dockerfile-for-testing }
### テスト用 Dockerfile のマルチステージ化
@z

@x
In addition to running the tests on command, we can run them when we build our image, using a multi-stage Dockerfile. The following Dockerfile will run our tests and build our production image.
@y
テスト起動をコマンドから行うことに加えて、イメージビルドも同じものから行っていきます。
つまりマルチステージビルドによる  Dockerfile を利用します。
以下に示す Dockerfile は、テストの実行と本番環境用イメージのビルドを行います。
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
FROM node:14.15.4 as base

WORKDIR /code

COPY package.json package.json
COPY package-lock.json package-lock.json

FROM base as test
RUN npm ci
COPY . .
CMD [ "npm", "run", "test" ]

FROM base as prod
RUN npm ci --production
COPY . .
CMD [ "node", "server.js" ]
```
@y
```dockerfile
# syntax=docker/dockerfile:1
FROM node:14.15.4 as base

WORKDIR /code

COPY package.json package.json
COPY package-lock.json package-lock.json

FROM base as test
RUN npm ci
COPY . .
CMD [ "npm", "run", "test" ]

FROM base as prod
RUN npm ci --production
COPY . .
CMD [ "node", "server.js" ]
```
@z

@x
We first add a label `as base` to the `FROM node:14.15.4` statement. This allows us to refer to this build stage in other build stages. Next we add a new build stage labeled test. We will use this stage for running our tests.
@y
ここではまずはじめに`FROM node:14.15.4`行に対して、`as base`によりラベルをつけます。
これを行うと、このビルドステージを他のビルドステージにおいて参照することができます。
次に新たなビルドステージに対して test というラベルをつけます。
このステージはテスト実行用に利用します。
@z

@x
Now let’s rebuild our image and run our tests. We will run the same docker build command as above but this time we will add the `--target test` flag so that we specifically run the test build stage.
@y
そこでイメージを再ビルドしてテストを実行してみます。
ここで実行する docker build コマンドは上と同様ですが、今回は`--target test`というフラグをつけます。
これによってテストビルドステージを指定してビルドします。
@z

@x
```console
$ docker build -t node-docker --target test .
[+] Building 66.5s (12/12) FINISHED
 => [internal] load build definition from Dockerfile                                                                                                                 0.0s
 => => transferring dockerfile: 662B                                                                                                                                 0.0s
 => [internal] load .dockerignore
 ...
  => [internal] load build context                                                                                                                                    4.2s
 => => transferring context: 9.00MB                                                                                                                                  4.1s
 => [base 2/4] WORKDIR /code                                                                                                                                         0.2s
 => [base 3/4] COPY package.json package.json                                                                                                                        0.0s
 => [base 4/4] COPY package-lock.json package-lock.json                                                                                                              0.0s
 => [test 1/2] RUN npm ci                                                                                                                                            6.5s
 => [test 2/2] COPY . .
```
@y
```console
$ docker build -t node-docker --target test .
[+] Building 66.5s (12/12) FINISHED
 => [internal] load build definition from Dockerfile                                                                                                                 0.0s
 => => transferring dockerfile: 662B                                                                                                                                 0.0s
 => [internal] load .dockerignore
 ...
  => [internal] load build context                                                                                                                                    4.2s
 => => transferring context: 9.00MB                                                                                                                                  4.1s
 => [base 2/4] WORKDIR /code                                                                                                                                         0.2s
 => [base 3/4] COPY package.json package.json                                                                                                                        0.0s
 => [base 4/4] COPY package-lock.json package-lock.json                                                                                                              0.0s
 => [test 1/2] RUN npm ci                                                                                                                                            6.5s
 => [test 2/2] COPY . .
```
@z

@x
Now that our test image is built, we can run it in a container and see if our tests pass.
@y
テストイメージがビルドできたので、これをコンテナー内において実行しテストが実施できるかどうかを見てみます。
@z

@x
```console
$ docker run -it --rm -p 8000:8000 node-docker

> node-docker@1.0.0 test /code
> mocha ./**/*.js
@y
```console
$ docker run -it --rm -p 8000:8000 node-docker

> node-docker@1.0.0 test /code
> mocha ./**/*.js
@z

@x
  Array
    #indexOf()
      ✓ should return -1 when the value is not present
@y
  Array
    #indexOf()
      ✓ should return -1 when the value is not present
@z

@x
  1 passing (12ms)

```
@y
  1 passing (12ms)

```
@z

@x
I’ve truncated the build output but you can see that the Mocha test runner completed and all our tests passed.
@y
ビルド処理の結果は上では省略しましたが、Mocha test runner の実行は完了し、テストが正常終了していることがわかります。
@z

@x
This is great but at the moment we have to run two docker commands to build and run our tests. We can improve this slightly by using a RUN statement instead of the CMD statement in the test stage. The CMD statement is not executed during the building of the image but is executed when you run the image in a container. While with the RUN statement, our tests will be run during the building of the image and stop the build when they fail.
@y
うまくできましたが、これでもイメージのビルドとテスト実行に対して 2 つの docker コマンドを実行しなければなりません。
これを少しだけ改善します。
テストステージにおいて CMD 命令ではなく RUN 命令を使うようにします。
CMD 命令はイメージビルド時には実行されません。
これが実行されるのはコンテナー内においてイメージが実行されたときです。
一方 RUN 命令の場合は、イメージビルドの最中にテストが実行され、テストが失敗したときにはビルドが停止します。
@z

@x
Update your Dockerfile with the highlighted line below.
@y
以下の Dockerfile においてハイライト表示されている行を修正してください。
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
FROM node:14.15.4 as base

WORKDIR /code

COPY package.json package.json
COPY package-lock.json package-lock.json

FROM base as test
RUN npm ci
COPY . .
RUN npm run test

FROM base as prod
RUN npm ci --production
COPY . .
CMD [ "node", "server.js" ]
```
@y
```dockerfile
# syntax=docker/dockerfile:1
FROM node:14.15.4 as base

WORKDIR /code

COPY package.json package.json
COPY package-lock.json package-lock.json

FROM base as test
RUN npm ci
COPY . .
RUN npm run test

FROM base as prod
RUN npm ci --production
COPY . .
CMD [ "node", "server.js" ]
```
@z

@x
Now to run our tests, we just need to run the docker build command as above.
@y
テストを実行するには、先ほどと同様に docker build コマンドを実行する必要があります。
@z

@x
```console
$ docker build -t node-docker --target test .
[+] Building 8.9s (13/13) FINISHED
 => [internal] load build definition from Dockerfile      0.0s
 => => transferring dockerfile: 650B                      0.0s
 => [internal] load .dockerignore                         0.0s
 => => transferring context: 2B

> node-docker@1.0.0 test /code
> mocha ./**/*.js



  Array
    #indexOf()
      ✓ should return -1 when the value is not present


  1 passing (9ms)

Removing intermediate container beadc36b293a
 ---> 445b80e59acd
Successfully built 445b80e59acd
Successfully tagged node-docker:latest
 ```
@y
```console
$ docker build -t node-docker --target test .
[+] Building 8.9s (13/13) FINISHED
 => [internal] load build definition from Dockerfile      0.0s
 => => transferring dockerfile: 650B                      0.0s
 => [internal] load .dockerignore                         0.0s
 => => transferring context: 2B

> node-docker@1.0.0 test /code
> mocha ./**/*.js



  Array
    #indexOf()
      ✓ should return -1 when the value is not present


  1 passing (9ms)

Removing intermediate container beadc36b293a
 ---> 445b80e59acd
Successfully built 445b80e59acd
Successfully tagged node-docker:latest
 ```
@z

@x
I’ve truncated the output again for simplicity but you can see that our tests are run and passed. Let’s break one of the tests and observe the output when our tests fail.
@y
ここでもわかりやすくなるように、ビルド結果の出力は省略しましたが、テストの実行と正常終了が見てとれます。
そこでテストが失敗したときにはどうなるかを見るために、ブレークポイントを設定して出力結果を確認します。
@z

@x
Open the test/test.js file and change line 5 as follows.
@y
test/test.js ファイルを開いて 5 行めを以下のように変更します。
@z

@x
```shell
     1	var assert = require('assert');
     2	describe('Array', function() {
     3	  describe('#indexOf()', function() {
     4	    it('should return -1 when the value is not present', function() {
     5	      assert.equal([1, 2, 3].indexOf(3), -1);
     6	    });
     7	  });
     8	});
```
@y
```shell
     1	var assert = require('assert');
     2	describe('Array', function() {
     3	  describe('#indexOf()', function() {
     4	    it('should return -1 when the value is not present', function() {
     5	      assert.equal([1, 2, 3].indexOf(3), -1);
     6	    });
     7	  });
     8	});
```
@z

@x
Now, run the same docker build command from above and observe that the build fails and the failing testing information is printed to the console.
@y
そして先ほどと同じ docker build コマンドを実行します。
ビルド処理は失敗して、失敗したテストに関する情報がコンソールに出力されます。
@z

@x
```console
$ docker build -t node-docker --target test .
Sending build context to Docker daemon  22.35MB
Step 1/8 : FROM node:14.15.4 as base
 ---> 995ff80c793e
...
Step 8/8 : RUN npm run test
 ---> Running in b96d114a336b

> node-docker@1.0.0 test /code
> mocha ./**/*.js



  Array
    #indexOf()
      1) should return -1 when the value is not present


  0 passing (12ms)
  1 failing

  1) Array
       #indexOf()
         should return -1 when the value is not present:

      AssertionError [ERR_ASSERTION]: 2 == -1
      + expected - actual

      -2
      +-1
      
      at Context.<anonymous> (test/test.js:5:14)
      at processImmediate (internal/timers.js:461:21)



npm ERR! code ELIFECYCLE
npm ERR! errno 1
npm ERR! node-docker@1.0.0 test: `mocha ./**/*.js`
npm ERR! Exit status 1
...
```
@y
```console
$ docker build -t node-docker --target test .
Sending build context to Docker daemon  22.35MB
Step 1/8 : FROM node:14.15.4 as base
 ---> 995ff80c793e
...
Step 8/8 : RUN npm run test
 ---> Running in b96d114a336b

> node-docker@1.0.0 test /code
> mocha ./**/*.js



  Array
    #indexOf()
      1) should return -1 when the value is not present


  0 passing (12ms)
  1 failing

  1) Array
       #indexOf()
         should return -1 when the value is not present:

      AssertionError [ERR_ASSERTION]: 2 == -1
      + expected - actual

      -2
      +-1
      
      at Context.<anonymous> (test/test.js:5:14)
      at processImmediate (internal/timers.js:461:21)



npm ERR! code ELIFECYCLE
npm ERR! errno 1
npm ERR! node-docker@1.0.0 test: `mocha ./**/*.js`
npm ERR! Exit status 1
...
```
@z

@x
## Next steps
@y
{: #next-steps }
## 次のステップ
@z

@x
In this module, we took a look at running tests as part of our Docker image build process.
@y
本節では Docker イメージのビルド処理の一部分として、テスト実行を行いました。
@z

@x
In the next module, we’ll take a look at how to set up a CI/CD pipeline using GitHub Actions. See:
@y
次節では GitHub アクションを使って CI/CD パイプラインを設定する方法を見ていきます。
以下を参照してください。
@z

@x
[Configure CI/CD](configure-ci-cd.md){: .button .primary-btn}
@y
[CI/CD の設定](configure-ci-cd.md){: .button .primary-btn}
@z

@x
## Feedback
@y
{: #feedback } 
## フィードバック
@z

@x
Help us improve this topic by providing your feedback. Let us know what you think by creating an issue in the [Docker Docs](https://github.com/docker/docker.github.io/issues/new?title=[Node.js%20docs%20feedback]){:target="_blank" rel="noopener" class="_"} GitHub repository. Alternatively, [create a PR](https://github.com/docker/docker.github.io/pulls){:target="_blank" rel="noopener" class="_"} to suggest updates.
@y
本トピック改善のためにフィードバックをお寄せください。
お気づきの点があれば [Docker Docs](https://github.com/docker/docker.github.io/issues/new?title=[Node.js%20docs%20feedback]){:target="_blank" rel="noopener" class="_"} の GitHub リポジトリに issue をあげてください。
あるいは [PR の生成](https://github.com/docker/docker.github.io/pulls){:target="_blank" rel="noopener" class="_"} により変更の提案を行ってください。
@z

@x
<br />
@y
<br />
@z
