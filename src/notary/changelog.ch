%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Notary release changelog
keywords: docker, notary, changelog, notary changelog, notary releases, releases, notary versions, versions
title: Notary Changelog
---
@y
---
description: Notary release changelog
keywords: docker, notary, changelog, notary changelog, notary releases, releases, notary versions, versions
title: Notary Changelog
---
@z

@x
## v0.3
@y
## v0.3
@z

@x
#### 5/11/2016
Implements root key and certificate rotation, as well as trust pinning configurations to specify known good key IDs and CAs to replace TOFU.
Additional improvements and fixes to notary internals, and RethinkDB support.
@y
#### 5/11/2016
Implements root key and certificate rotation, as well as trust pinning configurations to specify known good key IDs and CAs to replace TOFU.
Additional improvements and fixes to notary internals, and RethinkDB support.
@z

@x
> Detailed release notes can be found here:
<a href="https://github.com/docker/notary/releases/tag/v0.3.0" target="_blank">v0.3 release notes</a>.
@y
> Detailed release notes can be found here:
<a href="https://github.com/docker/notary/releases/tag/v0.3.0" target="_blank">v0.3 release notes</a>.
@z

@x
## v0.2
@y
## v0.2
@z

@x
#### 2/24/2016
@y
#### 2/24/2016
@z

@x
Adds support for
<a href="https://github.com/theupdateframework/tuf/blob/1bed3e09a478c2c918ffbff10b9118f6e52ee129/docs/tuf-spec.txt#L387" target="_blank">delegation
roles</a> in TUF.
Delegations allow for easier key management amongst collaborators in a notary trusted collection, and fine-grained permissions on what content each delegate is allowed to modify and sign.
This version also supports managing the snapshot key on notary server, which should be used when enabling delegations on a trusted collection.
Moreover, this version also adds more key management functionality to the notary CLI, and changes the docker-compose development configuration to use the official MariaDB image.
@y
Adds support for
<a href="https://github.com/theupdateframework/tuf/blob/1bed3e09a478c2c918ffbff10b9118f6e52ee129/docs/tuf-spec.txt#L387" target="_blank">delegation
roles</a> in TUF.
Delegations allow for easier key management amongst collaborators in a notary trusted collection, and fine-grained permissions on what content each delegate is allowed to modify and sign.
This version also supports managing the snapshot key on notary server, which should be used when enabling delegations on a trusted collection.
Moreover, this version also adds more key management functionality to the notary CLI, and changes the docker-compose development configuration to use the official MariaDB image.
@z

@x
> Detailed release notes can be found here:
<a href="https://github.com/docker/notary/releases/tag/v0.2.0" target="_blank">v0.2 release notes</a>.
@y
> Detailed release notes can be found here:
<a href="https://github.com/docker/notary/releases/tag/v0.2.0" target="_blank">v0.2 release notes</a>.
@z

@x
## v0.1
@y
## v0.1
@z

@x
#### 11/15/2015
@y
#### 11/15/2015
@z

@x
Initial notary non-alpha release.
Implements The Update Framework (TUF) with root, targets, snapshot, and timestamp roles to sign and verify content of a trusted collection.
@y
Initial notary non-alpha release.
Implements The Update Framework (TUF) with root, targets, snapshot, and timestamp roles to sign and verify content of a trusted collection.
@z

@x
> Detailed release notes can be found here:
<a href="https://github.com/docker/notary/releases/tag/v0.1" target="_blank">v0.1 release notes</a>.
@y
> Detailed release notes can be found here:
<a href="https://github.com/docker/notary/releases/tag/v0.1" target="_blank">v0.1 release notes</a>.
@z
