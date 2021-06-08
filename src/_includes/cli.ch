%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
{% capture tabChar %}	{% endcapture %}<!-- Make sure atom is using hard tabs -->
{% assign controller_data = site.data[include.datafolder][include.datafile] %}
{% assign parentPath = page.path | prepend: "/" | remove: page.name %}
@y
{% capture tabChar %}	{% endcapture %}<!-- Make sure atom is using hard tabs -->
{% assign controller_data = site.data[include.datafolder][include.datafile] %}
{% assign parentPath = page.path | prepend: "/" | remove: page.name %}
@z

@x
## Description
@y
{: #description }
## 説明
@z

@x
{{ controller_data.short | replace_relative_links: page.path }}
@y
{{ controller_data.short | replace_relative_links: page.path }}
@z

@x
{% if controller_data.min_api_version %}
@y
{% if controller_data.min_api_version %}
@z

@x
<a href="/engine/api/v{{ controller_data.min_api_version }}/" target="_blank" rel="noopener" class="_"><span class="badge badge-info" data-toggle="tooltip" data-placement="right" title="Open the {{ controller_data.min_api_version }} API reference (in a new window)">API {{ controller_data.min_api_version }}+</span></a>&nbsp;
The client and daemon API must both be at least
<a href="/engine/api/v{{ controller_data.min_api_version }}/" target="_blank" rel="noopener" class="_">{{ controller_data.min_api_version }}</a>
to use this command. Use the `docker version` command on the client to check
your client and daemon API versions.
@y
<a href="{{ site.baseurl }}/engine/api/v{{ controller_data.min_api_version }}/" target="_blank" rel="noopener" class="_"><span class="badge badge-info" data-toggle="tooltip" data-placement="right" title="{{ controller_data.min_api_version }} API リファレンスを開く (別ウィンドウ)">API {{ controller_data.min_api_version }} 以上</span></a>&nbsp;
このコマンドを利用するには、クライアントとデーモンの API はともに、最低でも
<a href="{{ site.baseurl }}/engine/api/v{{ controller_data.min_api_version }}/" target="_blank" rel="noopener" class="_">{{ controller_data.min_api_version }}</a>
である必要があります。
クライアント上において`docker version`コマンドを実行して、クライアントとデーモンの API バージョンを確認してください。
@z

@x
{% endif %}
@y
{% endif %}
@z

@x
{% if controller_data.deprecated %}
@y
{% if controller_data.deprecated %}
@z

@x
> This command is [deprecated](/engine/deprecated/){: target="_blank" rel="noopener" class="_"}.
>
> It may be removed in a future Docker version. For more information, see the [Docker Roadmap](https://github.com/docker/roadmap/issues/209){: target="_blank" rel="noopener" class="_"}.
{: .warning }
@y
> This command is [deprecated]({{ site.baseurl }}/engine/deprecated/){: target="_blank" rel="noopener" class="_"}.
>
> It may be removed in a future Docker version. For more information, see the [Docker Roadmap](https://github.com/docker/roadmap/issues/209){: target="_blank" rel="noopener" class="_"}.
{: .warning }
@z

@x
{% endif %}
@y
{% endif %}
@z

@x
{% if page.enterprise_only == true %}
@y
{% if page.enterprise_only == true %}
@z

@x
> This command is only available on Docker Enterprise Edition.
>
> Learn more about [Docker Enterprise products](/ee/supported-platforms/){: target="_blank" rel="noopener" class="_"}.
{: .important }
@y
> このコマンドは Docker Enterprise Edition においてのみ利用可能です。
>
> 詳しくは [Docker Enterprise 製品]({{ site.baseurl }}/ee/supported-platforms/){: target="_blank" rel="noopener" class="_"} を参照してください。
{: .important }
@z

@x
{% endif %}
@y
{% endif %}
@z

@x
{% if controller_data.experimental %}
@y
{% if controller_data.experimental %}
@z

@x
> This command is experimental.
>
> This command is experimental on the Docker daemon. It should not be used in
> production environments.
> To enable experimental features on the Docker daemon, edit the
> [daemon.json](/engine/reference/commandline/dockerd/#daemon-configuration-file)
> and set `experimental` to `true`.
>
> {% include experimental.md %}
@y
> このコマンドは試験的なものです
>
> このコマンドは Docker デーモンにおいて試験的なものです。
> 本番環境では利用しないでください。
> 
> Docker デーモンにおいて試験的機能を有効にする場合は、[daemon.json]({{ site.baseurl }}/engine/reference/commandline/dockerd/#daemon-configuration-file) ファイルを編集して、`experimental` を `enabled` に設定してください。
>
> {% include experimental.md %}
@z

@x
{% endif %}
@y
{% endif %}
@z

@x
{% if controller_data.experimentalcli %}
@y
{% if controller_data.experimentalcli %}
@z

@x
> This command is experimental on the Docker client.
>
> **It should not be used in production environments.**
>
> To enable experimental features in the Docker CLI, edit the
> [config.json](/engine/reference/commandline/cli/#configuration-files)
> and set `experimental` to `enabled`. You can go [here](https://docs.docker.com/engine/reference/commandline/cli/#experimental-features)
> for more information.
{: .important }
@y
> このコマンドは Docker クライアントにおける試験的なものです。
>
> **本番環境では利用しないでください。**
>
> Docker CLI において試験的機能を有効にする場合は、[config.json]({{ site.baseurl }}/engine/reference/commandline/cli/#configuration-files) ファイルを編集して、`experimental` を `enabled` に設定してください。
> 詳しくは [こちら]({{ site.baseurl }}/engine/reference/commandline/cli/#experimental-features) を参照してください。
{: .important }
@z

@x
{% endif %}
@y
{% endif %}
@z

@x
{% capture command-orchestrator %}
{% if controller_data.swarm %}
@y
{% capture command-orchestrator %}
{% if controller_data.swarm %}
@z

@x 日本語化
<span class="badge badge-info" data-toggle="tooltip" data-placement="right" title="This command works with the Swarm orchestrator.">Swarm</span> This command works with the Swarm orchestrator.
@y
<span class="badge badge-info" data-toggle="tooltip" data-placement="right" title="このコマンドは Swarm オーケストレーターにおいて動作します。">Swarm</span> このコマンドは Swarm オーケストレーターにおいて動作します。
@z

@x
{% endif %}
{% if controller_data.kubernetes %}
@y
{% endif %}
{% if controller_data.kubernetes %}
@z

@x 日本語化
<span class="badge badge-info" data-toggle="tooltip" data-placement="right" title="This command works with the Kubernetes orchestrator.">Kubernetes</span> This command works with the Kubernetes orchestrator.
@y
<span class="badge badge-info" data-toggle="tooltip" data-placement="right" title="このコマンドは Kubernetes オーケストレーターにおいて動作します。">Kubernetes</span> このコマンドは Kubernetes オーケストレーターにおいて動作します。
@z

@x
{% endif %}
{% endcapture %}{{ command-orchestrator }}
@y
{% endif %}
{% endcapture %}{{ command-orchestrator }}
@z

@x
{% if controller_data.usage %}
@y
{% if controller_data.usage %}
@z

@x
## Usage
@y
{: #usage }
## 利用方法
@z

@x
```console
$ {{ controller_data.usage | replace: tabChar, "" | strip }}{% if controller_data.cname %} COMMAND{% endif %}
```
@y
```console
$ {{ controller_data.usage | replace: tabChar, "" | strip }}{% if controller_data.cname %} COMMAND{% endif %}
```
@z

@x
{% endif %}
{% unless controller_data.long == controller_data.short %}
@y
{% endif %}
{% unless controller_data.long == controller_data.short %}
@z

@x
## Extended description
@y
{: #extended-description }
## 追加説明
@z

@x
{{ controller_data.long | replace_relative_links: page.path }}
@y
{{ controller_data.long | replace_relative_links: page.path }}
@z

@x
{% endunless %}
@y
{% endunless %}
@z

@x
{% if controller_data.examples %}
For example uses of this command, refer to the [examples section](#examples) below.
{% endif %}
@y
{% if controller_data.examples %}
本コマンドの利用例については、以下に示す [利用例の節](#examples) を参照してください。
{% endif %}
@z

@x
{% if controller_data.options %}
  {% if controller_data.inherited_options %}
    {% assign alloptions = controller_data.options | concat:controller_data.inherited_options %}
  {% else %}
    {% assign alloptions = controller_data.options %}
  {% endif %}
@y
{% if controller_data.options %}
  {% if controller_data.inherited_options %}
    {% assign alloptions = controller_data.options | concat:controller_data.inherited_options %}
  {% else %}
    {% assign alloptions = controller_data.options %}
  {% endif %}
@z

@x
## Options
@y
{: #options }
## オプション
@z

@x
<table>
<thead>
  <tr>
    <td>Name, shorthand</td>
    <td>Default</td>
    <td>Description</td>
  </tr>
</thead>
<tbody>
{% for option in alloptions %}
@y
<table>
<thead>
  <tr>
    <td>名前／省略形</td>
    <td>デフォルト</td>
    <td>説明</td>
  </tr>
</thead>
<tbody>
{% for option in alloptions %}
@z

@x Read about... 日本語化
  {% capture deprecated-badge %}{% if option.deprecated %}<a href="/engine/deprecated/" target="_blank" rel="noopener" class="_"><span class="badge badge-danger" data-toggle="tooltip" title="Read the deprecation reference (in a new window).">deprecated</span></a>{% endif %}{% endcapture %}
  {% capture experimental-daemon-badge %}{% if option.experimental %}<a href="/engine/reference/commandline/dockerd/#daemon-configuration-file" target="_blank" rel="noopener" class="_"><span class="badge badge-warning" data-toggle="tooltip" title="Read about experimental daemon options (in a new window).">experimental (daemon)</span></a>{% endif %}{% endcapture %}
  {% capture experimental-cli-badge %}{% if option.experimentalcli %}<a href="/engine/reference/commandline/cli/#configuration-files" target="_blank" rel="noopener" class="_"><span class="badge badge-warning"  data-toggle="tooltip" title="Read about experimental CLI options (in a new window).">experimental (CLI)</span></a>{% endif %}{% endcapture %}
  {% capture min-api %}{% if option.min_api_version %}<a href="/engine/api/v{{ option.min_api_version }}/" target="_blank" rel="noopener" class="_"><span class="badge badge-info" data-toggle="tooltip" ttitle="Open the {{ controller_data.min_api_version }} API reference (in a new window)">API {{ option.min_api_version }}+</span></a>{% endif %}{%endcapture%}
  {% capture flag-orchestrator %}{% if option.swarm %}<span class="badge badge-info" data-toggle="tooltip" title="This option works for the Swarm orchestrator.">Swarm</span>{% endif %}{% if option.kubernetes %}<span class="badge badge-info" data-toggle="tooltip" title="This option works for the Kubernetes orchestrator.">Kubernetes</span>{% endif %}{% endcapture %}
@y
  {% capture deprecated-badge %}{% if option.deprecated %}<a href="{{ site.baseurl }}/engine/deprecated/" target="_blank" rel="noopener" class="_"><span class="badge badge-danger" data-toggle="tooltip" title="Read the deprecation reference (in a new window).">deprecated</span></a>{% endif %}{% endcapture %}
  {% capture experimental-daemon-badge %}{% if option.experimental %}<a href="{{ site.baseurl }}/engine/reference/commandline/dockerd/#daemon-configuration-file" target="_blank" rel="noopener" class="_"><span class="badge badge-warning" data-toggle="tooltip" title="デーモンの試験的オプションを確認します。(別ウィンドウ)">試験的 (デーモン)</span></a>{% endif %}{% endcapture %}
  {% capture experimental-cli-badge %}{% if option.experimentalcli %}<a href="{{ site.baseurl }}/engine/reference/commandline/cli/#configuration-files" target="_blank" rel="noopener" class="_"><span class="badge badge-warning"  data-toggle="tooltip" title="CLI の試験的オプションを確認します。(別ウィンドウ)">試験的 (CLI)</span></a>{% endif %}{% endcapture %}
  {% capture min-api %}{% if option.min_api_version %}<a href="{{ site.baseurl }}/engine/api/v{{ option.min_api_version }}/" target="_blank" rel="noopener" class="_"><span class="badge badge-info" data-toggle="tooltip" ttitle="{{ controller_data.min_api_version }} API リファレンスを開きます。(別ウィンドウ)">API {{ option.min_api_version }} 以上</span></a>{% endif %}{%endcapture%}
  {% capture flag-orchestrator %}{% if option.swarm %}<span class="badge badge-info" data-toggle="tooltip" title="This option works for the Swarm orchestrator.">Swarm</span>{% endif %}{% if option.kubernetes %}<span class="badge badge-info" data-toggle="tooltip" title="このオプションは Kubernetes オーケストレーターにおいて動作します。">Kubernetes</span>{% endif %}{% endcapture %}
@z

@x
  {% capture all-badges %}{{ deprecated-badge }}{{ experimental-daemon-badge }}{{ experimental-cli-badge }}{{ min-api }}{{ flag-orchestrator }}{% endcapture %}
@y
  {% capture all-badges %}{{ deprecated-badge }}{{ experimental-daemon-badge }}{{ experimental-cli-badge }}{{ min-api }}{{ flag-orchestrator }}{% endcapture %}
@z

@x
  {% assign defaults-to-skip = "[],map[],false,0,0s,default,'',\"\"" | split: ',' %}
  {% capture option-default %}{% if option.default_value %}{% unless defaults-to-skip contains option.default_value or defaults-to-skip == blank %}`{{ option.default_value }}`{% endunless %}{% endif %}{% endcapture %}
  <tr>
    {% if option.details_url and option.details_url != '' -%}
    <td markdown="span">[`--{{ option.option }}`]({{ option.details_url }}){% if option.shorthand %} , [`-{{ option.shorthand }}`]({{ option.details_url }}){% endif %}</td>
    {%- else -%}
    <td markdown="span">`--{{ option.option }}`{% if option.shorthand %} , `-{{ option.shorthand }}`{% endif %}</td>
    {%- endif %}
    <td markdown="span">{{ option-default }}</td>
    <td markdown="span">{% if all-badges != '' %}{{ all-badges | strip }}<br />{% endif %}{{ option.description | strip | escape }}</td>
  </tr>
@y
  {% assign defaults-to-skip = "[],map[],false,0,0s,default,'',\"\"" | split: ',' %}
  {% capture option-default %}{% if option.default_value %}{% unless defaults-to-skip contains option.default_value or defaults-to-skip == blank %}`{{ option.default_value }}`{% endunless %}{% endif %}{% endcapture %}
  <tr>
    {% if option.details_url and option.details_url != '' -%}
    <td markdown="span">[`--{{ option.option }}`]({{ option.details_url }}){% if option.shorthand %} , [`-{{ option.shorthand }}`]({{ option.details_url }}){% endif %}</td>
    {%- else -%}
    <td markdown="span">`--{{ option.option }}`{% if option.shorthand %} , `-{{ option.shorthand }}`{% endif %}</td>
    {%- endif %}
    <td markdown="span">{{ option-default }}</td>
    <td markdown="span">{% if all-badges != '' %}{{ all-badges | strip }}<br />{% endif %}{{ option.description | strip | escape }}</td>
  </tr>
@z

@x
{% endfor %} <!-- end for option -->
</tbody>
</table>
@y
{% endfor %} <!-- end for option -->
</tbody>
</table>
@z

@x
{% endif %} <!-- end if options -->
@y
{% endif %} <!-- end if options -->
@z

@x
{% if controller_data.examples %}
@y
{% if controller_data.examples %}
@z

@x
## Examples
@y
{: #examples }
## 利用例
@z

@x
{{ controller_data.examples | replace_relative_links: page.path }}
@y
{{ controller_data.examples | replace_relative_links: page.path }}
@z

@x
{% endif %}
@y
{% endif %}
@z

@x
{% if controller_data.pname %}
{% unless controller_data.pname == include.datafile %}
@y
{% if controller_data.pname %}
{% unless controller_data.pname == include.datafile %}
@z

@x
## Parent command
@y
{: #parent-command }
## 上位コマンド
@z

@x
{% capture parentfile %}{{ controller_data.plink | remove_first: ".yaml" | remove_first: "docker_" }}{% endcapture %}
{% capture parentdatafile %}{{ controller_data.plink | remove_first: ".yaml" }}{% endcapture %}
{% capture parentDesc %}{{ site.data[include.datafolder][parentdatafile].short }}{% endcapture %}
@y
{% capture parentfile %}{{ controller_data.plink | remove_first: ".yaml" | remove_first: "docker_" }}{% endcapture %}
{% capture parentdatafile %}{{ controller_data.plink | remove_first: ".yaml" }}{% endcapture %}
{% capture parentDesc %}{{ site.data[include.datafolder][parentdatafile].short }}{% endcapture %}
@z

@x
| Command | Description |
| ------- | ----------- |
| [{{ controller_data.pname }}]({{parentPath}}{{ parentfile }}/) | {{ parentDesc }}|
@y
| コマンド | 説明        |
| -------- | ----------- |
| [{{ controller_data.pname }}]({{ site.baseurl }}{{parentPath}}{{ parentfile }}/) | {{ parentDesc }}|
@z

@x
{% endunless %}
{% endif %}
@y
{% endunless %}
{% endif %}
@z

@x
{% if controller_data.cname %}
@y
{% if controller_data.cname %}
@z

@x
## Child commands
@y
{: #child-commands }
## 下位コマンド
@z

@x
<table>
<thead>
  <tr>
    <td>Command</td>
    <td>Description</td>
  </tr>
</thead>
<tbody>
{% for command in controller_data.cname %}
  {% capture dataFileName %}{{ command | strip | replace: " ", "_" }}{% endcapture %}
  <tr>
    <td markdown="span">[{{ command }}]({{ parentPath }}{{ dataFileName | remove_first: "docker_" }}/)</td>
    <td markdown="span">{{ site.data[include.datafolder][dataFileName].short }}</td>
  </tr>
{% endfor %}
</tbody>
</table>
{% endif %}
@y
<table>
<thead>
  <tr>
    <td>コマンド</td>
    <td>説明</td>
  </tr>
</thead>
<tbody>
{% for command in controller_data.cname %}
  {% capture dataFileName %}{{ command | strip | replace: " ", "_" }}{% endcapture %}
  <tr>
    <td markdown="span">[{{ command }}]({{ site.baseurl }}{{ parentPath }}{{ dataFileName | remove_first: "docker_" }}/)</td>
    <td markdown="span">{{ site.data[include.datafolder][dataFileName].short }}</td>
  </tr>
{% endfor %}
</tbody>
</table>
{% endif %}
@z

@x
{% unless controller_data.pname == "docker" or controller_data.pname == "dockerd" or include.datafile=="docker" %}
@y
{% unless controller_data.pname == "docker" or controller_data.pname == "dockerd" or include.datafile=="docker" %}
@z

@x
## Related commands
@y
{: #related-commands }
## 関連コマンド
@z

@x
<table>
<thead>
  <tr>
    <td>Command</td>
    <td>Description</td>
  </tr>
</thead>
<tbody>
{% for command in site.data[include.datafolder][parentdatafile].cname %}
  {% capture dataFileName %}{{ command | strip | replace: " ", "_" }}{% endcapture %}
  <tr>
    <td markdown="span">[{{ command }}]({{ parentPath }}{{ dataFileName | remove_first: "docker_" }}/)</td>
    <td markdown="span">{{ site.data[include.datafolder][dataFileName].short }}</td>
  </tr>
{% endfor %}
</tbody>
</table>
@y
<table>
<thead>
  <tr>
    <td>コマンド</td>
    <td>説明</td>
  </tr>
</thead>
<tbody>
{% for command in site.data[include.datafolder][parentdatafile].cname %}
  {% capture dataFileName %}{{ command | strip | replace: " ", "_" }}{% endcapture %}
  <tr>
    <td markdown="span">[{{ command }}]({{ site.baseurl }}{{ parentPath }}{{ dataFileName | remove_first: "docker_" }}/)</td>
    <td markdown="span">{{ site.data[include.datafolder][dataFileName].short }}</td>
  </tr>
{% endfor %}
</tbody>
</table>
@z

@x
{% endunless %}
@y
{% endunless %}
@z
