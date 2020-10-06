%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Regenerate and update TLS certificates
keywords: machine, regenerate-certs, subcommand
title: docker-machine regenerate-certs
hide_from_sitemap: true
---
@y
---
description: TLS 証明書の再生成して更新します。
keywords: machine, regenerate-certs, subcommand
title: docker-machine regenerate-certs
hide_from_sitemap: true
---
@z

@x
```none
Usage: docker-machine regenerate-certs [OPTIONS] [arg...]

Regenerate TLS Certificates for a machine

Description:
   Argument(s) are one or more machine names.

Options:

   --force, -f		Force rebuild and do not prompt
   --client-certs	Also regenerate client certificates and CA.
```
@y
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" href="#origin">英語表記</a></li>
  <li><a data-toggle="tab" href="#japanese">日本語訳</a></li>
</ul>
<div class="tab-content">
  <div id="origin" class="tab-pane fade in active">
{% capture original-content %}
```none
Usage: docker-machine regenerate-certs [OPTIONS] [arg...]

Regenerate TLS Certificates for a machine

Description:
   Argument(s) are one or more machine names.

Options:

   --force, -f		Force rebuild and do not prompt
   --client-certs	Also regenerate client certificates and CA.
```
{% endcapture %}
{{ original-content | markdownify }}
</div>
<div id="japanese" class="tab-pane fade" markdown="1">
{% capture japanese-content %}
```none
利用例: docker-machine regenerate-certs [オプション] [arg...]

マシン向けに TLS 証明書を再生成します。

内容説明:
   引数にはマシン名を必要な数だけ指定します。

オプション:

   --force, -f		再生成を実行する際にプロンプト表示は行いません。
   --client-certs	クライアント証明書と CA も再生成します。
```
{% endcapture %}
{{ japanese-content | markdownify }}
</div>
</div>
@z

@x
Regenerate TLS certificates and update the machine with new certs.
@y
{% comment %}
Regenerate TLS certificates and update the machine with new certs.
{% endcomment %}
TLS 証明書を再生成し、この証明書を使ってマシンを更新します。
@z

@x
For example:
@y
{% comment %}
For example:
{% endcomment %}
たとえば以下のとおりです。
@z

@x
```bash
$ docker-machine regenerate-certs dev

Regenerate TLS machine certs?  Warning: this is irreversible. (y/n): y
Regenerating TLS certificates
```
@y
```bash
$ docker-machine regenerate-certs dev

Regenerate TLS machine certs?  Warning: this is irreversible. (y/n): y
Regenerating TLS certificates
```
@z

@x
If your certificates have expired, you'll need to regenerate the client certs
as well using the `--client-certs` option:
@y
{% comment %}
If your certificates have expired, you'll need to regenerate the client certs
as well using the `--client-certs` option:
{% endcomment %}
証明書の期限が切れている場合はクライアント証明書の再生成が必要になるため、その際には `--client-certs` オプションを利用します。
@z

@x
```bash
$ docker-machine regenerate-certs --client-certs dev

Regenerate TLS machine certs?  Warning: this is irreversible. (y/n): y
Regenerating TLS certificates
Regenerating local certificates
...
```
@y
```bash
$ docker-machine regenerate-certs --client-certs dev

Regenerate TLS machine certs?  Warning: this is irreversible. (y/n): y
Regenerating TLS certificates
Regenerating local certificates
...
```
@z
