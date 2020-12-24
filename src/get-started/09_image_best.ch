%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: "Image building tips"
keywords: get started, setup, orientation, quickstart, intro, concepts, containers, docker desktop
description: Tips for building the images for our application
---
@y
---
title: "イメージビルドのヒント"
keywords: get started, setup, orientation, quickstart, intro, concepts, containers, docker desktop
description: Tips for building the images for our application
---
@z

@x
## Security Scanning
@y
{: #security-scanning }
## セキュリティスキャン
@z

@x
When you have built an image, it is good practice to scan it for security vulnerabilities using the `docker scan` command.
Docker has partnered with [Snyk](http://snyk.io) to provide the vulnerability scanning service.
@y
イメージをビルドしたら`docker scan`コマンドを実行して、イメージにセキュリティぜい弱性がないかどうかをスキャンする。
これがベストプラクティスです。
Docker は [Snyk](http://snyk.io) 社と連携してセキュリティスキャンサービスを提供しています。
@z

@x
For example, to scan the `getting-started` image you created earlier in the tutorial, you can just type
@y
たとえば本チュートリアルの初期の頃に生成した`getting-started`イメージをスキャンする場合は、以下のようにします。
@z

@x
```bash
docker scan getting-started
```
@y
```bash
docker scan getting-started
```
@z

@x
The scan uses a constantly updated database of vulnerabilities, so the output you see will vary as new
vulnerabilities are discovered, but it might look something like this:
@y
スキャン処理では常時更新されているぜい弱性データベースを利用しています。
したがって処理結果は、新たなぜい弱性が発見されるたびに変わります。
出力例は以下のようなものです。
@z

@x
```plaintext
✗ Low severity vulnerability found in freetype/freetype
  Description: CVE-2020-15999
  Info: https://snyk.io/vuln/SNYK-ALPINE310-FREETYPE-1019641
  Introduced through: freetype/freetype@2.10.0-r0, gd/libgd@2.2.5-r2
  From: freetype/freetype@2.10.0-r0
  From: gd/libgd@2.2.5-r2 > freetype/freetype@2.10.0-r0
  Fixed in: 2.10.0-r1
@y
```plaintext
✗ Low severity vulnerability found in freetype/freetype
  Description: CVE-2020-15999
  Info: https://snyk.io/vuln/SNYK-ALPINE310-FREETYPE-1019641
  Introduced through: freetype/freetype@2.10.0-r0, gd/libgd@2.2.5-r2
  From: freetype/freetype@2.10.0-r0
  From: gd/libgd@2.2.5-r2 > freetype/freetype@2.10.0-r0
  Fixed in: 2.10.0-r1
@z

@x
✗ Medium severity vulnerability found in libxml2/libxml2
  Description: Out-of-bounds Read
  Info: https://snyk.io/vuln/SNYK-ALPINE310-LIBXML2-674791
  Introduced through: libxml2/libxml2@2.9.9-r3, libxslt/libxslt@1.1.33-r3, nginx-module-xslt/nginx-module-xslt@1.17.9-r1
  From: libxml2/libxml2@2.9.9-r3
  From: libxslt/libxslt@1.1.33-r3 > libxml2/libxml2@2.9.9-r3
  From: nginx-module-xslt/nginx-module-xslt@1.17.9-r1 > libxml2/libxml2@2.9.9-r3
  Fixed in: 2.9.9-r4
```
@y
✗ Medium severity vulnerability found in libxml2/libxml2
  Description: Out-of-bounds Read
  Info: https://snyk.io/vuln/SNYK-ALPINE310-LIBXML2-674791
  Introduced through: libxml2/libxml2@2.9.9-r3, libxslt/libxslt@1.1.33-r3, nginx-module-xslt/nginx-module-xslt@1.17.9-r1
  From: libxml2/libxml2@2.9.9-r3
  From: libxslt/libxslt@1.1.33-r3 > libxml2/libxml2@2.9.9-r3
  From: nginx-module-xslt/nginx-module-xslt@1.17.9-r1 > libxml2/libxml2@2.9.9-r3
  Fixed in: 2.9.9-r4
```
@z

@x
The output lists the type of vulnerability, a URL to learn more, and importantly which version of the relevant library
fixes the vulnerability.
@y
出力結果にはぜい弱性の種類、詳細 URL が示されます。
そして最も重要なのが対象となるライブラリです。
そこには対象ライブラリのどのバージョンがぜい弱性を解消しているかが示されます。
@z

@x
There are several other options, which you can read about in the [docker scan documentation](https://docs.docker.com/engine/scan/).
@y
その他にもいくつかオプションがあります。
その詳細については [docker scan のドキュメント]({{ site.baseurl }}/engine/scan/) を参照してください。
@z

@x
As well as scanning your newly built image on the command line, you can also [configure Docker Hub](https://docs.docker.com/docker-hub/vulnerability-scanning/)
to scan all newly pushed images automatically, and you can then see the results in both Docker Hub and Docker Desktop.
@y
新たに作り出したイメージに対するスキャンをコマンドラインから行う方法と、さらに [Docker Hub の設定]({{ site.baseurl }}/docker-hub/vulnerability-scanning/) を行って新規にプッシュされたイメージを自動的にスキャンすることも可能です。
その場合の処理結果は Docker Hub と Docker Desktop のいずれからでも確認できます。
@z

@x
![Hub vulnerability scanning](images/hvs.png){: style=width:75% }
{: .text-center }
@y
![Docker Hub のぜい弱性スキャン](images/hvs.png){: style=width:75% }
{: .text-center }
@z

@x
## Image Layering
@y
{: #image-layering }
## イメージのレイヤー管理
@z

@x
Did you know that you can look at what makes up an image? Using the `docker image history`
command, you can see the command that was used to create each layer within an image.
@y
イメージがどのように構成されているかを確認できるのはご存知でしたか？
`docker image history`コマンドを実行すれば、イメージ内のコンテナーがどのようなコマンドによって生成されたかを確認することができます。
@z

@x
1. Use the `docker image history` command to see the layers in the `getting-started` image you
   created earlier in the tutorial.
@y
1. `docker image history`コマンドを実行して、本チュートリアルの初期に生成した`getting-started`イメージ内のレイヤーを確認してみます。
@z

@x
    ```bash
    docker image history getting-started
    ```
@y
    ```bash
    docker image history getting-started
    ```
@z

@x
    You should get output that looks something like this (dates/IDs may be different).
@y
    結果として以下のような出力が得られます（日付や ID は異なるはずです）。
@z

@x
    ```plaintext
    IMAGE               CREATED             CREATED BY                                      SIZE                COMMENT
    a78a40cbf866        18 seconds ago      /bin/sh -c #(nop)  CMD ["node" "src/index.j…    0B                  
    f1d1808565d6        19 seconds ago      /bin/sh -c yarn install --production            85.4MB              
    a2c054d14948        36 seconds ago      /bin/sh -c #(nop) COPY dir:5dc710ad87c789593…   198kB               
    9577ae713121        37 seconds ago      /bin/sh -c #(nop) WORKDIR /app                  0B                  
    b95baba1cfdb        13 days ago         /bin/sh -c #(nop)  CMD ["node"]                 0B                  
    <missing>           13 days ago         /bin/sh -c #(nop)  ENTRYPOINT ["docker-entry…   0B                  
    <missing>           13 days ago         /bin/sh -c #(nop) COPY file:238737301d473041…   116B                
    <missing>           13 days ago         /bin/sh -c apk add --no-cache --virtual .bui…   5.35MB              
    <missing>           13 days ago         /bin/sh -c #(nop)  ENV YARN_VERSION=1.21.1      0B                  
    <missing>           13 days ago         /bin/sh -c addgroup -g 1000 node     && addu…   74.3MB              
    <missing>           13 days ago         /bin/sh -c #(nop)  ENV NODE_VERSION=12.14.1     0B                  
    <missing>           13 days ago         /bin/sh -c #(nop)  CMD ["/bin/sh"]              0B                  
    <missing>           13 days ago         /bin/sh -c #(nop) ADD file:e69d441d729412d24…   5.59MB   
    ```
@y
    ```plaintext
    IMAGE               CREATED             CREATED BY                                      SIZE                COMMENT
    a78a40cbf866        18 seconds ago      /bin/sh -c #(nop)  CMD ["node" "src/index.j…    0B                  
    f1d1808565d6        19 seconds ago      /bin/sh -c yarn install --production            85.4MB              
    a2c054d14948        36 seconds ago      /bin/sh -c #(nop) COPY dir:5dc710ad87c789593…   198kB               
    9577ae713121        37 seconds ago      /bin/sh -c #(nop) WORKDIR /app                  0B                  
    b95baba1cfdb        13 days ago         /bin/sh -c #(nop)  CMD ["node"]                 0B                  
    <missing>           13 days ago         /bin/sh -c #(nop)  ENTRYPOINT ["docker-entry…   0B                  
    <missing>           13 days ago         /bin/sh -c #(nop) COPY file:238737301d473041…   116B                
    <missing>           13 days ago         /bin/sh -c apk add --no-cache --virtual .bui…   5.35MB              
    <missing>           13 days ago         /bin/sh -c #(nop)  ENV YARN_VERSION=1.21.1      0B                  
    <missing>           13 days ago         /bin/sh -c addgroup -g 1000 node     && addu…   74.3MB              
    <missing>           13 days ago         /bin/sh -c #(nop)  ENV NODE_VERSION=12.14.1     0B                  
    <missing>           13 days ago         /bin/sh -c #(nop)  CMD ["/bin/sh"]              0B                  
    <missing>           13 days ago         /bin/sh -c #(nop) ADD file:e69d441d729412d24…   5.59MB   
    ```
@z

@x
    Each of the lines represents a layer in the image. The display here shows the base at the bottom with
    the newest layer at the top. Using this, you can also quickly see the size of each layer, helping 
    diagnose large images.
@y
    各行はイメージ内のレイヤーを表わしています。
    この出力結果はベースイメージが最下段に、そして最も新しいレイヤーが最上段に示されます。
    このコマンドを用いると、各レイヤーのサイズを簡単に知ることができるので、大容量イメージの調査に役立てることができます。
@z

@x
1. You'll notice that several of the lines are truncated. If you add the `--no-trunc` flag, you'll get the
   full output (yes... funny how you use a truncated flag to get untruncated output, huh?)
@y
1. 上の表示においては何行かが省略（truncate）表示されているのがわかります。
   `--no-trunc`フラグをつければ、省略せずに表示することができます。
   （`--no-trunc`って英単語が省略されたフラグを使っておきながら、省略されていない結果を得ようなんて、どういうことなんでしょうねぇ。）
@z

@x
    ```bash
    docker image history --no-trunc getting-started
    ```
@y
    ```bash
    docker image history --no-trunc getting-started
    ```
@z

@x
## Layer Caching
@y
{: #layer-caching }
## レイヤーのキャッシュ処理
@z

@x
Now that you've seen the layering in action, there's an important lesson to learn to help decrease build
times for your container images.
@y
レイヤー管理の様子をじかに見ましたので、次に重要なレッスンに進みます。
コンテナーイメージのビルド時間を減らす方法についてです。
@z

@x
> Once a layer changes, all downstream layers have to be recreated as well
@y
> 1 つのレイヤーに変更が入ると、それ以降に続く全レイヤーは再生成されます。
@z

@x
Let's look at the Dockerfile we were using one more time...
@y
利用してきた Dockerfile をもう一度見てみます...
@z

@x
```dockerfile
FROM node:12-alpine
WORKDIR /app
COPY . .
RUN yarn install --production
CMD ["node", "src/index.js"]
```
@y
```dockerfile
FROM node:12-alpine
WORKDIR /app
COPY . .
RUN yarn install --production
CMD ["node", "src/index.js"]
```
@z

@x
Going back to the image history output, we see that each command in the Dockerfile becomes a new layer in the image.
You might remember that when we made a change to the image, the yarn dependencies had to be reinstalled. Is there a
way to fix this? It doesn't make much sense to ship around the same dependencies every time we build, right?
@y
image history コマンドの出力結果に戻ってみると、Dockerfile の各コマンドがイメージ内の 1 つのレイヤーに対応していることがわかります。
覚えてるでしょうか。
イメージに変更を加えたときに yarn による依存パッケージが再インストールされていました。
ではこれを変える方法ってあるんでしょうか。
ビルドのたびに同じ依存パッケージを何度も導入することになるなんて、無駄なことですよね？
@z

@x
To fix this, we need to restructure our Dockerfile to help support the caching of the dependencies. For Node-based
applications, those dependencies are defined in the `package.json` file. So, what if we copied only that file in first,
install the dependencies, and _then_ copy in everything else? Then, we only recreate the yarn dependencies if there was
a change to the `package.json`. Make sense?
@y
これを変更するには Dockerfile の記述を組み立て直して、依存パッケージをキャッシングするようにします。
Node ベースのアプリケーションの場合、そういった依存パッケージは`package.json`ファイルに定義されます。
そこでこのファイルのコピーを一番最初に行っておいて、その後に依存パッケージのインストールとその他ファイルのコピーを行うようにしたら、どうなるでしょう。
`package.json`に対する変更があったときだけ、yarn による依存パッケージの再生成を行うようにするということです。
どうなるでしょう？
@z

@x
1. Update the Dockerfile to copy in the `package.json` first, install dependencies, and then copy everything else in.
@y
1. Dockerfile において最初に`package.json`をコピーするようにし、その後で依存パッケージのインストールとその他ファイルのコピーを行うように修正します。
@z

@x
    ```dockerfile
    FROM node:12-alpine
    WORKDIR /app
    COPY package.json yarn.lock ./
    RUN yarn install --production
    COPY . .
    CMD ["node", "src/index.js"]
    ```
@y
    ```dockerfile
    FROM node:12-alpine
    WORKDIR /app
    COPY package.json yarn.lock ./
    RUN yarn install --production
    COPY . .
    CMD ["node", "src/index.js"]
    ```
@z

@x
1. Create a file named `.dockerignore` in the same folder as the Dockerfile with the following contents.
@y
1. Dockerfile と同じフォルダー内に`.dockerignore`という名前のファイルを生成して、その内容を以下とします。
@z

@x
    ```ignore
    node_modules
    ```
@y
    ```ignore
    node_modules
    ```
@z

@x
    `.dockerignore` files are an easy way to selectively copy only image relevant files.
    You can read more about this
    [here](https://docs.docker.com/engine/reference/builder/#dockerignore-file).
    In this case, the `node_modules` folder should be omitted in the second `COPY` step because otherwise,
    it would possibly overwrite files which were created by the command in the `RUN` step.
    For further details on why this is recommended for Node.js applications and other best practices,
    have a look at their guide on
    [Dockerizing a Node.js web app](https://nodejs.org/en/docs/guides/nodejs-docker-webapp/).
@y
    `.dockerignore`ファイルを使うと、イメージに関係するファイルのみを選別してコピーするという方法を簡単に実現できます。
    この点に関しては [こちら]({{ site.baseurl }}/engine/reference/builder/#dockerignore-file) に説明しています。
    今の場合`node_modules`フォルダーは 2 番めの`COPY`においては処理対象からはずす必要があります。
    そうしないと、`RUN`におけるコマンド実行によって生成されたファイルを上書きしてしまう可能性があるからです。
    Node.js アプリケーションにおいてなぜこういったことが推奨されるか、あるいはその他のベストプラクティスについて、[Dockerizing a Node.js web app](https://nodejs.org/en/docs/guides/nodejs-docker-webapp/) にガイドが示されているのでご覧ください。
@z

@x
1. Build a new image using `docker build`.
@y
1. `docker build`を実行して新たなイメージをビルドします。
@z

@x
    ```bash
    docker build -t getting-started .
    ```
@y
    ```bash
    docker build -t getting-started .
    ```
@z

@x
    You should see output like this...
@y
    以下のような出力が得られます。
@z

@x
    ```plaintext
    Sending build context to Docker daemon  219.1kB
    Step 1/6 : FROM node:12-alpine
    ---> b0dc3a5e5e9e
    Step 2/6 : WORKDIR /app
    ---> Using cache
    ---> 9577ae713121
    Step 3/6 : COPY package.json yarn.lock ./
    ---> bd5306f49fc8
    Step 4/6 : RUN yarn install --production
    ---> Running in d53a06c9e4c2
    yarn install v1.17.3
    [1/4] Resolving packages...
    [2/4] Fetching packages...
    info fsevents@1.2.9: The platform "linux" is incompatible with this module.
    info "fsevents@1.2.9" is an optional dependency and failed compatibility check. Excluding it from installation.
    [3/4] Linking dependencies...
    [4/4] Building fresh packages...
    Done in 10.89s.
    Removing intermediate container d53a06c9e4c2
    ---> 4e68fbc2d704
    Step 5/6 : COPY . .
    ---> a239a11f68d8
    Step 6/6 : CMD ["node", "src/index.js"]
    ---> Running in 49999f68df8f
    Removing intermediate container 49999f68df8f
    ---> e709c03bc597
    Successfully built e709c03bc597
    Successfully tagged getting-started:latest
    ```
@y
    ```plaintext
    Sending build context to Docker daemon  219.1kB
    Step 1/6 : FROM node:12-alpine
    ---> b0dc3a5e5e9e
    Step 2/6 : WORKDIR /app
    ---> Using cache
    ---> 9577ae713121
    Step 3/6 : COPY package.json yarn.lock ./
    ---> bd5306f49fc8
    Step 4/6 : RUN yarn install --production
    ---> Running in d53a06c9e4c2
    yarn install v1.17.3
    [1/4] Resolving packages...
    [2/4] Fetching packages...
    info fsevents@1.2.9: The platform "linux" is incompatible with this module.
    info "fsevents@1.2.9" is an optional dependency and failed compatibility check. Excluding it from installation.
    [3/4] Linking dependencies...
    [4/4] Building fresh packages...
    Done in 10.89s.
    Removing intermediate container d53a06c9e4c2
    ---> 4e68fbc2d704
    Step 5/6 : COPY . .
    ---> a239a11f68d8
    Step 6/6 : CMD ["node", "src/index.js"]
    ---> Running in 49999f68df8f
    Removing intermediate container 49999f68df8f
    ---> e709c03bc597
    Successfully built e709c03bc597
    Successfully tagged getting-started:latest
    ```
@z

@x
    You'll see that all layers were rebuilt. Perfectly fine since we changed the Dockerfile quite a bit.
@y
    すべてのレイヤーが再ビルドされたことが見てとれます。
    Dockerfile を大きく変更したのですから、そうなるのも当たり前です。
@z

@x
1. Now, make a change to the `src/static/index.html` file (like change the `<title>` to say "The Awesome Todo App").
@y
1. そこで`src/static/index.html`ファイルに変更を加えます（たとえば`<title>`を「The Awesome Todo App」にするとか）。
@z

@x
1. Build the Docker image now using `docker build -t getting-started .` again. This time, your output should look a little different.
@y
1. もう一度`docker build -t getting-started .`を実行して Docker イメージを作り直します。
   今回の出力結果はやや異なります。
@z

@x
    ```plaintext
    Sending build context to Docker daemon  219.1kB
    Step 1/6 : FROM node:12-alpine
    ---> b0dc3a5e5e9e
    Step 2/6 : WORKDIR /app
    ---> Using cache
    ---> 9577ae713121
    Step 3/6 : COPY package.json yarn.lock ./
    ---> Using cache
    ---> bd5306f49fc8
    Step 4/6 : RUN yarn install --production
    ---> Using cache
    ---> 4e68fbc2d704
    Step 5/6 : COPY . .
    ---> cccde25a3d9a
    Step 6/6 : CMD ["node", "src/index.js"]
    ---> Running in 2be75662c150
    Removing intermediate container 2be75662c150
    ---> 458e5c6f080c
    Successfully built 458e5c6f080c
    Successfully tagged getting-started:latest
    ```
@y
    ```plaintext
    Sending build context to Docker daemon  219.1kB
    Step 1/6 : FROM node:12-alpine
    ---> b0dc3a5e5e9e
    Step 2/6 : WORKDIR /app
    ---> Using cache
    ---> 9577ae713121
    Step 3/6 : COPY package.json yarn.lock ./
    ---> Using cache
    ---> bd5306f49fc8
    Step 4/6 : RUN yarn install --production
    ---> Using cache
    ---> 4e68fbc2d704
    Step 5/6 : COPY . .
    ---> cccde25a3d9a
    Step 6/6 : CMD ["node", "src/index.js"]
    ---> Running in 2be75662c150
    Removing intermediate container 2be75662c150
    ---> 458e5c6f080c
    Successfully built 458e5c6f080c
    Successfully tagged getting-started:latest
    ```
@z

@x
    First off, you should notice that the build was MUCH faster! And, you'll see that steps 1-4 all have
    `Using cache`. So, hooray! We're using the build cache. Pushing and pulling this image and updates to it
    will be much faster as well. Hooray!
@y
    まずなによりもビルドが格段に速くなったことがわかります。
    そして Step 1 から 4 は`Using cache`と表記され、キャッシュが利用されていることがわかります。
    やりました。
    ビルドキャッシュを利用することができました。
    つまりこのイメージのプッシュとプル、あるいはイメージ更新がぐっと速くなるということです。
    お疲れさま。
@z

@x
## Multi-Stage Builds
@y
{: #multi-stage-builds }
## マルチステージビルド
@z

@x
While we're not going to dive into it too much in this tutorial, multi-stage builds are an incredibly powerful
tool to help use multiple stages to create an image. There are several advantages for them:
@y
本チュートリアルではさほど深く突き詰めていませんが、極めて強力なツールとしてマルチステージビルドがあります。
イメージの生成に複数ステージを利用するというものです。
これにはいくつかの利点があります。
@z

@x
- Separate build-time dependencies from runtime dependencies
- Reduce overall image size by shipping _only_ what your app needs to run
@y
- ビルド時の依存パッケージと実行時の依存パッケージを分離します。
- アプリとして実行する必要のあるもの **だけ** を作り出すことによって、イメージ全体のサイズを削減します。
@z

@x
### Maven/Tomcat Example
@y
{: #maventomcat-example }
### Maven/Tomcat の例
@z

@x
When building Java-based applications, a JDK is needed to compile the source code to Java bytecode. However,
that JDK isn't needed in production. Also, you might be using tools like Maven or Gradle to help build the app.
Those also aren't needed in our final image. Multi-stage builds help.
@y
Java ベースのアプリケーションをビルドするには、ソースコードを Java のバイトコードにコンパイルするために JDK が必要になります。
しかし JDK は本番環境では必要ありません。
またアプリのビルドに Maven や Gradle といったツールを利用するかもしれませんが、こういったものも最終イメージ内には不要のものです。
そこでマルチステージビルドが役立ちます。
@z

@x
```dockerfile
FROM maven AS build
WORKDIR /app
COPY . .
RUN mvn package

FROM tomcat
COPY --from=build /app/target/file.war /usr/local/tomcat/webapps 
```
@y
```dockerfile
FROM maven AS build
WORKDIR /app
COPY . .
RUN mvn package

FROM tomcat
COPY --from=build /app/target/file.war /usr/local/tomcat/webapps 
```
@z

@x
In this example, we use one stage (called `build`) to perform the actual Java build using Maven. In the second
stage (starting at `FROM tomcat`), we copy in files from the `build` stage. The final image is only the last stage
being created (which can be overridden using the `--target` flag).
@y
この例では 1 つめのステージ（`build`と呼ぶ）を使って Maven を利用した Java ビルドを実現します。
2 つめのステージ（`FROM tomcat`から始まるところ）において、`build`ステージの生成ファイルをコピーします。
最終イメージは、この 2 つめに作り出されたステージです（これは`--target`フラグを使えば上書き可能です）。
@z

@x
### React Example
@y
{: #react-example }
### React の例
@z

@x
When building React applications, we need a Node environment to compile the JS code (typically JSX), SASS stylesheets,
and more into static HTML, JS, and CSS. If we aren't doing server-side rendering, we don't even need a Node environment
for our production build. Why not ship the static resources in a static nginx container?
@y
React アプリケーションをビルドするには JS コード（通常 JSX）、SASS スタイルシートなどをコンパイルしてスタティック HTML、JS、CSS を生成するために Node 環境が必要です。
サーバーにおいてレンダリングを行わないのであれば、本番ビルド用の Node 環境すら必要ありません。
スタティックリソースであるならスタティック Nginx コンテナーを使いましょう。
@z

@x
```dockerfile
FROM node:12 AS build
WORKDIR /app
COPY package* yarn.lock ./
RUN yarn install
COPY public ./public
COPY src ./src
RUN yarn run build

FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
```
@y
```dockerfile
FROM node:12 AS build
WORKDIR /app
COPY package* yarn.lock ./
RUN yarn install
COPY public ./public
COPY src ./src
RUN yarn run build

FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
```
@z

@x
Here, we are using a `node:12` image to perform the build (maximizing layer caching) and then copying the output
into an nginx container. Cool, huh?
@y
ここで利用した`node:12`イメージは（レイヤーキャッシングの最大化を目指した上で）ビルド処理を実現するものであり、その出力結果を Nginx コンテナーにコピーしています。
すばらしい。
@z

@x
## Recap
@y
{: #recap }
## まとめ
@z

@x
By understanding a little bit about how images are structured, we can build images faster and ship fewer changes.
Scanning images gives us confidence that the containers we are running and distributing are secure.
Multi-stage builds also help us reduce overall image size and increase final container security by separating
build-time dependencies from runtime dependencies.
@y
イメージがどのように構成されているかについて何となく理解できたところで、イメージビルドをより速く、変更はより少なくすることができました。
イメージをスキャンしておけば、実行および配布するイメージの安全性が確実になります。
マルチステージビルドを使えば、イメージサイズ全体を小さくできることもわかりました。
ビルド時の依存パッケージを実行時の依存パッケージから切り離すことができるので、最終コンテナーの安全性が増すことになります。
@z
