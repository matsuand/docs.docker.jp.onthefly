%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
{% comment %}
  Generates a Github PR URL from three parameters
@y
{% comment %}
  Generates a Github PR URL from three parameters
@z

@x
  Usage:
    {% include github-pr.md org=docker repo=docker pr=12345 %}
@y
  Usage:
    {% include github-pr.md org=docker repo=docker pr=12345 %}
@z

@x
    If you omit the org or repo, they default to docker.
    If you omit the pr, it defaults to NULL.
@y
    If you omit the org or repo, they default to docker.
    If you omit the pr, it defaults to NULL.
@z

@x
  Output:
    [#12345](https://github.com/moby/moby/pull/12345)
{% endcomment %}{% assign org = include.org | default: "docker" %}{% assign repo = include.repo | default: "docker" %}{% assign pr = include.pr | default: NULL %}{% assign github-url="https://github.com" %}{% capture pr-link %}[#{{ pr }}]({{ github-url }}/{{ org }}/{{ repo }}/pull/{{ pr }}){% endcapture %}{{ pr-link | strip_newlines }}
@y
  Output:
    [#12345](https://github.com/moby/moby/pull/12345)
{% endcomment %}{% assign org = include.org | default: "docker" %}{% assign repo = include.repo | default: "docker" %}{% assign pr = include.pr | default: NULL %}{% assign github-url="https://github.com" %}{% capture pr-link %}[#{{ pr }}]({{ github-url }}/{{ org }}/{{ repo }}/pull/{{ pr }}){% endcapture %}{{ pr-link | strip_newlines }}
@z
