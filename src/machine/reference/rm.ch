%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Remove a machine.
keywords: machine, rm, subcommand
title: docker-machine rm
hide_from_sitemap: true
---
@y
---
description: Remove a machine.
keywords: machine, rm, subcommand
title: docker-machine rm
hide_from_sitemap: true
---
@z

@x
Remove a machine. This removes the local reference and deletes it
on the cloud provider or virtualization management platform.
@y
{% comment %}
Remove a machine. This removes the local reference and deletes it
on the cloud provider or virtualization management platform.
{% endcomment %}
マシンを削除します。
これはクラウドプロバイダーや仮想化管理システムへのローカル参照と、そのシステム上でのマシンを削除します。
@z

@x
```bash
$ docker-machine rm --help

Usage: docker-machine rm [OPTIONS] [arg...]

Remove a machine

Description:
   Argument(s) are one or more machine names.

Options:

   --force, -f	Remove local configuration even if machine cannot be removed, also implies an automatic yes (`-y`)
   -y		Assumes automatic yes to proceed with remove, without prompting further user confirmation
```
@y
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" href="#origin">英語表記</a></li>
  <li><a data-toggle="tab" href="#japanese">日本語訳</a></li>
</ul>
<div class="tab-content">
  <div id="origin" class="tab-pane fade in active">
{% capture original-content %}
```bash
$ docker-machine rm --help

Usage: docker-machine rm [OPTIONS] [arg...]

Remove a machine

Description:
   Argument(s) are one or more machine names.

Options:

   --force, -f	Remove local configuration even if machine cannot be removed, also implies an automatic yes (`-y`)
   -y		Assumes automatic yes to proceed with remove, without prompting further user confirmation
```
{% endcapture %}
{{ original-content | markdownify }}
</div>
<div id="japanese" class="tab-pane fade" markdown="1">
{% capture japanese-content %}
```bash
$ docker-machine rm --help

利用方法: docker-machine rm [オプション] [arg...]

マシンを削除します。

内容説明:
   引数にはマシン名を必要な数だけ指定します。

オプション:

   --force, -f	マシンが削除できなくてもローカル参照情報を削除します。自動的な yes (`-y`) の入力を含みます。
   -y		ユーザー確認せずに削除処理中に自動的に yes が入力されたものとして扱います。
```
{% endcapture %}
{{ japanese-content | markdownify }}
</div>
</div>
@z

@x
## Examples
@y
{% comment %}
## Examples
{% endcomment %}
{: #examples }
## 利用例
@z

@x
```bash
$ docker-machine ls
@y
```bash
$ docker-machine ls
@z

@x
NAME   ACTIVE   URL          STATE     URL                         SWARM   DOCKER   ERRORS
bar    -        virtualbox   Running   tcp://192.168.99.101:2376           v1.9.1
baz    -        virtualbox   Running   tcp://192.168.99.103:2376           v1.9.1
foo    -        virtualbox   Running   tcp://192.168.99.100:2376           v1.9.1
qix    -        virtualbox   Running   tcp://192.168.99.102:2376           v1.9.1
@y
NAME   ACTIVE   URL          STATE     URL                         SWARM   DOCKER   ERRORS
bar    -        virtualbox   Running   tcp://192.168.99.101:2376           v1.9.1
baz    -        virtualbox   Running   tcp://192.168.99.103:2376           v1.9.1
foo    -        virtualbox   Running   tcp://192.168.99.100:2376           v1.9.1
qix    -        virtualbox   Running   tcp://192.168.99.102:2376           v1.9.1
@z

@x
$ docker-machine rm baz
@y
$ docker-machine rm baz
@z

@x
About to remove baz
Are you sure? (y/n): y
Successfully removed baz
@y
About to remove baz
Are you sure? (y/n): y
Successfully removed baz
@z

@x
$ docker-machine ls
@y
$ docker-machine ls
@z

@x
NAME   ACTIVE   URL          STATE     URL                         SWARM   DOCKER   ERRORS
bar    -        virtualbox   Running   tcp://192.168.99.101:2376           v1.9.1
foo    -        virtualbox   Running   tcp://192.168.99.100:2376           v1.9.1
qix    -        virtualbox   Running   tcp://192.168.99.102:2376           v1.9.1
@y
NAME   ACTIVE   URL          STATE     URL                         SWARM   DOCKER   ERRORS
bar    -        virtualbox   Running   tcp://192.168.99.101:2376           v1.9.1
foo    -        virtualbox   Running   tcp://192.168.99.100:2376           v1.9.1
qix    -        virtualbox   Running   tcp://192.168.99.102:2376           v1.9.1
@z

@x
$ docker-machine rm bar qix
@y
$ docker-machine rm bar qix
@z

@x
About to remove bar, qix
Are you sure? (y/n): y
Successfully removed bar
Successfully removed qix
@y
About to remove bar, qix
Are you sure? (y/n): y
Successfully removed bar
Successfully removed qix
@z

@x
$ docker-machine ls
@y
$ docker-machine ls
@z

@x
NAME   ACTIVE   URL          STATE     URL                         SWARM   DOCKER   ERRORS
foo    -        virtualbox   Running   tcp://192.168.99.100:2376           v1.9.1
@y
NAME   ACTIVE   URL          STATE     URL                         SWARM   DOCKER   ERRORS
foo    -        virtualbox   Running   tcp://192.168.99.100:2376           v1.9.1
@z

@x
$ docker-machine rm -y foo
@y
$ docker-machine rm -y foo
@z

@x
About to remove foo
Successfully removed foo
```
@y
About to remove foo
Successfully removed foo
```
@z
