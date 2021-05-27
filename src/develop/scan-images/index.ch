%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Best practices for scanning images
description: Scan images best practices guide
keywords: docker scan, scan, images, snyk, vulnerability
---
@y
---
title: Best practices for scanning images
description: Scan images best practices guide
keywords: docker scan, scan, images, snyk, vulnerability
---
@z

@x
This page contains recommendations and best practices for scanning and building secure images.
@y
This page contains recommendations and best practices for scanning and building secure images.
@z

@x
Docker and Snyk have partnered together to bring security natively into the development workflow by providing a simple and streamlined approach for developers to build and deploy secure containers. Container security spans multiple teams - developers, security, and operations. Additionally, there are multiple layers of security that apply to containers:
@y
Docker and Snyk have partnered together to bring security natively into the development workflow by providing a simple and streamlined approach for developers to build and deploy secure containers. Container security spans multiple teams - developers, security, and operations. Additionally, there are multiple layers of security that apply to containers:
@z

@x
- The container image and the software running inside
- The interaction between a container, the host operating system, and other containers on the same host
- The host operating system
- Container networking and storage
@y
- The container image and the software running inside
- The interaction between a container, the host operating system, and other containers on the same host
- The host operating system
- Container networking and storage
@z

@x
Including the vulnerability scanning options into the Docker platform extends the existing, familiar process of vulnerability detection, and allows for remediation of vulnerabilities earlier in the development process. This process of simple and continuous checks leads to fewer vulnerabilities checked into Docker Hub, a shorter CI cycle, and faster and more reliable deployment into production.
@y
Including the vulnerability scanning options into the Docker platform extends the existing, familiar process of vulnerability detection, and allows for remediation of vulnerabilities earlier in the development process. This process of simple and continuous checks leads to fewer vulnerabilities checked into Docker Hub, a shorter CI cycle, and faster and more reliable deployment into production.
@z

@x
![Developer's security journey](/images/dev-security-journey.png){:width="700px"}
@y
![Developer's security journey](/images/dev-security-journey.png){:width="700px"}
@z

@x
## Scanning images
@y
## Scanning images
@z

@x
You can trigger scans automatically by pushing an image to Docker Hub. You can achieve this either through the `docker scan` command in the CLI, or through Docker Hub.
@y
You can trigger scans automatically by pushing an image to Docker Hub. You can achieve this either through the `docker scan` command in the CLI, or through Docker Hub.
@z

@x
### Scan using the CLI
@y
### Scan using the CLI
@z

@x
After you’ve built an image and before you push your image to Docker Hub, run the `docker scan` command. For detailed instructions on how to scan images using the CLI, see [docker scan](../../engine/scan/index.md).
@y
After you’ve built an image and before you push your image to Docker Hub, run the `docker scan` command. For detailed instructions on how to scan images using the CLI, see [docker scan](../../engine/scan/index.md).
@z

@x
![Docker Scan CL](/images/docker-scan-cli.png){:width="700px"}
@y
![Docker Scan CL](/images/docker-scan-cli.png){:width="700px"}
@z

@x
### Scan using Docker Hub
@y
### Scan using Docker Hub
@z

@x
You can trigger scans, view, and inspect vulnerabilities through Docker Hub. For detailed information, see [Hub Vulnerability Scanning](../../docker-hub/vulnerability-scanning.md).
@y
You can trigger scans, view, and inspect vulnerabilities through Docker Hub. For detailed information, see [Hub Vulnerability Scanning](../../docker-hub/vulnerability-scanning.md).
@z

@x
> **Note**
>
> Docker Hub Vulnerability Scanning is available for developers subscribed to a Pro or a Team plan. For more information about the pricing plans, see [Docker Pricing](https://www.docker.com/pricing?utm_source=docker&utm_medium=webreferral&utm_campaign=docs_driven_upgrade){:target="_blank" rel="noopener" class="_"}.
@y
> **Note**
>
> Docker Hub Vulnerability Scanning is available for developers subscribed to a Pro or a Team plan. For more information about the pricing plans, see [Docker Pricing](https://www.docker.com/pricing?utm_source=docker&utm_medium=webreferral&utm_campaign=docs_driven_upgrade){:target="_blank" rel="noopener" class="_"}.
@z

@x
![Hub Vulnerability scanning](/images/hub-hvs.png){:width="700px"}
@y
![Hub Vulnerability scanning](/images/hub-hvs.png){:width="700px"}
@z

@x
### View the scan summary in Docker Desktop
@y
### View the scan summary in Docker Desktop
@z

@x
Docker Desktop provides you a snapshot of your vulnerabilities status on the Docker Dashboard. Hover over the image and click **View in Hub** to view a detailed vulnerability report in Docker Hub.
@y
Docker Desktop provides you a snapshot of your vulnerabilities status on the Docker Dashboard. Hover over the image and click **View in Hub** to view a detailed vulnerability report in Docker Hub.
@z

@x
![Hub Vulnerability scan summary](/images/hvs-scan-summary.png){:width="700px"}
@y
![Hub Vulnerability scan summary](/images/hvs-scan-summary.png){:width="700px"}
@z

@x
## Best practices
@y
## Best practices
@z

@x
As a developer, you can take a few simple steps to improve the security of your container. This includes:
@y
As a developer, you can take a few simple steps to improve the security of your container. This includes:
@z

@x
1. Choosing the right base image from a trusted source and keeping it small
2. Using multi-stage builds
3. Rebuilding images
4. Scanning images during development
5. Scanning images during production
@y
1. Choosing the right base image from a trusted source and keeping it small
2. Using multi-stage builds
3. Rebuilding images
4. Scanning images during development
5. Scanning images during production
@z

@x
Now, let’s take a detailed look at each of these best practices:
@y
Now, let’s take a detailed look at each of these best practices:
@z

@x
### Choose the right base image
@y
### Choose the right base image
@z

@x
The first step towards achieving a secure image is to choose the right base image. When choosing an image, ensure it is built from a trusted source and keep it small.
@y
The first step towards achieving a secure image is to choose the right base image. When choosing an image, ensure it is built from a trusted source and keep it small.
@z

@x
Docker Hub has more than 8.3 million repositories. Some of these images are [Official Images](../../docker-hub/official_images.md), which are published by Docker as a curated set of Docker open source and drop-in solution repositories. Docker also offers images that are published by [Verified Publishers](../../docker-hub/publish/index.md). These high-quality images are published and maintained by the organizations partnering with Docker, with Docker verifying the authenticity of the content in their repositories. When you pick your base image, look out for the **Official Image** and **Verified Publisher** badges.
@y
Docker Hub has more than 8.3 million repositories. Some of these images are [Official Images](../../docker-hub/official_images.md), which are published by Docker as a curated set of Docker open source and drop-in solution repositories. Docker also offers images that are published by [Verified Publishers](../../docker-hub/publish/index.md). These high-quality images are published and maintained by the organizations partnering with Docker, with Docker verifying the authenticity of the content in their repositories. When you pick your base image, look out for the **Official Image** and **Verified Publisher** badges.
@z

@x
![Docker Hub Official and Verified Publisher images](/images/hub-official-images.png){:width="700px"}
@y
![Docker Hub Official and Verified Publisher images](/images/hub-official-images.png){:width="700px"}
@z

@x
When building your own image from a Dockerfile, ensure you choose a minimal base image that matches your requirements. A smaller base image not just offers portability and fast downloads, but also shrinks the size of your image and minimizes the number of vulnerabilities introduced through the dependencies.
@y
When building your own image from a Dockerfile, ensure you choose a minimal base image that matches your requirements. A smaller base image not just offers portability and fast downloads, but also shrinks the size of your image and minimizes the number of vulnerabilities introduced through the dependencies.
@z

@x
We also recommend that you use two types of base images: the first image for development and unit testing and the second one for testing during the latest stages of development and production. In the later stages of development, your image may not even require some build tools such as compilers, build systems, or any debugging tools. A small image with minimal dependencies can considerably lower the attack surface.
@y
We also recommend that you use two types of base images: the first image for development and unit testing and the second one for testing during the latest stages of development and production. In the later stages of development, your image may not even require some build tools such as compilers, build systems, or any debugging tools. A small image with minimal dependencies can considerably lower the attack surface.
@z

@x
### Use multi-stage builds
@y
### Use multi-stage builds
@z

@x
Multi-stage builds are designed to create an optimized Dockerfile that is easy to read and maintain. With a multi-stage build, you can use multiple images and selectively copy only the artifacts needed from a particular image.
@y
Multi-stage builds are designed to create an optimized Dockerfile that is easy to read and maintain. With a multi-stage build, you can use multiple images and selectively copy only the artifacts needed from a particular image.
@z

@x
You can use multiple `FROM` statements in your Dockerfile, and you can use a different base image for each `FROM`. You can also selectively copy artifacts from one stage to another, leaving behind things you don’t need in the final image. This can result in a concise final image.
@y
You can use multiple `FROM` statements in your Dockerfile, and you can use a different base image for each `FROM`. You can also selectively copy artifacts from one stage to another, leaving behind things you don’t need in the final image. This can result in a concise final image.
@z

@x
This method of creating a tiny image does not only significantly reduce complexity, but also the change of implementing vulnerable artifacts in your image. Therefore, instead of images that are built on images, that again are built on other images, multi-stage builds allow you to 'cherry pick' your artifacts without inheriting the vulnerabilities from the base images on which they rely on.
@y
This method of creating a tiny image does not only significantly reduce complexity, but also the change of implementing vulnerable artifacts in your image. Therefore, instead of images that are built on images, that again are built on other images, multi-stage builds allow you to 'cherry pick' your artifacts without inheriting the vulnerabilities from the base images on which they rely on.
@z

@x
For detailed information on how to configure multi-stage builds, see [multi-stage builds](../develop-images/multistage-build.md).
@y
For detailed information on how to configure multi-stage builds, see [multi-stage builds](../develop-images/multistage-build.md).
@z

@x
### Rebuild images
@y
### Rebuild images
@z

@x
A Docker image is built  from a Dockerfile. A Dockerfile contains a set of instructions which allows you to automate the steps you would normally (manually) take to create an image. Additionally, it can include some imported libraries and install custom software. These appear as instructions in the Dockerfile.
@y
A Docker image is built  from a Dockerfile. A Dockerfile contains a set of instructions which allows you to automate the steps you would normally (manually) take to create an image. Additionally, it can include some imported libraries and install custom software. These appear as instructions in the Dockerfile.
@z

@x
Building your image is a snapshot of that image, at that moment in time. When you depend on a base image without a tag, you’ll get a different base image every time you rebuild. Also, when you install packages using a package installer, rebuilding can change the image drastically. For example, a Dockerfile containing the following entries can potentially have a different binary with every rebuild.
@y
Building your image is a snapshot of that image, at that moment in time. When you depend on a base image without a tag, you’ll get a different base image every time you rebuild. Also, when you install packages using a package installer, rebuilding can change the image drastically. For example, a Dockerfile containing the following entries can potentially have a different binary with every rebuild.
@z

@x
```dockerfile
FROM ubuntu:latest
RUN apt-get -y update && apt-get install -y python
```
@y
```dockerfile
FROM ubuntu:latest
RUN apt-get -y update && apt-get install -y python
```
@z

@x
We recommend that you rebuild your Docker image regularly to prevent known vulnerabilities that have been addressed. When rebuilding, use the option `--no-cache` to avoid cache hits and to ensure a fresh download.
@y
We recommend that you rebuild your Docker image regularly to prevent known vulnerabilities that have been addressed. When rebuilding, use the option `--no-cache` to avoid cache hits and to ensure a fresh download.
@z

@x
For example:
@y
For example:
@z

@x
```console
$ docker build --no-cache -t myImage:myTag myPath/
```
@y
```console
$ docker build --no-cache -t myImage:myTag myPath/
```
@z

@x
Consider the following best practices when rebuilding an image:
@y
Consider the following best practices when rebuilding an image:
@z

@x
- Each container should have only one responsibility.
- Containers should be immutable, lightweight, and fast.
- Don’t store data in your container. Use a shared data store instead.
- Containers should be easy to destroy and rebuild.
- Use a small base image (such as Linux Alpine).  Smaller images are easier to distribute.
- Avoid installing unnecessary packages. This keeps the image clean and safe.
- Avoid cache hits when building.
- Auto-scan your image before deploying to avoid pushing vulnerable containers to production.
- Scan your images daily both during development and production for vulnerabilities Based on that, automate the rebuild of images if necessary.
@y
- Each container should have only one responsibility.
- Containers should be immutable, lightweight, and fast.
- Don’t store data in your container. Use a shared data store instead.
- Containers should be easy to destroy and rebuild.
- Use a small base image (such as Linux Alpine).  Smaller images are easier to distribute.
- Avoid installing unnecessary packages. This keeps the image clean and safe.
- Avoid cache hits when building.
- Auto-scan your image before deploying to avoid pushing vulnerable containers to production.
- Scan your images daily both during development and production for vulnerabilities Based on that, automate the rebuild of images if necessary.
@z

@x
For detailed best practices and methods for building efficient images, see [Dockerfile best practices](../develop-images/dockerfile_best-practices.md).
@y
For detailed best practices and methods for building efficient images, see [Dockerfile best practices](../develop-images/dockerfile_best-practices.md).
@z

@x
### Scan images during development
@y
### Scan images during development
@z

@x
Creating an image from a Dockerfile and even rebuilding an image can introduce new vulnerabilities in your system. Scanning your Docker images during development should be part of your workflow to catch vulnerabilities earlier in your development. You should scan images at all stages of the development cycle, and ideally consider automating scans. For example, consider configuring automated scans during the build process, before pushing the image to Docker Hub (or any other registry), and finally before pushing it to a production environment.
@y
Creating an image from a Dockerfile and even rebuilding an image can introduce new vulnerabilities in your system. Scanning your Docker images during development should be part of your workflow to catch vulnerabilities earlier in your development. You should scan images at all stages of the development cycle, and ideally consider automating scans. For example, consider configuring automated scans during the build process, before pushing the image to Docker Hub (or any other registry), and finally before pushing it to a production environment.
@z

@x
### Scan images during production
@y
### Scan images during production
@z

@x
Actively checking your container can save you a lot of hassle when a new vulnerability is discovered, which otherwise can put your production system at risk.
@y
Actively checking your container can save you a lot of hassle when a new vulnerability is discovered, which otherwise can put your production system at risk.
@z

@x
Periodically scanning your Docker image is possible by using the Snyk monitor capabilities for containers. Snyk creates a snapshot of the image’s dependencies for continuous monitoring. Additionally, you should also activate runtime monitoring. Scanning for unused modules and packages inside your runtime gives insight into how to shrink images. Removing unused components prevents unnecessary vulnerabilities from entering both system and application libraries. This also makes an image more easily maintainable.
@y
Periodically scanning your Docker image is possible by using the Snyk monitor capabilities for containers. Snyk creates a snapshot of the image’s dependencies for continuous monitoring. Additionally, you should also activate runtime monitoring. Scanning for unused modules and packages inside your runtime gives insight into how to shrink images. Removing unused components prevents unnecessary vulnerabilities from entering both system and application libraries. This also makes an image more easily maintainable.
@z

@x
## Conclusion
@y
## Conclusion
@z

@x
Building secure images is a continuous process. Consider the recommendations and best practices highlighted in this guide to plan and build efficient, scalable, and secure images.
@y
Building secure images is a continuous process. Consider the recommendations and best practices highlighted in this guide to plan and build efficient, scalable, and secure images.
@z

@x
Let’s recap what we’ve learnt in this guide:
@y
Let’s recap what we’ve learnt in this guide:
@z

@x
- Start with a base image that you trust. Remember the Official image and Verified Publisher badges when you choose your base images.
- Secure your code and its dependencies.
- Select a minimal base image which contains only the required packages.
- Use multi-stage builds to optimize your image.
- Ensure you carefully monitor and manage the tools and dependencies you add to your image.
- Ensure you scan images at multiple stages during your development lifecycle.
- Check your images frequently for vulnerabilities.
@y
- Start with a base image that you trust. Remember the Official image and Verified Publisher badges when you choose your base images.
- Secure your code and its dependencies.
- Select a minimal base image which contains only the required packages.
- Use multi-stage builds to optimize your image.
- Ensure you carefully monitor and manage the tools and dependencies you add to your image.
- Ensure you scan images at multiple stages during your development lifecycle.
- Check your images frequently for vulnerabilities.
@z

@x
## Further reading
@y
## Further reading
@z

@x
You can also take a look at the following articles from Snyk:
@y
You can also take a look at the following articles from Snyk:
@z

@x
- [Container Security Guide](https://snyk.io/learn/container-security/){:target="_blank" rel="noopener" class="_"}
- [Docker Vulnerability Scanning Cheat Sheet](https://goto.docker.com/rs/929-FJL-178/images/cheat-sheet-docker-desktop-vulnerability-scanning-CLI.pdf){:target="_blank" rel="noopener" class="_"}
@y
- [Container Security Guide](https://snyk.io/learn/container-security/){:target="_blank" rel="noopener" class="_"}
- [Docker Vulnerability Scanning Cheat Sheet](https://goto.docker.com/rs/929-FJL-178/images/cheat-sheet-docker-desktop-vulnerability-scanning-CLI.pdf){:target="_blank" rel="noopener" class="_"}
@z
