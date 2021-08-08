%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: CLI and log output formatting reference
keywords: format, formatting, output, templates, log
title: Format command and log output
redirect_from:
- /engine/admin/formatting/
---
@y
---
description: CLI and log output formatting reference
keywords: format, formatting, output, templates, log
title: コマンド出力やログ出力のフォーマット変更
redirect_from:
- /engine/admin/formatting/
---
@z

@x
Docker uses [Go templates](https://golang.org/pkg/text/template/) which you can
use to manipulate the output format of certain commands and log drivers.
@y
Docker は [Go 言語の templates パッケージ](https://golang.org/pkg/text/template/) を利用して、所定のコマンドやログドライバーの出力フォーマットを操作できるようにしています。
@z

@x
Docker provides a set of basic functions to manipulate template elements.
All of these examples use the `docker inspect` command, but many other CLI
commands have a `--format` flag, and many of the CLI command references
include examples of customizing the output format.
@y
Docker では、テンプレート項目を操作する基本機能を提供します。
以下では、すべて`docker inspect`コマンドを使った例を示します。
ただしこれ以外の CLI コマンドにも`--format`フラグは用意されています。
また多くの CLI コマンドリファレンスにて、出力フォーマットをカスタマイズする例を示しています。
@z

@x
>**Note**
>
> When using the `--format` flag, you need observe your shell environment. 
> In a Posix shell, you can run the following with a single quote:
>
> {% raw %}
> ```console
> $ docker inspect --format '{{join .Args " , "}}'
> ```
> {% endraw %}
>
> Otherwise, in a Windows shell (for example, PowerShell), you need to use single quotes, but
> escape the double quotes inside the params as follows:
>
> {% raw %}
> ```console
> $ docker inspect --format '{{join .Args \" , \"}}'
> ```
> {% endraw %}
>
{:.important}
@y
>**メモ**
>
> `--format`フラグを用いる際には、利用しているシェル環境を考慮する必要があります。
> Posix シェルの場合、以下のようなコマンド実行では、シングルクォートで囲むことが必要です。
>
> {% raw %}
> ```console
> $ docker inspect --format '{{join .Args " , "}}'
> ```
> {% endraw %}
>
> 逆に Windows シェル（たとえば PowerShell）の場合、シングルクォートの利用は必要ですが、パラメーター内部ではダブルクォートをエスケープする必要があります。
> たとえば以下のとおりです。
>
> {% raw %}
> ```console
> $ docker inspect --format '{{join .Args \" , \"}}'
> ```
> {% endraw %}
>
{:.important}
@z

@x
## join
@y
## join
@z

@x
`join` concatenates a list of strings to create a single string.
It puts a separator between each element in the list.
@y
`join`は文字列のリストを連結して、１つの文字列を生成します。
リスト内では、各項目はセパレーターで区切ります。
@z

@x
{% raw %}
```
docker inspect --format '{{join .Args " , "}}' container
```
{% endraw %}
@y
{% raw %}
```
docker inspect --format '{{join .Args " , "}}' container
```
{% endraw %}
@z

@x
## table
@y
## table
@z

@x
`table` specifies which fields you want to see its output.
@y
`table`は出力したい項目を指定します。
@z

@x
{% raw %}
```
docker image list --format "table {{.ID}}\t{{.Repository}}\t{{.Tag}}\t{{.Size}}"
```
{% endraw %}
@y
{% raw %}
```
docker image list --format "table {{.ID}}\t{{.Repository}}\t{{.Tag}}\t{{.Size}}"
```
{% endraw %}
@z

@x
## json
@y
## json
@z

@x
`json` encodes an element as a json string.
@y
`json`は項目を json 文字列としてエンコードします。
@z

@x
{% raw %}
```
docker inspect --format '{{json .Mounts}}' container
```
{% endraw %}
@y
{% raw %}
```
docker inspect --format '{{json .Mounts}}' container
```
{% endraw %}
@z

@x
## lower
@y
## lower
@z

@x
`lower` transforms a string into its lowercase representation.
@y
`lower`は文字列を小文字化します。
@z

@x
{% raw %}
```
docker inspect --format "{{lower .Name}}" container
```
{% endraw %}
@y
{% raw %}
```
docker inspect --format "{{lower .Name}}" container
```
{% endraw %}
@z

@x
## split
@y
## split
@z

@x
`split` slices a string into a list of strings separated by a separator.
@y
`split`は、文字列を分割して、セパレーターによって区切られた文字列リストにします。
@z

@x
{% raw %}
```
docker inspect --format '{{split .Image ":"}}'
```
{% endraw %}
@y
{% raw %}
```
docker inspect --format '{{split .Image ":"}}'
```
{% endraw %}
@z

@x
## title
@y
## title
@z

@x
`title` capitalizes the first character of a string.
@y
`title`は文字列の先頭文字を大文字にします。
@z

@x
{% raw %}
```
docker inspect --format "{{title .Name}}" container
```
{% endraw %}
@y
{% raw %}
```
docker inspect --format "{{title .Name}}" container
```
{% endraw %}
@z

@x
## upper
@y
## upper
@z

@x
`upper` transforms a string into its uppercase representation.
@y
`upper`は文字列を大文字化します。
@z

@x
{% raw %}
```
docker inspect --format "{{upper .Name}}" container
```
{% endraw %}
@y
{% raw %}
```
docker inspect --format "{{upper .Name}}" container
```
{% endraw %}
@z

@x
## println
@y
## println
@z

@x
`println` prints each value on a new line.
@y
`println`は各項目を一行ずつ出力します。
@z

@x
{% raw %}
```
docker inspect --format='{{range .NetworkSettings.Networks}}{{println .IPAddress}}{{end}}' container
```
{% endraw %}
@y
{% raw %}
```
docker inspect --format='{{range .NetworkSettings.Networks}}{{println .IPAddress}}{{end}}' container
```
{% endraw %}
@z

@x
# Hint
@y
{: #hint }
# ヒント
@z

@x
To find out what data can be printed, show all content as json:
@y
どの項目を出力できるかを知るには、以下を実行すれば全項目を JSON 形式で表示できます。
@z

@x
{% raw %} 
```
docker container ls --format='{{json .}}'
```
{% endraw %} 
@y
{% raw %} 
```
docker container ls --format='{{json .}}'
```
{% endraw %} 
@z
