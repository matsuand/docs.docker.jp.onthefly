%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Swarm task states
description: Learn about tasks that are scheduled on your swarm.
keywords: swarm, task, service
redirect_from:
- /datacenter/ucp/2.2/guides/admin/monitor-and-troubleshoot/troubleshoot-task-state/
---
@y
---
title: Swarm タスクの状態
description: Learn about tasks that are scheduled on your swarm.
keywords: swarm, task, service
redirect_from:
- /datacenter/ucp/2.2/guides/admin/monitor-and-troubleshoot/troubleshoot-task-state/
---
@z

@x
Docker lets you create services, which can start tasks. A service is a
description of a desired state, and a task does the work. Work is scheduled on
swarm nodes in this sequence:
@y
Docker ではサービスの生成を行いますが、そこではタスクが起動されます。
サービスは期待される状態が記述されたものであり、タスクがそれを実行します。
Swarm ノードにおいては以下の順に動作がスケジュールされます。
@z

@x
1.  Create a service by using `docker service create`.
2.  The request goes to a Docker manager node.
3.  The Docker manager node schedules the service to run on particular nodes.
4.  Each service can start multiple tasks.
5.  Each task has a life cycle, with states like `NEW`, `PENDING`, and `COMPLETE`.
@y
1.  `docker service create`を使ってサービスを生成します。
2.  上の要求が Docker マネージャーノードに届きます。
3.  Docker マネージャーノードは、特定ノード上にて実行するサービスをスケジューリングします。
4.  各サービスは複数のタスクを起動します。
5.  各タスクにはライフサイクルがあり、`NEW`、`PENDING`、`COMPLETE`といった状態があります。
@z

@x
Tasks are execution units that run once to completion. When a task stops, it
isn't executed again, but a new task may take its place.
@y
タスクとは、一度実行されてから完了するまでの実行単位のことです。
タスクが停止すると、再度実行されることはありません。
別の新たなタスクにとって代わるかもしれません。
@z

@x
Tasks advance through a number of states until they complete or fail. Tasks are
initialized in the `NEW` state. The task progresses forward through a number of
states, and its state doesn't go backward. For example, a task never goes from
`COMPLETE` to `RUNNING`.
@y
タスクは完了か失敗という結果に至るまでに、数種類の状態を経ていきます。
タスクは`NEW`という初期化状態から始まります。
タスクが数種類の状態を経るのは、常に次の状態へ向けて前進していくものであって、状態が戻るようなことはありません。
たとえばタスクが`COMPLETE`から`RUNNING`になることはありません。
@z

@x
Tasks go through the states in the following order:
@y
タスクは以下に示す順に、状態を変化させていきます。
@z

@x
| Task state  | Description                                                                                                 |
| ----------- | ----------------------------------------------------------------------------------------------------------- |
| `NEW`       | The task was initialized.                                                                                   |
| `PENDING`   | Resources for the task were allocated.                                                                      |
| `ASSIGNED`  | Docker assigned the task to nodes.                                                                          |
| `ACCEPTED`  | The task was accepted by a worker node. If a worker node rejects the task, the state changes to `REJECTED`. |
| `PREPARING` | Docker is preparing the task.                                                                               |
| `STARTING`  | Docker is starting the task.                                                                                |
| `RUNNING`   | The task is executing.                                                                                      |
| `COMPLETE`  | The task exited without an error code.                                                                      |
| `FAILED`    | The task exited with an error code.                                                                         |
| `SHUTDOWN`  | Docker requested the task to shut down.                                                                     |
| `REJECTED`  | The worker node rejected the task.                                                                          |
| `ORPHANED`  | The node was down for too long.                                                                             |
| `REMOVE`    | The task is not terminal but the associated service was removed or scaled down.                             |
@y
| タスクの状態 | 日本語訳 | 内容説明                                                                                                            |
| ------------ | ------------------------------------------------------------------------------------------------------------------------------ |
| `NEW`        | 初期化   | タスクが初期化されました。                                                                                          |
| `PENDING`    | 保留     | タスクに対するリソースが割り当てられました。                                                                        |
| `ASSIGNED`   | 割当済   | Docker がタスクをノードに割り当てました。                                                                           |
| `ACCEPTED`   | 受付済   | タスクがワーカーノードによって受けつけられました。<br/>ワーカーノードがタスクを拒否すると、状態は`REJECTED`に変わります。|
| `PREPARING`  | 準備中   | Docker がタスクを準備しています。                                                                                   |
| `STARTING`   | 起動中   | Docker がタスクを起動しています。                                                                                   |
| `RUNNING`    | 実行中   | タスクが実行中です。                                                                                                |
| `COMPLETE`   | 完了     | タスクがエラーコードなしに終了しました。                                                                            |
| `FAILED`     | 失敗     | タスクがエラーコードをともなって終了しました。                                                                      |
| `SHUTDOWN`   | 停止     | Docker がタスクに対してシャットダウンを要求しました。                                                               |
| `REJECTED`   | 拒否     | ワーカーノードがタスクを拒否しました。                                                                              |
| `ORPHANED`   | 孤立     | ノードが長期間停止しています。                                                                                      |
| `REMOVE`     | 削除     | タスクは終了していないが、関連サービスは削除またはスケールダウンしている。                                          |
@z

@x
## View task state
@y
{: #view-task-state }
## タスク状態の確認
@z

@x
Run `docker service ps <service-name>` to get the state of a task. The
`CURRENT STATE` field shows the task's state and how long it's been
there.
@y
`docker service ps <サービス名>`を実行して、タスク状態を確認することができます。
`CURRENT STATE`（現在の状態）カラムは、そのタスクの状態およびどれだけ存在しているかを示しています。
@z

@x
```console
$ docker service ps webserver
ID             NAME              IMAGE    NODE        DESIRED STATE  CURRENT STATE            ERROR                              PORTS
owsz0yp6z375   webserver.1       nginx    UbuntuVM    Running        Running 44 seconds ago
j91iahr8s74p    \_ webserver.1   nginx    UbuntuVM    Shutdown       Failed 50 seconds ago    "No such container: webserver.…"
7dyaszg13mw2    \_ webserver.1   nginx    UbuntuVM    Shutdown       Failed 5 hours ago       "No such container: webserver.…"
```
@y
```console
$ docker service ps webserver
ID             NAME              IMAGE    NODE        DESIRED STATE  CURRENT STATE            ERROR                              PORTS
owsz0yp6z375   webserver.1       nginx    UbuntuVM    Running        Running 44 seconds ago
j91iahr8s74p    \_ webserver.1   nginx    UbuntuVM    Shutdown       Failed 50 seconds ago    "No such container: webserver.…"
7dyaszg13mw2    \_ webserver.1   nginx    UbuntuVM    Shutdown       Failed 5 hours ago       "No such container: webserver.…"
```
@z

@x
## Where to go next
@y
{: #where-to-go-next }
## 次に読むものは
@z

@x
- [Learn about swarm tasks](https://github.com/docker/swarmkit/blob/master/design/task_model.md)
@y
- [Swarm タスクについて学ぶ](https://github.com/docker/swarmkit/blob/master/design/task_model.md)
@z
