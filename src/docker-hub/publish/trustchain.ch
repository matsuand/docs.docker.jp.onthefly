%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Docker Hub Publisher Image Trust Chain
keywords: trust, chain, store, security
redirect_from:
- /docker-store/trustchain/
---
@y
---
title: Docker Hub Publisher Image Trust Chain
keywords: trust, chain, store, security
redirect_from:
- /docker-store/trustchain/
---
@z

@x
## For consumers
@y
## For consumers
@z

@x
Docker can ensure that all content is securely received and verified from original
producers, and additionally audits images before adding them to the Docker
Hub. Docker cryptographically signs the images upon completion of a
satisfactory image check, so that you can verify and trust certified content
from the Docker Hub.
@y
Docker can ensure that all content is securely received and verified from original
producers, and additionally audits images before adding them to the Docker
Hub. Docker cryptographically signs the images upon completion of a
satisfactory image check, so that you can verify and trust certified content
from the Docker Hub.
@z

@x
Here’s the full trust chain in detail, with details on how to cryptographically
verify completion of the process when pulling an image from Docker Hub:
@y
Here’s the full trust chain in detail, with details on how to cryptographically
verify completion of the process when pulling an image from Docker Hub:
@z

@x
1. Publishers sign and push their images using Docker Content Trust to a private staging area.
@y
1. Publishers sign and push their images using Docker Content Trust to a private staging area.
@z

@x
2. Docker pulls the image, verifies the signatures to guarantee authenticity, integrity, and freshness of the image.
@y
2. Docker pulls the image, verifies the signatures to guarantee authenticity, integrity, and freshness of the image.
@z

@x
3. The Docker Hub certification team performs a thorough review of the image, looking for vulnerabilities and verifying best practices for image hygiene, such as ensuring minimal image sizes and working health-checks.
@y
3. The Docker Hub certification team performs a thorough review of the image, looking for vulnerabilities and verifying best practices for image hygiene, such as ensuring minimal image sizes and working health-checks.
@z

@x
4. Upon a successful review, Docker signs the image and makes it officially available on Docker Hub. As a consumer, you can confirm that Docker signed the image by pulling and running with Docker Content Trust:
@y
4. Upon a successful review, Docker signs the image and makes it officially available on Docker Hub. As a consumer, you can confirm that Docker signed the image by pulling and running with Docker Content Trust:
@z

@x
    ```shell
    DOCKER_CONTENT_TRUST=1 docker pull <image>
@y
    ```shell
    DOCKER_CONTENT_TRUST=1 docker pull <image>
@z

@x
    DOCKER_CONTENT_TRUST=1 docker run <image>
    ```
@y
    DOCKER_CONTENT_TRUST=1 docker run <image>
    ```
@z

@x
## For publishers
@y
## For publishers
@z

@x
The Docker Hub has a thorough and well-defined certification process to ensure
top-quality content from producers is delivered to consumers in a trusted
manner. As a producer of content, you are required to sign your images so
that Docker can verify that your content is not tampered with upon starting the
image certification and publishing process as outlined below:
@y
The Docker Hub has a thorough and well-defined certification process to ensure
top-quality content from producers is delivered to consumers in a trusted
manner. As a producer of content, you are required to sign your images so
that Docker can verify that your content is not tampered with upon starting the
image certification and publishing process as outlined below:
@z

@x
1. Producers sign and push their images using Docker Content Trust to a private staging area. To do this, run a `docker push` command with Content Trust enabled:
@y
1. Producers sign and push their images using Docker Content Trust to a private staging area. To do this, run a `docker push` command with Content Trust enabled:
@z

@x
    ```shell
    DOCKER_CONTENT_TRUST=1 docker push <image>
    ```
@y
    ```shell
    DOCKER_CONTENT_TRUST=1 docker push <image>
    ```
@z

@x
2. Docker verifies the signatures to guarantee authenticity, integrity, and freshness of the image. All of the individual layers of your image, and the combination thereof, are encompassed as part of this verification check. [Read more detail about Content Trust in Docker's documentation](../../engine/security/trust/index.md).
@y
2. Docker verifies the signatures to guarantee authenticity, integrity, and freshness of the image. All of the individual layers of your image, and the combination thereof, are encompassed as part of this verification check. [Read more detail about Content Trust in Docker's documentation](../../engine/security/trust/index.md).
@z

@x
3. Upon a successful signature verification, Docker pulls the original image to a private, internal staging area only accessible to the Docker Hub certification team.
@y
3. Upon a successful signature verification, Docker pulls the original image to a private, internal staging area only accessible to the Docker Hub certification team.
@z

@x
4. The Docker Hub certification team performs a thorough review of the image, looking for vulnerabilities and verifying best practices for image hygiene, such as ensuring minimal image sizes and working health-checks.
@y
4. The Docker Hub certification team performs a thorough review of the image, looking for vulnerabilities and verifying best practices for image hygiene, such as ensuring minimal image sizes and working health-checks.
@z

@x
5. Upon a successful review, Docker signs the image and makes it officially available on Docker Hub. Similar to artifacts on the Apple Store, this is the final and only signature on the image. Your consumers confirm that the full certification process was completed by checking Docker’s signature by pulling and running with Docker Content Trust:
@y
5. Upon a successful review, Docker signs the image and makes it officially available on Docker Hub. Similar to artifacts on the Apple Store, this is the final and only signature on the image. Your consumers confirm that the full certification process was completed by checking Docker’s signature by pulling and running with Docker Content Trust:
@z

@x
    ```shell
    DOCKER_CONTENT_TRUST=1 docker pull <image>
@y
    ```shell
    DOCKER_CONTENT_TRUST=1 docker pull <image>
@z

@x
    DOCKER_CONTENT_TRUST=1 docker run <image>
    ```
@y
    DOCKER_CONTENT_TRUST=1 docker run <image>
    ```
@z

@x
![Store Trust Chain signing process](images/image_0.png)
@y
![Store Trust Chain signing process](images/image_0.png)
@z

@x
To learn more the trust chain and certification for publishing content, see
[Security and Audit Policies](publish.md#security-and-audit-policies) in the
publishers guide.
@y
To learn more the trust chain and certification for publishing content, see
[Security and Audit Policies](publish.md#security-and-audit-policies) in the
publishers guide.
@z
