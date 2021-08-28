%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
# Docs @ Docker
Welcome to the repo for our documentation. This is the source for
[https://docs.docker.com/](https://docs.docker.com/).
@y
# Docs @ Docker
Welcome to the repo for our documentation. This is the source for
[https://docs.docker.com/](https://docs.docker.com/).
@z

@x
Feel free to send us pull requests and file issues. Our docs are completely	
open source and we deeply appreciate contributions from our community!
## Table of Contents
@y
Feel free to send us pull requests and file issues. Our docs are completely	
open source and we deeply appreciate contributions from our community!
## Table of Contents
@z

@x
- [Providing feedback](#providing-feedback)
- [Contributing](#contributing)
  - [Files not edited here](#files-not-edited-here)
  - [Overall doc improvements](#overall-doc-improvements)
- [Per-PR staging on GitHub](#per-pr-staging-on-github)
- [Build and preview the docs locally](#build-and-preview-the-docs-locally)
  - [Build the docs with deployment features enabled](#build-the-docs-with-deployment-features-enabled)
- [Important files](#important-files)
- [Relative linking for GitHub viewing](#relative-linking-for-github-viewing)
  - [Testing changes and practical guidance](#testing-changes-and-practical-guidance)
  - [Per-page front-matter](#per-page-front-matter)
  - [Creating tabs](#creating-tabs)
  - [Running in-page Javascript](#running-in-page-javascript)
  - [Images](#images)
- [Copyright and license](#copyright-and-license)
@y
- [Providing feedback](#providing-feedback)
- [Contributing](#contributing)
  - [Files not edited here](#files-not-edited-here)
  - [Overall doc improvements](#overall-doc-improvements)
- [Per-PR staging on GitHub](#per-pr-staging-on-github)
- [Build and preview the docs locally](#build-and-preview-the-docs-locally)
  - [Build the docs with deployment features enabled](#build-the-docs-with-deployment-features-enabled)
- [Important files](#important-files)
- [Relative linking for GitHub viewing](#relative-linking-for-github-viewing)
  - [Testing changes and practical guidance](#testing-changes-and-practical-guidance)
  - [Per-page front-matter](#per-page-front-matter)
  - [Creating tabs](#creating-tabs)
  - [Running in-page Javascript](#running-in-page-javascript)
  - [Images](#images)
- [Copyright and license](#copyright-and-license)
@z

@x
## Providing feedback
@y
## Providing feedback
@z

@x
We really want your feedback, and we've made it easy. You can edit a page or
request changes in the right column of every page on
[docs.docker.com](https://docs.docker.com/). You can also rate each page by
clicking a link at the footer.
@y
We really want your feedback, and we've made it easy. You can edit a page or
request changes in the right column of every page on
[docs.docker.com](https://docs.docker.com/). You can also rate each page by
clicking a link at the footer.
@z

@x
**Only file issues about the documentation in this repository.** One way
to think about this is that you should file a bug here if your issue is that you
don't see something that should be in the docs, or you see something incorrect
or confusing in the docs.
@y
**Only file issues about the documentation in this repository.** One way
to think about this is that you should file a bug here if your issue is that you
don't see something that should be in the docs, or you see something incorrect
or confusing in the docs.
@z

@x
- If your problem is a general question about how to configure or use Docker,
  ask in [https://forums.docker.com](https://forums.docker.com) instead.
@y
- If your problem is a general question about how to configure or use Docker,
  ask in [https://forums.docker.com](https://forums.docker.com) instead.
@z

@x
- If you have an idea for a new feature or behavior change in a specific aspect
  of Docker, or have found a bug in part of Docker, file that issue in
  the project's code repository.
@y
- If you have an idea for a new feature or behavior change in a specific aspect
  of Docker, or have found a bug in part of Docker, file that issue in
  the project's code repository.
@z

@x
## Contributing
@y
## Contributing
@z

@x
We value your documentation contributions, and we want to make it as easy
as possible to work in this repository. One of the first things to decide is
which branch to base your work on. If you get confused, just ask and we will
help. If a reviewer realizes you have based your work on the wrong branch, we'll
let you know so that you can rebase it.
@y
We value your documentation contributions, and we want to make it as easy
as possible to work in this repository. One of the first things to decide is
which branch to base your work on. If you get confused, just ask and we will
help. If a reviewer realizes you have based your work on the wrong branch, we'll
let you know so that you can rebase it.
@z

@x
>**Note**: To contribute code to Docker projects, see the
[Contribution guidelines](CONTRIBUTING.md).
@y
>**Note**: To contribute code to Docker projects, see the
[Contribution guidelines](CONTRIBUTING.md).
@z

@x
### Files not edited here
@y
### Files not edited here
@z

@x
Files and directories listed in the `path:` keys in
[`.NOT_EDITED_HERE.yaml`](.NOT_EDITED_HERE.yaml) are maintained in other
repositories and should not be edited in this one. Pull requests against these
files will be rejected. Make your edits to the files in the repository and path
in the `source:` key in the YAML file.
@y
Files and directories listed in the `path:` keys in
[`.NOT_EDITED_HERE.yaml`](.NOT_EDITED_HERE.yaml) are maintained in other
repositories and should not be edited in this one. Pull requests against these
files will be rejected. Make your edits to the files in the repository and path
in the `source:` key in the YAML file.
@z

@x
### Overall doc improvements
@y
### Overall doc improvements
@z

@x
Pull requests should be opened against the `master` branch, this includes:
@y
Pull requests should be opened against the `master` branch, this includes:
@z

@x
- Conceptual and task-based information not specific to new features
- Restructuring / rewriting
- Doc bug fixing
- Typos and grammar errors
@y
- Conceptual and task-based information not specific to new features
- Restructuring / rewriting
- Doc bug fixing
- Typos and grammar errors
@z

@x
> Do you enjoy creating graphics? Good graphics are key to great documentation,
> and we especially value contributions in this area.
@y
> Do you enjoy creating graphics? Good graphics are key to great documentation,
> and we especially value contributions in this area.
@z

@x
## Per-PR staging on GitHub
@y
## Per-PR staging on GitHub
@z

@x
For every PR against `master`, a staged version of the site is built using Netlify.
If the site builds, you will see **deploy/netlify — Deploy preview ready**.
Otherwise, you will see an error. Click **Details** to review the staged site or
the errors that prevented it from building. Review the staged site and amend your
commit if necessary. Reviewers will also check the staged site before merging the
PR, to protect the integrity of [https://docs.docker.com/](https://docs.docker.com/).
@y
For every PR against `master`, a staged version of the site is built using Netlify.
If the site builds, you will see **deploy/netlify — Deploy preview ready**.
Otherwise, you will see an error. Click **Details** to review the staged site or
the errors that prevented it from building. Review the staged site and amend your
commit if necessary. Reviewers will also check the staged site before merging the
PR, to protect the integrity of [https://docs.docker.com/](https://docs.docker.com/).
@z

@x
## Build and preview the docs locally
@y
## Build and preview the docs locally
@z

@x
On your local machine, clone this repo:
@y
On your local machine, clone this repo:
@z

@x
```bash
git clone --recursive https://github.com/docker/docker.github.io.git
cd docker.github.io
```
@y
```bash
git clone --recursive https://github.com/docker/docker.github.io.git
cd docker.github.io
```
@z

@x
Then build and run the documentation with [Docker Compose](https://docs.docker.com/compose/)
@y
Then build and run the documentation with [Docker Compose](https://docs.docker.com/compose/)
@z

@x
```bash
docker-compose up -d --build
```
@y
```bash
docker-compose up -d --build
```
@z

@x
> Docker Compose is included with [Docker Desktop](https://docs.docker.com/desktop/).
> If you don't have Docker Compose installed, [follow these installation instructions](https://docs.docker.com/compose/install/).
@y
> Docker Compose is included with [Docker Desktop](https://docs.docker.com/desktop/).
> If you don't have Docker Compose installed, [follow these installation instructions](https://docs.docker.com/compose/install/).
@z

@x
Once the container is built and running, visit [http://localhost:4000](http://localhost:4000)
in your web browser to view the docs.
@y
Once the container is built and running, visit [http://localhost:4000](http://localhost:4000)
in your web browser to view the docs.
@z

@x
To rebuild the docs after you made changes, run the `docker-compose up` command
again. This rebuilds the documentation, and updates the container with your changes:
@y
To rebuild the docs after you made changes, run the `docker-compose up` command
again. This rebuilds the documentation, and updates the container with your changes:
@z

@x
```bash
docker-compose up -d --build
```
@y
```bash
docker-compose up -d --build
```
@z

@x
Once the container is built and running, visit [http://localhost:4000](http://localhost:4000)
in your web browser to view the docs.
@y
Once the container is built and running, visit [http://localhost:4000](http://localhost:4000)
in your web browser to view the docs.
@z

@x
To stop the staging container, use the `docker-compose down` command:
@y
To stop the staging container, use the `docker-compose down` command:
@z

@x
```bash
docker-compose down
```
@y
```bash
docker-compose down
```
@z

@x
### Build the docs with deployment features enabled
@y
### Build the docs with deployment features enabled
@z

@x
The default configuration for local builds of the documentation disables some
features to allow for a shorter build-time. The following options differ between
local builds, and builds that are deployed to [docs.docker.com](https://docs.docker.com/):
@y
The default configuration for local builds of the documentation disables some
features to allow for a shorter build-time. The following options differ between
local builds, and builds that are deployed to [docs.docker.com](https://docs.docker.com/):
@z

@x
- search auto-completion, and generation of `js/metadata.json`
- google analytics
- page ratings
- `sitemap.xml` generation
- minification of stylesheets (`css/style.css`)
- adjusting "edit this page" links for content in other repositories
@y
- search auto-completion, and generation of `js/metadata.json`
- google analytics
- page ratings
- `sitemap.xml` generation
- minification of stylesheets (`css/style.css`)
- adjusting "edit this page" links for content in other repositories
@z

@x
If you want to contribute in these areas, you can perform a "production" build
locally.
@y
If you want to contribute in these areas, you can perform a "production" build
locally.
@z

@x
To preview the documentation with deployment features enabled, you need to set the
`JEKYLL_ENV` environment variable when building the documentation;
@y
To preview the documentation with deployment features enabled, you need to set the
`JEKYLL_ENV` environment variable when building the documentation;
@z

@x
```bash
JEKYLL_ENV=production docker-compose up --build
```
@y
```bash
JEKYLL_ENV=production docker-compose up --build
```
@z

@x
Once the container is built and running, visit [http://localhost:4000](http://localhost:4000)
in your web browser to view the docs.
@y
Once the container is built and running, visit [http://localhost:4000](http://localhost:4000)
in your web browser to view the docs.
@z

@x
To rebuild the docs after you make changes, repeat the steps above.
@y
To rebuild the docs after you make changes, repeat the steps above.
@z

@x
<!--
TODO re-enable auto-builds, or push master builds to Docker hub
## Read these docs offline
@y
<!--
TODO re-enable auto-builds, or push master builds to Docker hub
## Read these docs offline
@z

@x
To read the docs offline, you can use either a standalone container or a swarm service.
To see all available tags, go to [Docker Hub](https://docs.docker.com/docker-hub/).
@y
To read the docs offline, you can use either a standalone container or a swarm service.
To see all available tags, go to [Docker Hub](https://docs.docker.com/docker-hub/).
@z

@x
The following examples use the `latest` tag:
@y
The following examples use the `latest` tag:
@z

@x
- Run a single container:
@y
- Run a single container:
@z

@x
  ```bash
  docker run  -it -p 4000:4000 docs/docker.github.io:latest
  ```
@y
  ```bash
  docker run  -it -p 4000:4000 docs/docker.github.io:latest
  ```
@z

@x
- Run a swarm service:
@y
- Run a swarm service:
@z

@x
  ```bash
  docker service create -p 4000:4000 --name localdocs --replicas 1 docs/docker.github.io:latest
  ```
@y
  ```bash
  docker service create -p 4000:4000 --name localdocs --replicas 1 docs/docker.github.io:latest
  ```
@z

@x
  This example uses only a single replica, but you could run as many replicas as you'd like.
@y
  This example uses only a single replica, but you could run as many replicas as you'd like.
@z

@x
Either way, you can now access the docs at port 4000 on your Docker host.
-->
@y
Either way, you can now access the docs at port 4000 on your Docker host.
-->
@z

@x
## Important files
@y
## Important files
@z

@x
- `/_data/toc.yaml` defines the left-hand navigation for the docs
- `/js/docs.js` defines most of the docs-specific JS such as TOC generation and menu syncing
- `/css/style.scss` defines the docs-specific style rules
- `/_layouts/docs.html` is the HTML template file, which defines the header and footer, and includes all the JS/CSS that serves the docs content
@y
- `/_data/toc.yaml` defines the left-hand navigation for the docs
- `/js/docs.js` defines most of the docs-specific JS such as TOC generation and menu syncing
- `/css/style.scss` defines the docs-specific style rules
- `/_layouts/docs.html` is the HTML template file, which defines the header and footer, and includes all the JS/CSS that serves the docs content
@z

@x
## Relative linking for GitHub viewing
@y
## Relative linking for GitHub viewing
@z

@x
Feel free to link to `../foo.md` so that the docs are readable in GitHub, but keep in mind that Jekyll templating notation
`{% such as this %}` will render in raw text and not be processed. In general it's best to assume the docs are being read
directly on [https://docs.docker.com/](https://docs.docker.com/).
@y
Feel free to link to `../foo.md` so that the docs are readable in GitHub, but keep in mind that Jekyll templating notation
`{% such as this %}` will render in raw text and not be processed. In general it's best to assume the docs are being read
directly on [https://docs.docker.com/](https://docs.docker.com/).
@z

@x
### Testing changes and practical guidance
@y
### Testing changes and practical guidance
@z

@x
If you want to test a style change, or if you want to see how to achieve a
particular outcome with Markdown, Bootstrap, JQuery, or something else, have
a look at `test.md` (which renders in the site at `/test/`).
@y
If you want to test a style change, or if you want to see how to achieve a
particular outcome with Markdown, Bootstrap, JQuery, or something else, have
a look at `test.md` (which renders in the site at `/test/`).
@z

@x
### Per-page front-matter
@y
### Per-page front-matter
@z

@x
The front-matter of a given page is in a section at the top of the Markdown
file that starts and ends with three hyphens. It includes YAML content. The
following keys are supported. The title, description, and keywords are required.
@y
The front-matter of a given page is in a section at the top of the Markdown
file that starts and ends with three hyphens. It includes YAML content. The
following keys are supported. The title, description, and keywords are required.
@z

@x
| Key                    | Required  | Description                             |
|------------------------|-----------|-----------------------------------------|
| title                  | yes       | The page title. This is added to the HTML output as a `<h1>` level header. |
| description            | yes       | A sentence that describes the page contents. This is added to the HTML metadata. |
| keywords               | yes       | A comma-separated list of keywords. These are added to the HTML metadata. |
| redirect_from          | no        | A YAML list of pages which should redirect to THIS page. At build time, each page listed here is created as a HTML stub containing a 302 redirect to this page. |
| notoc                  | no        | Either `true` or `false`. If `true`, no in-page TOC is generated for the HTML output of this page. Defaults to `false`. Appropriate for some landing pages that have no in-page headings.|
| toc_min                | no        | Ignored if `notoc` is set to `true`. The minimum heading level included in the in-page TOC. Defaults to `2`, to show `<h2>` headings as the minimum. |
| toc_max                | no        | Ignored if `notoc` is set to `false`. The maximum heading level included in the in-page TOC. Defaults to `3`, to show `<h3>` headings. Set to the same as `toc_min` to only show `toc_min` level of headings. |
| no_ratings             | no        | Either `true` or `false`. Set to `true` to disable the page-ratings applet for this page. Defaults to `false`. |
| skip_read_time         | no        | Set to `true` to disable the 'Estimated reading time' banner for this page. |
| sitemap                | no        | Exclude the page from indexing by search engines. When set to `false`, the page is excluded from `sitemap.xml`, and a `<meta name="robots" content="noindex"/>` header is added to the page. |
@y
| Key                    | Required  | Description                             |
|------------------------|-----------|-----------------------------------------|
| title                  | yes       | The page title. This is added to the HTML output as a `<h1>` level header. |
| description            | yes       | A sentence that describes the page contents. This is added to the HTML metadata. |
| keywords               | yes       | A comma-separated list of keywords. These are added to the HTML metadata. |
| redirect_from          | no        | A YAML list of pages which should redirect to THIS page. At build time, each page listed here is created as a HTML stub containing a 302 redirect to this page. |
| notoc                  | no        | Either `true` or `false`. If `true`, no in-page TOC is generated for the HTML output of this page. Defaults to `false`. Appropriate for some landing pages that have no in-page headings.|
| toc_min                | no        | Ignored if `notoc` is set to `true`. The minimum heading level included in the in-page TOC. Defaults to `2`, to show `<h2>` headings as the minimum. |
| toc_max                | no        | Ignored if `notoc` is set to `false`. The maximum heading level included in the in-page TOC. Defaults to `3`, to show `<h3>` headings. Set to the same as `toc_min` to only show `toc_min` level of headings. |
| no_ratings             | no        | Either `true` or `false`. Set to `true` to disable the page-ratings applet for this page. Defaults to `false`. |
| skip_read_time         | no        | Set to `true` to disable the 'Estimated reading time' banner for this page. |
| sitemap                | no        | Exclude the page from indexing by search engines. When set to `false`, the page is excluded from `sitemap.xml`, and a `<meta name="robots" content="noindex"/>` header is added to the page. |
@z

@x
The following is an example of valid (but contrived) page metadata. The order of
the metadata elements in the front-matter is not important.
@y
The following is an example of valid (but contrived) page metadata. The order of
the metadata elements in the front-matter is not important.
@z

@x
```liquid
---
description: Instructions for installing Docker on Ubuntu
keywords: requirements, apt, installation, ubuntu, install, uninstall, upgrade, update
redirect_from:
- /engine/installation/ubuntulinux/
- /installation/ubuntulinux/
- /engine/installation/linux/ubuntulinux/
title: Get Docker for Ubuntu
toc_min: 1
toc_max: 6
skip_read_time: true
no_ratings: true
---
```
@y
```liquid
---
description: Instructions for installing Docker on Ubuntu
keywords: requirements, apt, installation, ubuntu, install, uninstall, upgrade, update
redirect_from:
- /engine/installation/ubuntulinux/
- /installation/ubuntulinux/
- /engine/installation/linux/ubuntulinux/
title: Get Docker for Ubuntu
toc_min: 1
toc_max: 6
skip_read_time: true
no_ratings: true
---
```
@z

@x
### Creating tabs
@y
### Creating tabs
@z

@x
The use of tabs, as on pages like [https://docs.docker.com/engine/api/](/engine/api/), requires
the use of HTML. The tabs use Bootstrap CSS/JS, so refer to those docs for more
advanced usage. For a basic horizontal tab set, copy/paste starting from this
code and implement from there. Keep an eye on those `href="#id"` and `id="id"`
references as you rename, add, and remove tabs.
@y
The use of tabs, as on pages like [https://docs.docker.com/engine/api/](/engine/api/), requires
the use of HTML. The tabs use Bootstrap CSS/JS, so refer to those docs for more
advanced usage. For a basic horizontal tab set, copy/paste starting from this
code and implement from there. Keep an eye on those `href="#id"` and `id="id"`
references as you rename, add, and remove tabs.
@z

@x
```html
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" data-target="#tab1">TAB 1 HEADER</a></li>
  <li><a data-toggle="tab" data-target="#tab2">TAB 2 HEADER</a></li>
</ul>
<div class="tab-content">
  <div id="tab1" class="tab-pane fade in active">TAB 1 CONTENT</div>
  <div id="tab2" class="tab-pane fade">TAB 2 CONTENT</div>
</div>
```
@y
```html
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" data-target="#tab1">TAB 1 HEADER</a></li>
  <li><a data-toggle="tab" data-target="#tab2">TAB 2 HEADER</a></li>
</ul>
<div class="tab-content">
  <div id="tab1" class="tab-pane fade in active">TAB 1 CONTENT</div>
  <div id="tab2" class="tab-pane fade">TAB 2 CONTENT</div>
</div>
```
@z

@x
For more info and a few more permutations, see `test.md`.
@y
For more info and a few more permutations, see `test.md`.
@z

@x
### Running in-page Javascript
@y
### Running in-page Javascript
@z

@x
If you need to run custom Javascript within a page, and it depends upon JQuery
or Bootstrap, make sure the `<script>` tags are at the very end of the page,
after all the content. Otherwise the script may try to run before JQuery and
Bootstrap JS are loaded.
@y
If you need to run custom Javascript within a page, and it depends upon JQuery
or Bootstrap, make sure the `<script>` tags are at the very end of the page,
after all the content. Otherwise the script may try to run before JQuery and
Bootstrap JS are loaded.
@z

@x
> **Note**: In general, this is a bad idea.
@y
> **Note**: In general, this is a bad idea.
@z

@x
### Images
@y
### Images
@z

@x
Don't forget to remove images that are no longer used. Keep the images sorted
in the local `images/` directory, with names that naturally group related images
together in alphabetical order. For instance prefer `settings-file-share.png`
and `settings-proxies.png` to `file-share-settings.png` and
`proxies-settings.png`. You may also use numbers, especially in the case of a
sequence, e.g., `run-only-the-images-you-trust-1.svg`
`run-only-the-images-you-trust-2.png` `run-only-the-images-you-trust-3.png`.
@y
Don't forget to remove images that are no longer used. Keep the images sorted
in the local `images/` directory, with names that naturally group related images
together in alphabetical order. For instance prefer `settings-file-share.png`
and `settings-proxies.png` to `file-share-settings.png` and
`proxies-settings.png`. You may also use numbers, especially in the case of a
sequence, e.g., `run-only-the-images-you-trust-1.svg`
`run-only-the-images-you-trust-2.png` `run-only-the-images-you-trust-3.png`.
@z

@x
When applicable, capture windows rather than rectangular regions. This
eliminates unpleasant background and saves the editors the need to crop.
@y
When applicable, capture windows rather than rectangular regions. This
eliminates unpleasant background and saves the editors the need to crop.
@z

@x
On Mac, capture windows without shadows. To this end, once you pressed
<kbd>Command-Shift-4</kbd>, press <kbd>Option</kbd> while clicking on the window. To disable
shadows once for all, run:
@y
On Mac, capture windows without shadows. To this end, once you pressed
<kbd>Command-Shift-4</kbd>, press <kbd>Option</kbd> while clicking on the window. To disable
shadows once for all, run:
@z

@x
```bash
$ defaults write com.apple.screencapture disable-shadow -bool TRUE
$ killall SystemUIServer  # restart it.
```
@y
```bash
$ defaults write com.apple.screencapture disable-shadow -bool TRUE
$ killall SystemUIServer  # restart it.
```
@z

@x
You can restore shadows later with `-bool FALSE`.
@y
You can restore shadows later with `-bool FALSE`.
@z

@x
In order to keep the Git repository light, _please_ compress the images
(losslessly). On Mac you may use [ImageOptim](https://imageoptim.com) for
instance. Be sure to compress the images *before* adding them to the
repository, doing it afterwards actually worsens the impact on the Git repo (but
still optimizes the bandwidth during browsing).
@y
In order to keep the Git repository light, _please_ compress the images
(losslessly). On Mac you may use [ImageOptim](https://imageoptim.com) for
instance. Be sure to compress the images *before* adding them to the
repository, doing it afterwards actually worsens the impact on the Git repo (but
still optimizes the bandwidth during browsing).
@z

@x
## Copyright and license
@y
## Copyright and license
@z

@x
Copyright 2013-2021 Docker, inc, released under the Apache 2.0 license.
@y
Copyright 2013-2021 Docker, inc, released under the Apache 2.0 license.
@z
