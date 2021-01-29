%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: "Configure CI/CD for your application"
keywords: python, CI/CD, local, development
description: Learn how to Configure CI/CD for your application
---
@y
---
title: "Configure CI/CD for your application"
keywords: python, CI/CD, local, development
description: Learn how to Configure CI/CD for your application
---
@z

@x
{% include_relative nav.html selected="4" %}
@y
{% include_relative nav.html selected="4" %}
@z

@x
This page guides you through the process of setting up a GitHub Action CI/CD pipeline with Docker containers. Before setting up a new pipeline, we recommend that you take a look at [Ben's blog](https://www.docker.com/blog/best-practices-for-using-docker-hub-for-ci-cd/){:target="_blank" rel="noopener" class="_"} on CI/CD best practices .
@y
This page guides you through the process of setting up a GitHub Action CI/CD pipeline with Docker containers. Before setting up a new pipeline, we recommend that you take a look at [Ben's blog](https://www.docker.com/blog/best-practices-for-using-docker-hub-for-ci-cd/){:target="_blank" rel="noopener" class="_"} on CI/CD best practices .
@z

@x
This guide contains instructions on how to:
@y
This guide contains instructions on how to:
@z

@x
1. Use a sample Docker project as an example to configure GitHub Actions
2. Set up the GitHub Actions workflow
3. Optimize your workflow to reduce the number of pull requests and the total build time, and finally,
4. Push only specific versions to Docker Hub.
@y
1. Use a sample Docker project as an example to configure GitHub Actions
2. Set up the GitHub Actions workflow
3. Optimize your workflow to reduce the number of pull requests and the total build time, and finally,
4. Push only specific versions to Docker Hub.
@z

@x
## Set up a Docker project
@y
## Set up a Docker project
@z

@x
Let’s get started. This guide uses a simple Docker project as an example. The [SimpleWhaleDemo](https://github.com/usha-mandya/SimpleWhaleDemo){:target="_blank" rel="noopener" class="_"} repository contains an Ngnix alpine image. You can either clone this repository, or use your own Docker project.
@y
Let’s get started. This guide uses a simple Docker project as an example. The [SimpleWhaleDemo](https://github.com/usha-mandya/SimpleWhaleDemo){:target="_blank" rel="noopener" class="_"} repository contains an Ngnix alpine image. You can either clone this repository, or use your own Docker project.
@z

@x
![SimpleWhaleDemo](../../ci-cd/images/simplewhaledemo.png){:width="500px"}
@y
![SimpleWhaleDemo](../../ci-cd/images/simplewhaledemo.png){:width="500px"}
@z

@x
Before we start, ensure you can access [Docker Hub](https://hub.docker.com/) from any workflows you create. To do this:
@y
Before we start, ensure you can access [Docker Hub](https://hub.docker.com/) from any workflows you create. To do this:
@z

@x
1. Add your Docker ID as a secret to GitHub. Navigate to your GitHub repository and click **Settings** > **Secrets** > **New secret**.
@y
1. Add your Docker ID as a secret to GitHub. Navigate to your GitHub repository and click **Settings** > **Secrets** > **New secret**.
@z

@x
2. Create a new secret with the name `DOCKER_HUB_USERNAME` and your Docker ID as value.
@y
2. Create a new secret with the name `DOCKER_HUB_USERNAME` and your Docker ID as value.
@z

@x
3. Create a new Personal Access Token (PAT). To create a new token, go to [Docker Hub Settings](https://hub.docker.com/settings/security) and then click **New Access Token**.
@y
3. Create a new Personal Access Token (PAT). To create a new token, go to [Docker Hub Settings](https://hub.docker.com/settings/security) and then click **New Access Token**.
@z

@x
4. Let’s call this token **simplewhaleci**.
@y
4. Let’s call this token **simplewhaleci**.
@z

@x
    ![New access token](../../ci-cd/images/github-access-token.png){:width="500px"}
@y
    ![New access token](../../ci-cd/images/github-access-token.png){:width="500px"}
@z

@x
5. Now, add this Personal Access Token (PAT) as a second secret into the GitHub secrets UI with the name `DOCKER_HUB_ACCESS_TOKEN`.
@y
5. Now, add this Personal Access Token (PAT) as a second secret into the GitHub secrets UI with the name `DOCKER_HUB_ACCESS_TOKEN`.
@z

@x
    ![GitHub Secrets](../../ci-cd/images/github-secrets.png){:width="500px"}
@y
    ![GitHub Secrets](../../ci-cd/images/github-secrets.png){:width="500px"}
@z

@x
## Set up the GitHub Actions workflow
@y
## Set up the GitHub Actions workflow
@z

@x
In the previous section, we created a PAT and added it to GitHub to ensure we can access Docker Hub from any workflow. Now, let’s set up our GitHub Actions workflow to build and store our images in Hub. We can achieve this by creating two Docker actions:
@y
In the previous section, we created a PAT and added it to GitHub to ensure we can access Docker Hub from any workflow. Now, let’s set up our GitHub Actions workflow to build and store our images in Hub. We can achieve this by creating two Docker actions:
@z

@x
1. The first action enables us to log in to Docker Hub using the secrets we stored in the GitHub Repository.
2. The second one is the build and push action.
@y
1. The first action enables us to log in to Docker Hub using the secrets we stored in the GitHub Repository.
2. The second one is the build and push action.
@z

@x
In this example, let us set the push flag to `true` as we also want to push. We’ll then add a tag to specify to always go to the latest version. Lastly, we’ll echo the image digest to see what was pushed.
@y
In this example, let us set the push flag to `true` as we also want to push. We’ll then add a tag to specify to always go to the latest version. Lastly, we’ll echo the image digest to see what was pushed.
@z

@x
To set up the workflow:
@y
To set up the workflow:
@z

@x
1. Go to your repository in GitHub and then click **Actions** > **New workflow**.
2. Click **set up a workflow yourself** and add the following content:
@y
1. Go to your repository in GitHub and then click **Actions** > **New workflow**.
2. Click **set up a workflow yourself** and add the following content:
@z

@x
First, we will name this workflow:
@y
First, we will name this workflow:
@z

@x
```yaml
name: CI to Docker Hub
 ```
@y
```yaml
name: CI to Docker Hub
 ```
@z

@x
Then, we will choose when we run this workflow. In our example, we are going to do it for every push against the main branch of our project:
@y
Then, we will choose when we run this workflow. In our example, we are going to do it for every push against the main branch of our project:
@z

@x
```yaml
on:
  push:
    branches: [ main ]
```
@y
```yaml
on:
  push:
    branches: [ main ]
```
@z

@x
Now, we need to specify what we actually want to happen within our action (what jobs), we are going to add our build one and select that it runs on the latest Ubuntu instances available:
@y
Now, we need to specify what we actually want to happen within our action (what jobs), we are going to add our build one and select that it runs on the latest Ubuntu instances available:
@z

@x
```yaml
jobs:
@y
```yaml
jobs:
@z

@x
  build:
    runs-on: ubuntu-latest
```
@y
  build:
    runs-on: ubuntu-latest
```
@z

@x
Now, we can add the steps required. The first one checks-out our repository under `$GITHUB_WORKSPACE`, so our workflow can access it. The second is to use our PAT and username to log into Docker Hub. The third is the Builder, the action  uses BuildKit under the hood through a simple Buildx action which we will also setup
@y
Now, we can add the steps required. The first one checks-out our repository under `$GITHUB_WORKSPACE`, so our workflow can access it. The second is to use our PAT and username to log into Docker Hub. The third is the Builder, the action  uses BuildKit under the hood through a simple Buildx action which we will also setup
@z

@x
{% raw %}
```yaml
    steps:
@y
{% raw %}
```yaml
    steps:
@z

@x
      - name: Check Out Repo 
        uses: actions/checkout@v2
@y
      - name: Check Out Repo 
        uses: actions/checkout@v2
@z

@x
      - name: Login to Docker Hub
        uses: docker/login-action@v1
        with:
          username: ${{ secrets.DOCKER_HUB_USERNAME }}
          password: ${{ secrets.DOCKER_HUB_ACCESS_TOKEN }}
@y
      - name: Login to Docker Hub
        uses: docker/login-action@v1
        with:
          username: ${{ secrets.DOCKER_HUB_USERNAME }}
          password: ${{ secrets.DOCKER_HUB_ACCESS_TOKEN }}
@z

@x
      - name: Set up Docker Buildx
        id: buildx
        uses: docker/setup-buildx-action@v1
@y
      - name: Set up Docker Buildx
        id: buildx
        uses: docker/setup-buildx-action@v1
@z

@x
      - name: Build and push
        id: docker_build
        uses: docker/build-push-action@v2
        with:
          context: ./
          file: ./Dockerfile
          push: true
          tags: ushamandya/simplewhale:latest
@y
      - name: Build and push
        id: docker_build
        uses: docker/build-push-action@v2
        with:
          context: ./
          file: ./Dockerfile
          push: true
          tags: ushamandya/simplewhale:latest
@z

@x
      - name: Image digest
        run: echo ${{ steps.docker_build.outputs.digest }}
```
{% endraw %}
@y
      - name: Image digest
        run: echo ${{ steps.docker_build.outputs.digest }}
```
{% endraw %}
@z

@x
Now, let the workflow run for the first time and then tweak the Dockerfile to make sure the CI is running and pushing the new image changes:
@y
Now, let the workflow run for the first time and then tweak the Dockerfile to make sure the CI is running and pushing the new image changes:
@z

@x
![CI to Docker Hub](../../ci-cd/images/ci-to-hub.png){:width="500px"}
@y
![CI to Docker Hub](../../ci-cd/images/ci-to-hub.png){:width="500px"}
@z

@x
## Optimizing the workflow
@y
## Optimizing the workflow
@z

@x
Next, let’s look at how we can optimize the GitHub Actions workflow through build cache. This has two main advantages:
@y
Next, let’s look at how we can optimize the GitHub Actions workflow through build cache. This has two main advantages:
@z

@x
1. Build cache reduces the build time as it will not have to re-download all of the images, and
2. It also reduces the number of pulls we complete against Docker Hub. We need to make use of GitHub cache to make use of this.
@y
1. Build cache reduces the build time as it will not have to re-download all of the images, and
2. It also reduces the number of pulls we complete against Docker Hub. We need to make use of GitHub cache to make use of this.
@z

@x
Let us set up a Builder with a build cache. First, we need to set up cache for the builder.  In this example, let us add the path and keys to store this under using GitHub cache for this.
@y
Let us set up a Builder with a build cache. First, we need to set up cache for the builder.  In this example, let us add the path and keys to store this under using GitHub cache for this.
@z

@x
{% raw %}
```yaml
@y
{% raw %}
```yaml
@z

@x
      - name: Cache Docker layers
        uses: actions/cache@v2
        with:
          path: /tmp/.buildx-cache
          key: ${{ runner.os }}-buildx-${{ github.sha }}
          restore-keys: |
            ${{ runner.os }}-buildx-
```
{% endraw %}
@y
      - name: Cache Docker layers
        uses: actions/cache@v2
        with:
          path: /tmp/.buildx-cache
          key: ${{ runner.os }}-buildx-${{ github.sha }}
          restore-keys: |
            ${{ runner.os }}-buildx-
```
{% endraw %}
@z

@x
And lastly, after adding the builder and build cache snippets to the top of the Actions file, we need to add some extra attributes to the build and push step. This involves:
@y
And lastly, after adding the builder and build cache snippets to the top of the Actions file, we need to add some extra attributes to the build and push step. This involves:
@z

@x
Setting up the builder to use the output of the buildx step, and then
Using the cache we set up earlier for it to store to and to retrieve
@y
Setting up the builder to use the output of the buildx step, and then
Using the cache we set up earlier for it to store to and to retrieve
@z

@x
{% raw %}
```yaml
      - name: Login to Docker Hub
        uses: docker/login-action@v1
        with:
          username: ${{ secrets.DOCKER_HUB_USERNAME }}
          password: ${{ secrets.DOCKER_HUB_ACCESS_TOKEN }}
      - name: Build and push
        id: docker_build
        uses: docker/build-push-action@v2
        with:
          context: ./
          file: ./Dockerfile
          builder: ${{ steps.buildx.outputs.name }}
          push: true
          tags:  ushamandya/simplewhale:latest
          cache-from: type=local,src=/tmp/.buildx-cache
          cache-to: type=local,dest=/tmp/.buildx-cache
      - name: Image digest
        run: echo ${{ steps.docker_build.outputs.digest }}
```
{% endraw %}
@y
{% raw %}
```yaml
      - name: Login to Docker Hub
        uses: docker/login-action@v1
        with:
          username: ${{ secrets.DOCKER_HUB_USERNAME }}
          password: ${{ secrets.DOCKER_HUB_ACCESS_TOKEN }}
      - name: Build and push
        id: docker_build
        uses: docker/build-push-action@v2
        with:
          context: ./
          file: ./Dockerfile
          builder: ${{ steps.buildx.outputs.name }}
          push: true
          tags:  ushamandya/simplewhale:latest
          cache-from: type=local,src=/tmp/.buildx-cache
          cache-to: type=local,dest=/tmp/.buildx-cache
      - name: Image digest
        run: echo ${{ steps.docker_build.outputs.digest }}
```
{% endraw %}
@z

@x
Now, run the workflow again and verify that it uses the build cache.
@y
Now, run the workflow again and verify that it uses the build cache.
@z

@x
## Push tagged versions to Docker Hub
@y
## Push tagged versions to Docker Hub
@z

@x
Earlier, we learnt how to set up a GitHub Actions workflow to a  Docker project, how to optimize the workflow by setting up a builder with build cache. Let’s now look at how we can improve it further. We can do this by adding the ability to have tagged versions behave differently to all commits to master. This means, only specific versions are pushed, instead of every commit updating the latest version on Docker Hub.
@y
Earlier, we learnt how to set up a GitHub Actions workflow to a  Docker project, how to optimize the workflow by setting up a builder with build cache. Let’s now look at how we can improve it further. We can do this by adding the ability to have tagged versions behave differently to all commits to master. This means, only specific versions are pushed, instead of every commit updating the latest version on Docker Hub.
@z

@x
You can consider this approach to have your commits go to a local registry to then use in nightly tests. By doing this, you can always test what is latest while reserving your tagged versions for release to Docker Hub.
@y
You can consider this approach to have your commits go to a local registry to then use in nightly tests. By doing this, you can always test what is latest while reserving your tagged versions for release to Docker Hub.
@z

@x
This involves two steps:
@y
This involves two steps:
@z

@x
1. Modifying the GitHub workflow to only push commits with specific tags to Docker Hub
2. Setting up a GitHub Actions file to store the latest commit as an image in the GitHub registry
@y
1. Modifying the GitHub workflow to only push commits with specific tags to Docker Hub
2. Setting up a GitHub Actions file to store the latest commit as an image in the GitHub registry
@z

@x
First, let us modify our existing GitHub workflow to only push to Hub if there’s a particular tag. For example:
@y
First, let us modify our existing GitHub workflow to only push to Hub if there’s a particular tag. For example:
@z

@x
{% raw %}
```yaml
on:
  push:
    tags:
      - "v*.*.*"
```
{% endraw %}
@y
{% raw %}
```yaml
on:
  push:
    tags:
      - "v*.*.*"
```
{% endraw %}
@z

@x
This ensures that the main CI will only trigger if we tag our commits with `V.n.n.n.` Let’s test this. For example, run the following command:
@y
This ensures that the main CI will only trigger if we tag our commits with `V.n.n.n.` Let’s test this. For example, run the following command:
@z

@x
```bash
git tag -a v1.0.2
git push origin v1.0.2
```
@y
```bash
git tag -a v1.0.2
git push origin v1.0.2
```
@z

@x
Now, go to GitHub and check your Actions
@y
Now, go to GitHub and check your Actions
@z

@x
![Push tagged version](../../ci-cd/images/push-tagged-version.png){:width="500px"}
@y
![Push tagged version](../../ci-cd/images/push-tagged-version.png){:width="500px"}
@z

@x
Now, let’s set up a second GitHub action file to store our latest commit as an image in the GitHub registry. You may want to do this to:
@y
Now, let’s set up a second GitHub action file to store our latest commit as an image in the GitHub registry. You may want to do this to:
@z

@x
1. Run your nightly tests or recurring tests, or
2. To share work in progress images with colleagues.
@y
1. Run your nightly tests or recurring tests, or
2. To share work in progress images with colleagues.
@z

@x
Let’s clone our previous GitHub action and add back in our previous logic for all pushes. This will mean we have two workflow files, our previous one and our new one we will now work on.
Next, change your Docker Hub login to a GitHub container registry login:
@y
Let’s clone our previous GitHub action and add back in our previous logic for all pushes. This will mean we have two workflow files, our previous one and our new one we will now work on.
Next, change your Docker Hub login to a GitHub container registry login:
@z

@x
{% raw %}
```yaml
        if: github.event_name != 'pull_request'
        uses: docker/login-action@v1
        with:
        registry: ghcr.io
          username: ${{ github.repository_owner }}
          password: ${{ secrets.GHCR_TOKEN }}
```
{% endraw %}
@y
{% raw %}
```yaml
        if: github.event_name != 'pull_request'
        uses: docker/login-action@v1
        with:
        registry: ghcr.io
          username: ${{ github.repository_owner }}
          password: ${{ secrets.GHCR_TOKEN }}
```
{% endraw %}
@z

@x
Remember to change how the image is tagged. The following example keeps ‘latest’ as the only tag. However, you can add any logic to this if you prefer:
@y
Remember to change how the image is tagged. The following example keeps ‘latest’ as the only tag. However, you can add any logic to this if you prefer:
@z

@x
{% raw %}
```yaml
  tags: ghcr.io/${{ github.repository_owner }}/simplewhale:latest
```
{% endraw %}
@y
{% raw %}
```yaml
  tags: ghcr.io/${{ github.repository_owner }}/simplewhale:latest
```
{% endraw %}
@z

@x
![Update tagged images](../../ci-cd/images/ghcr-logic.png){:width="500px"}
@y
![Update tagged images](../../ci-cd/images/ghcr-logic.png){:width="500px"}
@z

@x
Now, we will have two different flows: one for our changes to master, and one for our pull requests. Next, we need to modify what we had before to ensure we are pushing our PRs to the GitHub registry rather than to Docker Hub.
@y
Now, we will have two different flows: one for our changes to master, and one for our pull requests. Next, we need to modify what we had before to ensure we are pushing our PRs to the GitHub registry rather than to Docker Hub.
@z

@x
## Next steps
@y
## Next steps
@z

@x
In this module, you have learnt how to set up GitHub Actions workflow to an existing Docker project, optimize your workflow to improve build times and reduce the number of pull requests, and finally, we learnt how to push only specific versions to Docker Hub. You can also set up nightly tests against the latest tag, test each PR, or do something more elegant with the tags we are using and make use of the Git tag for the same tag in our image.
@y
In this module, you have learnt how to set up GitHub Actions workflow to an existing Docker project, optimize your workflow to improve build times and reduce the number of pull requests, and finally, we learnt how to push only specific versions to Docker Hub. You can also set up nightly tests against the latest tag, test each PR, or do something more elegant with the tags we are using and make use of the Git tag for the same tag in our image.
@z

@x
You can also consider deploying your application to the cloud. For detailed instructions, see:
@y
You can also consider deploying your application to the cloud. For detailed instructions, see:
@z

@x
[Deploy your application to the cloud](deploy.md){: .button .outline-btn}
@y
[Deploy your application to the cloud](deploy.md){: .button .outline-btn}
@z

@x
## Feedback
@y
## Feedback
@z

@x
Help us improve this topic by providing your feedback. Let us know what you think by creating an issue in the [Docker Docs ](https://github.com/docker/docker.github.io/issues/new?title=[Python%20docs%20feedback]){:target="_blank" rel="noopener" class="_"} GitHub repository. Alternatively, [create a PR](https://github.com/docker/docker.github.io/pulls){:target="_blank" rel="noopener" class="_"} to suggest updates.
@y
Help us improve this topic by providing your feedback. Let us know what you think by creating an issue in the [Docker Docs ](https://github.com/docker/docker.github.io/issues/new?title=[Python%20docs%20feedback]){:target="_blank" rel="noopener" class="_"} GitHub repository. Alternatively, [create a PR](https://github.com/docker/docker.github.io/pulls){:target="_blank" rel="noopener" class="_"} to suggest updates.
@z

@x
<br />
@y
<br />
@z
