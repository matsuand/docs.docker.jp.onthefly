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
Testing is an essential part of modern software development. Testing can mean a lot of things to different development teams. There are unit tests, integration tests and end-to-end testing. In this guide we take a look at running your unit tests in Docker. Let's assume we have defined Mocha tests in a `./test` folder within our application.
@y
最近のソフトウェア開発においてテストは重要な工程です。
テストは、さまざまな開発チームによって実に多くのことを実施します。
ユニットテスト、結合テスト、総合テスト（end-to-end testing）です。
本ガイドでは Docker においてユニットテストを実行していきます。
前提として、アプリケーション内の`./test`フォルダーには Mocha テストが定義されているものとします。
@z

@x
### Running locally and testing the application
@y
{: #running-locally-and-testing-the-application }
### アプリケーションのローカル実行とテスト
@z

@x
Now that we have our sample application locally, let’s build our Docker image and make sure everything is running properly. Run the following commands to build and then run your Docker image in a container.
@y
ローカル環境にはサンプルアプリケーションを構築しているので、Docker イメージをビルドして正常動作することを確認します。
以下のコマンドを入力して、Docker イメージをコンテナーとして実行します。
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
そこでアプリケーションに対して JSON データを POST して、HTTP GET リクエストを取得します。
これによって JSON データが正しく返ってくることを確認します。
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
同じエンドポイントに対して GET リクエストを実行して、JSON データが正しく返されることを確認します。
以下において「id」や「createDate」は、処理環境によって異なります。
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
{: #refactor-dockerfile-to-run-tests }
## テスト用 Dockerfile への変更
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
そして以下の Docker コマンドによって、コンテナーを起動してテストを実行します。
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
上を見てわかるようにエラーが発生しました。
このエラーは実行モジュール mocha が見つからなったということです。
Dockerfile を確認します。
@z

@x
```dockerfile
FROM node:14.15.4

WORKDIR /code

COPY package.json package.json
COPY package-lock.json package-lock.json

RUN npm ci --production
COPY . .

CMD [ "node", "server.js" ]
```
@y
```dockerfile
FROM node:14.15.4

WORKDIR /code

COPY package.json package.json
COPY package-lock.json package-lock.json

RUN npm ci --production
COPY . .

CMD [ "node", "server.js" ]
```
@z

@x
The error is occurring because we are passing the `--production` flag to the npm ci command when it installs our dependencies. This tells npm to not install packages that are located under the "devDependencies" section in the package.json file. Therefore, Mocha will not be installed inside the image and will not be found when we try to run it.
@y
エラーが発生した理由は、npm ci コマンドを使って依存パッケージをインストールする際に`--production`フラグを指定していたからです。
こうしてしまうと npm に対して、package.json ファイル内の「devDependencies」セクションにあるパッケージはインストールしない指示となってしまいます。
したがってイメージ内に Mocha がインストールされなかったことから、実行しても見つからないことになったわけです。
@z

@x
Since we want to follow best practices and not include anything inside the container that we do not need to run our application we can’t just remove the `--production` flag. We have a couple of options to fix this. One option is to create a second Dockerfile that would only be used to run tests. This has a couple of problems. The primary being keeping two Dockerfiles up-to-date. The second option is to use multi-stage builds. We can create a stage for production and one for testing. This is our preferred solution.
@y
ベストプラクティスを守って、アプリケーションの実行に必要のないものはコンテナー内にいっさい含めたくありません。
したがって`--production`フラグを取り除くということはできません。
これに対処する方法はいくつかあります。
その 1 つは、テストを実行するために利用する 2 つめの Dockerfile を生成することです。
ただしこれには問題があります。
2 つの Dockerfile を常に更新していかなければなりません。
そこで 2 つめの選択肢となるのがマルチステージビルドです。
ビルドステージを 1 つは本番用、1 つはテスト用として生成します。
こちらの方が適切な解決策です。
@z

@x
### Multi-stage Dockerfile for testing
@y
{: #multi-stage-dockerfile-for-testing }
### テスト用 Dockerfile のマルチステージ化
@z

@x
Below is a multi-stage Dockerfile tha we will use to build our production image and our test image. Add the highlighted lines to your Dockerfile.
@y
以下に示すのがマルチステージビルド化を行っている Dockerfile です。
これにより本番用イメージとテスト用イメージのビルドを行います。
以下でハイライト表示されている行を Dockerfile に追加してください。
@z

@x
```dockerfile
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
We first add a label to the `FROM node:14.15.4` statement. This allows us to refer to this build stage in other build stages. Next we add a new build stage labeled test. We will use this stage for running our tests.
@y
ここではまずはじめに`FROM node:14.15.4`行にラベルをつけます。
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
テストイメージがビルドできたので、これをコンテナー内において実行しテストが実施できるかどうかを見てみます。
@z

@x
```shell
$ docker run -it --rm --name app -p 8080:80 node-docker
> node-docker@0.1.0 test /code
> mocha ./**/*.js

  Calculator
    adding
      ✓ should return 4 when adding 2 + 2
      ✓ should return 0 when adding zeros
    subtracting
      ✓ should return 4 when subtracting 4 from 8
      ✓ should return 0 when subtracting 8 from 8

  4 passing (11ms)
```
@y
```shell
$ docker run -it --rm --name app -p 8080:80 node-docker
> node-docker@0.1.0 test /code
> mocha ./**/*.js

  Calculator
    adding
      ✓ should return 4 when adding 2 + 2
      ✓ should return 0 when adding zeros
    subtracting
      ✓ should return 4 when subtracting 4 from 8
      ✓ should return 0 when subtracting 8 from 8

  4 passing (11ms)
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
ここでもわかりやすくなるように、ビルド結果の出力は省略しましたが、テストの実行と正常終了が見てとれます。
そこでテストが失敗したときにはどうなるかを見るために、ブレークポイントを設定して出力結果を確認します。
@z

@x
Open the util/math.js file and change line 12 to the following.
@y
util/math.js ファイルを開いて 12 行めを以下のように変更します。
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
そして先ほどと同じ docker build コマンドを実行します。
ビルド処理は失敗して、失敗したテストに関する情報がコンソールに出力されます。
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
{: #next-steps }
## 次のステップ
@z

@x
In this module, we took a look at creating a general development image that we can use pretty much like our normal command line. We also set up our Compose file to map our source code into the running container and exposed the debugging port.
@y
本節では汎用的な開発イメージを生成しました。
このイメージは、ふだんのコマンドラインツールと何ら変わらずに実行できました。
また Compose ファイルを生成してソースコードを実行コンテナー内にマッピングし、デバッグ用のポートを公開しました。
@z

@x
In the next module, we’ll take a look at how to set up a CI/CD pipeline using GitHub Actions. See:
@y
次節では
GitHub アクションを使って CI/CD パイプラインを設定する方法を見ていきます。
以下を参照してください。
@z

@x
[Configure CI/CD](configure-ci-cd.md){: .button .outline-btn}
@y
[CI/CD の設定](configure-ci-cd.md){: .button .outline-btn}
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
お気づきの点があれば [Docker Docs](https://github.com/docker/docker.github.io/issues/new?title=[Node.js%20docs%20feedback]){:target="_blank" rel="noopener" class="_"} の GitHub リポジトリに isshue をあげてください。
あるいは [PR の生成](https://github.com/docker/docker.github.io/pulls){:target="_blank" rel="noopener" class="_"} により変更の提案を行ってください。
@z

@x
<br />
@y
<br />
@z
