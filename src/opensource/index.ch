%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Overview of contributing
keywords: open, source, contributing, overview
title: Contribute to documentation
redirect_from:
- /contributing/
- /contributing/contributing/
- /opensource/code/
- /opensource/project/who-written-for/
- /opensource/project/software-required/
- /opensource/project/software-req-win/
- /opensource/project/set-up-git/
- /opensource/project/set-up-dev-env/
- /opensource/project/test-and-docs/
- /opensource/project/who-written-for/
- /opensource/workflow/advanced-contributing/
- /opensource/workflow/
- /opensource/workflow/coding-style/
- /opensource/workflow/create-pr/
- /opensource/workflow/find-an-issue/
- /opensource/workflow/make-a-contribution/
- /opensource/workflow/review-pr/
- /opensource/workflow/work-issue/
- /opensource/FAQ/
- /opensource/get-help/
- /opensource/code/
- /opensource/doc-style/
- /opensource/governance/
- /opensource/governance/dgab-info/
- /opensource/governance/board-profiles/
- /opensource/governance/conduct-code/
@y
---
description: 貢献方法の概要
keywords: open, source, contributing, overview
title: ドキュメントへの貢献
redirect_from:
- /contributing/
- /contributing/contributing/
- /opensource/code/
- /opensource/project/who-written-for/
- /opensource/project/software-required/
- /opensource/project/software-req-win/
- /opensource/project/set-up-git/
- /opensource/project/set-up-dev-env/
- /opensource/project/test-and-docs/
- /opensource/project/who-written-for/
- /opensource/workflow/advanced-contributing/
- /opensource/workflow/
- /opensource/workflow/coding-style/
- /opensource/workflow/create-pr/
- /opensource/workflow/find-an-issue/
- /opensource/workflow/make-a-contribution/
- /opensource/workflow/review-pr/
- /opensource/workflow/work-issue/
- /opensource/FAQ/
- /opensource/get-help/
- /opensource/code/
- /opensource/doc-style/
- /opensource/governance/
- /opensource/governance/dgab-info/
- /opensource/governance/board-profiles/
- /opensource/governance/conduct-code/
@z

@x
---
@y
---
@z

@x
Contributing to the Docker documentation can be a rewarding experience. When you
offer feedback, questions, edits, or new content, you help us, the projects you
work on, and the larger Docker community.
@y
{% comment %}
{% endcomment %}
Contributing to the Docker documentation can be a rewarding experience. When you
offer feedback, questions, edits, or new content, you help us, the projects you
work on, and the larger Docker community.
@z

@x
We welcome your participation to help make the documentation better!
@y
{% comment %}
We welcome your participation to help make the documentation better!
{% endcomment %}
We welcome your participation to help make the documentation better!
@z

@x
> Looking for the open source Moby project?
>
> See [Looking for Moby?](#looking-for-moby) below.
@y
{% comment %}
> Looking for the open source Moby project?
>
> See [Looking for Moby?](#looking-for-moby) below.
{% endcomment %}
> オープンソース Moby プロジェクトを探していますか？
>
> その場合は後述する [Moby を探していますか？](#looking-for-moby) を参照してください。
@z

@x
## How to contribute to the docs
@y
{% comment %}
## How to contribute to the docs
{% endcomment %}
{: #how-to-contribute-to-the-docs }
## 本ドキュメントへの貢献方法
@z

@x
The documentation for Docker is published at
[docs.docker.com](https://docs.docker.com/).
@y
{% comment %}
The documentation for Docker is published at
[docs.docker.com](https://docs.docker.com/).
{% endcomment %}
Docker ドキュメントは [docs.docker.com](https://docs.docker.com/) において公開されています。
@z

@x
There are many ways to contribute:
@y
{% comment %}
There are many ways to contribute:
{% endcomment %}
貢献方法はいくつもあります。
@z

@x
- Edit, rate, or file an issue or question directly on the site by
using the links available on the right-side menu on every page
at [docs.docker.com](/).
@y
{% comment %}
- Edit, rate, or file an issue or question directly on the site by
using the links available on the right-side menu on every page
at [docs.docker.com](/).
{% endcomment %}
- Edit, rate, or file an issue or question directly on the site by
using the links available on the right-side menu on every page
at [docs.docker.com](/).
@z

@x
  ![Docs feedback links](images/docs-site-feedback.png)
@y
  {% comment %}
  ![Docs feedback links](images/docs-site-feedback.png)
  {% endcomment %}
  ![Docs フィードバックリンク](images/docs-site-feedback.png)
@z

@x
- File a documentation issue on GitHub at
[https://github.com/docker/docker.github.io/issues](https://github.com/docker/docker.github.io/issues).
@y
{% comment %}
- File a documentation issue on GitHub at
[https://github.com/docker/docker.github.io/issues](https://github.com/docker/docker.github.io/issues).
{% endcomment %}
- File a documentation issue on GitHub at
[https://github.com/docker/docker.github.io/issues](https://github.com/docker/docker.github.io/issues).
@z

@x
  This is similar to clicking **Request doc changes** on a published docs
  page, but if you manually file an issue you need to fill in links to
  the related pages.
@y
  {% comment %}
  This is similar to clicking **Request doc changes** on a published docs
  page, but if you manually file an issue you need to fill in links to
  the related pages.
  {% endcomment %}
  This is similar to clicking **Request doc changes** on a published docs
  page, but if you manually file an issue you need to fill in links to
  the related pages.
@z

@x
- Fork the documentation, make changes or add new content on your local
branch, and submit a pull request (PR) to the master branch for the docs.
@y
{% comment %}
{% endcomment %}
- Fork the documentation, make changes or add new content on your local
branch, and submit a pull request (PR) to the master branch for the docs.
@z

@x
  This is the manual, more advanced version of clicking **Edit this page**
  on a published docs page. Initiating a docs changes in a PR from your
  own branch gives you more flexibility, as you can submit changes to
  multiple pages or files under a single pull request, and even create
  new topics.
@y
  {% comment %}
  {% endcomment %}
  This is the manual, more advanced version of clicking **Edit this page**
  on a published docs page. Initiating a docs changes in a PR from your
  own branch gives you more flexibility, as you can submit changes to
  multiple pages or files under a single pull request, and even create
  new topics.
@z

@x
## Resources and guidance
@y
{% comment %}
## Resources and guidance
{% endcomment %}
{: #resources-and-guidance }
## Resources and guidance
@z

@x
We are here to help. If you are interested in contributing, but don't feel ready
to dive in on more complex updates, we can help get you up and running.
@y
{% comment %}
We are here to help. If you are interested in contributing, but don't feel ready
to dive in on more complex updates, we can help get you up and running.
{% endcomment %}
We are here to help. If you are interested in contributing, but don't feel ready
to dive in on more complex updates, we can help get you up and running.
@z

@x
You might start by using the right-side menus on published pages:
@y
{% comment %}
You might start by using the right-side menus on published pages:
{% endcomment %}
You might start by using the right-side menus on published pages:
@z

@x
* Click **Request doc changes** on a page to automatically log an issue.
@y
{% comment %}
* Click **Request doc changes** on a page to automatically log an issue.
{% endcomment %}
* Click **Request doc changes** on a page to automatically log an issue.
@z

@x
* Click **Edit this page** to make a change to content, which automatically creates a PR.
@y
{% comment %}
* Click **Edit this page** to make a change to content, which automatically creates a PR.
{% endcomment %}
* Click **Edit this page** to make a change to content, which automatically creates a PR.
@z

@x
The issue and PR pages on GitHub give us a community space to discuss
things, and answer any questions you might have about the problem or topic you
are reporting on.
@y
{% comment %}
The issue and PR pages on GitHub give us a community space to discuss
things, and answer any questions you might have about the problem or topic you
are reporting on.
{% endcomment %}
The issue and PR pages on GitHub give us a community space to discuss
things, and answer any questions you might have about the problem or topic you
are reporting on.
@z

@x
To learn more about working on the documentation, see these topics:
@y
{% comment %}
To learn more about working on the documentation, see these topics:
{% endcomment %}
To learn more about working on the documentation, see these topics:
@z

@x
- [README on docker/docker.github.io](https://github.com/docker/docker.github.io/blob/master/README.md)
@y
{% comment %}
- [README on docker/docker.github.io](https://github.com/docker/docker.github.io/blob/master/README.md)
{% endcomment %}
- [docker/docker.github.io の README](https://github.com/docker/docker.github.io/blob/master/README.md)
@z

@x
- [Docs Test page](../test.md) - This is on the
published site. It explains how to use Docs components, resources, and
formats, and gives us a way to test and demo them.
@y
{% comment %}
- [Docs Test page](../test.md) - This is on the
published site. It explains how to use Docs components, resources, and
formats, and gives us a way to test and demo them.
{% endcomment %}
- [Docs Test page](../test.md) - This is on the
published site. It explains how to use Docs components, resources, and
formats, and gives us a way to test and demo them.
@z

@x
## Looking for meetups and Docker Community?
@y
{% comment %}
## Looking for meetups and Docker Community?
{% endcomment %}
## Looking for meetups and Docker Community?
@z

@x
Go to the [Docker Community GitHub repository](https://github.com/docker/community/blob/master/README.md){:target="_blank" class="_"}
for resources and information on the community.
@y
{% comment %}
Go to the [Docker Community GitHub repository](https://github.com/docker/community/blob/master/README.md){:target="_blank" class="_"}
for resources and information on the community.
{% endcomment %}
Go to the [Docker Community GitHub repository](https://github.com/docker/community/blob/master/README.md){:target="_blank" class="_"}
for resources and information on the community.
@z

@x
The topics in this guide on [Other ways to contribute](/opensource/ways/)
provide some additional information,  but the community
information you are looking for is probably available on the GitHub repository.
@y
{% comment %}
The topics in this guide on [Other ways to contribute](/opensource/ways/)
provide some additional information,  but the community
information you are looking for is probably available on the GitHub repository.
{% endcomment %}
The topics in this guide on [Other ways to contribute](/opensource/ways/)
provide some additional information,  but the community
information you are looking for is probably available on the GitHub repository.
@z

@x
## Looking for Moby?
@y
{% comment %}
## Looking for Moby?
{% endcomment %}
{: #looking-for-moby }
## Moby を探していますか？
@z

@x
{% include content/moby.md %}
@y
{% include content/moby.md %}
@z
