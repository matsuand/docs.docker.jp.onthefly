%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: describes deprecated functionality
keywords: registry, manifest, images, signatures, repository, distribution, digest
title: Docker Registry deprecation
---
@y
---
description: describes deprecated functionality
keywords: registry, manifest, images, signatures, repository, distribution, digest
title: Docker Registry deprecation
---
@z

@x
{% include registry.md %}
@y
{% include registry.md %}
@z

@x
This document details functionality or components which are deprecated within
the registry.
@y
This document details functionality or components which are deprecated within
the registry.
@z

@x
### v2.5.0
@y
### v2.5.0
@z

@x
The signature store has been removed from the registry.  Since `v2.4.0` it has
been possible to configure the registry to generate manifest signatures rather
than load them from storage.   In this version of the registry this becomes
the default behavior.  Signatures which are attached to manifests on put are
not stored in the registry.  This does not alter the functional behavior of
the registry.
@y
The signature store has been removed from the registry.  Since `v2.4.0` it has
been possible to configure the registry to generate manifest signatures rather
than load them from storage.   In this version of the registry this becomes
the default behavior.  Signatures which are attached to manifests on put are
not stored in the registry.  This does not alter the functional behavior of
the registry.
@z

@x
Old signatures blobs can be removed from the registry storage by running the
garbage-collect subcommand.
@y
Old signatures blobs can be removed from the registry storage by running the
garbage-collect subcommand.
@z
