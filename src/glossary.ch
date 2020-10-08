%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: "Glossary"
description: "Glossary of terms used around Docker"
keywords: "glossary, docker, terms, definitions"
notoc: true
noratings: true
skip_read_time: true
redirect_from:
- /engine/reference/glossary/
- /reference/glossary/
---
<!--
To edit/add/remove glossary entries, visit the YAML file at:
https://github.com/docker/docker.github.io/blob/master/_data/glossary.yaml
@y
---
title: "用語"
description: "Docker に関して使われている用語集"
keywords: "glossary, docker, terms, definitions"
notoc: true
noratings: true
skip_read_time: true
redirect_from:
- /engine/reference/glossary/
- /reference/glossary/
---
<!--
To edit/add/remove glossary entries, visit the YAML file at:
https://github.com/docker/docker.github.io/blob/master/_data/glossary.yaml
@z

@x
To get a specific entry while writing a page in the docs, enter Liquid text
like so:
{{ site.data.glossary["aufs"] }}
-->
@y
To get a specific entry while writing a page in the docs, enter Liquid text
like so:
{{ site.data.glossary["aufs"] }}
-->
@z

@x
<table>
  <thead>
    <tr><th>Term</th><th>Definition</th></tr>
  </thead>
  <tbody>
  {%- for entry in site.data.glossary -%}
    {%- assign id = entry[0] | slugify -%}
    <tr>
      <td><a class="glossary" id="{{ id }}" href="#{{ id }}">{{ entry[0] }}</a></td>
      <td>{{ entry[1] | markdownify }}</td>
    </tr>
  {%- endfor -%}
  </tbody>
</table>
@y
<table>
  <thead>
    <tr><th>用語</th><th>定義説明</th></tr>
  </thead>
  <tbody>
  {%- for entry in site.data.glossary -%}
    {%- assign id = entry[0] | slugify -%}
    <tr>
      <td><a class="glossary" id="{{ id }}" href="#{{ id }}">{{ entry[0] }}</a></td>
      <td>{{ entry[1] | markdownify }}</td>
    </tr>
  {%- endfor -%}
  </tbody>
</table>
@z
