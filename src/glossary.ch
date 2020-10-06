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
<span id="glossaryMatch" />
<span id="topicMatch" />
@y
To get a specific entry while writing a page in the docs, enter Liquid text
like so:
{{ site.data.glossary["aufs"] }}
-->
<span id="glossaryMatch" />
<span id="topicMatch" />
@z

@x
<table border="1">
  {% for entry in site.data.glossary %}
    <tr>
      <td>{{ entry[0] }}</td>
      <td>{{ entry[1] | markdownify }}</td>
    </tr>
  {% endfor %}
</table>
@y
<table border="1">
  {% for entry in site.data.glossary %}
    <tr>
      <td>{{ entry[0] }}</td>
      <td>{{ entry[1] | markdownify }}</td>
    </tr>
  {% endfor %}
</table>
@z
