%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Examples using the Docker Engine SDKs and Docker API
keywords: developing, api, sdk, developers, rest, curl, python, go
redirect_from:
- /engine/api/getting-started/
- /engine/api/client-libraries/
- /engine/reference/api/remote_api_client_libraries/
- /reference/api/remote_api_client_libraries/
- /develop/sdk/examples/
---
@y
---
title: Docker Engine SDK および Docker API の利用例
keywords: developing, api, sdk, developers, rest, curl, python, go
redirect_from:
- /engine/api/getting-started/
- /engine/api/client-libraries/
- /engine/reference/api/remote_api_client_libraries/
- /reference/api/remote_api_client_libraries/
- /develop/sdk/examples/
---
@z

@x
After you
[install Docker](../../../get-docker.md), you can
[install the Go or Python SDK](index.md#install-the-sdks) and
also try out the Docker Engine API.
@y
{% comment %}
After you
[install Docker](../../../get-docker.md), you can
[install the Go or Python SDK](index.md#install-the-sdks) and
also try out the Docker Engine API.
{% endcomment %}
[Docker のインストール](../../../get-docker.md) を行ったら、[Go または Python SDK のインストール](index.md#install-the-sdks) を行うことができます。
そして Docker Engine API にも挑戦してみましょう。
@z

@x
Each of these examples show how to perform a given Docker operation using the Go
and Python SDKs and the HTTP API using `curl`.
@y
{% comment %}
Each of these examples show how to perform a given Docker operation using the Go
and Python SDKs and the HTTP API using `curl`.
{% endcomment %}
以下に示す利用例は、提示されている Docker 操作を、Go や Python の SDK や `curl` 利用による HTTP API を使って実現する方法を示すものです。
@z

@x
## Run a container
@y
{% comment %}
## Run a container
{% endcomment %}
{: #run-a-container }
## コンテナーの実行
@z

@x
This first example shows how to run a container using the Docker API. On the
command line, you would use the `docker run` command, but this is just as easy
to do from your own apps too.
@y
{% comment %}
This first example shows how to run a container using the Docker API. On the
command line, you would use the `docker run` command, but this is just as easy
to do from your own apps too.
{% endcomment %}
1 つめの利用例は、Docker API を使ったコンテナーの実行方法です。
コマンドラインであれば `docker run` コマンドを実行します。
これはアプリケーションからであっても、ごく簡単に実現できます。
@z

@x
This is the equivalent of typing `docker run alpine echo hello world` at the
command prompt:
@y
{% comment %}
This is the equivalent of typing `docker run alpine echo hello world` at the
command prompt:
{% endcomment %}
以下は、コマンドプロンプトからの `docker run alpine echo hello world` の実行と、まったく同じことを行います。
@z

@x
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" data-target="#tab-run-go" data-group="go">Go</a></li>
  <li><a data-toggle="tab" data-target="#tab-run-python" data-group="python">Python</a></li>
  <li><a data-toggle="tab" data-target="#tab-run-curl" data-group="curl">HTTP</a></li>
</ul>
@y
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" data-target="#tab-run-go" data-group="go">Go</a></li>
  <li><a data-toggle="tab" data-target="#tab-run-python" data-group="python">Python</a></li>
  <li><a data-toggle="tab" data-target="#tab-run-curl" data-group="curl">HTTP</a></li>
</ul>
@z

@x
<div class="tab-content">
@y
<div class="tab-content">
@z

@x
<div id="tab-run-go" class="tab-pane fade in active" markdown="1">
@y
<div id="tab-run-go" class="tab-pane fade in active" markdown="1">
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
		Tty:   false,
	}, nil, nil, nil, "")
	if err != nil {
		panic(err)
	}
@y
	resp, err := cli.ContainerCreate(ctx, &container.Config{
		Image: "alpine",
		Cmd:   []string{"echo", "hello world"},
		Tty:   false,
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
@y
</div>
@z

@x
<div id="tab-run-python" class="tab-pane fade" markdown="1">
@y
<div id="tab-run-python" class="tab-pane fade" markdown="1">
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
@y
</div>
@z

@x
<div id="tab-run-curl" class="tab-pane fade" markdown="1">
@y
<div id="tab-run-curl" class="tab-pane fade" markdown="1">
@z

@x
```bash
$ curl --unix-socket /var/run/docker.sock -H "Content-Type: application/json" \
  -d '{"Image": "alpine", "Cmd": ["echo", "hello world"]}' \
  -X POST http:/v1.24/containers/create
{"Id":"1c6594faf5","Warnings":null}
@y
```bash
$ curl --unix-socket /var/run/docker.sock -H "Content-Type: application/json" \
  -d '{"Image": "alpine", "Cmd": ["echo", "hello world"]}' \
  -X POST http:/v1.24/containers/create
{"Id":"1c6594faf5","Warnings":null}
@z

@x
$ curl --unix-socket /var/run/docker.sock -X POST http:/v1.24/containers/1c6594faf5/start
@y
$ curl --unix-socket /var/run/docker.sock -X POST http:/v1.24/containers/1c6594faf5/start
@z

@x
$ curl --unix-socket /var/run/docker.sock -X POST http:/v1.24/containers/1c6594faf5/wait
{"StatusCode":0}
@y
$ curl --unix-socket /var/run/docker.sock -X POST http:/v1.24/containers/1c6594faf5/wait
{"StatusCode":0}
@z

@x
$ curl --unix-socket /var/run/docker.sock "http:/v1.24/containers/1c6594faf5/logs?stdout=1"
hello world
```
@y
$ curl --unix-socket /var/run/docker.sock "http:/v1.24/containers/1c6594faf5/logs?stdout=1"
hello world
```
@z

@x
</div>
</div><!-- end tab-content -->
@y
</div>
</div><!-- end tab-content -->
@z

@x
## Run a container in the background
@y
{% comment %}
## Run a container in the background
{% endcomment %}
{: #run-a-container-in-the-background }
## コンテナーのバックグラウンド実行
@z

@x
You can also run containers in the background, the equivalent of typing
`docker run -d bfirsh/reticulate-splines`:
@y
{% comment %}
You can also run containers in the background, the equivalent of typing
`docker run -d bfirsh/reticulate-splines`:
{% endcomment %}
コンテナーはバックグラウンド実行ができます。
`docker run -d bfirsh/reticulate-splines` と同じことは、以下のようにして実現できます。
@z

@x
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" data-target="#tab-rundetach-go" data-group="go">Go</a></li>
  <li><a data-toggle="tab" data-target="#tab-rundetach-python" data-group="python">Python</a></li>
  <li><a data-toggle="tab" data-target="#tab-rundetach-curl" data-group="curl">HTTP</a></li>
</ul>
@y
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" data-target="#tab-rundetach-go" data-group="go">Go</a></li>
  <li><a data-toggle="tab" data-target="#tab-rundetach-python" data-group="python">Python</a></li>
  <li><a data-toggle="tab" data-target="#tab-rundetach-curl" data-group="curl">HTTP</a></li>
</ul>
@z

@x
<div class="tab-content">
@y
<div class="tab-content">
@z

@x
<div id="tab-rundetach-go" class="tab-pane fade in active" markdown="1">
@y
<div id="tab-rundetach-go" class="tab-pane fade in active" markdown="1">
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
	"fmt"
	"io"
	"os"
@y
import (
	"context"
	"fmt"
	"io"
	"os"
@z

@x
	"github.com/docker/docker/api/types"
	"github.com/docker/docker/api/types/container"
	"github.com/docker/docker/client"
)
@y
	"github.com/docker/docker/api/types"
	"github.com/docker/docker/api/types/container"
	"github.com/docker/docker/client"
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
	imageName := "bfirsh/reticulate-splines"
@y
	imageName := "bfirsh/reticulate-splines"
@z

@x
	out, err := cli.ImagePull(ctx, imageName, types.ImagePullOptions{})
	if err != nil {
		panic(err)
	}
	io.Copy(os.Stdout, out)
@y
	out, err := cli.ImagePull(ctx, imageName, types.ImagePullOptions{})
	if err != nil {
		panic(err)
	}
	io.Copy(os.Stdout, out)
@z

@x
	resp, err := cli.ContainerCreate(ctx, &container.Config{
		Image: imageName,
	}, nil, nil, "")
	if err != nil {
		panic(err)
	}
@y
	resp, err := cli.ContainerCreate(ctx, &container.Config{
		Image: imageName,
	}, nil, nil, "")
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
	fmt.Println(resp.ID)
}
```
@y
	fmt.Println(resp.ID)
}
```
@z

@x
</div>
@y
</div>
@z

@x
<div id="tab-rundetach-python" class="tab-pane fade" markdown="1">
@y
<div id="tab-rundetach-python" class="tab-pane fade" markdown="1">
@z

@x
```python
import docker
client = docker.from_env()
container = client.containers.run("bfirsh/reticulate-splines", detach=True)
print container.id
```
@y
```python
import docker
client = docker.from_env()
container = client.containers.run("bfirsh/reticulate-splines", detach=True)
print container.id
```
@z

@x
</div>
@y
</div>
@z

@x
<div id="tab-rundetach-curl" class="tab-pane fade" markdown="1">
@y
<div id="tab-rundetach-curl" class="tab-pane fade" markdown="1">
@z

@x
```bash
$ curl --unix-socket /var/run/docker.sock -H "Content-Type: application/json" \
  -d '{"Image": "bfirsh/reticulate-splines"}' \
  -X POST http:/v1.24/containers/create
{"Id":"1c6594faf5","Warnings":null}
@y
```bash
$ curl --unix-socket /var/run/docker.sock -H "Content-Type: application/json" \
  -d '{"Image": "bfirsh/reticulate-splines"}' \
  -X POST http:/v1.24/containers/create
{"Id":"1c6594faf5","Warnings":null}
@z

@x
$ curl --unix-socket /var/run/docker.sock -X POST http:/v1.24/containers/1c6594faf5/start
```
@y
$ curl --unix-socket /var/run/docker.sock -X POST http:/v1.24/containers/1c6594faf5/start
```
@z

@x
</div>
</div><!-- end tab-content -->
@y
</div>
</div><!-- end tab-content -->
@z

@x
## List and manage containers
@y
{% comment %}
## List and manage containers
{% endcomment %}
{: #list-and-manage-containers }
## コンテナー一覧と管理
@z

@x
You can use the API to list containers that are running, just like using
`docker ps`:
@y
{% comment %}
You can use the API to list containers that are running, just like using
`docker ps`:
{% endcomment %}
実行中コンテナーの一覧を得る `docker ps` は、API を使うと以下のようになります。
@z

@x
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" data-target="#tab-listcontainers-go" data-group="go">Go</a></li>
  <li ><a data-toggle="tab" data-target="#tab-listcontainers-python" data-group="python">Python</a></li>
  <li><a data-toggle="tab" data-target="#tab-listcontainers-curl" data-group="curl">HTTP</a></li>
</ul>
@y
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" data-target="#tab-listcontainers-go" data-group="go">Go</a></li>
  <li ><a data-toggle="tab" data-target="#tab-listcontainers-python" data-group="python">Python</a></li>
  <li><a data-toggle="tab" data-target="#tab-listcontainers-curl" data-group="curl">HTTP</a></li>
</ul>
@z

@x
<div class="tab-content">
@y
<div class="tab-content">
@z

@x
<div id="tab-listcontainers-go" class="tab-pane fade in active" markdown="1">
@y
<div id="tab-listcontainers-go" class="tab-pane fade in active" markdown="1">
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
	"fmt"
@y
import (
	"context"
	"fmt"
@z

@x
	"github.com/docker/docker/api/types"
	"github.com/docker/docker/client"
)
@y
	"github.com/docker/docker/api/types"
	"github.com/docker/docker/client"
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
	containers, err := cli.ContainerList(ctx, types.ContainerListOptions{})
	if err != nil {
		panic(err)
	}
@y
	containers, err := cli.ContainerList(ctx, types.ContainerListOptions{})
	if err != nil {
		panic(err)
	}
@z

@x
	for _, container := range containers {
		fmt.Println(container.ID)
	}
}
```
@y
	for _, container := range containers {
		fmt.Println(container.ID)
	}
}
```
@z

@x
</div>
@y
</div>
@z

@x
<div id="tab-listcontainers-python" class="tab-pane fade" markdown="1">
@y
<div id="tab-listcontainers-python" class="tab-pane fade" markdown="1">
@z

@x
```python
import docker
client = docker.from_env()
for container in client.containers.list():
  print container.id
```
@y
```python
import docker
client = docker.from_env()
for container in client.containers.list():
  print container.id
```
@z

@x
</div>
@y
</div>
@z

@x
<div id="tab-listcontainers-curl" class="tab-pane fade" markdown="1">
@y
<div id="tab-listcontainers-curl" class="tab-pane fade" markdown="1">
@z

@x
```bash
$ curl --unix-socket /var/run/docker.sock http:/v1.24/containers/json
[{
  "Id":"ae63e8b89a26f01f6b4b2c9a7817c31a1b6196acf560f66586fbc8809ffcd772",
  "Names":["/tender_wing"],
  "Image":"bfirsh/reticulate-splines",
  ...
}]
```
@y
```bash
$ curl --unix-socket /var/run/docker.sock http:/v1.24/containers/json
[{
  "Id":"ae63e8b89a26f01f6b4b2c9a7817c31a1b6196acf560f66586fbc8809ffcd772",
  "Names":["/tender_wing"],
  "Image":"bfirsh/reticulate-splines",
  ...
}]
```
@z

@x
</div>
</div><!-- end tab-content -->
@y
</div>
</div><!-- end tab-content -->
@z

@x
## Stop all running containers
@y
{% comment %}
## Stop all running containers
{% endcomment %}
{: #stop-all-runningccontainers }
## 実行中コンテナーの全停止
@z

@x
Now that you know what containers exist, you can perform operations on them.
This example stops all running containers.
@y
{% comment %}
Now that you know what containers exist, you can perform operations on them.
This example stops all running containers.
{% endcomment %}
コンテナーとして何があるのかがわかったので、そのコンテナー上での操作を行います。
以下の例は、実行中コンテナーをすべて停止させます。
@z

@x
> **Note**: Don't run this on a production server. Also, if you are using swarm
> services, the containers stop, but Docker creates new ones to keep
> the service running in its configured state.
@y
{% comment %}
> **Note**: Don't run this on a production server. Also, if you are using swarm
> services, the containers stop, but Docker creates new ones to keep
> the service running in its configured state.
{% endcomment %}
> **メモ**: この操作は、本番サーバー上では実行しないでください。
> また Swarm サービスを利用している場合は、コンテナーを停止させても、Docker が新たなコンテナーを生成して、サービスを設定内容どおりに動作させようとします。
@z

@x
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" data-target="#tab-stopcontainers-go" data-group="go">Go</a></li>
  <li><a data-toggle="tab" data-target="#tab-stopcontainers-python" data-group="python">Python</a></li>
  <li><a data-toggle="tab" data-target="#tab-stopcontainers-curl" data-group="curl">HTTP</a></li>
</ul>
@y
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" data-target="#tab-stopcontainers-go" data-group="go">Go</a></li>
  <li><a data-toggle="tab" data-target="#tab-stopcontainers-python" data-group="python">Python</a></li>
  <li><a data-toggle="tab" data-target="#tab-stopcontainers-curl" data-group="curl">HTTP</a></li>
</ul>
@z

@x
<div class="tab-content">
@y
<div class="tab-content">
@z

@x
<div id="tab-stopcontainers-go" class="tab-pane fade in active" markdown="1">
@y
<div id="tab-stopcontainers-go" class="tab-pane fade in active" markdown="1">
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
	"fmt"
@y
import (
	"context"
	"fmt"
@z

@x
	"github.com/docker/docker/api/types"
	"github.com/docker/docker/client"
)
@y
	"github.com/docker/docker/api/types"
	"github.com/docker/docker/client"
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
	containers, err := cli.ContainerList(ctx, types.ContainerListOptions{})
	if err != nil {
		panic(err)
	}
@y
	containers, err := cli.ContainerList(ctx, types.ContainerListOptions{})
	if err != nil {
		panic(err)
	}
@z

@x
	for _, container := range containers {
		fmt.Print("Stopping container ", container.ID[:10], "... ")
		if err := cli.ContainerStop(ctx, container.ID, nil); err != nil {
			panic(err)
		}
		fmt.Println("Success")
	}
}
```
@y
	for _, container := range containers {
		fmt.Print("Stopping container ", container.ID[:10], "... ")
		if err := cli.ContainerStop(ctx, container.ID, nil); err != nil {
			panic(err)
		}
		fmt.Println("Success")
	}
}
```
@z

@x
</div>
@y
</div>
@z

@x
<div id="tab-stopcontainers-python" class="tab-pane fade" markdown="1">
@y
<div id="tab-stopcontainers-python" class="tab-pane fade" markdown="1">
@z

@x
```python
import docker
client = docker.from_env()
for container in client.containers.list():
  container.stop()
```
@y
```python
import docker
client = docker.from_env()
for container in client.containers.list():
  container.stop()
```
@z

@x
</div>
@y
</div>
@z

@x
<div id="tab-stopcontainers-curl" class="tab-pane fade" markdown="1">
@y
<div id="tab-stopcontainers-curl" class="tab-pane fade" markdown="1">
@z

@x
```bash
$ curl --unix-socket /var/run/docker.sock http:/v1.24/containers/json
[{
  "Id":"ae63e8b89a26f01f6b4b2c9a7817c31a1b6196acf560f66586fbc8809ffcd772",
  "Names":["/tender_wing"],
  "Image":"bfirsh/reticulate-splines",
  ...
}]
@y
```bash
$ curl --unix-socket /var/run/docker.sock http:/v1.24/containers/json
[{
  "Id":"ae63e8b89a26f01f6b4b2c9a7817c31a1b6196acf560f66586fbc8809ffcd772",
  "Names":["/tender_wing"],
  "Image":"bfirsh/reticulate-splines",
  ...
}]
@z

@x
$ curl --unix-socket /var/run/docker.sock \
  -X POST http:/v1.24/containers/ae63e8b89a26/stop
```
@y
$ curl --unix-socket /var/run/docker.sock \
  -X POST http:/v1.24/containers/ae63e8b89a26/stop
```
@z

@x
</div>
</div><!-- end tab-content -->
@y
</div>
</div><!-- end tab-content -->
@z

@x
## Print the logs of a specific container
@y
{% comment %}
## Print the logs of a specific container
{% endcomment %}
{: #print-the-logs-of-a-specific-container }
## 指定コンテナーのログ出力
@z

@x
You can also perform actions on individual containers. This example prints the
logs of a container given its ID. You need to modify the code before running it
to change the hard-coded ID of the container to print the logs for.
@y
{% comment %}
You can also perform actions on individual containers. This example prints the
logs of a container given its ID. You need to modify the code before running it
to change the hard-coded ID of the container to print the logs for.
{% endcomment %}
個別のコンテナーに対しても操作することができます。
以下の例では、指定された ID を持つコンテナーのログを出力します。
以下のコードを実行するにあたっては、コード内にハードコーディングされている ID を、ログ出力したいコンテナーの ID に置き換えてから実行してください。
@z

@x
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" data-target="#tab-containerlogs-go" data-group="go">Go</a></li>
  <li><a data-toggle="tab" data-target="#tab-containerlogs-python" data-group="python">Python</a></li>
  <li><a data-toggle="tab" data-target="#tab-containerlogs-curl" data-group="curl">HTTP</a></li>
</ul>
@y
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" data-target="#tab-containerlogs-go" data-group="go">Go</a></li>
  <li><a data-toggle="tab" data-target="#tab-containerlogs-python" data-group="python">Python</a></li>
  <li><a data-toggle="tab" data-target="#tab-containerlogs-curl" data-group="curl">HTTP</a></li>
</ul>
@z

@x
<div class="tab-content">
@y
<div class="tab-content">
@z

@x
<div id="tab-containerlogs-go" class="tab-pane fade in active" markdown="1">
@y
<div id="tab-containerlogs-go" class="tab-pane fade in active" markdown="1">
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
	"github.com/docker/docker/client"
)
@y
	"github.com/docker/docker/api/types"
	"github.com/docker/docker/client"
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
	options := types.ContainerLogsOptions{ShowStdout: true}
	// Replace this ID with a container that really exists
	out, err := cli.ContainerLogs(ctx, "f1064a8a4c82", options)
	if err != nil {
		panic(err)
	}
@y
	options := types.ContainerLogsOptions{ShowStdout: true}
	// Replace this ID with a container that really exists
	out, err := cli.ContainerLogs(ctx, "f1064a8a4c82", options)
	if err != nil {
		panic(err)
	}
@z

@x
	io.Copy(os.Stdout, out)
}
```
@y
	io.Copy(os.Stdout, out)
}
```
@z

@x
</div>
@y
</div>
@z

@x
<div id="tab-containerlogs-python" class="tab-pane fade" markdown="1">
@y
<div id="tab-containerlogs-python" class="tab-pane fade" markdown="1">
@z

@x
```python
import docker
client = docker.from_env()
container = client.containers.get('f1064a8a4c82')
print container.logs()
```
@y
```python
import docker
client = docker.from_env()
container = client.containers.get('f1064a8a4c82')
print container.logs()
```
@z

@x
</div>
@y
</div>
@z

@x
<div id="tab-containerlogs-curl" class="tab-pane fade" markdown="1">
@y
<div id="tab-containerlogs-curl" class="tab-pane fade" markdown="1">
@z

@x
```bash
$ curl --unix-socket /var/run/docker.sock "http:/v1.24/containers/ca5f55cdb/logs?stdout=1"
Reticulating spline 1...
Reticulating spline 2...
Reticulating spline 3...
Reticulating spline 4...
Reticulating spline 5...
```
</div>
</div><!-- end tab-content -->
@y
```bash
$ curl --unix-socket /var/run/docker.sock "http:/v1.24/containers/ca5f55cdb/logs?stdout=1"
Reticulating spline 1...
Reticulating spline 2...
Reticulating spline 3...
Reticulating spline 4...
Reticulating spline 5...
```
</div>
</div><!-- end tab-content -->
@z

@x
## List all images
@y
{% comment %}
## List all images
{% endcomment %}
{: #list-all-images }
## イメージの全一覧
@z

@x
List the images on your Engine, similar to `docker image ls`:
@y
{% comment %}
List the images on your Engine, similar to `docker image ls`:
{% endcomment %}
Engine 上のイメージ一覧を取得します。
これは `docker image ls` に相当するものです。
@z

@x
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" data-target="#tab-listimages-go" data-group="go">Go</a></li>
  <li><a data-toggle="tab" data-target="#tab-listimages-python" data-group="python">Python</a></li>
  <li><a data-toggle="tab" data-target="#tab-listimages-curl" data-group="curl">HTTP</a></li>
</ul>
@y
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" data-target="#tab-listimages-go" data-group="go">Go</a></li>
  <li><a data-toggle="tab" data-target="#tab-listimages-python" data-group="python">Python</a></li>
  <li><a data-toggle="tab" data-target="#tab-listimages-curl" data-group="curl">HTTP</a></li>
</ul>
@z

@x
<div class="tab-content">
@y
<div class="tab-content">
@z

@x
<div id="tab-listimages-go" class="tab-pane fade in active" markdown="1">
@y
<div id="tab-listimages-go" class="tab-pane fade in active" markdown="1">
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
	"fmt"
@y
import (
	"context"
	"fmt"
@z

@x
	"github.com/docker/docker/api/types"
	"github.com/docker/docker/client"
)
@y
	"github.com/docker/docker/api/types"
	"github.com/docker/docker/client"
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
	images, err := cli.ImageList(ctx, types.ImageListOptions{})
	if err != nil {
		panic(err)
	}
@y
	images, err := cli.ImageList(ctx, types.ImageListOptions{})
	if err != nil {
		panic(err)
	}
@z

@x
	for _, image := range images {
		fmt.Println(image.ID)
	}
}
```
@y
	for _, image := range images {
		fmt.Println(image.ID)
	}
}
```
@z

@x
</div>
@y
</div>
@z

@x
<div id="tab-listimages-python" class="tab-pane fade" markdown="1">
@y
<div id="tab-listimages-python" class="tab-pane fade" markdown="1">
@z

@x
```python
import docker
client = docker.from_env()
for image in client.images.list():
  print image.id
```
@y
```python
import docker
client = docker.from_env()
for image in client.images.list():
  print image.id
```
@z

@x
</div>
@y
</div>
@z

@x
<div id="tab-listimages-curl" class="tab-pane fade" markdown="1">
@y
<div id="tab-listimages-curl" class="tab-pane fade" markdown="1">
@z

@x
```bash
$ curl --unix-socket /var/run/docker.sock http:/v1.24/images/json
[{
  "Id":"sha256:31d9a31e1dd803470c5a151b8919ef1988ac3efd44281ac59d43ad623f275dcd",
  "ParentId":"sha256:ee4603260daafe1a8c2f3b78fd760922918ab2441cbb2853ed5c439e59c52f96",
  ...
}]
```
@y
```bash
$ curl --unix-socket /var/run/docker.sock http:/v1.24/images/json
[{
  "Id":"sha256:31d9a31e1dd803470c5a151b8919ef1988ac3efd44281ac59d43ad623f275dcd",
  "ParentId":"sha256:ee4603260daafe1a8c2f3b78fd760922918ab2441cbb2853ed5c439e59c52f96",
  ...
}]
```
@z

@x
</div>
</div><!-- end tab-content -->
@y
</div>
</div><!-- end tab-content -->
@z

@x
## Pull an image
@y
{% comment %}
## Pull an image
{% endcomment %}
{: #pull-an-image }
## イメージのプル
@z

@x
Pull an image, like `docker pull`:
@y
{% comment %}
Pull an image, like `docker pull`:
{% endcomment %}
`docker pull` のようにイメージをプルします。
@z

@x
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" data-target="#tab-pullimages-go" data-group="go">Go</a></li>
  <li><a data-toggle="tab" data-target="#tab-pullimages-python" data-group="python">Python</a></li>
  <li><a data-toggle="tab" data-target="#tab-pullimages-curl" data-group="curl">HTTP</a></li>
</ul>
@y
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" data-target="#tab-pullimages-go" data-group="go">Go</a></li>
  <li><a data-toggle="tab" data-target="#tab-pullimages-python" data-group="python">Python</a></li>
  <li><a data-toggle="tab" data-target="#tab-pullimages-curl" data-group="curl">HTTP</a></li>
</ul>
@z

@x
<div class="tab-content">
@y
<div class="tab-content">
@z

@x
<div id="tab-pullimages-go" class="tab-pane fade in active" markdown="1">
@y
<div id="tab-pullimages-go" class="tab-pane fade in active" markdown="1">
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
	"github.com/docker/docker/client"
)
@y
	"github.com/docker/docker/api/types"
	"github.com/docker/docker/client"
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
	out, err := cli.ImagePull(ctx, "alpine", types.ImagePullOptions{})
	if err != nil {
		panic(err)
	}
@y
	out, err := cli.ImagePull(ctx, "alpine", types.ImagePullOptions{})
	if err != nil {
		panic(err)
	}
@z

@x
	defer out.Close()
@y
	defer out.Close()
@z

@x
	io.Copy(os.Stdout, out)
}
```
@y
	io.Copy(os.Stdout, out)
}
```
@z

@x
</div>
@y
</div>
@z

@x
<div id="tab-pullimages-python" class="tab-pane fade" markdown="1">
@y
<div id="tab-pullimages-python" class="tab-pane fade" markdown="1">
@z

@x
```python
import docker
client = docker.from_env()
image = client.images.pull("alpine")
print image.id
```
@y
```python
import docker
client = docker.from_env()
image = client.images.pull("alpine")
print image.id
```
@z

@x
</div>
<div id="tab-pullimages-curl" class="tab-pane fade" markdown="1">
@y
</div>
<div id="tab-pullimages-curl" class="tab-pane fade" markdown="1">
@z

@x
```bash
$ curl --unix-socket /var/run/docker.sock \
  -X POST "http:/v1.24/images/create?fromImage=alpine"
{"status":"Pulling from library/alpine","id":"3.1"}
{"status":"Pulling fs layer","progressDetail":{},"id":"8f13703509f7"}
{"status":"Downloading","progressDetail":{"current":32768,"total":2244027},"progress":"[\u003e                                                  ] 32.77 kB/2.244 MB","id":"8f13703509f7"}
...
```
@y
```bash
$ curl --unix-socket /var/run/docker.sock \
  -X POST "http:/v1.24/images/create?fromImage=alpine"
{"status":"Pulling from library/alpine","id":"3.1"}
{"status":"Pulling fs layer","progressDetail":{},"id":"8f13703509f7"}
{"status":"Downloading","progressDetail":{"current":32768,"total":2244027},"progress":"[\u003e                                                  ] 32.77 kB/2.244 MB","id":"8f13703509f7"}
...
```
@z

@x
</div>
</div> <!-- end tab-content -->
@y
</div>
</div> <!-- end tab-content -->
@z

@x
## Pull an image with authentication
@y
{% comment %}
## Pull an image with authentication
{% endcomment %}
{: #pull-an-image-with-authentication }
## 認証をともなうイメージのプル
@z

@x
Pull an image, like `docker pull`, with authentication:
@y
{% comment %}
Pull an image, like `docker pull`, with authentication:
{% endcomment %}
`docker pull` と同じイメージのプルを、認証処理を含めて行います。
@z

@x
> **Note**: Credentials are sent in the clear. Docker's official registries use
> HTTPS. Private registries should also be configured to use HTTPS.
@y
{% comment %}
> **Note**: Credentials are sent in the clear. Docker's official registries use
> HTTPS. Private registries should also be configured to use HTTPS.
{% endcomment %}
> **メモ**: 資格情報は平文で送信されます。
> Docker の公式レジストリでは HTTPS が用いられています。
> プライベートなレジストリも HTTPS を利用するように設定されるべきものです。
@z

@x
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" data-target="#tab-pullimages-auth-go" data-group="go">Go</a></li>
  <li><a data-toggle="tab" data-target="#tab-pullimages-auth-python" data-group="python">Python</a></li>
  <li><a data-toggle="tab" data-target="#tab-pullimages-auth-curl" data-group="curl">HTTP</a></li>
</ul>
@y
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" data-target="#tab-pullimages-auth-go" data-group="go">Go</a></li>
  <li><a data-toggle="tab" data-target="#tab-pullimages-auth-python" data-group="python">Python</a></li>
  <li><a data-toggle="tab" data-target="#tab-pullimages-auth-curl" data-group="curl">HTTP</a></li>
</ul>
@z

@x
<div class="tab-content">
@y
<div class="tab-content">
@z

@x
<div id="tab-pullimages-auth-go" class="tab-pane fade in active" markdown="1">
@y
<div id="tab-pullimages-auth-go" class="tab-pane fade in active" markdown="1">
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
	"encoding/base64"
	"encoding/json"
	"io"
	"os"
@y
import (
	"context"
	"encoding/base64"
	"encoding/json"
	"io"
	"os"
@z

@x
	"github.com/docker/docker/api/types"
	"github.com/docker/docker/client"
)
@y
	"github.com/docker/docker/api/types"
	"github.com/docker/docker/client"
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
	authConfig := types.AuthConfig{
		Username: "username",
		Password: "password",
	}
	encodedJSON, err := json.Marshal(authConfig)
	if err != nil {
		panic(err)
	}
	authStr := base64.URLEncoding.EncodeToString(encodedJSON)
@y
	authConfig := types.AuthConfig{
		Username: "username",
		Password: "password",
	}
	encodedJSON, err := json.Marshal(authConfig)
	if err != nil {
		panic(err)
	}
	authStr := base64.URLEncoding.EncodeToString(encodedJSON)
@z

@x
	out, err := cli.ImagePull(ctx, "alpine", types.ImagePullOptions{RegistryAuth: authStr})
	if err != nil {
		panic(err)
	}
@y
	out, err := cli.ImagePull(ctx, "alpine", types.ImagePullOptions{RegistryAuth: authStr})
	if err != nil {
		panic(err)
	}
@z

@x
	defer out.Close()
	io.Copy(os.Stdout, out)
}
```
@y
	defer out.Close()
	io.Copy(os.Stdout, out)
}
```
@z

@x
</div>
@y
</div>
@z

@x
<div id="tab-pullimages-auth-python" class="tab-pane fade" markdown="1">
@y
<div id="tab-pullimages-auth-python" class="tab-pane fade" markdown="1">
@z

@x
The Python SDK retrieves authentication information from the [credentials
store](/engine/reference/commandline/login/#credentials-store) file and
integrates with [credential
helpers](https://github.com/docker/docker-credential-helpers){: target="_blank"
class="_" }. It is possible to override these credentials, but that is out of
scope for this Getting Started guide. After using `docker login`, the Python SDK
uses these credentials automatically.
@y
{% comment %}
The Python SDK retrieves authentication information from the [credentials
store](/engine/reference/commandline/login/#credentials-store) file and
integrates with [credential
helpers](https://github.com/docker/docker-credential-helpers){: target="_blank"
class="_" }. It is possible to override these credentials, but that is out of
scope for this Getting Started guide. After using `docker login`, the Python SDK
uses these credentials automatically.
{% endcomment %}
Python SDK では、認証情報を [認証情報ストア](/engine/reference/commandline/login/#credentials-store) ファイルから抽出し、[認証情報ヘルパー](https://github.com/docker/docker-credential-helpers){: target="_blank" class="_" } を利用して統合します。
認証情報をオーバーライドすることは可能ですが、そのような処理はここに示す利用ガイドの説明範囲を超えます。
ここでは `docker login` を実行した後に、Python SDK により自動的にその認証情報を利用します。
@z

@x
```python
import docker
client = docker.from_env()
image = client.images.pull("alpine")
print image.id
```
@y
```python
import docker
client = docker.from_env()
image = client.images.pull("alpine")
print image.id
```
@z

@x
</div>
@y
</div>
@z

@x
<div id="tab-pullimages-auth-curl" class="tab-pane fade" markdown="1">
@y
<div id="tab-pullimages-auth-curl" class="tab-pane fade" markdown="1">
@z

@x
This example leaves the credentials in your shell's history, so consider
this a naive implementation. The credentials are passed as a Base-64-encoded
JSON structure.
@y
{% comment %}
This example leaves the credentials in your shell's history, so consider
this a naive implementation. The credentials are passed as a Base-64-encoded
JSON structure.
{% endcomment %}
この例において、資格情報はシェルの履歴に残ります。
したがって、内部での実装としてとどめるようにしてください。
資格情報は、Base-64-encoded の JSON 構造として送信されます。
@z

@x
```bash
$ JSON=$(echo '{"username": "string", "password": "string", "serveraddress": "string"}' | base64)
@y
```bash
$ JSON=$(echo '{"username": "string", "password": "string", "serveraddress": "string"}' | base64)
@z

@x
$ curl --unix-socket /var/run/docker.sock \
  -H "Content-Type: application/tar"
  -X POST "http:/v1.24/images/create?fromImage=alpine"
  -H "X-Registry-Auth"
  -d "$JSON"
{"status":"Pulling from library/alpine","id":"3.1"}
{"status":"Pulling fs layer","progressDetail":{},"id":"8f13703509f7"}
{"status":"Downloading","progressDetail":{"current":32768,"total":2244027},"progress":"[\u003e                                                  ] 32.77 kB/2.244 MB","id":"8f13703509f7"}
...
```
@y
$ curl --unix-socket /var/run/docker.sock \
  -H "Content-Type: application/tar"
  -X POST "http:/v1.24/images/create?fromImage=alpine"
  -H "X-Registry-Auth"
  -d "$JSON"
{"status":"Pulling from library/alpine","id":"3.1"}
{"status":"Pulling fs layer","progressDetail":{},"id":"8f13703509f7"}
{"status":"Downloading","progressDetail":{"current":32768,"total":2244027},"progress":"[\u003e                                                  ] 32.77 kB/2.244 MB","id":"8f13703509f7"}
...
```
@z

@x
</div>
</div> <!-- end tab-content -->
@y
</div>
</div> <!-- end tab-content -->
@z

@x
## Commit a container
@y
{% comment %}
## Commit a container
{% endcomment %}
{: #commit-a-container }
## コンテナーのコミット
@z

@x
Commit a container to create an image from its contents:
@y
{% comment %}
Commit a container to create an image from its contents:
{% endcomment %}
コンテナーをコミットして、その内容からイメージを生成します。
@z

@x
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" data-target="#tab-commit-go" data-group="go">Go</a></li>
  <li><a data-toggle="tab" data-target="#tab-commit-python" data-group="python">Python</a></li>
  <li><a data-toggle="tab" data-target="#tab-commit-curl" data-group="curl">HTTP</a></li>
</ul>
@y
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" data-target="#tab-commit-go" data-group="go">Go</a></li>
  <li><a data-toggle="tab" data-target="#tab-commit-python" data-group="python">Python</a></li>
  <li><a data-toggle="tab" data-target="#tab-commit-curl" data-group="curl">HTTP</a></li>
</ul>
@z

@x
<div class="tab-content">
@y
<div class="tab-content">
@z

@x
<div id="tab-commit-go" class="tab-pane fade in active" markdown="1">
@y
<div id="tab-commit-go" class="tab-pane fade in active" markdown="1">
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
	"fmt"
@y
import (
	"context"
	"fmt"
@z

@x
	"github.com/docker/docker/api/types"
	"github.com/docker/docker/api/types/container"
	"github.com/docker/docker/client"
)
@y
	"github.com/docker/docker/api/types"
	"github.com/docker/docker/api/types/container"
	"github.com/docker/docker/client"
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
	createResp, err := cli.ContainerCreate(ctx, &container.Config{
		Image: "alpine",
		Cmd:   []string{"touch", "/helloworld"},
	}, nil, nil, "")
	if err != nil {
		panic(err)
	}
@y
	createResp, err := cli.ContainerCreate(ctx, &container.Config{
		Image: "alpine",
		Cmd:   []string{"touch", "/helloworld"},
	}, nil, nil, "")
	if err != nil {
		panic(err)
	}
@z

@x
	if err := cli.ContainerStart(ctx, createResp.ID, types.ContainerStartOptions{}); err != nil {
		panic(err)
	}
@y
	if err := cli.ContainerStart(ctx, createResp.ID, types.ContainerStartOptions{}); err != nil {
		panic(err)
	}
@z

@x
	statusCh, errCh := cli.ContainerWait(ctx, createResp.ID, container.WaitConditionNotRunning)
	select {
	case err := <-errCh:
		if err != nil {
			panic(err)
		}
	case <-statusCh:
	}
@y
	statusCh, errCh := cli.ContainerWait(ctx, createResp.ID, container.WaitConditionNotRunning)
	select {
	case err := <-errCh:
		if err != nil {
			panic(err)
		}
	case <-statusCh:
	}
@z

@x
	commitResp, err := cli.ContainerCommit(ctx, createResp.ID, types.ContainerCommitOptions{Reference: "helloworld"})
	if err != nil {
		panic(err)
	}
@y
	commitResp, err := cli.ContainerCommit(ctx, createResp.ID, types.ContainerCommitOptions{Reference: "helloworld"})
	if err != nil {
		panic(err)
	}
@z

@x
	fmt.Println(commitResp.ID)
}
```
@y
	fmt.Println(commitResp.ID)
}
```
@z

@x
</div>
@y
</div>
@z

@x
<div id="tab-commit-python" class="tab-pane fade" markdown="1">
@y
<div id="tab-commit-python" class="tab-pane fade" markdown="1">
@z

@x
```python
import docker
client = docker.from_env()
container = client.containers.run("alpine", ["touch", "/helloworld"], detach=True)
container.wait()
image = container.commit("helloworld")
print image.id
```
@y
```python
import docker
client = docker.from_env()
container = client.containers.run("alpine", ["touch", "/helloworld"], detach=True)
container.wait()
image = container.commit("helloworld")
print image.id
```
@z

@x
</div>
<div id="tab-commit-curl" class="tab-pane fade" markdown="1">
@y
</div>
<div id="tab-commit-curl" class="tab-pane fade" markdown="1">
@z

@x
```bash
$ docker run -d alpine touch /helloworld
0888269a9d584f0fa8fc96b3c0d8d57969ceea3a64acf47cd34eebb4744dbc52
$ curl --unix-socket /var/run/docker.sock\
  -X POST "http:/v1.24/commit?container=0888269a9d&repo=helloworld"
{"Id":"sha256:6c86a5cd4b87f2771648ce619e319f3e508394b5bfc2cdbd2d60f59d52acda6c"}
```
@y
```bash
$ docker run -d alpine touch /helloworld
0888269a9d584f0fa8fc96b3c0d8d57969ceea3a64acf47cd34eebb4744dbc52
$ curl --unix-socket /var/run/docker.sock\
  -X POST "http:/v1.24/commit?container=0888269a9d&repo=helloworld"
{"Id":"sha256:6c86a5cd4b87f2771648ce619e319f3e508394b5bfc2cdbd2d60f59d52acda6c"}
```
@z

@x
</div>
</div><!-- end tab-content -->
@y
</div>
</div><!-- end tab-content -->
@z
