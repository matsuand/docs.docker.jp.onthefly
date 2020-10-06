%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Submit a product for Docker Hub
keywords: Docker, docker, hub, purchase images
title: Publish content on Docker Hub
redirect_from:
- /docker-store/publish/
---
@y
---
description: Submit a product for Docker Hub
keywords: Docker, docker, hub, purchase images
title: Publish content on Docker Hub
redirect_from:
- /docker-store/publish/
---
@z

@x
## Permitted content and support options
@y
## Permitted content and support options
@z

@x
* Content that runs on Docker Enterprise may be published on Docker Hub under a
Verified Publisher profile. This content may also qualify to become a Docker
Certified Container or Plugin image, and thus become backed by collaborative
Docker/Publisher support.
@y
* Content that runs on Docker Enterprise may be published on Docker Hub under a
Verified Publisher profile. This content may also qualify to become a Docker
Certified Container or Plugin image, and thus become backed by collaborative
Docker/Publisher support.
@z

@x
* Content that runs on the Docker Community may be published in Docker Hub, but
is not supported by Docker nor is it eligible to become Certified.
@y
* Content that runs on the Docker Community may be published in Docker Hub, but
is not supported by Docker nor is it eligible to become Certified.
@z

@x
* Content that requires a non-Certified Infrastructure environment may not be
  published.
@y
* Content that requires a non-Certified Infrastructure environment may not be
  published.
@z

@x
| If your content: | Can publish  | Can be Certified | Supported by publisher |
|:-----|:--------|:------|:-----|
| Works on Docker Enterprise  | YES | YES |  Required |
| Works on Docker Community  | YES | NO  |  Optional |
| Does not work on Docker Certified Infrastructure | NO                       |   N/A       |    N/A     |
@y
| If your content: | Can publish  | Can be Certified | Supported by publisher |
|:-----|:--------|:------|:-----|
| Works on Docker Enterprise  | YES | YES |  Required |
| Works on Docker Community  | YES | NO  |  Optional |
| Does not work on Docker Certified Infrastructure | NO                       |   N/A       |    N/A     |
@z

@x
## Onboarding
@y
## Onboarding
@z

@x
The Docker Hub publishing process begins from the landing page: sign in with
your Docker ID and specify a product name and image source from a private or public repository.
@y
The Docker Hub publishing process begins from the landing page: sign in with
your Docker ID and specify a product name and image source from a private or public repository.
@z

@x
After specifying a source, provide the content-manifest items to populate your
product details page. These items include logos, descriptions, and licensing and
support links so that customers can make informed decisions about your image.
These items are submitted alongside the image itself for moderation.
@y
After specifying a source, provide the content-manifest items to populate your
product details page. These items include logos, descriptions, and licensing and
support links so that customers can make informed decisions about your image.
These items are submitted alongside the image itself for moderation.
@z

@x
The Docker Hub team then conducts a comprehensive review of your image and
metadata. We use Docker Security Scanning to evaluate the security of your
product images, and share results with you as the publisher. During the
image-moderation phase, we iterate back and forth with publishers to address
outstanding vulnerabilities and content-manifest issues until the image is ready
for publication.
@y
The Docker Hub team then conducts a comprehensive review of your image and
metadata. We use Docker Security Scanning to evaluate the security of your
product images, and share results with you as the publisher. During the
image-moderation phase, we iterate back and forth with publishers to address
outstanding vulnerabilities and content-manifest issues until the image is ready
for publication.
@z

@x
Commercial content and other supported images may qualify for the Docker
Certified Container or Plugins quality mark. The testing for this program goes
beyond the vulnerability scan and also evaluates container images for Docker
best practices developed over years of experience. Collaborative support
capability between Docker and the publisher is also established. Refer to the
diagram below for a high-level summary:
@y
Commercial content and other supported images may qualify for the Docker
Certified Container or Plugins quality mark. The testing for this program goes
beyond the vulnerability scan and also evaluates container images for Docker
best practices developed over years of experience. Collaborative support
capability between Docker and the publisher is also established. Refer to the
diagram below for a high-level summary:
@z

@x
![publishing workflow](images/publish-diagram.png)
@y
![publishing workflow](images/publish-diagram.png)
@z

@x
## Create great content
@y
## Create great content
@z

@x
Create your content, and follow our best practices to Dockerize it. Keep your
images small, your layers few, and your components secure. Refer to the links
and guidelines listed below to build and deliver great content:
@y
Create your content, and follow our best practices to Dockerize it. Keep your
images small, your layers few, and your components secure. Refer to the links
and guidelines listed below to build and deliver great content:
@z

@x
* [Best practices for writing Dockerfiles](/engine/userguide/eng-image/dockerfile_best-practices/)
@y
* [Best practices for writing Dockerfiles](/engine/userguide/eng-image/dockerfile_best-practices/)
@z

@x
* [Official Images on Docker Hub](/docker-hub/official_images/)
@y
* [Official Images on Docker Hub](/docker-hub/official_images/)
@z

@x
* [Docker Bench for Security](https://github.com/docker/docker-bench-security){: target="_blank"
class="_"}
@y
* [Docker Bench for Security](https://github.com/docker/docker-bench-security){: target="_blank"
class="_"}
@z

@x
Here are some best practices when it comes to building vulnerability-free Docker images:
@y
Here are some best practices when it comes to building vulnerability-free Docker images:
@z

@x
### Choose a secure base image (See your Dockerfile's `FROM:` directive)
@y
### Choose a secure base image (See your Dockerfile's `FROM:` directive)
@z

@x
Many base images have a strong record of being secure, including:
@y
Many base images have a strong record of being secure, including:
@z

@x
* [Debian](https://hub.docker.com/r/library/debian/tags/jessie/){: target="_blank" class="_"}
  Linux: both small and tightly-controlled, Debian-linux is a good alternative
  if you're currently using Ubuntu.
@y
* [Debian](https://hub.docker.com/r/library/debian/tags/jessie/){: target="_blank" class="_"}
  Linux: both small and tightly-controlled, Debian-linux is a good alternative
  if you're currently using Ubuntu.
@z

@x
* [Alpine](https://hub.docker.com/_/alpine/){: target="_blank" class="_"} Linux:
  Alpine is a minimal linux distribution with an excellent security record.
@y
* [Alpine](https://hub.docker.com/_/alpine/){: target="_blank" class="_"} Linux:
  Alpine is a minimal linux distribution with an excellent security record.
@z

@x
* Alpine-based application images: these include `python:alpine`, `ruby:alpine`,
  and `golang:alpine`. They are secure and minimal, while providing the
  convenience of their non-Alpine alternatives.
@y
* Alpine-based application images: these include `python:alpine`, `ruby:alpine`,
  and `golang:alpine`. They are secure and minimal, while providing the
  convenience of their non-Alpine alternatives.
@z

@x
Docker strongly recommends Alpine Linux. The founder of this Linux distribution
is leading an initiative at Docker to provide safe, compact base images for all
container applications.
@y
Docker strongly recommends Alpine Linux. The founder of this Linux distribution
is leading an initiative at Docker to provide safe, compact base images for all
container applications.
@z

@x
### Remove unused components
@y
### Remove unused components
@z

@x
Often, vulnerabilities exist in components that aren't actually used in the
containerized application. To avoid this, you can:
@y
Often, vulnerabilities exist in components that aren't actually used in the
containerized application. To avoid this, you can:
@z

@x
* Follow best practices when using the `apt-get` command.
@y
* Follow best practices when using the `apt-get` command.
@z

@x
* Run `apt-get-remove` to destroy any components required to build but not
  actually run your application. Usually, this involves creating multi-line
  Dockerfile directives, as seen below. The following example shows how to remove
  `curl` and `python-pip` after they are used to install the Python `requests`
  package, all in a single Dockerfile directive:
@y
* Run `apt-get-remove` to destroy any components required to build but not
  actually run your application. Usually, this involves creating multi-line
  Dockerfile directives, as seen below. The following example shows how to remove
  `curl` and `python-pip` after they are used to install the Python `requests`
  package, all in a single Dockerfile directive:
@z

@x
  ```dockerfile
  RUN apt-get update && \
           apt-get install -y --no-install-recommends curl python-pip && \
           pip install requests && \
           apt-get remove -y python-pip curl && \
           rm -rf /var/lib/apt/lists/
  ```
@y
  ```dockerfile
  RUN apt-get update && \
           apt-get install -y --no-install-recommends curl python-pip && \
           pip install requests && \
           apt-get remove -y python-pip curl && \
           rm -rf /var/lib/apt/lists/
  ```
@z

@x
> Files introduced in one directive of your Dockerfile can only be removed in
> the same directive (and not in subsequent directives in your Dockerfile).
@y
> Files introduced in one directive of your Dockerfile can only be removed in
> the same directive (and not in subsequent directives in your Dockerfile).
@z

@x
### Keep required components up-to-date
@y
### Keep required components up-to-date
@z

@x
Your images are composed of open-source libraries and packages that amass
vulnerabilities over time and are consequently patched. To ensure the integrity
of your product, keep your images up-to-date:
@y
Your images are composed of open-source libraries and packages that amass
vulnerabilities over time and are consequently patched. To ensure the integrity
of your product, keep your images up-to-date:
@z

@x
* Periodically update your base image's version, especially if you’re using a
  version deemed to be vulnerable.
@y
* Periodically update your base image's version, especially if you’re using a
  version deemed to be vulnerable.
@z

@x
* Re-build your image periodically. Directives including commands such as
  `apt-get install ...` pull the latest versions of dependencies, which may
  include security fixes.
@y
* Re-build your image periodically. Directives including commands such as
  `apt-get install ...` pull the latest versions of dependencies, which may
  include security fixes.
@z

@x
## Create and maintain your Verified Publisher profile
@y
## Create and maintain your Verified Publisher profile
@z

@x
Let the Docker community know who you are. Add your details, your company
story, and what you do. At the very minimum, we require:
@y
Let the Docker community know who you are. Add your details, your company
story, and what you do. At the very minimum, we require:
@z

@x
* Legal entity name
* Company website
* Phone number
* Valid company email
* Company icon/logo (square; at least 512x512px)
@y
* Legal entity name
* Company website
* Phone number
* Valid company email
* Company icon/logo (square; at least 512x512px)
@z

@x
## Prepare your image-manifest materials
@y
## Prepare your image-manifest materials
@z

@x
You must provide the namespace (including repository and tags) of a private or public
repository on Docker Hub that contains the source for your product.
This repository path is not shown to users, but the repositories you choose
determine the Product Tiers available for customers to download.
@y
You must provide the namespace (including repository and tags) of a private or public
repository on Docker Hub that contains the source for your product.
This repository path is not shown to users, but the repositories you choose
determine the Product Tiers available for customers to download.
@z

@x
The following content information helps us make your product look great and
discoverable:
@y
The following content information helps us make your product look great and
discoverable:
@z

@x
1.  Product Name
2.  Product icon/logo
3.  Short description: a one-to-two-sentence summary; up to 140 characters
4.  Category: Database, Networking, Business Software, etc. and any search tags
5.  Long description: includes product details/pitch
6.  Screenshot(s)
7.  Support link
8.  Product tier name
9.  Product tier description
10. Product tier price
11. Installation instructions
12. Link to, or text of, license agreements
@y
1.  Product Name
2.  Product icon/logo
3.  Short description: a one-to-two-sentence summary; up to 140 characters
4.  Category: Database, Networking, Business Software, etc. and any search tags
5.  Long description: includes product details/pitch
6.  Screenshot(s)
7.  Support link
8.  Product tier name
9.  Product tier description
10. Product tier price
11. Installation instructions
12. Link to, or text of, license agreements
@z

@x
### How the manifest information is displayed in the UI
@y
### How the manifest information is displayed in the UI
@z

@x
This is an approximate representation, and some elements might shift around as we make enhancements.
@y
This is an approximate representation, and some elements might shift around as we make enhancements.
@z

@x
![manifest information displayed on store UI](images/subscribed.png)
@y
![manifest information displayed on store UI](images/subscribed.png)
@z

@x
## Support your users
@y
## Support your users
@z

@x
Docker users who download your content might need help
later, so be prepared for questions! The information you provide with your
submission saves support time in the future.
@y
Docker users who download your content might need help
later, so be prepared for questions! The information you provide with your
submission saves support time in the future.
@z

@x
### Support information
@y
### Support information
@z

@x
If you provide support along with your content, include that information. Is
there a support website? What email address can users contact for help? Are
there self-help or troubleshooting resources available?
@y
If you provide support along with your content, include that information. Is
there a support website? What email address can users contact for help? Are
there self-help or troubleshooting resources available?
@z

@x
### Support SLA
@y
### Support SLA
@z

@x
Include a Service Level Agreement (SLA) for each image you're offering. An SLA is your commitment to your users about the nature and level of
support you provide to them. Make sure your SLA includes support hours and
response-time expectations, where applicable.
@y
Include a Service Level Agreement (SLA) for each image you're offering. An SLA is your commitment to your users about the nature and level of
support you provide to them. Make sure your SLA includes support hours and
response-time expectations, where applicable.
@z

@x
## Security and audit policies
@y
## Security and audit policies
@z

@x
Docker Hub [scans](#docker-security-scanning) your content for
vulnerabilities with the Docker Security Scanning tool, and
[audits](#usage-audit-and-reporting) consumer activity of your images to provide
you intelligence about the use of your product.
@y
Docker Hub [scans](#docker-security-scanning) your content for
vulnerabilities with the Docker Security Scanning tool, and
[audits](#usage-audit-and-reporting) consumer activity of your images to provide
you intelligence about the use of your product.
@z

@x
### Docker Security Scanning
@y
### Docker Security Scanning
@z

@x
Docker Security Scanning automatically and continuously assesses the integrity
of your products. The Docker Security Scanning tool deconstructs an image,
conducts a binary scan of the bits to identify the open-source components
present in each image layer, and associates those components with known
vulnerabilities and exposures.
@y
Docker Security Scanning automatically and continuously assesses the integrity
of your products. The Docker Security Scanning tool deconstructs an image,
conducts a binary scan of the bits to identify the open-source components
present in each image layer, and associates those components with known
vulnerabilities and exposures.
@z

@x
Docker then shares the scan results with you as the publisher, so that you can
modify the content of your images as necessary. Your scan results are private,
and are never shared with end customers or other publishers.
@y
Docker then shares the scan results with you as the publisher, so that you can
modify the content of your images as necessary. Your scan results are private,
and are never shared with end customers or other publishers.
@z

@x
#### Interpret results
@y
#### Interpret results
@z

@x
To interpret the results of a scanned image:
@y
To interpret the results of a scanned image:
@z

@x
1.  Log on to [Docker Hub](https://hub.docker.com){: target="_blank" class="_"}.
@y
1.  Log on to [Docker Hub](https://hub.docker.com){: target="_blank" class="_"}.
@z

@x
2.  Navigate to the repository details page (for example,
    [nodejs](https://hub.docker.com/_/nodejs){: target="_blank" class="_"}).
@y
2.  Navigate to the repository details page (for example,
    [nodejs](https://hub.docker.com/_/nodejs){: target="_blank" class="_"}).
@z

@x
3.  Click **Tags**.
@y
3.  Click **Tags**.
@z

@x
    ![Scanned tags](images/image-tags.png)
@y
    ![Scanned tags](images/image-tags.png)
@z

@x
    In this section, you can now view the different architectures separately to
    easily identify the right image for the architecture you need, complete
    with image size and operating system information.
@y
    In this section, you can now view the different architectures separately to
    easily identify the right image for the architecture you need, complete
    with image size and operating system information.
@z

@x
    ![system info](images/node-tags-system-info.png)
@y
    ![system info](images/node-tags-system-info.png)
@z

@x
4.  Click on the digest for a particular architecture. You can now also see the
actual source of the image: the layer-by-layer details that make up the image.
@y
4.  Click on the digest for a particular architecture. You can now also see the
actual source of the image: the layer-by-layer details that make up the image.
@z

@x
    ![system info](images/node-tags-vulnerabilities.png)
@y
    ![system info](images/node-tags-vulnerabilities.png)
@z

@x
5.  Click on any row in the **Image History** list. You’ll see that the image contains multiple components, and that some of them have known vulnerabilities ranging from minor to critical. To explore further, click on the caret to expand and view all of the found vulnerabilities:
@y
5.  Click on any row in the **Image History** list. You’ll see that the image contains multiple components, and that some of them have known vulnerabilities ranging from minor to critical. To explore further, click on the caret to expand and view all of the found vulnerabilities:
@z

@x
    ![Scanned components](images/node-tags-vulnerability-details.png)
@y
    ![Scanned components](images/node-tags-vulnerability-details.png)
@z

@x
Each vulnerability is linked directly to the CVE (Common Vulnerabilities and Exposures) list entry so that you can learn more about the CVE entry and its implications.
@y
Each vulnerability is linked directly to the CVE (Common Vulnerabilities and Exposures) list entry so that you can learn more about the CVE entry and its implications.
@z

@x
#### Classification of issues
@y
#### Classification of issues
@z

@x
* All Scan results include the CVE numbers and a CVSS (Common Vulnerability
  Scoring System) Score.
@y
* All Scan results include the CVE numbers and a CVSS (Common Vulnerability
  Scoring System) Score.
@z

@x
* CVE Identifiers (also referred to by the community as "CVE names," "CVE
  numbers," "CVE entries," "CVE-IDs," and "CVEs") are unique identifiers for
  publicly-known, cyber-security vulnerabilities.
@y
* CVE Identifiers (also referred to by the community as "CVE names," "CVE
  numbers," "CVE entries," "CVE-IDs," and "CVEs") are unique identifiers for
  publicly-known, cyber-security vulnerabilities.
@z

@x
* The Common Vulnerability Scoring System (CVSS) provides an open
  framework for communicating the characteristics and impacts of
  IT vulnerabilities. Its quantitative model ensures repeatable,
  accurate measurement while enabling users to see the underlying
  vulnerability characteristics that were used to generate the scores.
  As a result, CVSS is well-suited as a standard measurement system
  for industries, organizations, and governments that need accurate
  and consistent vulnerability-impact scores. CVSS is commonly used
  to prioritize vulnerability-remediation activities, and calculate
  the severity of vulnerabilities discovered on systems. The
  National Vulnerability Database (NVD) provides CVSS scores for
  almost all known vulnerabilities.
@y
* The Common Vulnerability Scoring System (CVSS) provides an open
  framework for communicating the characteristics and impacts of
  IT vulnerabilities. Its quantitative model ensures repeatable,
  accurate measurement while enabling users to see the underlying
  vulnerability characteristics that were used to generate the scores.
  As a result, CVSS is well-suited as a standard measurement system
  for industries, organizations, and governments that need accurate
  and consistent vulnerability-impact scores. CVSS is commonly used
  to prioritize vulnerability-remediation activities, and calculate
  the severity of vulnerabilities discovered on systems. The
  National Vulnerability Database (NVD) provides CVSS scores for
  almost all known vulnerabilities.
@z

@x
* In addition to CVSS, the Docker Security team can identify or classify
  vulnerabilities that need to be fixed, and categorize them in the
  minor-to-critical range.
@y
* In addition to CVSS, the Docker Security team can identify or classify
  vulnerabilities that need to be fixed, and categorize them in the
  minor-to-critical range.
@z

@x
* The publisher is presented with initial scan results, including all components
  with their CVEs and their CVSS scores.
@y
* The publisher is presented with initial scan results, including all components
  with their CVEs and their CVSS scores.
@z

@x
* If you use Docker’s Scanning Service, you can subscribe to a notification
  service for new vulnerabilities.
@y
* If you use Docker’s Scanning Service, you can subscribe to a notification
  service for new vulnerabilities.
@z

@x
### Usage audit and reporting
@y
### Usage audit and reporting
@z

@x
Unless otherwise negotiated, an audit of activity on publisher content is
retained for no less than 180 days.
@y
Unless otherwise negotiated, an audit of activity on publisher content is
retained for no less than 180 days.
@z

@x
A monthly report of said activity is provided to the publisher with the
following data: (1) report of content download by free and paid customers by
date and time; (2) report of purchase, cancellations, refunds, tax payments,
where applicable, and subscription length for paid customers of the content; and
(3) the consolidated amount to be received by the publisher.
@y
A monthly report of said activity is provided to the publisher with the
following data: (1) report of content download by free and paid customers by
date and time; (2) report of purchase, cancellations, refunds, tax payments,
where applicable, and subscription length for paid customers of the content; and
(3) the consolidated amount to be received by the publisher.
@z

@x
### Certification
@y
### Certification
@z

@x
There are three types of certification that appear in Docker Hub.
@y
There are three types of certification that appear in Docker Hub.
@z

@x
![certified container badge](images/certified_container.png)
@y
![certified container badge](images/certified_container.png)
@z

@x
Certifies that a container image on Docker Hub has been tested; complies best
practices guidelines; runs on Docker Certified Infrastructure; has proven
provenance; been scanned for vulnerabilities; and is supported by Docker and the
content publisher
@y
Certifies that a container image on Docker Hub has been tested; complies best
practices guidelines; runs on Docker Certified Infrastructure; has proven
provenance; been scanned for vulnerabilities; and is supported by Docker and the
content publisher
@z

@x
![certified plugins badge](images/certified_plugins.png)
@y
![certified plugins badge](images/certified_plugins.png)
@z

@x
This certification is designed for volume, network, and other plugins that
access system level Docker APIs. Docker Certified Plugins provide the same level
of assurance as a Docker Certified Container, but go further by having passed an
additional suite of API compliance testing.
@y
This certification is designed for volume, network, and other plugins that
access system level Docker APIs. Docker Certified Plugins provide the same level
of assurance as a Docker Certified Container, but go further by having passed an
additional suite of API compliance testing.
@z

@x
### Docker Certified Publisher FAQ
@y
### Docker Certified Publisher FAQ
@z

@x
#### What is the Docker Certified program?
@y
#### What is the Docker Certified program?
@z

@x
Docker Certified Container images and plugins are meant to differentiate high
quality content on Docker Hub. Customers can consume Certified Containers with
confidence knowing that both Docker and the publisher stands behind the
solution. Further details and an application can be [found here.](https://goto.docker.com/2019-Partner-Program-Technology.html){: target="_blank" class="_"}.
@y
Docker Certified Container images and plugins are meant to differentiate high
quality content on Docker Hub. Customers can consume Certified Containers with
confidence knowing that both Docker and the publisher stands behind the
solution. Further details and an application can be [found here.](https://goto.docker.com/2019-Partner-Program-Technology.html){: target="_blank" class="_"}.
@z

@x
#### What are the benefits of Docker Certified?
@y
#### What are the benefits of Docker Certified?
@z

@x
Docker Hub promotes Docker Certified Containers and Plugins running on Docker
Certified Infrastructure trusted and high quality content. The Docker Certified badge
can also be listed alongside external references to your product.
@y
Docker Hub promotes Docker Certified Containers and Plugins running on Docker
Certified Infrastructure trusted and high quality content. The Docker Certified badge
can also be listed alongside external references to your product.
@z

@x
#### How is support handled?
@y
#### How is support handled?
@z

@x
All Docker Certified Container images and plugins running on Docker Enterprise come with support provided directly by the publisher, under your existing SLA.
Normally, a customer contacts the publisher for container and application level
issues. Likewise, a customer contacts Docker for Docker Enterprise support. In the
case where a customer calls Docker (or vice versa) about an issue on the
application, Docker advises the customer about the publisher support process and
performs a handover directly to the publisher if required. TSAnet is required
for exchange of support tickets between the publisher and Docker.
@y
All Docker Certified Container images and plugins running on Docker Enterprise come with support provided directly by the publisher, under your existing SLA.
Normally, a customer contacts the publisher for container and application level
issues. Likewise, a customer contacts Docker for Docker Enterprise support. In the
case where a customer calls Docker (or vice versa) about an issue on the
application, Docker advises the customer about the publisher support process and
performs a handover directly to the publisher if required. TSAnet is required
for exchange of support tickets between the publisher and Docker.
@z

@x
#### How does a publisher apply to the Docker Certified program?
@y
#### How does a publisher apply to the Docker Certified program?
@z

@x
Start by applying to be a [Docker Technology
Partner](https://goto.docker.com/2019-Partner-Program-Technology.html){: target="_blank" class="_"}
@y
Start by applying to be a [Docker Technology
Partner](https://goto.docker.com/2019-Partner-Program-Technology.html){: target="_blank" class="_"}
@z

@x
#### What is the difference between Official Images and Docker Certified?
@y
#### What is the difference between Official Images and Docker Certified?
@z

@x
Official Images is a program sponsored by Docker for the curation and packaging of Open Source Software. While upstream vendors are sometimes involved, this is not always the case. Docker Certified content is explicitly provided, maintained, and supported directly by the ISV.
@y
Official Images is a program sponsored by Docker for the curation and packaging of Open Source Software. While upstream vendors are sometimes involved, this is not always the case. Docker Certified content is explicitly provided, maintained, and supported directly by the ISV.
@z

@x
#### How is certification of plugins handled?
@y
#### How is certification of plugins handled?
@z

@x
Docker Certification program recognizes the need to apply special scrutiny and
testing to containers that access system level interfaces like storage volumes
and networking. Docker identifies these special containers as “Plugins” which
require additional testing by the publisher or Docker.
@y
Docker Certification program recognizes the need to apply special scrutiny and
testing to containers that access system level interfaces like storage volumes
and networking. Docker identifies these special containers as “Plugins” which
require additional testing by the publisher or Docker.
@z
