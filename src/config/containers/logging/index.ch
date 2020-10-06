%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: How to write to and view a container's logs
keywords: docker, logging
title: View logs for a container or service
redirect_from:
- /engine/admin/logging/
- /engine/admin/logging/view_container_logs/
---
@y
---
description: How to write to and view a container's logs
keywords: docker, logging
title: コンテナーまたはサービスのログ確認
redirect_from:
- /engine/admin/logging/
- /engine/admin/logging/view_container_logs/
---
@z

@x
The `docker logs` command shows information logged by a running container. The
`docker service logs` command shows information logged by all containers
participating in a service. The information that is logged and the format of the
log depends almost entirely on the container's endpoint command.
@y
{% comment %}
The `docker logs` command shows information logged by a running container. The
`docker service logs` command shows information logged by all containers
participating in a service. The information that is logged and the format of the
log depends almost entirely on the container's endpoint command.
{% endcomment %}
`docker logs` は実行中のコンテナーが出力するログ情報を確認するコマンドです。
`docker service logs` コマンドは、1 つのサービスに参加しているコンテナーすべてのログ情報を確認します。
出力されるログ情報およびその出力書式は、ほぼコンテナーのエンドポイントコマンドにより定まります。
@z

@x
By default, `docker logs` or `docker service logs` shows the command's output
just as it would appear if you ran the command interactively in a terminal. UNIX
and Linux commands typically open three I/O streams when they run, called
`STDIN`, `STDOUT`, and `STDERR`. `STDIN` is the command's input stream, which
may include input from the keyboard or input from another command. `STDOUT` is
usually a command's normal output, and `STDERR` is typically used to output
error messages. By default, `docker logs` shows the command's `STDOUT` and
`STDERR`. To read more about I/O and Linux, see the
[Linux Documentation Project article on I/O redirection](http://www.tldp.org/LDP/abs/html/io-redirection.html).
@y
{% comment %}
By default, `docker logs` or `docker service logs` shows the command's output
just as it would appear if you ran the command interactively in a terminal. UNIX
and Linux commands typically open three I/O streams when they run, called
`STDIN`, `STDOUT`, and `STDERR`. `STDIN` is the command's input stream, which
may include input from the keyboard or input from another command. `STDOUT` is
usually a command's normal output, and `STDERR` is typically used to output
error messages. By default, `docker logs` shows the command's `STDOUT` and
`STDERR`. To read more about I/O and Linux, see the
[Linux Documentation Project article on I/O redirection](http://www.tldp.org/LDP/abs/html/io-redirection.html).
{% endcomment %}
デフォルトにおいて `docker logs` や `docker service logs` は、端末画面にて対話的にコマンドを入力した際、そのコマンドが出力するものと同じような情報を得ることができます。
UNIX や Linux コマンドは普通、3 つの I/O ストリームを実行時に開きます。
それは `STDIN`、`STDOUT`、`STDERR` です。
`STDIN` はコマンドの入力ストリームです。
これはキーボードから入力されるか、あるいは他のコマンドからの入力の場合もあります。
`STDOUT` はコマンドの標準出力です。
そして `STDERR` は通常、エラーメッセージを出力するために用いられます。
デフォルトで `docker logs` は、コマンドの `STDOUT` と `STDERR` を表示します。
I/O と Linux に関しての詳細は [Linux Documentation Project における I/O リダイレクション](http://www.tldp.org/LDP/abs/html/io-redirection.html) を参照してください。
@z

@x
In some cases, `docker logs` may not show useful information unless you take
additional steps.
@y
{% comment %}
In some cases, `docker logs` may not show useful information unless you take
additional steps.
{% endcomment %}
`docker logs` の出力だけでは不十分なことがあります。
その場合は別の手順が必要になります。
@z

@x
- If you use a [logging driver](configure.md) which sends logs to a file, an
  external host, a database, or another logging back-end, `docker logs` may not
  show useful information.
@y
{% comment %}
- If you use a [logging driver](configure.md) which sends logs to a file, an
  external host, a database, or another logging back-end, `docker logs` may not
  show useful information.
{% endcomment %}
- [ログドライバー](configure.md) を利用するにあたって、そのドライバーのログ出力先が、ファイル、外部ホスト、データベース、別のログバックエンドである場合、`docker logs` の出力は不十分である場合があります。
  show useful information.
@z

@x
- If your image runs a non-interactive process such as a web server or a
  database, that application may send its output to log files instead of `STDOUT`
  and `STDERR`.
@y
{% comment %}
- If your image runs a non-interactive process such as a web server or a
  database, that application may send its output to log files instead of `STDOUT`
  and `STDERR`.
{% endcomment %}
- 実行するイメージが、ウェブサーバーやデータベースのような非対話的なプロセスである場合、ログは `STDOUT`
  や `STDERR` にではなく、ログファイルに対して出力されるかもしれません。
@z

@x
In the first case, your logs are processed in other ways and you may choose not
to use `docker logs`. In the second case, the official `nginx` image shows one
workaround, and the official Apache `httpd` image shows another.
@y
{% comment %}
In the first case, your logs are processed in other ways and you may choose not
to use `docker logs`. In the second case, the official `nginx` image shows one
workaround, and the official Apache `httpd` image shows another.
{% endcomment %}
上の 1 点めに該当する場合、ログ出力が他の方法で処理されているため、`docker logs` は利用しないようにすることが考えられます。
2 点めの場合、`nginx` の公式イメージではその解決がなされていて、公式の Apache イメージ `httpd` では、また別の解決方法をとっています。
@z

@x
The official `nginx` image creates a symbolic link from `/var/log/nginx/access.log`
to `/dev/stdout`, and creates another symbolic link
from `/var/log/nginx/error.log` to `/dev/stderr`, overwriting the log files and
causing logs to be sent to the relevant special device instead. See the
[Dockerfile](https://github.com/nginxinc/docker-nginx/blob/8921999083def7ba43a06fabd5f80e4406651353/mainline/jessie/Dockerfile#L21-L23).
@y
{% comment %}
The official `nginx` image creates a symbolic link from `/var/log/nginx/access.log`
to `/dev/stdout`, and creates another symbolic link
from `/var/log/nginx/error.log` to `/dev/stderr`, overwriting the log files and
causing logs to be sent to the relevant special device instead. See the
[Dockerfile](https://github.com/nginxinc/docker-nginx/blob/8921999083def7ba43a06fabd5f80e4406651353/mainline/jessie/Dockerfile#L21-L23).
{% endcomment %}
`nginx` の公式イメージでは、`/var/log/nginx/access.log` から `/dev/stdout` へのシンボリックリンクを生成しています。
同じく `/var/log/nginx/error.log` は `/dev/stderr` へのリンクとしています。
ログファイルをこのように設定し、ログ内容に合わせた特別デバイスへの出力を行っています。
詳しくは [Dockerfile](https://github.com/nginxinc/docker-nginx/blob/8921999083def7ba43a06fabd5f80e4406651353/mainline/jessie/Dockerfile#L21-L23) を参照してください。
@z

@x
The official `httpd` driver changes the `httpd` application's configuration to
write its normal output directly to `/proc/self/fd/1` (which is `STDOUT`) and
its errors to `/proc/self/fd/2` (which is `STDERR`). See the
[Dockerfile](https://github.com/docker-library/httpd/blob/b13054c7de5c74bbaa6d595dbe38969e6d4f860c/2.2/Dockerfile#L72-L75).
@y
{% comment %}
The official `httpd` driver changes the `httpd` application's configuration to
write its normal output directly to `/proc/self/fd/1` (which is `STDOUT`) and
its errors to `/proc/self/fd/2` (which is `STDERR`). See the
[Dockerfile](https://github.com/docker-library/httpd/blob/b13054c7de5c74bbaa6d595dbe38969e6d4f860c/2.2/Dockerfile#L72-L75).
{% endcomment %}
公式イメージ `httpd` では、`httpd` アプリケーション設定を変更して、標準出力を直接 `/proc/self/fd/1` (すなわち `STDOUT`) に、またエラーを `/proc/self/fd/2` (すなわち `STDERR`) にそれぞれ出力するようにしています。
詳しくは [Dockerfile](https://github.com/docker-library/httpd/blob/b13054c7de5c74bbaa6d595dbe38969e6d4f860c/2.2/Dockerfile#L72-L75) を参照してください。
@z

@x
## Next steps
@y
{% comment %}
## Next steps
{% endcomment %}
{: #next-steps }
## 次のステップ
@z

@x
- Configure [logging drivers](configure.md).
- Write a [Dockerfile](../../../engine/reference/builder.md).
@y
{% comment %}
- Configure [logging drivers](configure.md).
- Write a [Dockerfile](../../../engine/reference/builder.md).
{% endcomment %}
- [ログドライバー](configure.md) を設定します。
- [Dockerfile](../../../engine/reference/builder.md) を記述します。
@z
