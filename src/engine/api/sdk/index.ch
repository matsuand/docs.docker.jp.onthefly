%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Develop with Docker Engine SDKs
description: Using Docker SDKs to automate Docker tasks in your language of choice
keywords: developing, sdk
redirect_from:
- /engine/api/sdks/
- /develop/sdk/
---
@y
---
title: Docker Engine SDK を利用した開発
description: Using Docker SDKs to automate Docker tasks in your language of choice
keywords: developing, sdk
redirect_from:
- /engine/api/sdks/
- /develop/sdk/
---
@z

@x
Docker provides an API for interacting with the Docker daemon (called the Docker
Engine API), as well as SDKs for Go and Python. The SDKs allow you to build and
scale Docker apps and solutions quickly and easily. If Go or Python don't work
for you, you can use the Docker Engine API directly.
@y
Docker には、Docker デーモンとの対話的な処理を行うための API が提供されています。
（これを Docker Engine API と呼びます。）
Go 言語や Python における SDK のようなものです。
SDK を使えば、Docker アプリや Docker ソリューションのビルドやスケール変更を、すばやく簡単に行うことができます。
Go 言語や Python ではうまく動作しない場合には、Docker Engine API を直接処理してみてください。
@z

@x
The Docker Engine API is a RESTful API accessed by an HTTP client such as `wget` or
`curl`, or the HTTP library which is part of most modern programming languages.
@y
Docker Engine API は、`wget` や `curl` といった HTTP クライアントからアクセスできる RESTful API です。
あるいは、今日あるほとんどのプログラミング言語に組み入れられる HTTP ライブラリです。
@z

@x
## Install the SDKs
@y
{: #install-the-sdks }
## SDK のインストール
@z

@x
Use the following commands to install the Go or Python SDK. Both SDKs can be
installed and coexist together.
@y
Use the following commands to install the Go or Python SDK. Both SDKs can be
installed and coexist together.
@z

@x
### Go SDK
@y
{: #go-sdk }
### Go 言語の SDK
@z

@x
```console
$ go get github.com/docker/docker/client
```
@y
```console
$ go get github.com/docker/docker/client
```
@z

@x
The client requires a recent version of Go. Run `go version` and ensure that you 
are running a currently supported version of Go
@y
The client requires a recent version of Go. Run `go version` and ensure that you 
are running a currently supported version of Go
@z

@x
[Read the full Docker Engine Go SDK reference](https://godoc.org/github.com/docker/docker/client).
@y
[Read the full Docker Engine Go SDK reference](https://godoc.org/github.com/docker/docker/client).
@z

@x
### Python SDK
@y
### Python SDK
@z

@x
- **Recommended**: Run `pip install docker`.
@y
- **推奨** ＝ `pip install docker` を実行します。
@z

@x
- **If you can't use `pip`**:
@y
- **`pip` を利用できない場合は以下を行います。**
@z

@x
  1.  [Download the package directly](https://pypi.python.org/pypi/docker/).
  2.  Extract it and change to the extracted directory,
  3.  Run `python setup.py install`.
@y
  1.  [パッケージを直接ダウンロード](https://pypi.python.org/pypi/docker/) します。
  2.  パッケージを伸張（解凍）して、生成されたディレクトリに移動します。
  3.  `python setup.py install` を実行します。
@z

@x
[Read the full Docker Engine Python SDK reference](https://docker-py.readthedocs.io/).
@y
[Read the full Docker Engine Python SDK reference](https://docker-py.readthedocs.io/).
@z

@x
## View the API reference
@y
{: #view-the-api-reference }
## API リファレンスの参照
@z

@x
You can
[view the reference for the latest version of the API](/engine/api/latest/)
or [choose a specific version](/engine/api/version-history/).
@y
You can
[view the reference for the latest version of the API](/engine/api/latest/)
or [choose a specific version](/engine/api/version-history/).
@z

@x
## Versioned API and SDK
@y
## Versioned API and SDK
@z

@x
The version of the Docker Engine API you should use depends upon the version of
your Docker daemon and Docker client. Refer to the [versioned API and SDK](/engine/api/#versioned-api-and-sdk)
section in the API documentation for details.
@y
The version of the Docker Engine API you should use depends upon the version of
your Docker daemon and Docker client. Refer to the [versioned API and SDK](/engine/api/#versioned-api-and-sdk)
section in the API documentation for details.
@z

@x
## SDK and API quickstart
@y
## SDK and API quickstart
@z

@x
Use the following guidelines to choose the SDK or API version to use in your
code:
@y
Use the following guidelines to choose the SDK or API version to use in your
code:
@z

@x
- If you're starting a new project, use the [latest version](/engine/api/latest/),
  but use API version negotiation or specify the version you are using. This
  helps prevent surprises.
- If you need a new feature, update your code to use at least the minimum version
  that supports the feature, and prefer the latest version you can use.
- Otherwise, continue to use the version that your code is already using.
@y
- If you're starting a new project, use the [latest version](/engine/api/latest/),
  but use API version negotiation or specify the version you are using. This
  helps prevent surprises.
- If you need a new feature, update your code to use at least the minimum version
  that supports the feature, and prefer the latest version you can use.
- Otherwise, continue to use the version that your code is already using.
@z

@x
As an example, the `docker run` command can be easily implemented using the
Docker API directly, or using the Python or Go SDK.
@y
As an example, the `docker run` command can be easily implemented using the
Docker API directly, or using the Python or Go SDK.
@z

@x
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" data-target="#go">Go</a></li>
  <li><a data-toggle="tab" data-target="#python">Python</a></li>
  <li><a data-toggle="tab" data-target="#curl">HTTP</a></li>
</ul>
<div class="tab-content">
@y
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" data-target="#go">Go</a></li>
  <li><a data-toggle="tab" data-target="#python">Python</a></li>
  <li><a data-toggle="tab" data-target="#curl">HTTP</a></li>
</ul>
<div class="tab-content">
@z

@x
  <div id="go" class="tab-pane fade in active" markdown="1">
@y
  <div id="go" class="tab-pane fade in active" markdown="1">
@z

@x
```go
package main
@y
```go
package main
@z

@x
import (
	"context"
	"io"
	"os"
@y
import (
	"context"
	"io"
	"os"
@z

@x
	"github.com/docker/docker/api/types"
	"github.com/docker/docker/api/types/container"
	"github.com/docker/docker/client"
	"github.com/docker/docker/pkg/stdcopy"
)
@y
	"github.com/docker/docker/api/types"
	"github.com/docker/docker/api/types/container"
	"github.com/docker/docker/client"
	"github.com/docker/docker/pkg/stdcopy"
)
@z

@x
func main() {
    ctx := context.Background()
    cli, err := client.NewClientWithOpts(client.FromEnv, client.WithAPIVersionNegotiation())
    if err != nil {
        panic(err)
    }
@y
func main() {
    ctx := context.Background()
    cli, err := client.NewClientWithOpts(client.FromEnv, client.WithAPIVersionNegotiation())
    if err != nil {
        panic(err)
    }
@z

@x
    reader, err := cli.ImagePull(ctx, "docker.io/library/alpine", types.ImagePullOptions{})
    if err != nil {
        panic(err)
    }
    io.Copy(os.Stdout, reader)
@y
    reader, err := cli.ImagePull(ctx, "docker.io/library/alpine", types.ImagePullOptions{})
    if err != nil {
        panic(err)
    }
    io.Copy(os.Stdout, reader)
@z

@x
    resp, err := cli.ContainerCreate(ctx, &container.Config{
        Image: "alpine",
        Cmd:   []string{"echo", "hello world"},
    }, nil, nil, nil, "")
    if err != nil {
        panic(err)
    }
@y
    resp, err := cli.ContainerCreate(ctx, &container.Config{
        Image: "alpine",
        Cmd:   []string{"echo", "hello world"},
    }, nil, nil, nil, "")
    if err != nil {
        panic(err)
    }
@z

@x
    if err := cli.ContainerStart(ctx, resp.ID, types.ContainerStartOptions{}); err != nil {
        panic(err)
    }
@y
    if err := cli.ContainerStart(ctx, resp.ID, types.ContainerStartOptions{}); err != nil {
        panic(err)
    }
@z

@x
    statusCh, errCh := cli.ContainerWait(ctx, resp.ID, container.WaitConditionNotRunning)
    select {
    case err := <-errCh:
        if err != nil {
            panic(err)
        }
    case <-statusCh:
    }
@y
    statusCh, errCh := cli.ContainerWait(ctx, resp.ID, container.WaitConditionNotRunning)
    select {
    case err := <-errCh:
        if err != nil {
            panic(err)
        }
    case <-statusCh:
    }
@z

@x
    out, err := cli.ContainerLogs(ctx, resp.ID, types.ContainerLogsOptions{ShowStdout: true})
    if err != nil {
        panic(err)
    }
@y
    out, err := cli.ContainerLogs(ctx, resp.ID, types.ContainerLogsOptions{ShowStdout: true})
    if err != nil {
        panic(err)
    }
@z

@x
    stdcopy.StdCopy(os.Stdout, os.Stderr, out)
}
```
@y
    stdcopy.StdCopy(os.Stdout, os.Stderr, out)
}
```
@z

@x
  </div>
  <div id="python" class="tab-pane fade" markdown="1">
@y
  </div>
  <div id="python" class="tab-pane fade" markdown="1">
@z

@x
```python
import docker
client = docker.from_env()
print client.containers.run("alpine", ["echo", "hello", "world"])
```
@y
```python
import docker
client = docker.from_env()
print client.containers.run("alpine", ["echo", "hello", "world"])
```
@z

@x
  </div>
  <div id="curl" class="tab-pane fade" markdown="1">
@y
  </div>
  <div id="curl" class="tab-pane fade" markdown="1">
@z

@x
```console
$ curl --unix-socket /var/run/docker.sock -H "Content-Type: application/json" \
  -d '{"Image": "alpine", "Cmd": ["echo", "hello world"]}' \
  -X POST http://localhost/v{{ site.latest_engine_api_version}}/containers/create
{"Id":"1c6594faf5","Warnings":null}
@y
```console
$ curl --unix-socket /var/run/docker.sock -H "Content-Type: application/json" \
  -d '{"Image": "alpine", "Cmd": ["echo", "hello world"]}' \
  -X POST http://localhost/v{{ site.latest_engine_api_version}}/containers/create
{"Id":"1c6594faf5","Warnings":null}
@z

@x
$ curl --unix-socket /var/run/docker.sock -X POST http://localhost/v{{ site.latest_engine_api_version}}/containers/1c6594faf5/start
@y
$ curl --unix-socket /var/run/docker.sock -X POST http://localhost/v{{ site.latest_engine_api_version}}/containers/1c6594faf5/start
@z

@x
$ curl --unix-socket /var/run/docker.sock -X POST http://localhost/v{{ site.latest_engine_api_version}}/containers/1c6594faf5/wait
{"StatusCode":0}
@y
$ curl --unix-socket /var/run/docker.sock -X POST http://localhost/v{{ site.latest_engine_api_version}}/containers/1c6594faf5/wait
{"StatusCode":0}
@z

@x
$ curl --unix-socket /var/run/docker.sock "http://localhost/v{{ site.latest_engine_api_version}}/containers/1c6594faf5/logs?stdout=1"
hello world
```
@y
$ curl --unix-socket /var/run/docker.sock "http://localhost/v{{ site.latest_engine_api_version}}/containers/1c6594faf5/logs?stdout=1"
hello world
```
@z

@x
When using cURL to connect over a unix socket, the hostname is not important. The
examples above use `localhost`, but any hostname would work.
@y
When using cURL to connect over a unix socket, the hostname is not important. The
examples above use `localhost`, but any hostname would work.
@z

@x
> **Using cURL 7.47.0 or below?**
>
> The examples above assume you are using cURL 7.50.0 or above. Older versions of
> cURL used a [non-standard URL notation](https://github.com/moby/moby/issues/17960){:target="_blank" rel="noopener" class="_"}
> when using a socket connection.
> 
> If you are using an older version of cURL, use `http:/<API version>/` instead,
> for example, `http:/v{{ site.latest_engine_api_version}}/containers/1c6594faf5/start`
{: .important}
@y
> **Using cURL 7.47.0 or below?**
>
> The examples above assume you are using cURL 7.50.0 or above. Older versions of
> cURL used a [non-standard URL notation](https://github.com/moby/moby/issues/17960){:target="_blank" rel="noopener" class="_"}
> when using a socket connection.
> 
> If you are using an older version of cURL, use `http:/<API version>/` instead,
> for example, `http:/v{{ site.latest_engine_api_version}}/containers/1c6594faf5/start`
{: .important}
@z

@x
  </div>
</div>
@y
  </div>
</div>
@z

@x
For more examples, take a look at the [SDK examples](examples.md).
@y
For more examples, take a look at the [SDK examples](examples.md).
@z

@x
## Unofficial libraries
@y
## Unofficial libraries
@z

@x
There are a number of community supported libraries available for other
languages. They have not been tested by Docker, so if you run into any issues,
file them with the library maintainers.
@y
There are a number of community supported libraries available for other
languages. They have not been tested by Docker, so if you run into any issues,
file them with the library maintainers.
@z

@x
| Language              | Library                                                                     |
|:----------------------|:----------------------------------------------------------------------------|
| C                     | [libdocker](https://github.com/danielsuo/libdocker)                         |
| C#                    | [Docker.DotNet](https://github.com/ahmetalpbalkan/Docker.DotNet)            |
| C++                   | [lasote/docker_client](https://github.com/lasote/docker_client)             |
| Clojure               | [clj-docker-client](https://github.com/into-docker/clj-docker-client)       |
| Dart                  | [bwu_docker](https://github.com/bwu-dart/bwu_docker)                        |
| Erlang                | [erldocker](https://github.com/proger/erldocker)                            |
| Gradle                | [gradle-docker-plugin](https://github.com/gesellix/gradle-docker-plugin)    |
| Groovy                | [docker-client](https://github.com/gesellix/docker-client)                  |
| Haskell               | [docker-hs](https://github.com/denibertovic/docker-hs)                      |
| HTML (Web Components) | [docker-elements](https://github.com/kapalhq/docker-elements)               |
| Java                  | [docker-client](https://github.com/spotify/docker-client)                   |
| Java                  | [docker-java](https://github.com/docker-java/docker-java)                   |
| Java                  | [docker-java-api](https://github.com/amihaiemil/docker-java-api)            |
| Java                  | [jocker](https://github.com/ndeloof/jocker)                                 |
| NodeJS                | [dockerode](https://github.com/apocas/dockerode)                            |
| NodeJS                | [harbor-master](https://github.com/arhea/harbor-master)                     |
| Perl                  | [Eixo::Docker](https://github.com/alambike/eixo-docker)                     |
| PHP                   | [Docker-PHP](https://github.com/docker-php/docker-php)                      |
| Ruby                  | [docker-api](https://github.com/swipely/docker-api)                         |
| Rust                  | [docker-rust](https://github.com/abh1nav/docker-rust)                       |
| Rust                  | [shiplift](https://github.com/softprops/shiplift)                           |
| Scala                 | [tugboat](https://github.com/softprops/tugboat)                             |
| Scala                 | [reactive-docker](https://github.com/almoehi/reactive-docker)               |
| Swift                 | [docker-client-swift](https://github.com/valeriomazzeo/docker-client-swift) |
@y
| 言語                  | ライブラリ                                                                  |
|:----------------------|:----------------------------------------------------------------------------|
| C                     | [libdocker](https://github.com/danielsuo/libdocker)                         |
| C#                    | [Docker.DotNet](https://github.com/ahmetalpbalkan/Docker.DotNet)            |
| C++                   | [lasote/docker_client](https://github.com/lasote/docker_client)             |
| Dart                  | [bwu_docker](https://github.com/bwu-dart/bwu_docker)                        |
| Erlang                | [erldocker](https://github.com/proger/erldocker)                            |
| Gradle                | [gradle-docker-plugin](https://github.com/gesellix/gradle-docker-plugin)    |
| Groovy                | [docker-client](https://github.com/gesellix/docker-client)                  |
| Haskell               | [docker-hs](https://github.com/denibertovic/docker-hs)                      |
| HTML (Web Components) | [docker-elements](https://github.com/kapalhq/docker-elements)               |
| Java                  | [docker-client](https://github.com/spotify/docker-client)                   |
| Java                  | [docker-java](https://github.com/docker-java/docker-java)                   |
| Java                  | [docker-java-api](https://github.com/amihaiemil/docker-java-api)            |
| Java                  | [jocker](https://github.com/ndeloof/jocker)                                 |
| NodeJS                | [dockerode](https://github.com/apocas/dockerode)                            |
| NodeJS                | [harbor-master](https://github.com/arhea/harbor-master)                     |
| Perl                  | [Eixo::Docker](https://github.com/alambike/eixo-docker)                     |
| PHP                   | [Docker-PHP](https://github.com/docker-php/docker-php)                      |
| Ruby                  | [docker-api](https://github.com/swipely/docker-api)                         |
| Rust                  | [docker-rust](https://github.com/abh1nav/docker-rust)                       |
| Rust                  | [shiplift](https://github.com/softprops/shiplift)                           |
| Scala                 | [tugboat](https://github.com/softprops/tugboat)                             |
| Scala                 | [reactive-docker](https://github.com/almoehi/reactive-docker)               |
| Swift                 | [docker-client-swift](https://github.com/valeriomazzeo/docker-client-swift) |
@z
