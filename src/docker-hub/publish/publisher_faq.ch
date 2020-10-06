%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Docker Hub frequently asked questions for publishers
keywords: Docker, docker, hub, purchase images
title: Docker Hub Publisher FAQs
redirect_from:
- /docker-store/publisher_faq/
@y
---
description: Docker Hub frequently asked questions for publishers
keywords: Docker, docker, hub, purchase images
title: Docker Hub Publisher FAQs
redirect_from:
- /docker-store/publisher_faq/
@z

@x
---
@y
---
@z

@x
## Certification program
@y
## Certification program
@z

@x
### What is the certification program for containers and plugins, and what are some benefits?
@y
### What is the certification program for containers and plugins, and what are some benefits?
@z

@x
The Docker Certification program for Containers and Plugins is
designed for both technology partners and enterprise customers to recognize
high-quality Containers and Plugins, provide collaborative support, and ensure
compatibility with the Docker Enterprise platform. Docker Certified products give enterprises a trusted way to run more
technology in containers with support from both Docker and the publisher. The
[Docker Technology Partner guide](https://www.docker.com/sites/default/files/d8/2018-12/Docker-Technology-Partner-Program-Guide-120418.pdf)
explains the Technology Partner program, inclusive of process and requirements to Certify Containers and Plugins.
@y
The Docker Certification program for Containers and Plugins is
designed for both technology partners and enterprise customers to recognize
high-quality Containers and Plugins, provide collaborative support, and ensure
compatibility with the Docker Enterprise platform. Docker Certified products give enterprises a trusted way to run more
technology in containers with support from both Docker and the publisher. The
[Docker Technology Partner guide](https://www.docker.com/sites/default/files/d8/2018-12/Docker-Technology-Partner-Program-Guide-120418.pdf)
explains the Technology Partner program, inclusive of process and requirements to Certify Containers and Plugins.
@z

@x
## Publisher signup and approval
@y
## Publisher signup and approval
@z

@x
### How do I get started with the publisher signup and approval process?
@y
### How do I get started with the publisher signup and approval process?
@z

@x
Start by completing our [Technology Partner application](https://goto.docker.com/2019-Partner-Program-Technology.html). Docker's partner team will review your application, and follow up directly with further steps. If you have any questions or concerns, please reach out directly to us at partners@docker.com!
@y
Start by completing our [Technology Partner application](https://goto.docker.com/2019-Partner-Program-Technology.html). Docker's partner team will review your application, and follow up directly with further steps. If you have any questions or concerns, please reach out directly to us at partners@docker.com!
@z

@x
### Can we have a group of people work on the same product and publish to Docker Hub? (This replicates our internal workflow where more than one person is working on Dockerizing our product.)
@y
### Can we have a group of people work on the same product and publish to Docker Hub? (This replicates our internal workflow where more than one person is working on Dockerizing our product.)
@z

@x
Yes. You can submit your content as a team.
@y
Yes. You can submit your content as a team.
@z

@x
## Product submission
@y
## Product submission
@z

@x
### What exactly is a customer given access to once they're entitled to a given product plan?
@y
### What exactly is a customer given access to once they're entitled to a given product plan?
@z

@x
The customer will be given the permissions to docker pull any tag associated with the source repo specified. We recommend that you create a distinct repo per plan and only use tags for different versions of that specific plan. For example, if you have a community, pro, and enterprise plan of a single product, you should create three separate repos, `namespace/community, namespace/pro, and namespace/enterprise`. Once a customer is entitled to your enterprise plan, they will be able to pull `store/namespace/enterprise:anytag`.
@y
The customer will be given the permissions to docker pull any tag associated with the source repo specified. We recommend that you create a distinct repo per plan and only use tags for different versions of that specific plan. For example, if you have a community, pro, and enterprise plan of a single product, you should create three separate repos, `namespace/community, namespace/pro, and namespace/enterprise`. Once a customer is entitled to your enterprise plan, they will be able to pull `store/namespace/enterprise:anytag`.
@z

@x
### What is the typical publishing time for new products and updates?
Products are typically published within 24hrs of submission. 
@y
### What is the typical publishing time for new products and updates?
Products are typically published within 24hrs of submission. 
@z

@x
### Once a product is published, what is the process for pushing a new build (1.2, 1.3)? Will we simply edit the same product, adding the newly tagged repos?
@y
### Once a product is published, what is the process for pushing a new build (1.2, 1.3)? Will we simply edit the same product, adding the newly tagged repos?
@z

@x
Edit the same product and update with the newly tagged repos.
@y
Edit the same product and update with the newly tagged repos.
@z

@x
Additionally, for product updates, you may include a set of *Release Notes*. These notes will not be published with the product listing itself. Instead, they will be emailed directly to the current subscriber of the product. This ensures that consumers will have timely, valuable alerts about the availability of new images and significant changes. 
@y
Additionally, for product updates, you may include a set of *Release Notes*. These notes will not be published with the product listing itself. Instead, they will be emailed directly to the current subscriber of the product. This ensures that consumers will have timely, valuable alerts about the availability of new images and significant changes. 
@z

@x
### On the Information page, organization details are required. Do we need to fill those in again for every product we publish, or are they carried over? And if we change them for a later image publish, are they updated for all images published by our organization?
@y
### On the Information page, organization details are required. Do we need to fill those in again for every product we publish, or are they carried over? And if we change them for a later image publish, are they updated for all images published by our organization?
@z

@x
Organization details need to be filled in only once. Updating organization info
once updates this for all images published by your organization.
@y
Organization details need to be filled in only once. Updating organization info
once updates this for all images published by your organization.
@z

@x
### Can we show customers all tags for a specific repository, the way we show all tags for official images?
@y
### Can we show customers all tags for a specific repository, the way we show all tags for official images?
@z

@x
We don't support the ability to view available tags for published products because published products usually require entitlement.
@y
We don't support the ability to view available tags for published products because published products usually require entitlement.
@z

@x
Official images and community images have available tags visible because anyone can access any tag at any time anonymously.
@y
Official images and community images have available tags visible because anyone can access any tag at any time anonymously.
@z

@x
In the future, we may enable product listings published with the concept of versions, allowing publishers to manage which versions of their products they expose to customers for access.
@y
In the future, we may enable product listings published with the concept of versions, allowing publishers to manage which versions of their products they expose to customers for access.
@z

@x
### On the page for another vendor’s product on Docker Hub, I see the following chunks of data: How do these fields map to the following that are required in the publish process?
@y
### On the page for another vendor’s product on Docker Hub, I see the following chunks of data: How do these fields map to the following that are required in the publish process?
@z

@x
#### Fields I see
@y
#### Fields I see
@z

@x
* Description
* License
* Feedback
* Contributing Guidelines
* Documentation
@y
* Description
* License
* Feedback
* Contributing Guidelines
* Documentation
@z

@x
#### Fields in the publish process
@y
#### Fields in the publish process
@z

@x
* Product description
* Support link
* Documentation link
* Screenshots
* Tier description
* Installation instructions
@y
* Product description
* Support link
* Documentation link
* Screenshots
* Tier description
* Installation instructions
@z

@x
*Description* maps to *Product description* in the publish process.
*License* maps to *Support Link* in the publish process.
*Documentation* maps to *Documentation Link* in the publish process.
*Feedback* is provided through customer reviews. https://hub.docker.com/images/node?tab=reviews is an example.
*Tier Description* is what you see once users get entitled to a plan. For instance, in https://hub.docker.com/images/openmaptiles-openstreetmap-maps/plans/f1fc533a-76f0-493a-80a1-4e0a2b38a563?tab=instructions `A detailed street map of any place on a planet. Evaluation and non-production use. Production use license available separately` is what this publisher entered in the Tier description
*Installation instructions* is documentation on installing your software. In this case the documentation is just `Just launch the container and the map is going to be available on port 80 - ready-to-use - with instructions and list of available styles.` (We recommend more details for any content that's a certification candidate).
@y
*Description* maps to *Product description* in the publish process.
*License* maps to *Support Link* in the publish process.
*Documentation* maps to *Documentation Link* in the publish process.
*Feedback* is provided through customer reviews. https://hub.docker.com/images/node?tab=reviews is an example.
*Tier Description* is what you see once users get entitled to a plan. For instance, in https://hub.docker.com/images/openmaptiles-openstreetmap-maps/plans/f1fc533a-76f0-493a-80a1-4e0a2b38a563?tab=instructions `A detailed street map of any place on a planet. Evaluation and non-production use. Production use license available separately` is what this publisher entered in the Tier description
*Installation instructions* is documentation on installing your software. In this case the documentation is just `Just launch the container and the map is going to be available on port 80 - ready-to-use - with instructions and list of available styles.` (We recommend more details for any content that's a certification candidate).
@z

@x
### How can I remove a published product?
@y
### How can I remove a published product?
@z

@x
If you would like to remove your submission, contact us at [publisher-support@docker.com](mailto:publisher-support@docker.com).
@y
If you would like to remove your submission, contact us at [publisher-support@docker.com](mailto:publisher-support@docker.com).
@z

@x
### Can publishers publish multi-container apps?
@y
### Can publishers publish multi-container apps?
@z

@x
Yes. Publishers can provide multiple images and add a compose file in the
install instructions to describe how the multi-container app can be used. For
now, we recommend asking publishers to look at this example from Microsoft
https://hub.docker.com/images/mssql-server-linux where they have Supported
Tags listed in the Install instructions (you don't necessarily need to list it
in the readme).
@y
Yes. Publishers can provide multiple images and add a compose file in the
install instructions to describe how the multi-container app can be used. For
now, we recommend asking publishers to look at this example from Microsoft
https://hub.docker.com/images/mssql-server-linux where they have Supported
Tags listed in the Install instructions (you don't necessarily need to list it
in the readme).
@z

@x
### Regarding source repo tags: it says not to use “latest”. However, if we want users to be able to download the images without specifying a tag, then presumably an image tagged “latest” is required. So how do we go about that?
@y
### Regarding source repo tags: it says not to use “latest”. However, if we want users to be able to download the images without specifying a tag, then presumably an image tagged “latest” is required. So how do we go about that?
@z

@x
You can not submit "latest" tags through the certification/hub publish workflow.
The reason we do this is so that users are aware of the exact version they
download. To make the user experience easy we have a copy widget that users can
use to copy the pull command and paste in their command line. Here is a
[screenshot](https://user-images.githubusercontent.com/2453622/32354702-1bec633a-bfe8-11e7-9f80-a02c26b1b10c.png)
to provide additional clarity.
@y
You can not submit "latest" tags through the certification/hub publish workflow.
The reason we do this is so that users are aware of the exact version they
download. To make the user experience easy we have a copy widget that users can
use to copy the pull command and paste in their command line. Here is a
[screenshot](https://user-images.githubusercontent.com/2453622/32354702-1bec633a-bfe8-11e7-9f80-a02c26b1b10c.png)
to provide additional clarity.
@z

@x
### I have two plans, can I use the same repository but different tags for the two plans?
@y
### I have two plans, can I use the same repository but different tags for the two plans?
@z

@x
We expect publishers to use a different repository for each plan. If a user is entitled to a plan in your product, the user is entitled to all tags in the relevant.
For instance, if you have a `Developer` Plan, that is mapped to repositories store/`mynamespace`/`myrepo1`:`mytag1`, another plan (say `Production`) **should** map to a different repository.
**_Any user that is entitled to the `Developer` plan will be able to pull all tags in store/`mynamespace`/`myrepo1`_**.
@y
We expect publishers to use a different repository for each plan. If a user is entitled to a plan in your product, the user is entitled to all tags in the relevant.
For instance, if you have a `Developer` Plan, that is mapped to repositories store/`mynamespace`/`myrepo1`:`mytag1`, another plan (say `Production`) **should** map to a different repository.
**_Any user that is entitled to the `Developer` plan will be able to pull all tags in store/`mynamespace`/`myrepo1`_**.
@z

@x
## Licensing, terms and conditions, and pricing
@y
## Licensing, terms and conditions, and pricing
@z

@x
### What options are presented to users to pull an image?
@y
### What options are presented to users to pull an image?
@z

@x
We provide users the following options to access your software
* Logged-in users
* Subscribed users only (requires ToS acceptance)
* All users (including users without Docker Identity)
Here is a [screenshot](https://user-images.githubusercontent.com/2453622/32067299-00cf1210-ba83-11e7-89f8-15deed6fef62.png) to describe how publishers can update the options provided to customers.
@y
We provide users the following options to access your software
* Logged-in users
* Subscribed users only (requires ToS acceptance)
* All users (including users without Docker Identity)
Here is a [screenshot](https://user-images.githubusercontent.com/2453622/32067299-00cf1210-ba83-11e7-89f8-15deed6fef62.png) to describe how publishers can update the options provided to customers.
@z

@x
### If something is published as a free tier, for subscribed users only, does a user need to explicitly click Accept on the license terms for which we provide the link before they can download the image?
Yes
@y
### If something is published as a free tier, for subscribed users only, does a user need to explicitly click Accept on the license terms for which we provide the link before they can download the image?
Yes
@z

@x
### Do you have a license enforcement system for docker images sold on Docker Hub? How are they protected, once they have been downloaded? What happens if a customer stop paying for the image I am selling after, let's say, 2 months?
@y
### Do you have a license enforcement system for docker images sold on Docker Hub? How are they protected, once they have been downloaded? What happens if a customer stop paying for the image I am selling after, let's say, 2 months?
@z

@x
We provide the following licensing option to customers:
* Bring your own License or BYOL.
@y
We provide the following licensing option to customers:
* Bring your own License or BYOL.
@z

@x
The expectation is that the publisher would take care of License Keys within the
container. The License Key itself can be presented to the customer through Docker
Hub. We expect the Publisher to build short circuits into the container, so
the container stops running once the License Key expires. Once a customer
cancels, or if the customer subscription expires - the customer cannot
download updates from Docker Hub.
@y
The expectation is that the publisher would take care of License Keys within the
container. The License Key itself can be presented to the customer through Docker
Hub. We expect the Publisher to build short circuits into the container, so
the container stops running once the License Key expires. Once a customer
cancels, or if the customer subscription expires - the customer cannot
download updates from Docker Hub.
@z

@x
If a user cancels their subscription, they cannot download updates
from Docker Hub. The container may continue running. If you have a licensing
scheme built into the container, the licensing scheme can be a forcing function
and stop the container. (_We do not build anything into the container, it is up to the publisher_).
@y
If a user cancels their subscription, they cannot download updates
from Docker Hub. The container may continue running. If you have a licensing
scheme built into the container, the licensing scheme can be a forcing function
and stop the container. (_We do not build anything into the container, it is up to the publisher_).
@z

@x
### Does Docker Hub offer a Subscription service, handle our invoicing, payments, etc? What happened to Pay-via-Docker?
Docker has deprecated the Pay-via-Docker subscription service. At this time, Docker Hub only supports distribution of content, under the BYOL Ungated model. In the future, we intend to release BYOL Gated functionality as well. If neither of these options will work for your product and licensing structure, please do inform your partner manager to help guide our feature prioritization. 
@y
### Does Docker Hub offer a Subscription service, handle our invoicing, payments, etc? What happened to Pay-via-Docker?
Docker has deprecated the Pay-via-Docker subscription service. At this time, Docker Hub only supports distribution of content, under the BYOL Ungated model. In the future, we intend to release BYOL Gated functionality as well. If neither of these options will work for your product and licensing structure, please do inform your partner manager to help guide our feature prioritization. 
@z

@x
### How does Docker handle Export control? Can individual countries be specified if differing from Docker's list of embargoed countries?
@y
### How does Docker handle Export control? Can individual countries be specified if differing from Docker's list of embargoed countries?
@z

@x
We provide export control through blacklisting several countries, IPs and users
based on the national export compliance database. Any export control we do is
across all products, we do not selectively blacklist versions and products for
specific groups. Send us an email at publisher-support if you have questions
@y
We provide export control through blacklisting several countries, IPs and users
based on the national export compliance database. Any export control we do is
across all products, we do not selectively blacklist versions and products for
specific groups. Send us an email at publisher-support if you have questions
@z

@x
## Analytics
@y
## Analytics
@z

@x
### Where can I view customer insights?
@y
### Where can I view customer insights?
@z

@x
Analytics reports are only available to Publishers with Certified. Go to https://hub.docker.com/publisher/center and click on "Actions"
for the product you'd like to view analytics for. Here is a
[screenshot](https://user-images.githubusercontent.com/2453622/32352202-6e87ce6e-bfdd-11e7-8fb0-08fe5a3e8930.png).
@y
Analytics reports are only available to Publishers with Certified. Go to https://hub.docker.com/publisher/center and click on "Actions"
for the product you'd like to view analytics for. Here is a
[screenshot](https://user-images.githubusercontent.com/2453622/32352202-6e87ce6e-bfdd-11e7-8fb0-08fe5a3e8930.png).
@z

@x
### How do metrics differentiate between the different Pull Requirement options?
@y
### How do metrics differentiate between the different Pull Requirement options?
@z

@x
The Analytics reports contain information about the Subscriber and the
relevant product plan. You can identify subscribers for each plan
for each product. Only anonymous information is available to our publishers. If you'd like the opportunity to receive Lead information, Subscribed Users Only will need to be selected as the pull requirement. Please review the Technology Partner Program guide, and consult with your partner manager, for more information on Lead Generation plans. 
@y
The Analytics reports contain information about the Subscriber and the
relevant product plan. You can identify subscribers for each plan
for each product. Only anonymous information is available to our publishers. If you'd like the opportunity to receive Lead information, Subscribed Users Only will need to be selected as the pull requirement. Please review the Technology Partner Program guide, and consult with your partner manager, for more information on Lead Generation plans. 
@z

@x
### Can I preview my submission before publishing?
@y
### Can I preview my submission before publishing?
@z

@x
Yes. You can preview your submission including the image you've submitted, the look and feel of the detail page and any markdown descriptions you might have.
@y
Yes. You can preview your submission including the image you've submitted, the look and feel of the detail page and any markdown descriptions you might have.
@z

@x
Here are a few screenshots that illustrate the preview experience for markdown content.
Product Description preview [screenshot](https://user-images.githubusercontent.com/2453622/32344591-9cd6b456-bfc4-11e7-9505-1f7e8235f812.png).
Install instructions description preview [screenshot](https://user-images.githubusercontent.com/2453622/32344592-9cf2e234-bfc4-11e7-9e60-d773b62eae07.png).
@y
Here are a few screenshots that illustrate the preview experience for markdown content.
Product Description preview [screenshot](https://user-images.githubusercontent.com/2453622/32344591-9cd6b456-bfc4-11e7-9505-1f7e8235f812.png).
Install instructions description preview [screenshot](https://user-images.githubusercontent.com/2453622/32344592-9cf2e234-bfc4-11e7-9e60-d773b62eae07.png).
@z

@x
## Other FAQs
@y
## Other FAQs
@z

@x
### Can a publisher respond to a review of their product?
@y
### Can a publisher respond to a review of their product?
@z

@x
Yes
@y
Yes
@z

@x
### Can I have a publish by date for my content?
@y
### Can I have a publish by date for my content?
@z

@x
Not yet. This is a planned enhancement, but we have no specific availability date at this time.
In lieu of an automated approach, you may coordinate publication timeline directly with your partner manager. 
@y
Not yet. This is a planned enhancement, but we have no specific availability date at this time.
In lieu of an automated approach, you may coordinate publication timeline directly with your partner manager. 
@z

@x
### Can I convert my Hub Community profile to a Verified Publisher profile?
@y
### Can I convert my Hub Community profile to a Verified Publisher profile?
@z

@x
No, at this time you will need to separately sign up to become a Verified Publisher. Following that, you may migrate or re-publish your public repo's under the new Verified Publisher profile.
@y
No, at this time you will need to separately sign up to become a Verified Publisher. Following that, you may migrate or re-publish your public repo's under the new Verified Publisher profile.
@z

@x
### Once I've completed the process to become a Verified Publisher with my partner manager, how do I get access to the Publisher Portal?
@y
### Once I've completed the process to become a Verified Publisher with my partner manager, how do I get access to the Publisher Portal?
@z

@x
You will need to apply for access. Please either follow [this direct link](https://hub.docker.com/publisher/center) or click the "Publisher Center" link at the bottom of any Docker Hub page. Please note, that you will need to be logged in with a DockerID in order to see this link. 
@y
You will need to apply for access. Please either follow [this direct link](https://hub.docker.com/publisher/center) or click the "Publisher Center" link at the bottom of any Docker Hub page. Please note, that you will need to be logged in with a DockerID in order to see this link. 
@z

@x
### What kind of DockerID should I use to publish my content?
@y
### What kind of DockerID should I use to publish my content?
@z

@x
Publishing should be done with an [Organization level DockerID](https://docs.docker.com/docker-hub/orgs/). We recommend that this account utilize a shared alias with your corporate email account and only individual DockerIDs with company email are added to that organization. 
@y
Publishing should be done with an [Organization level DockerID](https://docs.docker.com/docker-hub/orgs/). We recommend that this account utilize a shared alias with your corporate email account and only individual DockerIDs with company email are added to that organization. 
@z
