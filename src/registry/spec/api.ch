%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: "HTTP API V2"
description: "Specification for the Registry API."
keywords: registry, on-prem, images, tags, repository, distribution, api, advanced
---
@y
---
title: "HTTP API V2"
description: "Specification for the Registry API."
keywords: registry, on-prem, images, tags, repository, distribution, api, advanced
---
@z

@x
# Docker Registry HTTP API V2
@y
# Docker Registry HTTP API V2
@z

@x
## Introduction
@y
## Introduction
@z

@x
The _Docker Registry HTTP API_ is the protocol to facilitate distribution of
images to the docker engine. It interacts with instances of the docker
registry, which is a service to manage information about docker images and
enable their distribution. The specification covers the operation of version 2
of this API, known as _Docker Registry HTTP API V2_.
@y
The _Docker Registry HTTP API_ is the protocol to facilitate distribution of
images to the docker engine. It interacts with instances of the docker
registry, which is a service to manage information about docker images and
enable their distribution. The specification covers the operation of version 2
of this API, known as _Docker Registry HTTP API V2_.
@z

@x
While the V1 registry protocol is usable, there are several problems with the
architecture that have led to this new version. The main driver of this
specification is a set of changes to the Docker image format, covered in
[docker/docker#8093](https://github.com/docker/docker/issues/8093).
The new, self-contained image manifest simplifies image definition and improves
security. This specification will build on that work, leveraging new properties
of the manifest format to improve performance, reduce bandwidth usage and
decrease the likelihood of backend corruption.
@y
While the V1 registry protocol is usable, there are several problems with the
architecture that have led to this new version. The main driver of this
specification is a set of changes to the Docker image format, covered in
[docker/docker#8093](https://github.com/docker/docker/issues/8093).
The new, self-contained image manifest simplifies image definition and improves
security. This specification will build on that work, leveraging new properties
of the manifest format to improve performance, reduce bandwidth usage and
decrease the likelihood of backend corruption.
@z

@x
For relevant details and history leading up to this specification, please see
the following issues:
@y
For relevant details and history leading up to this specification, please see
the following issues:
@z

@x
- [docker/docker#8093](https://github.com/docker/docker/issues/8093)
- [docker/docker#9015](https://github.com/docker/docker/issues/9015)
- [docker/docker-registry#612](https://github.com/docker/docker-registry/issues/612)
@y
- [docker/docker#8093](https://github.com/docker/docker/issues/8093)
- [docker/docker#9015](https://github.com/docker/docker/issues/9015)
- [docker/docker-registry#612](https://github.com/docker/docker-registry/issues/612)
@z

@x
### Scope
@y
### Scope
@z

@x
This specification covers the URL layout and protocols of the interaction
between docker registry and docker core. This will affect the docker core
registry API and the rewrite of docker-registry. Docker registry
implementations may implement other API endpoints, but they are not covered by
this specification.
@y
This specification covers the URL layout and protocols of the interaction
between docker registry and docker core. This will affect the docker core
registry API and the rewrite of docker-registry. Docker registry
implementations may implement other API endpoints, but they are not covered by
this specification.
@z

@x
This includes the following features:
@y
This includes the following features:
@z

@x
- Namespace-oriented URI Layout
- PUSH/PULL registry server for V2 image manifest format
- Resumable layer PUSH support
- V2 Client library implementation
@y
- Namespace-oriented URI Layout
- PUSH/PULL registry server for V2 image manifest format
- Resumable layer PUSH support
- V2 Client library implementation
@z

@x
While authentication and authorization support will influence this
specification, details of the protocol will be left to a future specification.
Relevant header definitions and error codes are present to provide an
indication of what a client may encounter.
@y
While authentication and authorization support will influence this
specification, details of the protocol will be left to a future specification.
Relevant header definitions and error codes are present to provide an
indication of what a client may encounter.
@z

@x
#### Future
@y
#### Future
@z

@x
There are features that have been discussed during the process of cutting this
specification. The following is an incomplete list:
@y
There are features that have been discussed during the process of cutting this
specification. The following is an incomplete list:
@z

@x
- Immutable image references
- Multiple architecture support
- Migration from v2compatibility representation
@y
- Immutable image references
- Multiple architecture support
- Migration from v2compatibility representation
@z

@x
These may represent features that are either out of the scope of this
specification, the purview of another specification or have been deferred to a
future version.
@y
These may represent features that are either out of the scope of this
specification, the purview of another specification or have been deferred to a
future version.
@z

@x
### Use Cases
@y
### Use Cases
@z

@x
For the most part, the use cases of the former registry API apply to the new
version. Differentiating use cases are covered below.
@y
For the most part, the use cases of the former registry API apply to the new
version. Differentiating use cases are covered below.
@z

@x
#### Image Verification
@y
#### Image Verification
@z

@x
A docker engine instance would like to run verified image named
"library/ubuntu", with the tag "latest". The engine contacts the registry,
requesting the manifest for "library/ubuntu:latest". An untrusted registry
returns a manifest. Before proceeding to download the individual layers, the
engine verifies the manifest's signature, ensuring that the content was
produced from a trusted source and no tampering has occurred. After each layer
is downloaded, the engine verifies the digest of the layer, ensuring that the
content matches that specified by the manifest.
@y
A docker engine instance would like to run verified image named
"library/ubuntu", with the tag "latest". The engine contacts the registry,
requesting the manifest for "library/ubuntu:latest". An untrusted registry
returns a manifest. Before proceeding to download the individual layers, the
engine verifies the manifest's signature, ensuring that the content was
produced from a trusted source and no tampering has occurred. After each layer
is downloaded, the engine verifies the digest of the layer, ensuring that the
content matches that specified by the manifest.
@z

@x
#### Resumable Push
@y
#### Resumable Push
@z

@x
Company X's build servers lose connectivity to docker registry before
completing an image layer transfer. After connectivity returns, the build
server attempts to re-upload the image. The registry notifies the build server
that the upload has already been partially attempted. The build server
responds by only sending the remaining data to complete the image file.
@y
Company X's build servers lose connectivity to docker registry before
completing an image layer transfer. After connectivity returns, the build
server attempts to re-upload the image. The registry notifies the build server
that the upload has already been partially attempted. The build server
responds by only sending the remaining data to complete the image file.
@z

@x
#### Resumable Pull
@y
#### Resumable Pull
@z

@x
Company X is having more connectivity problems but this time in their
deployment datacenter. When downloading an image, the connection is
interrupted before completion. The client keeps the partial data and uses http
`Range` requests to avoid downloading repeated data.
@y
Company X is having more connectivity problems but this time in their
deployment datacenter. When downloading an image, the connection is
interrupted before completion. The client keeps the partial data and uses http
`Range` requests to avoid downloading repeated data.
@z

@x
#### Layer Upload De-duplication
@y
#### Layer Upload De-duplication
@z

@x
Company Y's build system creates two identical docker layers from build
processes A and B. Build process A completes uploading the layer before B.
When process B attempts to upload the layer, the registry indicates that its
not necessary because the layer is already known.
@y
Company Y's build system creates two identical docker layers from build
processes A and B. Build process A completes uploading the layer before B.
When process B attempts to upload the layer, the registry indicates that its
not necessary because the layer is already known.
@z

@x
If process A and B upload the same layer at the same time, both operations
will proceed and the first to complete will be stored in the registry (Note:
we may modify this to prevent dogpile with some locking mechanism).
@y
If process A and B upload the same layer at the same time, both operations
will proceed and the first to complete will be stored in the registry (Note:
we may modify this to prevent dogpile with some locking mechanism).
@z

@x
### Changes
@y
### Changes
@z

@x
The V2 specification has been written to work as a living document, specifying
only what is certain and leaving what is not specified open or to future
changes. Only non-conflicting additions should be made to the API and accepted
changes should avoid preventing future changes from happening.
@y
The V2 specification has been written to work as a living document, specifying
only what is certain and leaving what is not specified open or to future
changes. Only non-conflicting additions should be made to the API and accepted
changes should avoid preventing future changes from happening.
@z

@x
This section should be updated when changes are made to the specification,
indicating what is different. Optionally, we may start marking parts of the
specification to correspond with the versions enumerated here.
@y
This section should be updated when changes are made to the specification,
indicating what is different. Optionally, we may start marking parts of the
specification to correspond with the versions enumerated here.
@z

@x
Each set of changes is given a letter corresponding to a set of modifications
that were applied to the baseline specification. These are merely for
reference and shouldn't be used outside the specification other than to
identify a set of modifications.
@y
Each set of changes is given a letter corresponding to a set of modifications
that were applied to the baseline specification. These are merely for
reference and shouldn't be used outside the specification other than to
identify a set of modifications.
@z

@x
<dl>
  <dt>l</dt>
  <dd>
    <ul>
      <li>Document TOOMANYREQUESTS error code.</li>
    </ul>
  </dd>
@y
<dl>
  <dt>l</dt>
  <dd>
    <ul>
      <li>Document TOOMANYREQUESTS error code.</li>
    </ul>
  </dd>
@z

@x
  <dt>k</dt>
  <dd>
    <ul>
      <li>Document use of Accept and Content-Type headers in manifests endpoint.</li>
    </ul>
  </dd>
@y
  <dt>k</dt>
  <dd>
    <ul>
      <li>Document use of Accept and Content-Type headers in manifests endpoint.</li>
    </ul>
  </dd>
@z

@x
  <dt>j</dt>
  <dd>
    <ul>
      <li>Add ability to mount blobs across repositories.</li>
    </ul>
  </dd>
@y
  <dt>j</dt>
  <dd>
    <ul>
      <li>Add ability to mount blobs across repositories.</li>
    </ul>
  </dd>
@z

@x
  <dt>i</dt>
  <dd>
    <ul>
      <li>Clarified expected behavior response to manifest HEAD request.</li>
    </ul>
  </dd>
@y
  <dt>i</dt>
  <dd>
    <ul>
      <li>Clarified expected behavior response to manifest HEAD request.</li>
    </ul>
  </dd>
@z

@x
  <dt>h</dt>
  <dd>
    <ul>
      <li>All mention of tarsum removed.</li>
    </ul>
  </dd>
@y
  <dt>h</dt>
  <dd>
    <ul>
      <li>All mention of tarsum removed.</li>
    </ul>
  </dd>
@z

@x
  <dt>g</dt>
  <dd>
    <ul>
      <li>Clarify behavior of pagination behavior with unspecified parameters.</li>
    </ul>
  </dd>
@y
  <dt>g</dt>
  <dd>
    <ul>
      <li>Clarify behavior of pagination behavior with unspecified parameters.</li>
    </ul>
  </dd>
@z

@x
  <dt>f</dt>
  <dd>
    <ul>
      <li>Specify the delete API for layers and manifests.</li>
    </ul>
  </dd>
@y
  <dt>f</dt>
  <dd>
    <ul>
      <li>Specify the delete API for layers and manifests.</li>
    </ul>
  </dd>
@z

@x
  <dt>e</dt>
  <dd>
    <ul>
      <li>Added support for listing registry contents.</li>
      <li>Added pagination to tags API.</li>
      <li>Added common approach to support pagination.</li>
    </ul>
  </dd>
@y
  <dt>e</dt>
  <dd>
    <ul>
      <li>Added support for listing registry contents.</li>
      <li>Added pagination to tags API.</li>
      <li>Added common approach to support pagination.</li>
    </ul>
  </dd>
@z

@x
  <dt>d</dt>
  <dd>
    <ul>
      <li>Allow repository name components to be one character.</li>
      <li>Clarified that single component names are allowed.</li>
    </ul>
  </dd>
@y
  <dt>d</dt>
  <dd>
    <ul>
      <li>Allow repository name components to be one character.</li>
      <li>Clarified that single component names are allowed.</li>
    </ul>
  </dd>
@z

@x
  <dt>c</dt>
  <dd>
    <ul>
      <li>Added section covering digest format.</li>
      <li>Added more clarification that manifest cannot be deleted by tag.</li>
    </ul>
  </dd>
@y
  <dt>c</dt>
  <dd>
    <ul>
      <li>Added section covering digest format.</li>
      <li>Added more clarification that manifest cannot be deleted by tag.</li>
    </ul>
  </dd>
@z

@x
  <dt>b</dt>
  <dd>
    <ul>
      <li>Added capability of doing streaming upload to PATCH blob upload.</li>
      <li>Updated PUT blob upload to no longer take final chunk, now requires entire data or no data.</li>
      <li>Removed `416 Requested Range Not Satisfiable` response status from PUT blob upload.</li>
    </ul>
  </dd>
@y
  <dt>b</dt>
  <dd>
    <ul>
      <li>Added capability of doing streaming upload to PATCH blob upload.</li>
      <li>Updated PUT blob upload to no longer take final chunk, now requires entire data or no data.</li>
      <li>Removed `416 Requested Range Not Satisfiable` response status from PUT blob upload.</li>
    </ul>
  </dd>
@z

@x
  <dt>a</dt>
  <dd>
    <ul>
      <li>Added support for immutable manifest references in manifest endpoints.</li>
      <li>Deleting a manifest by tag has been deprecated.</li>
      <li>Specified `Docker-Content-Digest` header for appropriate entities.</li>
      <li>Added error code for unsupported operations.</li>
    </ul>
  </dd>
</dl>
@y
  <dt>a</dt>
  <dd>
    <ul>
      <li>Added support for immutable manifest references in manifest endpoints.</li>
      <li>Deleting a manifest by tag has been deprecated.</li>
      <li>Specified `Docker-Content-Digest` header for appropriate entities.</li>
      <li>Added error code for unsupported operations.</li>
    </ul>
  </dd>
</dl>
@z

@x
## Overview
@y
## Overview
@z

@x
This section covers client flows and details of the API endpoints. The URI
layout of the new API is structured to support a rich authentication and
authorization model by leveraging namespaces. All endpoints will be prefixed
by the API version and the repository name:
@y
This section covers client flows and details of the API endpoints. The URI
layout of the new API is structured to support a rich authentication and
authorization model by leveraging namespaces. All endpoints will be prefixed
by the API version and the repository name:
@z

@x
    /v2/<name>/
@y
    /v2/<name>/
@z

@x
For example, an API endpoint that will work with the `library/ubuntu`
repository, the URI prefix will be:
@y
For example, an API endpoint that will work with the `library/ubuntu`
repository, the URI prefix will be:
@z

@x
    /v2/library/ubuntu/
@y
    /v2/library/ubuntu/
@z

@x
This scheme provides rich access control over various operations and methods
using the URI prefix and http methods that can be controlled in variety of
ways.
@y
This scheme provides rich access control over various operations and methods
using the URI prefix and http methods that can be controlled in variety of
ways.
@z

@x
Classically, repository names have always been two path components where each
path component is less than 30 characters. The V2 registry API does not
enforce this. The rules for a repository name are as follows:
@y
Classically, repository names have always been two path components where each
path component is less than 30 characters. The V2 registry API does not
enforce this. The rules for a repository name are as follows:
@z

@x
1. A repository name is broken up into _path components_. A component of a
   repository name must be at least one lowercase, alpha-numeric characters,
   optionally separated by periods, dashes or underscores. More strictly, it
   must match the regular expression `[a-z0-9]+(?:[._-][a-z0-9]+)*`.
2. If a repository  name has two or more path components, they must be
   separated by a forward slash ("/").
3. The total length of a repository name, including slashes, must be less than
   256 characters.
@y
1. A repository name is broken up into _path components_. A component of a
   repository name must be at least one lowercase, alpha-numeric characters,
   optionally separated by periods, dashes or underscores. More strictly, it
   must match the regular expression `[a-z0-9]+(?:[._-][a-z0-9]+)*`.
2. If a repository  name has two or more path components, they must be
   separated by a forward slash ("/").
3. The total length of a repository name, including slashes, must be less than
   256 characters.
@z

@x
These name requirements _only_ apply to the registry API and should accept a
superset of what is supported by other docker ecosystem components.
@y
These name requirements _only_ apply to the registry API and should accept a
superset of what is supported by other docker ecosystem components.
@z

@x
All endpoints should support aggressive http caching, compression and range
headers, where appropriate. The new API attempts to leverage HTTP semantics
where possible but may break from standards to implement targeted features.
@y
All endpoints should support aggressive http caching, compression and range
headers, where appropriate. The new API attempts to leverage HTTP semantics
where possible but may break from standards to implement targeted features.
@z

@x
For detail on individual endpoints, please see the [_Detail_](#detail)
section.
@y
For detail on individual endpoints, please see the [_Detail_](#detail)
section.
@z

@x
### Errors
@y
### Errors
@z

@x
Actionable failure conditions, covered in detail in their relevant sections,
are reported as part of 4xx responses, in a json response body. One or more
errors will be returned in the following format:
@y
Actionable failure conditions, covered in detail in their relevant sections,
are reported as part of 4xx responses, in a json response body. One or more
errors will be returned in the following format:
@z

@x
    {
        "errors:" [{
                "code": <error identifier>,
                "message": <message describing condition>,
                "detail": <unstructured>
            },
            ...
        ]
    }
@y
    {
        "errors:" [{
                "code": <error identifier>,
                "message": <message describing condition>,
                "detail": <unstructured>
            },
            ...
        ]
    }
@z

@x
The `code` field will be a unique identifier, all caps with underscores by
convention. The `message` field will be a human readable string. The optional
`detail` field may contain arbitrary json data providing information the
client can use to resolve the issue.
@y
The `code` field will be a unique identifier, all caps with underscores by
convention. The `message` field will be a human readable string. The optional
`detail` field may contain arbitrary json data providing information the
client can use to resolve the issue.
@z

@x
While the client can take action on certain error codes, the registry may add
new error codes over time. All client implementations should treat unknown
error codes as `UNKNOWN`, allowing future error codes to be added without
breaking API compatibility. For the purposes of the specification error codes
will only be added and never removed.
@y
While the client can take action on certain error codes, the registry may add
new error codes over time. All client implementations should treat unknown
error codes as `UNKNOWN`, allowing future error codes to be added without
breaking API compatibility. For the purposes of the specification error codes
will only be added and never removed.
@z

@x
For a complete account of all error codes, please see the [_Errors_](#errors-2)
section.
@y
For a complete account of all error codes, please see the [_Errors_](#errors-2)
section.
@z

@x
### API Version Check
@y
### API Version Check
@z

@x
A minimal endpoint, mounted at `/v2/` will provide version support information
based on its response statuses. The request format is as follows:
@y
A minimal endpoint, mounted at `/v2/` will provide version support information
based on its response statuses. The request format is as follows:
@z

@x
    GET /v2/
@y
    GET /v2/
@z

@x
If a `200 OK` response is returned, the registry implements the V2(.1)
registry API and the client may proceed safely with other V2 operations.
Optionally, the response may contain information about the supported paths in
the response body. The client should be prepared to ignore this data.
@y
If a `200 OK` response is returned, the registry implements the V2(.1)
registry API and the client may proceed safely with other V2 operations.
Optionally, the response may contain information about the supported paths in
the response body. The client should be prepared to ignore this data.
@z

@x
If a `401 Unauthorized` response is returned, the client should take action
based on the contents of the "WWW-Authenticate" header and try the endpoint
again. Depending on access control setup, the client may still have to
authenticate against different resources, even if this check succeeds.
@y
If a `401 Unauthorized` response is returned, the client should take action
based on the contents of the "WWW-Authenticate" header and try the endpoint
again. Depending on access control setup, the client may still have to
authenticate against different resources, even if this check succeeds.
@z

@x
If `404 Not Found` response status, or other unexpected status, is returned,
the client should proceed with the assumption that the registry does not
implement V2 of the API.
@y
If `404 Not Found` response status, or other unexpected status, is returned,
the client should proceed with the assumption that the registry does not
implement V2 of the API.
@z

@x
When a `200 OK` or `401 Unauthorized` response is returned, the
"Docker-Distribution-API-Version" header should be set to "registry/2.0".
Clients may require this header value to determine if the endpoint serves this
API. When this header is omitted, clients may fallback to an older API version.
@y
When a `200 OK` or `401 Unauthorized` response is returned, the
"Docker-Distribution-API-Version" header should be set to "registry/2.0".
Clients may require this header value to determine if the endpoint serves this
API. When this header is omitted, clients may fallback to an older API version.
@z

@x
### Content Digests
@y
### Content Digests
@z

@x
This API design is driven heavily by [content addressability](http://en.wikipedia.org/wiki/Content-addressable_storage).
The core of this design is the concept of a content addressable identifier. It
uniquely identifies content by taking a collision-resistant hash of the bytes.
Such an identifier can be independently calculated and verified by selection
of a common _algorithm_. If such an identifier can be communicated in a secure
manner, one can retrieve the content from an insecure source, calculate it
independently and be certain that the correct content was obtained. Put simply,
the identifier is a property of the content.
@y
This API design is driven heavily by [content addressability](http://en.wikipedia.org/wiki/Content-addressable_storage).
The core of this design is the concept of a content addressable identifier. It
uniquely identifies content by taking a collision-resistant hash of the bytes.
Such an identifier can be independently calculated and verified by selection
of a common _algorithm_. If such an identifier can be communicated in a secure
manner, one can retrieve the content from an insecure source, calculate it
independently and be certain that the correct content was obtained. Put simply,
the identifier is a property of the content.
@z

@x
To disambiguate from other concepts, we call this identifier a _digest_. A
_digest_ is a serialized hash result, consisting of a _algorithm_ and _hex_
portion. The _algorithm_ identifies the methodology used to calculate the
digest. The _hex_ portion is the hex-encoded result of the hash.
@y
To disambiguate from other concepts, we call this identifier a _digest_. A
_digest_ is a serialized hash result, consisting of a _algorithm_ and _hex_
portion. The _algorithm_ identifies the methodology used to calculate the
digest. The _hex_ portion is the hex-encoded result of the hash.
@z

@x
We define a _digest_ string to match the following grammar:
```
digest      := algorithm ":" hex
algorithm   := /[A-Fa-f0-9_+.-]+/
hex         := /[A-Fa-f0-9]+/
```
@y
We define a _digest_ string to match the following grammar:
```
digest      := algorithm ":" hex
algorithm   := /[A-Fa-f0-9_+.-]+/
hex         := /[A-Fa-f0-9]+/
```
@z

@x
Some examples of _digests_ include the following:
@y
Some examples of _digests_ include the following:
@z

@x
digest                                                                            | description                                   |
----------------------------------------------------------------------------------|------------------------------------------------
sha256:6c3c624b58dbbcd3c0dd82b4c53f04194d1247c6eebdaab7c610cf7d66709b3b           | Common sha256 based digest                    |
@y
digest                                                                            | description                                   |
----------------------------------------------------------------------------------|------------------------------------------------
sha256:6c3c624b58dbbcd3c0dd82b4c53f04194d1247c6eebdaab7c610cf7d66709b3b           | Common sha256 based digest                    |
@z

@x
While the _algorithm_ does allow one to implement a wide variety of
algorithms, compliant implementations should use sha256. Heavy processing of
input before calculating a hash is discouraged to avoid degrading the
uniqueness of the _digest_ but some canonicalization may be performed to
ensure consistent identifiers.
@y
While the _algorithm_ does allow one to implement a wide variety of
algorithms, compliant implementations should use sha256. Heavy processing of
input before calculating a hash is discouraged to avoid degrading the
uniqueness of the _digest_ but some canonicalization may be performed to
ensure consistent identifiers.
@z

@x
Let's use a simple example in pseudo-code to demonstrate a digest calculation:
```
let C = 'a small string'
let B = sha256(C)
let D = 'sha256:' + EncodeHex(B)
let ID(C) = D
```
@y
Let's use a simple example in pseudo-code to demonstrate a digest calculation:
```
let C = 'a small string'
let B = sha256(C)
let D = 'sha256:' + EncodeHex(B)
let ID(C) = D
```
@z

@x
Above, we have bytestring `C` passed into a function, `SHA256`, that returns a
bytestring `B`, which is the hash of `C`. `D` gets the algorithm concatenated
with the hex encoding of `B`. We then define the identifier of `C` to `ID(C)`
as equal to `D`. A digest can be verified by independently calculating `D` and
comparing it with identifier `ID(C)`.
@y
Above, we have bytestring `C` passed into a function, `SHA256`, that returns a
bytestring `B`, which is the hash of `C`. `D` gets the algorithm concatenated
with the hex encoding of `B`. We then define the identifier of `C` to `ID(C)`
as equal to `D`. A digest can be verified by independently calculating `D` and
comparing it with identifier `ID(C)`.
@z

@x
#### Digest Header
@y
#### Digest Header
@z

@x
To provide verification of http content, any response may include a
`Docker-Content-Digest` header. This will include the digest of the target
entity returned in the response. For blobs, this is the entire blob content. For
manifests, this is the manifest body without the signature content, also known
as the JWS payload. Note that the commonly used canonicalization for digest
calculation may be dependent on the mediatype of the content, such as with
manifests.
@y
To provide verification of http content, any response may include a
`Docker-Content-Digest` header. This will include the digest of the target
entity returned in the response. For blobs, this is the entire blob content. For
manifests, this is the manifest body without the signature content, also known
as the JWS payload. Note that the commonly used canonicalization for digest
calculation may be dependent on the mediatype of the content, such as with
manifests.
@z

@x
The client may choose to ignore the header or may verify it to ensure content
integrity and transport security. This is most important when fetching by a
digest. To ensure security, the content should be verified against the digest
used to fetch the content. At times, the returned digest may differ from that
used to initiate a request. Such digests are considered to be from different
_domains_, meaning they have different values for _algorithm_. In such a case,
the client may choose to verify the digests in both domains or ignore the
server's digest. To maintain security, the client _must_ always verify the
content against the _digest_ used to fetch the content.
@y
The client may choose to ignore the header or may verify it to ensure content
integrity and transport security. This is most important when fetching by a
digest. To ensure security, the content should be verified against the digest
used to fetch the content. At times, the returned digest may differ from that
used to initiate a request. Such digests are considered to be from different
_domains_, meaning they have different values for _algorithm_. In such a case,
the client may choose to verify the digests in both domains or ignore the
server's digest. To maintain security, the client _must_ always verify the
content against the _digest_ used to fetch the content.
@z

@x
> __IMPORTANT:__ If a _digest_ is used to fetch content, the client should use
> the same digest used to fetch the content to verify it. The header
> `Docker-Content-Digest` should not be trusted over the "local" digest.
@y
> __IMPORTANT:__ If a _digest_ is used to fetch content, the client should use
> the same digest used to fetch the content to verify it. The header
> `Docker-Content-Digest` should not be trusted over the "local" digest.
@z

@x
### Pulling An Image
@y
### Pulling An Image
@z

@x
An "image" is a combination of a JSON manifest and individual layer files. The
process of pulling an image centers around retrieving these two components.
@y
An "image" is a combination of a JSON manifest and individual layer files. The
process of pulling an image centers around retrieving these two components.
@z

@x
The first step in pulling an image is to retrieve the manifest. For reference,
the relevant manifest fields for the registry are the following:
@y
The first step in pulling an image is to retrieve the manifest. For reference,
the relevant manifest fields for the registry are the following:
@z

@x
 field    | description                                    |
----------|------------------------------------------------|
name      | The name of the image.                         |
tag       | The tag for this version of the image.         |
fsLayers  | A list of layer descriptors (including digest) |
signature | A JWS used to verify the manifest content      |
@y
 field    | description                                    |
----------|------------------------------------------------|
name      | The name of the image.                         |
tag       | The tag for this version of the image.         |
fsLayers  | A list of layer descriptors (including digest) |
signature | A JWS used to verify the manifest content      |
@z

@x
For more information about the manifest format, please see
[docker/docker#8093](https://github.com/docker/docker/issues/8093).
@y
For more information about the manifest format, please see
[docker/docker#8093](https://github.com/docker/docker/issues/8093).
@z

@x
When the manifest is in hand, the client must verify the signature to ensure
the names and layers are valid. Once confirmed, the client will then use the
digests to download the individual layers. Layers are stored in as blobs in
the V2 registry API, keyed by their digest.
@y
When the manifest is in hand, the client must verify the signature to ensure
the names and layers are valid. Once confirmed, the client will then use the
digests to download the individual layers. Layers are stored in as blobs in
the V2 registry API, keyed by their digest.
@z

@x
#### Pulling an Image Manifest
@y
#### Pulling an Image Manifest
@z

@x
The image manifest can be fetched with the following url:
@y
The image manifest can be fetched with the following url:
@z

@x
```
GET /v2/<name>/manifests/<reference>
```
@y
```
GET /v2/<name>/manifests/<reference>
```
@z

@x
The `name` and `reference` parameter identify the image and are required. The
reference may include a tag or digest.
@y
The `name` and `reference` parameter identify the image and are required. The
reference may include a tag or digest.
@z

@x
The client should include an Accept header indicating which manifest content
types it supports. For more details on the manifest formats and their content
types, see [manifest-v2-1.md](manifest-v2-1.md) and
[manifest-v2-2.md](manifest-v2-2.md). In a successful response, the Content-Type
header will indicate which manifest type is being returned.
@y
The client should include an Accept header indicating which manifest content
types it supports. For more details on the manifest formats and their content
types, see [manifest-v2-1.md](manifest-v2-1.md) and
[manifest-v2-2.md](manifest-v2-2.md). In a successful response, the Content-Type
header will indicate which manifest type is being returned.
@z

@x
A `404 Not Found` response will be returned if the image is unknown to the
registry. If the image exists and the response is successful, the image
manifest will be returned, with the following format (see
[docker/docker#8093](https://github.com/docker/docker/issues/8093) for details):
@y
A `404 Not Found` response will be returned if the image is unknown to the
registry. If the image exists and the response is successful, the image
manifest will be returned, with the following format (see
[docker/docker#8093](https://github.com/docker/docker/issues/8093) for details):
@z

@x
    {
       "name": <name>,
       "tag": <tag>,
       "fsLayers": [
          {
             "blobSum": <digest>
          },
          ...
        ]
       ],
       "history": <v1 images>,
       "signature": <JWS>
    }
@y
    {
       "name": <name>,
       "tag": <tag>,
       "fsLayers": [
          {
             "blobSum": <digest>
          },
          ...
        ]
       ],
       "history": <v1 images>,
       "signature": <JWS>
    }
@z

@x
The client should verify the returned manifest signature for authenticity
before fetching layers.
@y
The client should verify the returned manifest signature for authenticity
before fetching layers.
@z

@x
##### Existing Manifests
@y
##### Existing Manifests
@z

@x
The image manifest can be checked for existence with the following url:
@y
The image manifest can be checked for existence with the following url:
@z

@x
```
HEAD /v2/<name>/manifests/<reference>
```
@y
```
HEAD /v2/<name>/manifests/<reference>
```
@z

@x
The `name` and `reference` parameter identify the image and are required. The
reference may include a tag or digest.
@y
The `name` and `reference` parameter identify the image and are required. The
reference may include a tag or digest.
@z

@x
A `404 Not Found` response will be returned if the image is unknown to the
registry. If the image exists and the response is successful the response will
be as follows:
@y
A `404 Not Found` response will be returned if the image is unknown to the
registry. If the image exists and the response is successful the response will
be as follows:
@z

@x
```
200 OK
Content-Length: <length of manifest>
Docker-Content-Digest: <digest>
```
@y
```
200 OK
Content-Length: <length of manifest>
Docker-Content-Digest: <digest>
```
@z

@x
#### Pulling a Layer
@y
#### Pulling a Layer
@z

@x
Layers are stored in the blob portion of the registry, keyed by digest.
Pulling a layer is carried out by a standard http request. The URL is as
follows:
@y
Layers are stored in the blob portion of the registry, keyed by digest.
Pulling a layer is carried out by a standard http request. The URL is as
follows:
@z

@x
    GET /v2/<name>/blobs/<digest>
@y
    GET /v2/<name>/blobs/<digest>
@z

@x
Access to a layer will be gated by the `name` of the repository but is
identified uniquely in the registry by `digest`.
@y
Access to a layer will be gated by the `name` of the repository but is
identified uniquely in the registry by `digest`.
@z

@x
This endpoint may issue a 307 (302 for <HTTP 1.1) redirect to another service
for downloading the layer and clients should be prepared to handle redirects.
@y
This endpoint may issue a 307 (302 for <HTTP 1.1) redirect to another service
for downloading the layer and clients should be prepared to handle redirects.
@z

@x
This endpoint should support aggressive HTTP caching for image layers. Support
for Etags, modification dates and other cache control headers should be
included. To allow for incremental downloads, `Range` requests should be
supported, as well.
@y
This endpoint should support aggressive HTTP caching for image layers. Support
for Etags, modification dates and other cache control headers should be
included. To allow for incremental downloads, `Range` requests should be
supported, as well.
@z

@x
### Pushing An Image
@y
### Pushing An Image
@z

@x
Pushing an image works in the opposite order as a pull. After assembling the
image manifest, the client must first push the individual layers. When the
layers are fully pushed into the registry, the client should upload the signed
manifest.
@y
Pushing an image works in the opposite order as a pull. After assembling the
image manifest, the client must first push the individual layers. When the
layers are fully pushed into the registry, the client should upload the signed
manifest.
@z

@x
The details of each step of the process are covered in the following sections.
@y
The details of each step of the process are covered in the following sections.
@z

@x
#### Pushing a Layer
@y
#### Pushing a Layer
@z

@x
All layer uploads use two steps to manage the upload process. The first step
starts the upload in the registry service, returning a url to carry out the
second step. The second step uses the upload url to transfer the actual data.
Uploads are started with a POST request which returns a url that can be used
to push data and check upload status.
@y
All layer uploads use two steps to manage the upload process. The first step
starts the upload in the registry service, returning a url to carry out the
second step. The second step uses the upload url to transfer the actual data.
Uploads are started with a POST request which returns a url that can be used
to push data and check upload status.
@z

@x
The `Location` header will be used to communicate the upload location after
each request. While it won't change in the this specification, clients should
use the most recent value returned by the API.
@y
The `Location` header will be used to communicate the upload location after
each request. While it won't change in the this specification, clients should
use the most recent value returned by the API.
@z

@x
##### Starting An Upload
@y
##### Starting An Upload
@z

@x
To begin the process, a POST request should be issued in the following format:
@y
To begin the process, a POST request should be issued in the following format:
@z

@x
```
POST /v2/<name>/blobs/uploads/
```
@y
```
POST /v2/<name>/blobs/uploads/
```
@z

@x
The parameters of this request are the image namespace under which the layer
will be linked. Responses to this request are covered below.
@y
The parameters of this request are the image namespace under which the layer
will be linked. Responses to this request are covered below.
@z

@x
##### Existing Layers
@y
##### Existing Layers
@z

@x
The existence of a layer can be checked via a `HEAD` request to the blob store
API. The request should be formatted as follows:
@y
The existence of a layer can be checked via a `HEAD` request to the blob store
API. The request should be formatted as follows:
@z

@x
```
HEAD /v2/<name>/blobs/<digest>
```
@y
```
HEAD /v2/<name>/blobs/<digest>
```
@z

@x
If the layer with the digest specified in `digest` is available, a 200 OK
response will be received, with no actual body content (this is according to
http specification). The response will look as follows:
@y
If the layer with the digest specified in `digest` is available, a 200 OK
response will be received, with no actual body content (this is according to
http specification). The response will look as follows:
@z

@x
```
200 OK
Content-Length: <length of blob>
Docker-Content-Digest: <digest>
```
@y
```
200 OK
Content-Length: <length of blob>
Docker-Content-Digest: <digest>
```
@z

@x
When this response is received, the client can assume that the layer is
already available in the registry under the given name and should take no
further action to upload the layer. Note that the binary digests may differ
for the existing registry layer, but the digests will be guaranteed to match.
@y
When this response is received, the client can assume that the layer is
already available in the registry under the given name and should take no
further action to upload the layer. Note that the binary digests may differ
for the existing registry layer, but the digests will be guaranteed to match.
@z

@x
##### Uploading the Layer
@y
##### Uploading the Layer
@z

@x
If the POST request is successful, a `202 Accepted` response will be returned
with the upload URL in the `Location` header:
@y
If the POST request is successful, a `202 Accepted` response will be returned
with the upload URL in the `Location` header:
@z

@x
```
202 Accepted
Location: /v2/<name>/blobs/uploads/<uuid>
Range: bytes=0-<offset>
Content-Length: 0
Docker-Upload-UUID: <uuid>
```
@y
```
202 Accepted
Location: /v2/<name>/blobs/uploads/<uuid>
Range: bytes=0-<offset>
Content-Length: 0
Docker-Upload-UUID: <uuid>
```
@z

@x
The rest of the upload process can be carried out with the returned url,
called the "Upload URL" from the `Location` header. All responses to the
upload url, whether sending data or getting status, will be in this format.
Though the URI format (`/v2/<name>/blobs/uploads/<uuid>`) for the `Location`
header is specified, clients should treat it as an opaque url and should never
try to assemble it. While the `uuid` parameter may be an actual UUID, this
proposal imposes no constraints on the format and clients should never impose
any.
@y
The rest of the upload process can be carried out with the returned url,
called the "Upload URL" from the `Location` header. All responses to the
upload url, whether sending data or getting status, will be in this format.
Though the URI format (`/v2/<name>/blobs/uploads/<uuid>`) for the `Location`
header is specified, clients should treat it as an opaque url and should never
try to assemble it. While the `uuid` parameter may be an actual UUID, this
proposal imposes no constraints on the format and clients should never impose
any.
@z

@x
If clients need to correlate local upload state with remote upload state, the
contents of the `Docker-Upload-UUID` header should be used. Such an id can be
used to key the last used location header when implementing resumable uploads.
@y
If clients need to correlate local upload state with remote upload state, the
contents of the `Docker-Upload-UUID` header should be used. Such an id can be
used to key the last used location header when implementing resumable uploads.
@z

@x
##### Upload Progress
@y
##### Upload Progress
@z

@x
The progress and chunk coordination of the upload process will be coordinated
through the `Range` header. While this is a non-standard use of the `Range`
header, there are examples of [similar approaches](https://developers.google.com/youtube/v3/guides/using_resumable_upload_protocol) in APIs with heavy use.
For an upload that just started, for an example with a 1000 byte layer file,
the `Range` header would be as follows:
@y
The progress and chunk coordination of the upload process will be coordinated
through the `Range` header. While this is a non-standard use of the `Range`
header, there are examples of [similar approaches](https://developers.google.com/youtube/v3/guides/using_resumable_upload_protocol) in APIs with heavy use.
For an upload that just started, for an example with a 1000 byte layer file,
the `Range` header would be as follows:
@z

@x
```
Range: bytes=0-0
```
@y
```
Range: bytes=0-0
```
@z

@x
To get the status of an upload, issue a GET request to the upload URL:
@y
To get the status of an upload, issue a GET request to the upload URL:
@z

@x
```
GET /v2/<name>/blobs/uploads/<uuid>
Host: <registry host>
```
@y
```
GET /v2/<name>/blobs/uploads/<uuid>
Host: <registry host>
```
@z

@x
The response will be similar to the above, except will return 204 status:
@y
The response will be similar to the above, except will return 204 status:
@z

@x
```
204 No Content
Location: /v2/<name>/blobs/uploads/<uuid>
Range: bytes=0-<offset>
Docker-Upload-UUID: <uuid>
```
@y
```
204 No Content
Location: /v2/<name>/blobs/uploads/<uuid>
Range: bytes=0-<offset>
Docker-Upload-UUID: <uuid>
```
@z

@x
Note that the HTTP `Range` header byte ranges are inclusive and that will be
honored, even in non-standard use cases.
@y
Note that the HTTP `Range` header byte ranges are inclusive and that will be
honored, even in non-standard use cases.
@z

@x
##### Monolithic Upload
@y
##### Monolithic Upload
@z

@x
A monolithic upload is simply a chunked upload with a single chunk and may be
favored by clients that would like to avoided the complexity of chunking. To
carry out a "monolithic" upload, one can simply put the entire content blob to
the provided URL:
@y
A monolithic upload is simply a chunked upload with a single chunk and may be
favored by clients that would like to avoided the complexity of chunking. To
carry out a "monolithic" upload, one can simply put the entire content blob to
the provided URL:
@z

@x
```
PUT /v2/<name>/blobs/uploads/<uuid>?digest=<digest>
Content-Length: <size of layer>
Content-Type: application/octet-stream
@y
```
PUT /v2/<name>/blobs/uploads/<uuid>?digest=<digest>
Content-Length: <size of layer>
Content-Type: application/octet-stream
@z

@x
<Layer Binary Data>
```
@y
<Layer Binary Data>
```
@z

@x
The "digest" parameter must be included with the PUT request. Please see the
[_Completed Upload_](#completed-upload) section for details on the parameters
and expected responses.
@y
The "digest" parameter must be included with the PUT request. Please see the
[_Completed Upload_](#completed-upload) section for details on the parameters
and expected responses.
@z

@x
##### Chunked Upload
@y
##### Chunked Upload
@z

@x
To carry out an upload of a chunk, the client can specify a range header and
only include that part of the layer file:
@y
To carry out an upload of a chunk, the client can specify a range header and
only include that part of the layer file:
@z

@x
```
PATCH /v2/<name>/blobs/uploads/<uuid>
Content-Length: <size of chunk>
Content-Range: <start of range>-<end of range>
Content-Type: application/octet-stream
@y
```
PATCH /v2/<name>/blobs/uploads/<uuid>
Content-Length: <size of chunk>
Content-Range: <start of range>-<end of range>
Content-Type: application/octet-stream
@z

@x
<Layer Chunk Binary Data>
```
@y
<Layer Chunk Binary Data>
```
@z

@x
There is no enforcement on layer chunk splits other than that the server must
receive them in order. The server may enforce a minimum chunk size. If the
server cannot accept the chunk, a `416 Requested Range Not Satisfiable`
response will be returned and will include a `Range` header indicating the
current status:
@y
There is no enforcement on layer chunk splits other than that the server must
receive them in order. The server may enforce a minimum chunk size. If the
server cannot accept the chunk, a `416 Requested Range Not Satisfiable`
response will be returned and will include a `Range` header indicating the
current status:
@z

@x
```
416 Requested Range Not Satisfiable
Location: /v2/<name>/blobs/uploads/<uuid>
Range: 0-<last valid range>
Content-Length: 0
Docker-Upload-UUID: <uuid>
```
@y
```
416 Requested Range Not Satisfiable
Location: /v2/<name>/blobs/uploads/<uuid>
Range: 0-<last valid range>
Content-Length: 0
Docker-Upload-UUID: <uuid>
```
@z

@x
If this response is received, the client should resume from the "last valid
range" and upload the subsequent chunk. A 416 will be returned under the
following conditions:
@y
If this response is received, the client should resume from the "last valid
range" and upload the subsequent chunk. A 416 will be returned under the
following conditions:
@z

@x
- Invalid Content-Range header format
- Out of order chunk: the range of the next chunk must start immediately after
  the "last valid range" from the previous response.
@y
- Invalid Content-Range header format
- Out of order chunk: the range of the next chunk must start immediately after
  the "last valid range" from the previous response.
@z

@x
When a chunk is accepted as part of the upload, a `202 Accepted` response will
be returned, including a `Range` header with the current upload status:
@y
When a chunk is accepted as part of the upload, a `202 Accepted` response will
be returned, including a `Range` header with the current upload status:
@z

@x
```
202 Accepted
Location: /v2/<name>/blobs/uploads/<uuid>
Range: bytes=0-<offset>
Content-Length: 0
Docker-Upload-UUID: <uuid>
```
@y
```
202 Accepted
Location: /v2/<name>/blobs/uploads/<uuid>
Range: bytes=0-<offset>
Content-Length: 0
Docker-Upload-UUID: <uuid>
```
@z

@x
##### Completed Upload
@y
##### Completed Upload
@z

@x
For an upload to be considered complete, the client must submit a `PUT`
request on the upload endpoint with a digest parameter. If it is not provided,
the upload will not be considered complete. The format for the final chunk
will be as follows:
@y
For an upload to be considered complete, the client must submit a `PUT`
request on the upload endpoint with a digest parameter. If it is not provided,
the upload will not be considered complete. The format for the final chunk
will be as follows:
@z

@x
```
PUT /v2/<name>/blobs/uploads/<uuid>?digest=<digest>
Content-Length: <size of chunk>
Content-Range: <start of range>-<end of range>
Content-Type: application/octet-stream
@y
```
PUT /v2/<name>/blobs/uploads/<uuid>?digest=<digest>
Content-Length: <size of chunk>
Content-Range: <start of range>-<end of range>
Content-Type: application/octet-stream
@z

@x
<Last Layer Chunk Binary Data>
```
@y
<Last Layer Chunk Binary Data>
```
@z

@x
Optionally, if all chunks have already been uploaded, a `PUT` request with a
`digest` parameter and zero-length body may be sent to complete and validate
the upload. Multiple "digest" parameters may be provided with different
digests. The server may verify none or all of them but _must_ notify the
client if the content is rejected.
@y
Optionally, if all chunks have already been uploaded, a `PUT` request with a
`digest` parameter and zero-length body may be sent to complete and validate
the upload. Multiple "digest" parameters may be provided with different
digests. The server may verify none or all of them but _must_ notify the
client if the content is rejected.
@z

@x
When the last chunk is received and the layer has been validated, the client
will receive a `201 Created` response:
@y
When the last chunk is received and the layer has been validated, the client
will receive a `201 Created` response:
@z

@x
```
201 Created
Location: /v2/<name>/blobs/<digest>
Content-Length: 0
Docker-Content-Digest: <digest>
```
@y
```
201 Created
Location: /v2/<name>/blobs/<digest>
Content-Length: 0
Docker-Content-Digest: <digest>
```
@z

@x
The `Location` header will contain the registry URL to access the accepted
layer file. The `Docker-Content-Digest` header returns the canonical digest of
the uploaded blob which may differ from the provided digest. Most clients may
ignore the value but if it is used, the client should verify the value against
the uploaded blob data.
@y
The `Location` header will contain the registry URL to access the accepted
layer file. The `Docker-Content-Digest` header returns the canonical digest of
the uploaded blob which may differ from the provided digest. Most clients may
ignore the value but if it is used, the client should verify the value against
the uploaded blob data.
@z

@x
###### Digest Parameter
@y
###### Digest Parameter
@z

@x
The "digest" parameter is designed as an opaque parameter to support
verification of a successful transfer. For example, an HTTP URI parameter
might be as follows:
@y
The "digest" parameter is designed as an opaque parameter to support
verification of a successful transfer. For example, an HTTP URI parameter
might be as follows:
@z

@x
```
sha256:6c3c624b58dbbcd3c0dd82b4c53f04194d1247c6eebdaab7c610cf7d66709b3b
```
@y
```
sha256:6c3c624b58dbbcd3c0dd82b4c53f04194d1247c6eebdaab7c610cf7d66709b3b
```
@z

@x
Given this parameter, the registry will verify that the provided content does
match this digest.
@y
Given this parameter, the registry will verify that the provided content does
match this digest.
@z

@x
##### Canceling an Upload
@y
##### Canceling an Upload
@z

@x
An upload can be cancelled by issuing a DELETE request to the upload endpoint.
The format will be as follows:
@y
An upload can be cancelled by issuing a DELETE request to the upload endpoint.
The format will be as follows:
@z

@x
```
DELETE /v2/<name>/blobs/uploads/<uuid>
```
@y
```
DELETE /v2/<name>/blobs/uploads/<uuid>
```
@z

@x
After this request is issued, the upload uuid will no longer be valid and the
registry server will dump all intermediate data. While uploads will time out
if not completed, clients should issue this request if they encounter a fatal
error but still have the ability to issue an http request.
@y
After this request is issued, the upload uuid will no longer be valid and the
registry server will dump all intermediate data. While uploads will time out
if not completed, clients should issue this request if they encounter a fatal
error but still have the ability to issue an http request.
@z

@x
##### Cross Repository Blob Mount
@y
##### Cross Repository Blob Mount
@z

@x
A blob may be mounted from another repository that the client has read access
to, removing the need to upload a blob already known to the registry. To issue
a blob mount instead of an upload, a POST request should be issued in the
following format:
@y
A blob may be mounted from another repository that the client has read access
to, removing the need to upload a blob already known to the registry. To issue
a blob mount instead of an upload, a POST request should be issued in the
following format:
@z

@x
```
POST /v2/<name>/blobs/uploads/?mount=<digest>&from=<repository name>
Content-Length: 0
```
@y
```
POST /v2/<name>/blobs/uploads/?mount=<digest>&from=<repository name>
Content-Length: 0
```
@z

@x
If the blob is successfully mounted, the client will receive a `201 Created`
response:
@y
If the blob is successfully mounted, the client will receive a `201 Created`
response:
@z

@x
```
201 Created
Location: /v2/<name>/blobs/<digest>
Content-Length: 0
Docker-Content-Digest: <digest>
```
@y
```
201 Created
Location: /v2/<name>/blobs/<digest>
Content-Length: 0
Docker-Content-Digest: <digest>
```
@z

@x
The `Location` header will contain the registry URL to access the accepted
layer file. The `Docker-Content-Digest` header returns the canonical digest of
the uploaded blob which may differ from the provided digest. Most clients may
ignore the value but if it is used, the client should verify the value against
the uploaded blob data.
@y
The `Location` header will contain the registry URL to access the accepted
layer file. The `Docker-Content-Digest` header returns the canonical digest of
the uploaded blob which may differ from the provided digest. Most clients may
ignore the value but if it is used, the client should verify the value against
the uploaded blob data.
@z

@x
If a mount fails due to invalid repository or digest arguments, the registry
will fall back to the standard upload behavior and return a `202 Accepted` with
the upload URL in the `Location` header:
@y
If a mount fails due to invalid repository or digest arguments, the registry
will fall back to the standard upload behavior and return a `202 Accepted` with
the upload URL in the `Location` header:
@z

@x
```
202 Accepted
Location: /v2/<name>/blobs/uploads/<uuid>
Range: bytes=0-<offset>
Content-Length: 0
Docker-Upload-UUID: <uuid>
```
@y
```
202 Accepted
Location: /v2/<name>/blobs/uploads/<uuid>
Range: bytes=0-<offset>
Content-Length: 0
Docker-Upload-UUID: <uuid>
```
@z

@x
This behavior is consistent with older versions of the registry, which do not
recognize the repository mount query parameters.
@y
This behavior is consistent with older versions of the registry, which do not
recognize the repository mount query parameters.
@z

@x
Note: a client may issue a HEAD request to check existence of a blob in a source
repository to distinguish between the registry not supporting blob mounts and
the blob not existing in the expected repository.
@y
Note: a client may issue a HEAD request to check existence of a blob in a source
repository to distinguish between the registry not supporting blob mounts and
the blob not existing in the expected repository.
@z

@x
##### Errors
@y
##### Errors
@z

@x
If an 502, 503 or 504 error is received, the client should assume that the
download can proceed due to a temporary condition, honoring the appropriate
retry mechanism. Other 5xx errors should be treated as terminal.
@y
If an 502, 503 or 504 error is received, the client should assume that the
download can proceed due to a temporary condition, honoring the appropriate
retry mechanism. Other 5xx errors should be treated as terminal.
@z

@x
If there is a problem with the upload, a 4xx error will be returned indicating
the problem. After receiving a 4xx response (except 416, as called out above),
the upload will be considered failed and the client should take appropriate
action.
@y
If there is a problem with the upload, a 4xx error will be returned indicating
the problem. After receiving a 4xx response (except 416, as called out above),
the upload will be considered failed and the client should take appropriate
action.
@z

@x
Note that the upload url will not be available forever. If the upload uuid is
unknown to the registry, a `404 Not Found` response will be returned and the
client must restart the upload process.
@y
Note that the upload url will not be available forever. If the upload uuid is
unknown to the registry, a `404 Not Found` response will be returned and the
client must restart the upload process.
@z

@x
#### Deleting a Layer
@y
#### Deleting a Layer
@z

@x
A layer may be deleted from the registry via its `name` and `digest`. A
delete may be issued with the following request format:
@y
A layer may be deleted from the registry via its `name` and `digest`. A
delete may be issued with the following request format:
@z

@x
    DELETE /v2/<name>/blobs/<digest>
@y
    DELETE /v2/<name>/blobs/<digest>
@z

@x
If the blob exists and has been successfully deleted, the following response
will be issued:
@y
If the blob exists and has been successfully deleted, the following response
will be issued:
@z

@x
    202 Accepted
    Content-Length: None
@y
    202 Accepted
    Content-Length: None
@z

@x
If the blob had already been deleted or did not exist, a `404 Not Found`
response will be issued instead.
@y
If the blob had already been deleted or did not exist, a `404 Not Found`
response will be issued instead.
@z

@x
If a layer is deleted which is referenced by a manifest in the registry,
then the complete images will not be resolvable.
@y
If a layer is deleted which is referenced by a manifest in the registry,
then the complete images will not be resolvable.
@z

@x
#### Pushing an Image Manifest
@y
#### Pushing an Image Manifest
@z

@x
Once all of the layers for an image are uploaded, the client can upload the
image manifest. An image can be pushed using the following request format:
@y
Once all of the layers for an image are uploaded, the client can upload the
image manifest. An image can be pushed using the following request format:
@z

@x
    PUT /v2/<name>/manifests/<reference>
    Content-Type: <manifest media type>
@y
    PUT /v2/<name>/manifests/<reference>
    Content-Type: <manifest media type>
@z

@x
    {
       "name": <name>,
       "tag": <tag>,
       "fsLayers": [
          {
             "blobSum": <digest>
          },
          ...
        ]
       ],
       "history": <v1 images>,
       "signature": <JWS>,
       ...
    }
@y
    {
       "name": <name>,
       "tag": <tag>,
       "fsLayers": [
          {
             "blobSum": <digest>
          },
          ...
        ]
       ],
       "history": <v1 images>,
       "signature": <JWS>,
       ...
    }
@z

@x
The `name` and `reference` fields of the response body must match those
specified in the URL. The `reference` field may be a "tag" or a "digest". The
content type should match the type of the manifest being uploaded, as specified
in [manifest-v2-1.md](manifest-v2-1.md) and [manifest-v2-2.md](manifest-v2-2.md).
@y
The `name` and `reference` fields of the response body must match those
specified in the URL. The `reference` field may be a "tag" or a "digest". The
content type should match the type of the manifest being uploaded, as specified
in [manifest-v2-1.md](manifest-v2-1.md) and [manifest-v2-2.md](manifest-v2-2.md).
@z

@x
If there is a problem with pushing the manifest, a relevant 4xx response will
be returned with a JSON error message. Please see the
[_PUT Manifest_](#put-manifest) section for details on possible error codes that
may be returned.
@y
If there is a problem with pushing the manifest, a relevant 4xx response will
be returned with a JSON error message. Please see the
[_PUT Manifest_](#put-manifest) section for details on possible error codes that
may be returned.
@z

@x
If one or more layers are unknown to the registry, `BLOB_UNKNOWN` errors are
returned. The `detail` field of the error response will have a `digest` field
identifying the missing blob. An error is returned for each unknown blob. The
response format is as follows:
@y
If one or more layers are unknown to the registry, `BLOB_UNKNOWN` errors are
returned. The `detail` field of the error response will have a `digest` field
identifying the missing blob. An error is returned for each unknown blob. The
response format is as follows:
@z

@x
    {
        "errors:" [{
                "code": "BLOB_UNKNOWN",
                "message": "blob unknown to registry",
                "detail": {
                    "digest": <digest>
                }
            },
            ...
        ]
    }
@y
    {
        "errors:" [{
                "code": "BLOB_UNKNOWN",
                "message": "blob unknown to registry",
                "detail": {
                    "digest": <digest>
                }
            },
            ...
        ]
    }
@z

@x
### Listing Repositories
@y
### Listing Repositories
@z

@x
Images are stored in collections, known as a _repository_, which is keyed by a
`name`, as seen throughout the API specification. A registry instance may
contain several repositories. The list of available repositories is made
available through the _catalog_.
@y
Images are stored in collections, known as a _repository_, which is keyed by a
`name`, as seen throughout the API specification. A registry instance may
contain several repositories. The list of available repositories is made
available through the _catalog_.
@z

@x
The catalog for a given registry can be retrieved with the following request:
@y
The catalog for a given registry can be retrieved with the following request:
@z

@x
```
GET /v2/_catalog
```
@y
```
GET /v2/_catalog
```
@z

@x
The response will be in the following format:
@y
The response will be in the following format:
@z

@x
```
200 OK
Content-Type: application/json
@y
```
200 OK
Content-Type: application/json
@z

@x
{
  "repositories": [
    <name>,
    ...
  ]
}
```
@y
{
  "repositories": [
    <name>,
    ...
  ]
}
```
@z

@x
Note that the contents of the response are specific to the registry
implementation. Some registries may opt to provide a full catalog output,
limit it based on the user's access level or omit upstream results, if
providing mirroring functionality. Subsequently, the presence of a repository
in the catalog listing only means that the registry *may* provide access to
the repository at the time of the request. Conversely, a missing entry does
*not* mean that the registry does not have the repository. More succinctly,
the presence of a repository only guarantees that it is there but not that it
is _not_ there.
@y
Note that the contents of the response are specific to the registry
implementation. Some registries may opt to provide a full catalog output,
limit it based on the user's access level or omit upstream results, if
providing mirroring functionality. Subsequently, the presence of a repository
in the catalog listing only means that the registry *may* provide access to
the repository at the time of the request. Conversely, a missing entry does
*not* mean that the registry does not have the repository. More succinctly,
the presence of a repository only guarantees that it is there but not that it
is _not_ there.
@z

@x
For registries with a large number of repositories, this response may be quite
large. If such a response is expected, one should use pagination. A registry
may also limit the amount of responses returned even if pagination was not
explicitly requested. In this case the `Link` header will be returned along
with the results, and subsequent results can be obtained by following the link
as if pagination had been initially requested.
@y
For registries with a large number of repositories, this response may be quite
large. If such a response is expected, one should use pagination. A registry
may also limit the amount of responses returned even if pagination was not
explicitly requested. In this case the `Link` header will be returned along
with the results, and subsequent results can be obtained by following the link
as if pagination had been initially requested.
@z

@x
For details of the `Link` header, please see the [_Pagination_](#pagination)
section.
@y
For details of the `Link` header, please see the [_Pagination_](#pagination)
section.
@z

@x
#### Pagination
@y
#### Pagination
@z

@x
Paginated catalog results can be retrieved by adding an `n` parameter to the
request URL, declaring that the response should be limited to `n` results.
Starting a paginated flow begins as follows:
@y
Paginated catalog results can be retrieved by adding an `n` parameter to the
request URL, declaring that the response should be limited to `n` results.
Starting a paginated flow begins as follows:
@z

@x
```
GET /v2/_catalog?n=<integer>
```
@y
```
GET /v2/_catalog?n=<integer>
```
@z

@x
The above specifies that a catalog response should be returned, from the start of
the result set, ordered lexically, limiting the number of results to `n`. The
response to such a request would look as follows:
@y
The above specifies that a catalog response should be returned, from the start of
the result set, ordered lexically, limiting the number of results to `n`. The
response to such a request would look as follows:
@z

@x
```
200 OK
Content-Type: application/json
Link: <<url>?n=<n from the request>&last=<last repository in response>>; rel="next"
@y
```
200 OK
Content-Type: application/json
Link: <<url>?n=<n from the request>&last=<last repository in response>>; rel="next"
@z

@x
{
  "repositories": [
    <name>,
    ...
  ]
}
```
@y
{
  "repositories": [
    <name>,
    ...
  ]
}
```
@z

@x
The above includes the _first_ `n` entries from the result set. To get the
_next_ `n` entries, one can create a URL where the argument `last` has the
value from `repositories[len(repositories)-1]`. If there are indeed more
results, the URL for the next block is encoded in an
[RFC5988](https://tools.ietf.org/html/rfc5988) `Link` header, as a "next"
relation. The presence of the `Link` header communicates to the client that
the entire result set has not been returned and another request must be
issued. If the header is not present, the client can assume that all results
have been received.
@y
The above includes the _first_ `n` entries from the result set. To get the
_next_ `n` entries, one can create a URL where the argument `last` has the
value from `repositories[len(repositories)-1]`. If there are indeed more
results, the URL for the next block is encoded in an
[RFC5988](https://tools.ietf.org/html/rfc5988) `Link` header, as a "next"
relation. The presence of the `Link` header communicates to the client that
the entire result set has not been returned and another request must be
issued. If the header is not present, the client can assume that all results
have been received.
@z

@x
> __NOTE:__ In the request template above, note that the brackets
> are required. For example, if the url is
> `http://example.com/v2/_catalog?n=20&last=b`, the value of the header would
> be `<http://example.com/v2/_catalog?n=20&last=b>; rel="next"`. Please see
> [RFC5988](https://tools.ietf.org/html/rfc5988) for details.
@y
> __NOTE:__ In the request template above, note that the brackets
> are required. For example, if the url is
> `http://example.com/v2/_catalog?n=20&last=b`, the value of the header would
> be `<http://example.com/v2/_catalog?n=20&last=b>; rel="next"`. Please see
> [RFC5988](https://tools.ietf.org/html/rfc5988) for details.
@z

@x
Compliant client implementations should always use the `Link` header
value when proceeding through results linearly. The client may construct URLs
to skip forward in the catalog.
@y
Compliant client implementations should always use the `Link` header
value when proceeding through results linearly. The client may construct URLs
to skip forward in the catalog.
@z

@x
To get the next result set, a client would issue the request as follows, using
the URL encoded in the described `Link` header:
@y
To get the next result set, a client would issue the request as follows, using
the URL encoded in the described `Link` header:
@z

@x
```
GET /v2/_catalog?n=<n from the request>&last=<last repository value from previous response>
```
@y
```
GET /v2/_catalog?n=<n from the request>&last=<last repository value from previous response>
```
@z

@x
The above process should then be repeated until the `Link` header is no longer
set.
@y
The above process should then be repeated until the `Link` header is no longer
set.
@z

@x
The catalog result set is represented abstractly as a lexically sorted list,
where the position in that list can be specified by the query term `last`. The
entries in the response start _after_ the term specified by `last`, up to `n`
entries.
@y
The catalog result set is represented abstractly as a lexically sorted list,
where the position in that list can be specified by the query term `last`. The
entries in the response start _after_ the term specified by `last`, up to `n`
entries.
@z

@x
The behavior of `last` is quite simple when demonstrated with an example. Let
us say the registry has the following repositories:
@y
The behavior of `last` is quite simple when demonstrated with an example. Let
us say the registry has the following repositories:
@z

@x
```
a
b
c
d
```
@y
```
a
b
c
d
```
@z

@x
If the value of `n` is 2, _a_ and _b_ will be returned on the first response.
The `Link` header returned on the response will have `n` set to 2 and last set
to _b_:
@y
If the value of `n` is 2, _a_ and _b_ will be returned on the first response.
The `Link` header returned on the response will have `n` set to 2 and last set
to _b_:
@z

@x
```
Link: <<url>?n=2&last=b>; rel="next"
```
@y
```
Link: <<url>?n=2&last=b>; rel="next"
```
@z

@x
The client can then issue the request with the above value from the `Link`
header, receiving the values _c_ and _d_. Note that `n` may change on the second
to last response or be fully omitted, depending on the server implementation.
@y
The client can then issue the request with the above value from the `Link`
header, receiving the values _c_ and _d_. Note that `n` may change on the second
to last response or be fully omitted, depending on the server implementation.
@z

@x
### Listing Image Tags
@y
### Listing Image Tags
@z

@x
It may be necessary to list all of the tags under a given repository. The tags
for an image repository can be retrieved with the following request:
@y
It may be necessary to list all of the tags under a given repository. The tags
for an image repository can be retrieved with the following request:
@z

@x
    GET /v2/<name>/tags/list
@y
    GET /v2/<name>/tags/list
@z

@x
The response will be in the following format:
@y
The response will be in the following format:
@z

@x
    200 OK
    Content-Type: application/json
@y
    200 OK
    Content-Type: application/json
@z

@x
    {
        "name": <name>,
        "tags": [
            <tag>,
            ...
        ]
    }
@y
    {
        "name": <name>,
        "tags": [
            <tag>,
            ...
        ]
    }
@z

@x
For repositories with a large number of tags, this response may be quite
large. If such a response is expected, one should use the pagination.
@y
For repositories with a large number of tags, this response may be quite
large. If such a response is expected, one should use the pagination.
@z

@x
#### Pagination
@y
#### Pagination
@z

@x
Paginated tag results can be retrieved by adding the appropriate parameters to
the request URL described above. The behavior of tag pagination is identical
to that specified for catalog pagination. We cover a simple flow to highlight
any differences.
@y
Paginated tag results can be retrieved by adding the appropriate parameters to
the request URL described above. The behavior of tag pagination is identical
to that specified for catalog pagination. We cover a simple flow to highlight
any differences.
@z

@x
Starting a paginated flow may begin as follows:
@y
Starting a paginated flow may begin as follows:
@z

@x
```
GET /v2/<name>/tags/list?n=<integer>
```
@y
```
GET /v2/<name>/tags/list?n=<integer>
```
@z

@x
The above specifies that a tags response should be returned, from the start of
the result set, ordered lexically, limiting the number of results to `n`. The
response to such a request would look as follows:
@y
The above specifies that a tags response should be returned, from the start of
the result set, ordered lexically, limiting the number of results to `n`. The
response to such a request would look as follows:
@z

@x
```
200 OK
Content-Type: application/json
Link: <<url>?n=<n from the request>&last=<last tag value from previous response>>; rel="next"
@y
```
200 OK
Content-Type: application/json
Link: <<url>?n=<n from the request>&last=<last tag value from previous response>>; rel="next"
@z

@x
{
  "name": <name>,
  "tags": [
    <tag>,
    ...
  ]
}
```
@y
{
  "name": <name>,
  "tags": [
    <tag>,
    ...
  ]
}
```
@z

@x
To get the next result set, a client would issue the request as follows, using
the value encoded in the [RFC5988](https://tools.ietf.org/html/rfc5988) `Link`
header:
@y
To get the next result set, a client would issue the request as follows, using
the value encoded in the [RFC5988](https://tools.ietf.org/html/rfc5988) `Link`
header:
@z

@x
```
GET /v2/<name>/tags/list?n=<n from the request>&last=<last tag value from previous response>
```
@y
```
GET /v2/<name>/tags/list?n=<n from the request>&last=<last tag value from previous response>
```
@z

@x
The above process should then be repeated until the `Link` header is no longer
set in the response. The behavior of the `last` parameter, the provided
response result, lexical ordering and encoding of the `Link` header are
identical to that of catalog pagination.
@y
The above process should then be repeated until the `Link` header is no longer
set in the response. The behavior of the `last` parameter, the provided
response result, lexical ordering and encoding of the `Link` header are
identical to that of catalog pagination.
@z

@x
### Deleting an Image
@y
### Deleting an Image
@z

@x
An image may be deleted from the registry via its `name` and `reference`. A
delete may be issued with the following request format:
@y
An image may be deleted from the registry via its `name` and `reference`. A
delete may be issued with the following request format:
@z

@x
    DELETE /v2/<name>/manifests/<reference>
@y
    DELETE /v2/<name>/manifests/<reference>
@z

@x
For deletes, `reference` *must* be a digest or the delete will fail. If the
image exists and has been successfully deleted, the following response will be
issued:
@y
For deletes, `reference` *must* be a digest or the delete will fail. If the
image exists and has been successfully deleted, the following response will be
issued:
@z

@x
    202 Accepted
    Content-Length: None
@y
    202 Accepted
    Content-Length: None
@z

@x
If the image had already been deleted or did not exist, a `404 Not Found`
response will be issued instead.
@y
If the image had already been deleted or did not exist, a `404 Not Found`
response will be issued instead.
@z

@x
> **Note**  When deleting a manifest from a registry version 2.3 or later, the
> following header must be used when `HEAD` or `GET`-ing the manifest to obtain
> the correct digest to delete:
@y
> **Note**  When deleting a manifest from a registry version 2.3 or later, the
> following header must be used when `HEAD` or `GET`-ing the manifest to obtain
> the correct digest to delete:
@z

@x
    Accept: application/vnd.docker.distribution.manifest.v2+json
@y
    Accept: application/vnd.docker.distribution.manifest.v2+json
@z

@x
> for more details, see: [compatibility.md](../compatibility.md#content-addressable-storage-cas)
@y
> for more details, see: [compatibility.md](../compatibility.md#content-addressable-storage-cas)
@z

@x
## Detail
@y
## Detail
@z

@x
> **Note**: This section is still under construction. For the purposes of
> implementation, if any details below differ from the described request flows
> above, the section below should be corrected. When they match, this note
> should be removed.
@y
> **Note**: This section is still under construction. For the purposes of
> implementation, if any details below differ from the described request flows
> above, the section below should be corrected. When they match, this note
> should be removed.
@z

@x
The behavior of the endpoints are covered in detail in this section, organized
by route and entity. All aspects of the request and responses are covered,
including headers, parameters and body formats. Examples of requests and their
corresponding responses, with success and failure, are enumerated.
@y
The behavior of the endpoints are covered in detail in this section, organized
by route and entity. All aspects of the request and responses are covered,
including headers, parameters and body formats. Examples of requests and their
corresponding responses, with success and failure, are enumerated.
@z

@x
> **Note**: The sections on endpoint detail are arranged with an example
> request, a description of the request, followed by information about that
> request.
@y
> **Note**: The sections on endpoint detail are arranged with an example
> request, a description of the request, followed by information about that
> request.
@z

@x
A list of methods and URIs are covered in the table below:
@y
A list of methods and URIs are covered in the table below:
@z

@x
|Method|Path|Entity|Description|
|------|----|------|-----------|
| GET | `/v2/` | Base | Check that the endpoint implements Docker Registry API V2. |
| GET | `/v2/<name>/tags/list` | Tags | Fetch the tags under the repository identified by `name`. |
| GET | `/v2/<name>/manifests/<reference>` | Manifest | Fetch the manifest identified by `name` and `reference` where `reference` can be a tag or digest. A `HEAD` request can also be issued to this endpoint to obtain resource information without receiving all data. |
| PUT | `/v2/<name>/manifests/<reference>` | Manifest | Put the manifest identified by `name` and `reference` where `reference` can be a tag or digest. |
| DELETE | `/v2/<name>/manifests/<reference>` | Manifest | Delete the manifest identified by `name` and `reference`. Note that a manifest can _only_ be deleted by `digest`. |
| GET | `/v2/<name>/blobs/<digest>` | Blob | Retrieve the blob from the registry identified by `digest`. A `HEAD` request can also be issued to this endpoint to obtain resource information without receiving all data. |
| DELETE | `/v2/<name>/blobs/<digest>` | Blob | Delete the blob identified by `name` and `digest` |
| POST | `/v2/<name>/blobs/uploads/` | Initiate Blob Upload | Initiate a resumable blob upload. If successful, an upload location will be provided to complete the upload. Optionally, if the `digest` parameter is present, the request body will be used to complete the upload in a single request. |
| GET | `/v2/<name>/blobs/uploads/<uuid>` | Blob Upload | Retrieve status of upload identified by `uuid`. The primary purpose of this endpoint is to resolve the current status of a resumable upload. |
| PATCH | `/v2/<name>/blobs/uploads/<uuid>` | Blob Upload | Upload a chunk of data for the specified upload. |
| PUT | `/v2/<name>/blobs/uploads/<uuid>` | Blob Upload | Complete the upload specified by `uuid`, optionally appending the body as the final chunk. |
| DELETE | `/v2/<name>/blobs/uploads/<uuid>` | Blob Upload | Cancel outstanding upload processes, releasing associated resources. If this is not called, the unfinished uploads will eventually timeout. |
| GET | `/v2/_catalog` | Catalog | Retrieve a sorted, json list of repositories available in the registry. |
@y
|Method|Path|Entity|Description|
|------|----|------|-----------|
| GET | `/v2/` | Base | Check that the endpoint implements Docker Registry API V2. |
| GET | `/v2/<name>/tags/list` | Tags | Fetch the tags under the repository identified by `name`. |
| GET | `/v2/<name>/manifests/<reference>` | Manifest | Fetch the manifest identified by `name` and `reference` where `reference` can be a tag or digest. A `HEAD` request can also be issued to this endpoint to obtain resource information without receiving all data. |
| PUT | `/v2/<name>/manifests/<reference>` | Manifest | Put the manifest identified by `name` and `reference` where `reference` can be a tag or digest. |
| DELETE | `/v2/<name>/manifests/<reference>` | Manifest | Delete the manifest identified by `name` and `reference`. Note that a manifest can _only_ be deleted by `digest`. |
| GET | `/v2/<name>/blobs/<digest>` | Blob | Retrieve the blob from the registry identified by `digest`. A `HEAD` request can also be issued to this endpoint to obtain resource information without receiving all data. |
| DELETE | `/v2/<name>/blobs/<digest>` | Blob | Delete the blob identified by `name` and `digest` |
| POST | `/v2/<name>/blobs/uploads/` | Initiate Blob Upload | Initiate a resumable blob upload. If successful, an upload location will be provided to complete the upload. Optionally, if the `digest` parameter is present, the request body will be used to complete the upload in a single request. |
| GET | `/v2/<name>/blobs/uploads/<uuid>` | Blob Upload | Retrieve status of upload identified by `uuid`. The primary purpose of this endpoint is to resolve the current status of a resumable upload. |
| PATCH | `/v2/<name>/blobs/uploads/<uuid>` | Blob Upload | Upload a chunk of data for the specified upload. |
| PUT | `/v2/<name>/blobs/uploads/<uuid>` | Blob Upload | Complete the upload specified by `uuid`, optionally appending the body as the final chunk. |
| DELETE | `/v2/<name>/blobs/uploads/<uuid>` | Blob Upload | Cancel outstanding upload processes, releasing associated resources. If this is not called, the unfinished uploads will eventually timeout. |
| GET | `/v2/_catalog` | Catalog | Retrieve a sorted, json list of repositories available in the registry. |
@z

@x
The detail for each endpoint is covered in the following sections.
@y
The detail for each endpoint is covered in the following sections.
@z

@x
### Errors
@y
### Errors
@z

@x
The error codes encountered via the API are enumerated in the following table:
@y
The error codes encountered via the API are enumerated in the following table:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
 `BLOB_UNKNOWN` | blob unknown to registry | This error may be returned when a blob is unknown to the registry in a specified repository. This can be returned with a standard get or if a manifest references an unknown layer during upload.
 `BLOB_UPLOAD_INVALID` | blob upload invalid | The blob upload encountered an error and can no longer proceed.
 `BLOB_UPLOAD_UNKNOWN` | blob upload unknown to registry | If a blob upload has been cancelled or was never started, this error code may be returned.
 `DIGEST_INVALID` | provided digest did not match uploaded content | When a blob is uploaded, the registry will check that the content matches the digest provided by the client. The error may include a detail structure with the key "digest", including the invalid digest string. This error may also be returned when a manifest includes an invalid layer digest.
 `MANIFEST_BLOB_UNKNOWN` | blob unknown to registry | This error may be returned when a manifest blob is  unknown to the registry.
 `MANIFEST_INVALID` | manifest invalid | During upload, manifests undergo several checks ensuring validity. If those checks fail, this error may be returned, unless a more specific error is included. The detail will contain information the failed validation.
 `MANIFEST_UNKNOWN` | manifest unknown | This error is returned when the manifest, identified by name and tag is unknown to the repository.
 `MANIFEST_UNVERIFIED` | manifest failed signature verification | During manifest upload, if the manifest fails signature verification, this error will be returned.
 `NAME_INVALID` | invalid repository name | Invalid repository name encountered either during manifest validation or any API operation.
 `NAME_UNKNOWN` | repository name not known to registry | This is returned if the name used during an operation is unknown to the registry.
 `SIZE_INVALID` | provided length did not match content length | When a layer is uploaded, the provided size will be checked against the uploaded content. If they do not match, this error will be returned.
 `TAG_INVALID` | manifest tag did not match URI | During a manifest upload, if the tag in the manifest does not match the uri tag, this error will be returned.
 `UNAUTHORIZED` | authentication required | The access controller was unable to authenticate the client. Often this will be accompanied by a Www-Authenticate HTTP response header indicating how to authenticate.
 `DENIED` | requested access to the resource is denied | The access controller denied access for the operation on a resource.
 `UNSUPPORTED` | The operation is unsupported. | The operation was unsupported due to a missing implementation or invalid set of parameters.
@y
|Code|Message|Description|
|----|-------|-----------|
 `BLOB_UNKNOWN` | blob unknown to registry | This error may be returned when a blob is unknown to the registry in a specified repository. This can be returned with a standard get or if a manifest references an unknown layer during upload.
 `BLOB_UPLOAD_INVALID` | blob upload invalid | The blob upload encountered an error and can no longer proceed.
 `BLOB_UPLOAD_UNKNOWN` | blob upload unknown to registry | If a blob upload has been cancelled or was never started, this error code may be returned.
 `DIGEST_INVALID` | provided digest did not match uploaded content | When a blob is uploaded, the registry will check that the content matches the digest provided by the client. The error may include a detail structure with the key "digest", including the invalid digest string. This error may also be returned when a manifest includes an invalid layer digest.
 `MANIFEST_BLOB_UNKNOWN` | blob unknown to registry | This error may be returned when a manifest blob is  unknown to the registry.
 `MANIFEST_INVALID` | manifest invalid | During upload, manifests undergo several checks ensuring validity. If those checks fail, this error may be returned, unless a more specific error is included. The detail will contain information the failed validation.
 `MANIFEST_UNKNOWN` | manifest unknown | This error is returned when the manifest, identified by name and tag is unknown to the repository.
 `MANIFEST_UNVERIFIED` | manifest failed signature verification | During manifest upload, if the manifest fails signature verification, this error will be returned.
 `NAME_INVALID` | invalid repository name | Invalid repository name encountered either during manifest validation or any API operation.
 `NAME_UNKNOWN` | repository name not known to registry | This is returned if the name used during an operation is unknown to the registry.
 `SIZE_INVALID` | provided length did not match content length | When a layer is uploaded, the provided size will be checked against the uploaded content. If they do not match, this error will be returned.
 `TAG_INVALID` | manifest tag did not match URI | During a manifest upload, if the tag in the manifest does not match the uri tag, this error will be returned.
 `UNAUTHORIZED` | authentication required | The access controller was unable to authenticate the client. Often this will be accompanied by a Www-Authenticate HTTP response header indicating how to authenticate.
 `DENIED` | requested access to the resource is denied | The access controller denied access for the operation on a resource.
 `UNSUPPORTED` | The operation is unsupported. | The operation was unsupported due to a missing implementation or invalid set of parameters.
@z

@x
### Base
@y
### Base
@z

@x
Base V2 API route. Typically, this can be used for lightweight version checks and to validate registry authentication.
@y
Base V2 API route. Typically, this can be used for lightweight version checks and to validate registry authentication.
@z

@x
#### GET Base
@y
#### GET Base
@z

@x
Check that the endpoint implements Docker Registry API V2.
@y
Check that the endpoint implements Docker Registry API V2.
@z

@x
```
GET /v2/
Host: <registry host>
Authorization: <scheme> <token>
```
@y
```
GET /v2/
Host: <registry host>
Authorization: <scheme> <token>
```
@z

@x
The following parameters should be specified on the request:
@y
The following parameters should be specified on the request:
@z

@x
|Name|Kind|Description|
|----|----|-----------|
|`Host`|header|Standard HTTP Host Header. Should be set to the registry host.|
|`Authorization`|header|An RFC7235 compliant authorization header.|
@y
|Name|Kind|Description|
|----|----|-----------|
|`Host`|header|Standard HTTP Host Header. Should be set to the registry host.|
|`Authorization`|header|An RFC7235 compliant authorization header.|
@z

@x
###### On Success: OK
@y
###### On Success: OK
@z

@x
```
200 OK
```
@y
```
200 OK
```
@z

@x
The API implements V2 protocol and is accessible.
@y
The API implements V2 protocol and is accessible.
@z

@x
###### On Failure: Not Found
@y
###### On Failure: Not Found
@z

@x
```
404 Not Found
```
@y
```
404 Not Found
```
@z

@x
The registry does not implement the V2 API.
@y
The registry does not implement the V2 API.
@z

@x
###### On Failure: Authentication Required
@y
###### On Failure: Authentication Required
@z

@x
```
401 Unauthorized
WWW-Authenticate: <scheme> realm="<realm>", ..."
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@y
```
401 Unauthorized
WWW-Authenticate: <scheme> realm="<realm>", ..."
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The client is not authenticated.
@y
The client is not authenticated.
@z

@x
The following headers will be returned on the response:
@y
The following headers will be returned on the response:
@z

@x
|Name|Description|
|----|-----------|
|`WWW-Authenticate`|An RFC7235 compliant authentication challenge header.|
|`Content-Length`|Length of the JSON response body.|
@y
|Name|Description|
|----|-----------|
|`WWW-Authenticate`|An RFC7235 compliant authentication challenge header.|
|`Content-Length`|Length of the JSON response body.|
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `UNAUTHORIZED` | authentication required | The access controller was unable to authenticate the client. Often this will be accompanied by a Www-Authenticate HTTP response header indicating how to authenticate. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `UNAUTHORIZED` | authentication required | The access controller was unable to authenticate the client. Often this will be accompanied by a Www-Authenticate HTTP response header indicating how to authenticate. |
@z

@x
###### On Failure: Too Many Requests
@y
###### On Failure: Too Many Requests
@z

@x
```
429 Too Many Requests
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@y
```
429 Too Many Requests
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The client made too many requests within a time interval.
@y
The client made too many requests within a time interval.
@z

@x
The following headers will be returned on the response:
@y
The following headers will be returned on the response:
@z

@x
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@y
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `TOOMANYREQUESTS` | too many requests | Returned when a client attempts to contact a service too many times |
@y
|Code|Message|Description|
|----|-------|-----------|
| `TOOMANYREQUESTS` | too many requests | Returned when a client attempts to contact a service too many times |
@z

@x
### Tags
@y
### Tags
@z

@x
Retrieve information about tags.
@y
Retrieve information about tags.
@z

@x
#### GET Tags
@y
#### GET Tags
@z

@x
Fetch the tags under the repository identified by `name`.
@y
Fetch the tags under the repository identified by `name`.
@z

@x
##### Tags
@y
##### Tags
@z

@x
```
GET /v2/<name>/tags/list
Host: <registry host>
Authorization: <scheme> <token>
```
@y
```
GET /v2/<name>/tags/list
Host: <registry host>
Authorization: <scheme> <token>
```
@z

@x
Return all tags for the repository
@y
Return all tags for the repository
@z

@x
The following parameters should be specified on the request:
@y
The following parameters should be specified on the request:
@z

@x
|Name|Kind|Description|
|----|----|-----------|
|`Host`|header|Standard HTTP Host Header. Should be set to the registry host.|
|`Authorization`|header|An RFC7235 compliant authorization header.|
|`name`|path|Name of the target repository.|
@y
|Name|Kind|Description|
|----|----|-----------|
|`Host`|header|Standard HTTP Host Header. Should be set to the registry host.|
|`Authorization`|header|An RFC7235 compliant authorization header.|
|`name`|path|Name of the target repository.|
@z

@x
###### On Success: OK
@y
###### On Success: OK
@z

@x
```
200 OK
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@y
```
200 OK
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@z

@x
{
    "name": <name>,
    "tags": [
        <tag>,
        ...
    ]
}
```
@y
{
    "name": <name>,
    "tags": [
        <tag>,
        ...
    ]
}
```
@z

@x
A list of tags for the named repository.
@y
A list of tags for the named repository.
@z

@x
The following headers will be returned with the response:
@y
The following headers will be returned with the response:
@z

@x
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@y
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@z

@x
###### On Failure: Authentication Required
@y
###### On Failure: Authentication Required
@z

@x
```
401 Unauthorized
WWW-Authenticate: <scheme> realm="<realm>", ..."
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@y
```
401 Unauthorized
WWW-Authenticate: <scheme> realm="<realm>", ..."
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The client is not authenticated.
@y
The client is not authenticated.
@z

@x
The following headers will be returned on the response:
@y
The following headers will be returned on the response:
@z

@x
|Name|Description|
|----|-----------|
|`WWW-Authenticate`|An RFC7235 compliant authentication challenge header.|
|`Content-Length`|Length of the JSON response body.|
@y
|Name|Description|
|----|-----------|
|`WWW-Authenticate`|An RFC7235 compliant authentication challenge header.|
|`Content-Length`|Length of the JSON response body.|
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `UNAUTHORIZED` | authentication required | The access controller was unable to authenticate the client. Often this will be accompanied by a Www-Authenticate HTTP response header indicating how to authenticate. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `UNAUTHORIZED` | authentication required | The access controller was unable to authenticate the client. Often this will be accompanied by a Www-Authenticate HTTP response header indicating how to authenticate. |
@z

@x
###### On Failure: No Such Repository Error
@y
###### On Failure: No Such Repository Error
@z

@x
```
404 Not Found
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@y
```
404 Not Found
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The repository is not known to the registry.
@y
The repository is not known to the registry.
@z

@x
The following headers will be returned on the response:
@y
The following headers will be returned on the response:
@z

@x
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@y
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `NAME_UNKNOWN` | repository name not known to registry | This is returned if the name used during an operation is unknown to the registry. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `NAME_UNKNOWN` | repository name not known to registry | This is returned if the name used during an operation is unknown to the registry. |
@z

@x
###### On Failure: Access Denied
@y
###### On Failure: Access Denied
@z

@x
```
403 Forbidden
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@y
```
403 Forbidden
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The client does not have required access to the repository.
@y
The client does not have required access to the repository.
@z

@x
The following headers will be returned on the response:
@y
The following headers will be returned on the response:
@z

@x
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@y
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `DENIED` | requested access to the resource is denied | The access controller denied access for the operation on a resource. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `DENIED` | requested access to the resource is denied | The access controller denied access for the operation on a resource. |
@z

@x
###### On Failure: Too Many Requests
@y
###### On Failure: Too Many Requests
@z

@x
```
429 Too Many Requests
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@y
```
429 Too Many Requests
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The client made too many requests within a time interval.
@y
The client made too many requests within a time interval.
@z

@x
The following headers will be returned on the response:
@y
The following headers will be returned on the response:
@z

@x
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@y
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `TOOMANYREQUESTS` | too many requests | Returned when a client attempts to contact a service too many times |
@y
|Code|Message|Description|
|----|-------|-----------|
| `TOOMANYREQUESTS` | too many requests | Returned when a client attempts to contact a service too many times |
@z

@x
##### Tags Paginated
@y
##### Tags Paginated
@z

@x
```
GET /v2/<name>/tags/list?n=<integer>&last=<integer>
```
@y
```
GET /v2/<name>/tags/list?n=<integer>&last=<integer>
```
@z

@x
Return a portion of the tags for the specified repository.
@y
Return a portion of the tags for the specified repository.
@z

@x
The following parameters should be specified on the request:
@y
The following parameters should be specified on the request:
@z

@x
|Name|Kind|Description|
|----|----|-----------|
|`name`|path|Name of the target repository.|
|`n`|query|Limit the number of entries in each response. It not present, all entries will be returned.|
|`last`|query|Result set will include values lexically after last.|
@y
|Name|Kind|Description|
|----|----|-----------|
|`name`|path|Name of the target repository.|
|`n`|query|Limit the number of entries in each response. It not present, all entries will be returned.|
|`last`|query|Result set will include values lexically after last.|
@z

@x
###### On Success: OK
@y
###### On Success: OK
@z

@x
```
200 OK
Content-Length: <length>
Link: <<url>?n=<last n value>&last=<last entry from response>>; rel="next"
Content-Type: application/json; charset=utf-8
@y
```
200 OK
Content-Length: <length>
Link: <<url>?n=<last n value>&last=<last entry from response>>; rel="next"
Content-Type: application/json; charset=utf-8
@z

@x
{
    "name": <name>,
    "tags": [
        <tag>,
        ...
    ],
}
```
@y
{
    "name": <name>,
    "tags": [
        <tag>,
        ...
    ],
}
```
@z

@x
A list of tags for the named repository.
@y
A list of tags for the named repository.
@z

@x
The following headers will be returned with the response:
@y
The following headers will be returned with the response:
@z

@x
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
|`Link`|RFC5988 compliant rel='next' with URL to next result set, if available|
@y
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
|`Link`|RFC5988 compliant rel='next' with URL to next result set, if available|
@z

@x
###### On Failure: Authentication Required
@y
###### On Failure: Authentication Required
@z

@x
```
401 Unauthorized
WWW-Authenticate: <scheme> realm="<realm>", ..."
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@y
```
401 Unauthorized
WWW-Authenticate: <scheme> realm="<realm>", ..."
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The client is not authenticated.
@y
The client is not authenticated.
@z

@x
The following headers will be returned on the response:
@y
The following headers will be returned on the response:
@z

@x
|Name|Description|
|----|-----------|
|`WWW-Authenticate`|An RFC7235 compliant authentication challenge header.|
|`Content-Length`|Length of the JSON response body.|
@y
|Name|Description|
|----|-----------|
|`WWW-Authenticate`|An RFC7235 compliant authentication challenge header.|
|`Content-Length`|Length of the JSON response body.|
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `UNAUTHORIZED` | authentication required | The access controller was unable to authenticate the client. Often this will be accompanied by a Www-Authenticate HTTP response header indicating how to authenticate. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `UNAUTHORIZED` | authentication required | The access controller was unable to authenticate the client. Often this will be accompanied by a Www-Authenticate HTTP response header indicating how to authenticate. |
@z

@x
###### On Failure: No Such Repository Error
@y
###### On Failure: No Such Repository Error
@z

@x
```
404 Not Found
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@y
```
404 Not Found
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The repository is not known to the registry.
@y
The repository is not known to the registry.
@z

@x
The following headers will be returned on the response:
@y
The following headers will be returned on the response:
@z

@x
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@y
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `NAME_UNKNOWN` | repository name not known to registry | This is returned if the name used during an operation is unknown to the registry. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `NAME_UNKNOWN` | repository name not known to registry | This is returned if the name used during an operation is unknown to the registry. |
@z

@x
###### On Failure: Access Denied
@y
###### On Failure: Access Denied
@z

@x
```
403 Forbidden
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@y
```
403 Forbidden
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The client does not have required access to the repository.
@y
The client does not have required access to the repository.
@z

@x
The following headers will be returned on the response:
@y
The following headers will be returned on the response:
@z

@x
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@y
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `DENIED` | requested access to the resource is denied | The access controller denied access for the operation on a resource. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `DENIED` | requested access to the resource is denied | The access controller denied access for the operation on a resource. |
@z

@x
###### On Failure: Too Many Requests
@y
###### On Failure: Too Many Requests
@z

@x
```
429 Too Many Requests
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@y
```
429 Too Many Requests
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The client made too many requests within a time interval.
@y
The client made too many requests within a time interval.
@z

@x
The following headers will be returned on the response:
@y
The following headers will be returned on the response:
@z

@x
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@y
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `TOOMANYREQUESTS` | too many requests | Returned when a client attempts to contact a service too many times |
@y
|Code|Message|Description|
|----|-------|-----------|
| `TOOMANYREQUESTS` | too many requests | Returned when a client attempts to contact a service too many times |
@z

@x
### Manifest
@y
### Manifest
@z

@x
Create, update, delete and retrieve manifests.
@y
Create, update, delete and retrieve manifests.
@z

@x
#### GET Manifest
@y
#### GET Manifest
@z

@x
Fetch the manifest identified by `name` and `reference` where `reference` can be a tag or digest. A `HEAD` request can also be issued to this endpoint to obtain resource information without receiving all data.
@y
Fetch the manifest identified by `name` and `reference` where `reference` can be a tag or digest. A `HEAD` request can also be issued to this endpoint to obtain resource information without receiving all data.
@z

@x
```
GET /v2/<name>/manifests/<reference>
Host: <registry host>
Authorization: <scheme> <token>
```
@y
```
GET /v2/<name>/manifests/<reference>
Host: <registry host>
Authorization: <scheme> <token>
```
@z

@x
The following parameters should be specified on the request:
@y
The following parameters should be specified on the request:
@z

@x
|Name|Kind|Description|
|----|----|-----------|
|`Host`|header|Standard HTTP Host Header. Should be set to the registry host.|
|`Authorization`|header|An RFC7235 compliant authorization header.|
|`name`|path|Name of the target repository.|
|`reference`|path|Tag or digest of the target manifest.|
@y
|Name|Kind|Description|
|----|----|-----------|
|`Host`|header|Standard HTTP Host Header. Should be set to the registry host.|
|`Authorization`|header|An RFC7235 compliant authorization header.|
|`name`|path|Name of the target repository.|
|`reference`|path|Tag or digest of the target manifest.|
@z

@x
###### On Success: OK
@y
###### On Success: OK
@z

@x
```
200 OK
Docker-Content-Digest: <digest>
Content-Type: <media type of manifest>
@y
```
200 OK
Docker-Content-Digest: <digest>
Content-Type: <media type of manifest>
@z

@x
{
   "name": <name>,
   "tag": <tag>,
   "fsLayers": [
      {
         "blobSum": "<digest>"
      },
      ...
    ]
   ],
   "history": <v1 images>,
   "signature": <JWS>
}
```
@y
{
   "name": <name>,
   "tag": <tag>,
   "fsLayers": [
      {
         "blobSum": "<digest>"
      },
      ...
    ]
   ],
   "history": <v1 images>,
   "signature": <JWS>
}
```
@z

@x
The manifest identified by `name` and `reference`. The contents can be used to identify and resolve resources required to run the specified image.
@y
The manifest identified by `name` and `reference`. The contents can be used to identify and resolve resources required to run the specified image.
@z

@x
The following headers will be returned with the response:
@y
The following headers will be returned with the response:
@z

@x
|Name|Description|
|----|-----------|
|`Docker-Content-Digest`|Digest of the targeted content for the request.|
@y
|Name|Description|
|----|-----------|
|`Docker-Content-Digest`|Digest of the targeted content for the request.|
@z

@x
###### On Failure: Bad Request
@y
###### On Failure: Bad Request
@z

@x
```
400 Bad Request
Content-Type: application/json; charset=utf-8
@y
```
400 Bad Request
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The name or reference was invalid.
@y
The name or reference was invalid.
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `NAME_INVALID` | invalid repository name | Invalid repository name encountered either during manifest validation or any API operation. |
| `TAG_INVALID` | manifest tag did not match URI | During a manifest upload, if the tag in the manifest does not match the uri tag, this error will be returned. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `NAME_INVALID` | invalid repository name | Invalid repository name encountered either during manifest validation or any API operation. |
| `TAG_INVALID` | manifest tag did not match URI | During a manifest upload, if the tag in the manifest does not match the uri tag, this error will be returned. |
@z

@x
###### On Failure: Authentication Required
@y
###### On Failure: Authentication Required
@z

@x
```
401 Unauthorized
WWW-Authenticate: <scheme> realm="<realm>", ..."
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@y
```
401 Unauthorized
WWW-Authenticate: <scheme> realm="<realm>", ..."
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The client is not authenticated.
@y
The client is not authenticated.
@z

@x
The following headers will be returned on the response:
@y
The following headers will be returned on the response:
@z

@x
|Name|Description|
|----|-----------|
|`WWW-Authenticate`|An RFC7235 compliant authentication challenge header.|
|`Content-Length`|Length of the JSON response body.|
@y
|Name|Description|
|----|-----------|
|`WWW-Authenticate`|An RFC7235 compliant authentication challenge header.|
|`Content-Length`|Length of the JSON response body.|
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `UNAUTHORIZED` | authentication required | The access controller was unable to authenticate the client. Often this will be accompanied by a Www-Authenticate HTTP response header indicating how to authenticate. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `UNAUTHORIZED` | authentication required | The access controller was unable to authenticate the client. Often this will be accompanied by a Www-Authenticate HTTP response header indicating how to authenticate. |
@z

@x
###### On Failure: No Such Repository Error
@y
###### On Failure: No Such Repository Error
@z

@x
```
404 Not Found
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@y
```
404 Not Found
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The repository is not known to the registry.
@y
The repository is not known to the registry.
@z

@x
The following headers will be returned on the response:
@y
The following headers will be returned on the response:
@z

@x
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@y
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `NAME_UNKNOWN` | repository name not known to registry | This is returned if the name used during an operation is unknown to the registry. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `NAME_UNKNOWN` | repository name not known to registry | This is returned if the name used during an operation is unknown to the registry. |
@z

@x
###### On Failure: Access Denied
@y
###### On Failure: Access Denied
@z

@x
```
403 Forbidden
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@y
```
403 Forbidden
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The client does not have required access to the repository.
@y
The client does not have required access to the repository.
@z

@x
The following headers will be returned on the response:
@y
The following headers will be returned on the response:
@z

@x
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@y
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `DENIED` | requested access to the resource is denied | The access controller denied access for the operation on a resource. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `DENIED` | requested access to the resource is denied | The access controller denied access for the operation on a resource. |
@z

@x
###### On Failure: Too Many Requests
@y
###### On Failure: Too Many Requests
@z

@x
```
429 Too Many Requests
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@y
```
429 Too Many Requests
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The client made too many requests within a time interval.
@y
The client made too many requests within a time interval.
@z

@x
The following headers will be returned on the response:
@y
The following headers will be returned on the response:
@z

@x
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@y
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `TOOMANYREQUESTS` | too many requests | Returned when a client attempts to contact a service too many times |
@y
|Code|Message|Description|
|----|-------|-----------|
| `TOOMANYREQUESTS` | too many requests | Returned when a client attempts to contact a service too many times |
@z

@x
#### PUT Manifest
@y
#### PUT Manifest
@z

@x
Put the manifest identified by `name` and `reference` where `reference` can be a tag or digest.
@y
Put the manifest identified by `name` and `reference` where `reference` can be a tag or digest.
@z

@x
```
PUT /v2/<name>/manifests/<reference>
Host: <registry host>
Authorization: <scheme> <token>
Content-Type: <media type of manifest>
@y
```
PUT /v2/<name>/manifests/<reference>
Host: <registry host>
Authorization: <scheme> <token>
Content-Type: <media type of manifest>
@z

@x
{
   "name": <name>,
   "tag": <tag>,
   "fsLayers": [
      {
         "blobSum": "<digest>"
      },
      ...
    ]
   ],
   "history": <v1 images>,
   "signature": <JWS>
}
```
@y
{
   "name": <name>,
   "tag": <tag>,
   "fsLayers": [
      {
         "blobSum": "<digest>"
      },
      ...
    ]
   ],
   "history": <v1 images>,
   "signature": <JWS>
}
```
@z

@x
The following parameters should be specified on the request:
@y
The following parameters should be specified on the request:
@z

@x
|Name|Kind|Description|
|----|----|-----------|
|`Host`|header|Standard HTTP Host Header. Should be set to the registry host.|
|`Authorization`|header|An RFC7235 compliant authorization header.|
|`name`|path|Name of the target repository.|
|`reference`|path|Tag or digest of the target manifest.|
@y
|Name|Kind|Description|
|----|----|-----------|
|`Host`|header|Standard HTTP Host Header. Should be set to the registry host.|
|`Authorization`|header|An RFC7235 compliant authorization header.|
|`name`|path|Name of the target repository.|
|`reference`|path|Tag or digest of the target manifest.|
@z

@x
###### On Success: Created
@y
###### On Success: Created
@z

@x
```
201 Created
Location: <url>
Content-Length: 0
Docker-Content-Digest: <digest>
```
@y
```
201 Created
Location: <url>
Content-Length: 0
Docker-Content-Digest: <digest>
```
@z

@x
The manifest has been accepted by the registry and is stored under the specified `name` and `tag`.
@y
The manifest has been accepted by the registry and is stored under the specified `name` and `tag`.
@z

@x
The following headers will be returned with the response:
@y
The following headers will be returned with the response:
@z

@x
|Name|Description|
|----|-----------|
|`Location`|The canonical location url of the uploaded manifest.|
|`Content-Length`|The `Content-Length` header must be zero and the body must be empty.|
|`Docker-Content-Digest`|Digest of the targeted content for the request.|
@y
|Name|Description|
|----|-----------|
|`Location`|The canonical location url of the uploaded manifest.|
|`Content-Length`|The `Content-Length` header must be zero and the body must be empty.|
|`Docker-Content-Digest`|Digest of the targeted content for the request.|
@z

@x
###### On Failure: Invalid Manifest
@y
###### On Failure: Invalid Manifest
@z

@x
```
400 Bad Request
Content-Type: application/json; charset=utf-8
@y
```
400 Bad Request
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The received manifest was invalid in some way, as described by the error codes. The client should resolve the issue and retry the request.
@y
The received manifest was invalid in some way, as described by the error codes. The client should resolve the issue and retry the request.
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `NAME_INVALID` | invalid repository name | Invalid repository name encountered either during manifest validation or any API operation. |
| `TAG_INVALID` | manifest tag did not match URI | During a manifest upload, if the tag in the manifest does not match the uri tag, this error will be returned. |
| `MANIFEST_INVALID` | manifest invalid | During upload, manifests undergo several checks ensuring validity. If those checks fail, this error may be returned, unless a more specific error is included. The detail will contain information the failed validation. |
| `MANIFEST_UNVERIFIED` | manifest failed signature verification | During manifest upload, if the manifest fails signature verification, this error will be returned. |
| `BLOB_UNKNOWN` | blob unknown to registry | This error may be returned when a blob is unknown to the registry in a specified repository. This can be returned with a standard get or if a manifest references an unknown layer during upload. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `NAME_INVALID` | invalid repository name | Invalid repository name encountered either during manifest validation or any API operation. |
| `TAG_INVALID` | manifest tag did not match URI | During a manifest upload, if the tag in the manifest does not match the uri tag, this error will be returned. |
| `MANIFEST_INVALID` | manifest invalid | During upload, manifests undergo several checks ensuring validity. If those checks fail, this error may be returned, unless a more specific error is included. The detail will contain information the failed validation. |
| `MANIFEST_UNVERIFIED` | manifest failed signature verification | During manifest upload, if the manifest fails signature verification, this error will be returned. |
| `BLOB_UNKNOWN` | blob unknown to registry | This error may be returned when a blob is unknown to the registry in a specified repository. This can be returned with a standard get or if a manifest references an unknown layer during upload. |
@z

@x
###### On Failure: Authentication Required
@y
###### On Failure: Authentication Required
@z

@x
```
401 Unauthorized
WWW-Authenticate: <scheme> realm="<realm>", ..."
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@y
```
401 Unauthorized
WWW-Authenticate: <scheme> realm="<realm>", ..."
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The client is not authenticated.
@y
The client is not authenticated.
@z

@x
The following headers will be returned on the response:
@y
The following headers will be returned on the response:
@z

@x
|Name|Description|
|----|-----------|
|`WWW-Authenticate`|An RFC7235 compliant authentication challenge header.|
|`Content-Length`|Length of the JSON response body.|
@y
|Name|Description|
|----|-----------|
|`WWW-Authenticate`|An RFC7235 compliant authentication challenge header.|
|`Content-Length`|Length of the JSON response body.|
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `UNAUTHORIZED` | authentication required | The access controller was unable to authenticate the client. Often this will be accompanied by a Www-Authenticate HTTP response header indicating how to authenticate. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `UNAUTHORIZED` | authentication required | The access controller was unable to authenticate the client. Often this will be accompanied by a Www-Authenticate HTTP response header indicating how to authenticate. |
@z

@x
###### On Failure: No Such Repository Error
@y
###### On Failure: No Such Repository Error
@z

@x
```
404 Not Found
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@y
```
404 Not Found
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The repository is not known to the registry.
@y
The repository is not known to the registry.
@z

@x
The following headers will be returned on the response:
@y
The following headers will be returned on the response:
@z

@x
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@y
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `NAME_UNKNOWN` | repository name not known to registry | This is returned if the name used during an operation is unknown to the registry. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `NAME_UNKNOWN` | repository name not known to registry | This is returned if the name used during an operation is unknown to the registry. |
@z

@x
###### On Failure: Access Denied
@y
###### On Failure: Access Denied
@z

@x
```
403 Forbidden
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@y
```
403 Forbidden
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The client does not have required access to the repository.
@y
The client does not have required access to the repository.
@z

@x
The following headers will be returned on the response:
@y
The following headers will be returned on the response:
@z

@x
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@y
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `DENIED` | requested access to the resource is denied | The access controller denied access for the operation on a resource. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `DENIED` | requested access to the resource is denied | The access controller denied access for the operation on a resource. |
@z

@x
###### On Failure: Too Many Requests
@y
###### On Failure: Too Many Requests
@z

@x
```
429 Too Many Requests
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@y
```
429 Too Many Requests
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The client made too many requests within a time interval.
@y
The client made too many requests within a time interval.
@z

@x
The following headers will be returned on the response:
@y
The following headers will be returned on the response:
@z

@x
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@y
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `TOOMANYREQUESTS` | too many requests | Returned when a client attempts to contact a service too many times |
@y
|Code|Message|Description|
|----|-------|-----------|
| `TOOMANYREQUESTS` | too many requests | Returned when a client attempts to contact a service too many times |
@z

@x
###### On Failure: Missing Layer(s)
@y
###### On Failure: Missing Layer(s)
@z

@x
```
400 Bad Request
Content-Type: application/json; charset=utf-8
@y
```
400 Bad Request
Content-Type: application/json; charset=utf-8
@z

@x
{
    "errors:" [{
            "code": "BLOB_UNKNOWN",
            "message": "blob unknown to registry",
            "detail": {
                "digest": "<digest>"
            }
        },
        ...
    ]
}
```
@y
{
    "errors:" [{
            "code": "BLOB_UNKNOWN",
            "message": "blob unknown to registry",
            "detail": {
                "digest": "<digest>"
            }
        },
        ...
    ]
}
```
@z

@x
One or more layers may be missing during a manifest upload. If so, the missing layers will be enumerated in the error response.
@y
One or more layers may be missing during a manifest upload. If so, the missing layers will be enumerated in the error response.
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `BLOB_UNKNOWN` | blob unknown to registry | This error may be returned when a blob is unknown to the registry in a specified repository. This can be returned with a standard get or if a manifest references an unknown layer during upload. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `BLOB_UNKNOWN` | blob unknown to registry | This error may be returned when a blob is unknown to the registry in a specified repository. This can be returned with a standard get or if a manifest references an unknown layer during upload. |
@z

@x
###### On Failure: Not allowed
@y
###### On Failure: Not allowed
@z

@x
```
405 Method Not Allowed
```
@y
```
405 Method Not Allowed
```
@z

@x
Manifest put is not allowed because the registry is configured as a pull-through cache or for some other reason
@y
Manifest put is not allowed because the registry is configured as a pull-through cache or for some other reason
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `UNSUPPORTED` | The operation is unsupported. | The operation was unsupported due to a missing implementation or invalid set of parameters. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `UNSUPPORTED` | The operation is unsupported. | The operation was unsupported due to a missing implementation or invalid set of parameters. |
@z

@x
#### DELETE Manifest
@y
#### DELETE Manifest
@z

@x
Delete the manifest identified by `name` and `reference`. Note that a manifest can _only_ be deleted by `digest`.
@y
Delete the manifest identified by `name` and `reference`. Note that a manifest can _only_ be deleted by `digest`.
@z

@x
```
DELETE /v2/<name>/manifests/<reference>
Host: <registry host>
Authorization: <scheme> <token>
```
@y
```
DELETE /v2/<name>/manifests/<reference>
Host: <registry host>
Authorization: <scheme> <token>
```
@z

@x
The following parameters should be specified on the request:
@y
The following parameters should be specified on the request:
@z

@x
|Name|Kind|Description|
|----|----|-----------|
|`Host`|header|Standard HTTP Host Header. Should be set to the registry host.|
|`Authorization`|header|An RFC7235 compliant authorization header.|
|`name`|path|Name of the target repository.|
|`reference`|path|Tag or digest of the target manifest.|
@y
|Name|Kind|Description|
|----|----|-----------|
|`Host`|header|Standard HTTP Host Header. Should be set to the registry host.|
|`Authorization`|header|An RFC7235 compliant authorization header.|
|`name`|path|Name of the target repository.|
|`reference`|path|Tag or digest of the target manifest.|
@z

@x
###### On Success: Accepted
@y
###### On Success: Accepted
@z

@x
```
202 Accepted
```
@y
```
202 Accepted
```
@z

@x
###### On Failure: Invalid Name or Reference
@y
###### On Failure: Invalid Name or Reference
@z

@x
```
400 Bad Request
Content-Type: application/json; charset=utf-8
@y
```
400 Bad Request
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The specified `name` or `reference` were invalid and the delete was unable to proceed.
@y
The specified `name` or `reference` were invalid and the delete was unable to proceed.
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `NAME_INVALID` | invalid repository name | Invalid repository name encountered either during manifest validation or any API operation. |
| `TAG_INVALID` | manifest tag did not match URI | During a manifest upload, if the tag in the manifest does not match the uri tag, this error will be returned. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `NAME_INVALID` | invalid repository name | Invalid repository name encountered either during manifest validation or any API operation. |
| `TAG_INVALID` | manifest tag did not match URI | During a manifest upload, if the tag in the manifest does not match the uri tag, this error will be returned. |
@z

@x
###### On Failure: Authentication Required
@y
###### On Failure: Authentication Required
@z

@x
```
401 Unauthorized
WWW-Authenticate: <scheme> realm="<realm>", ..."
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@y
```
401 Unauthorized
WWW-Authenticate: <scheme> realm="<realm>", ..."
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The client is not authenticated.
@y
The client is not authenticated.
@z

@x
The following headers will be returned on the response:
@y
The following headers will be returned on the response:
@z

@x
|Name|Description|
|----|-----------|
|`WWW-Authenticate`|An RFC7235 compliant authentication challenge header.|
|`Content-Length`|Length of the JSON response body.|
@y
|Name|Description|
|----|-----------|
|`WWW-Authenticate`|An RFC7235 compliant authentication challenge header.|
|`Content-Length`|Length of the JSON response body.|
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `UNAUTHORIZED` | authentication required | The access controller was unable to authenticate the client. Often this will be accompanied by a Www-Authenticate HTTP response header indicating how to authenticate. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `UNAUTHORIZED` | authentication required | The access controller was unable to authenticate the client. Often this will be accompanied by a Www-Authenticate HTTP response header indicating how to authenticate. |
@z

@x
###### On Failure: No Such Repository Error
@y
###### On Failure: No Such Repository Error
@z

@x
```
404 Not Found
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@y
```
404 Not Found
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The repository is not known to the registry.
@y
The repository is not known to the registry.
@z

@x
The following headers will be returned on the response:
@y
The following headers will be returned on the response:
@z

@x
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@y
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `NAME_UNKNOWN` | repository name not known to registry | This is returned if the name used during an operation is unknown to the registry. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `NAME_UNKNOWN` | repository name not known to registry | This is returned if the name used during an operation is unknown to the registry. |
@z

@x
###### On Failure: Access Denied
@y
###### On Failure: Access Denied
@z

@x
```
403 Forbidden
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@y
```
403 Forbidden
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The client does not have required access to the repository.
@y
The client does not have required access to the repository.
@z

@x
The following headers will be returned on the response:
@y
The following headers will be returned on the response:
@z

@x
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@y
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `DENIED` | requested access to the resource is denied | The access controller denied access for the operation on a resource. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `DENIED` | requested access to the resource is denied | The access controller denied access for the operation on a resource. |
@z

@x
###### On Failure: Too Many Requests
@y
###### On Failure: Too Many Requests
@z

@x
```
429 Too Many Requests
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@y
```
429 Too Many Requests
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The client made too many requests within a time interval.
@y
The client made too many requests within a time interval.
@z

@x
The following headers will be returned on the response:
@y
The following headers will be returned on the response:
@z

@x
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@y
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `TOOMANYREQUESTS` | too many requests | Returned when a client attempts to contact a service too many times |
@y
|Code|Message|Description|
|----|-------|-----------|
| `TOOMANYREQUESTS` | too many requests | Returned when a client attempts to contact a service too many times |
@z

@x
###### On Failure: Unknown Manifest
@y
###### On Failure: Unknown Manifest
@z

@x
```
404 Not Found
Content-Type: application/json; charset=utf-8
@y
```
404 Not Found
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The specified `name` or `reference` are unknown to the registry and the delete was unable to proceed. Clients can assume the manifest was already deleted if this response is returned.
@y
The specified `name` or `reference` are unknown to the registry and the delete was unable to proceed. Clients can assume the manifest was already deleted if this response is returned.
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `NAME_UNKNOWN` | repository name not known to registry | This is returned if the name used during an operation is unknown to the registry. |
| `MANIFEST_UNKNOWN` | manifest unknown | This error is returned when the manifest, identified by name and tag is unknown to the repository. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `NAME_UNKNOWN` | repository name not known to registry | This is returned if the name used during an operation is unknown to the registry. |
| `MANIFEST_UNKNOWN` | manifest unknown | This error is returned when the manifest, identified by name and tag is unknown to the repository. |
@z

@x
###### On Failure: Not allowed
@y
###### On Failure: Not allowed
@z

@x
```
405 Method Not Allowed
```
@y
```
405 Method Not Allowed
```
@z

@x
Manifest delete is not allowed because the registry is configured as a pull-through cache or `delete` has been disabled.
@y
Manifest delete is not allowed because the registry is configured as a pull-through cache or `delete` has been disabled.
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `UNSUPPORTED` | The operation is unsupported. | The operation was unsupported due to a missing implementation or invalid set of parameters. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `UNSUPPORTED` | The operation is unsupported. | The operation was unsupported due to a missing implementation or invalid set of parameters. |
@z

@x
### Blob
@y
### Blob
@z

@x
Operations on blobs identified by `name` and `digest`. Used to fetch or delete layers by digest.
@y
Operations on blobs identified by `name` and `digest`. Used to fetch or delete layers by digest.
@z

@x
#### GET Blob
@y
#### GET Blob
@z

@x
Retrieve the blob from the registry identified by `digest`. A `HEAD` request can also be issued to this endpoint to obtain resource information without receiving all data.
@y
Retrieve the blob from the registry identified by `digest`. A `HEAD` request can also be issued to this endpoint to obtain resource information without receiving all data.
@z

@x
##### Fetch Blob
@y
##### Fetch Blob
@z

@x
```
GET /v2/<name>/blobs/<digest>
Host: <registry host>
Authorization: <scheme> <token>
```
@y
```
GET /v2/<name>/blobs/<digest>
Host: <registry host>
Authorization: <scheme> <token>
```
@z

@x
The following parameters should be specified on the request:
@y
The following parameters should be specified on the request:
@z

@x
|Name|Kind|Description|
|----|----|-----------|
|`Host`|header|Standard HTTP Host Header. Should be set to the registry host.|
|`Authorization`|header|An RFC7235 compliant authorization header.|
|`name`|path|Name of the target repository.|
|`digest`|path|Digest of desired blob.|
@y
|Name|Kind|Description|
|----|----|-----------|
|`Host`|header|Standard HTTP Host Header. Should be set to the registry host.|
|`Authorization`|header|An RFC7235 compliant authorization header.|
|`name`|path|Name of the target repository.|
|`digest`|path|Digest of desired blob.|
@z

@x
###### On Success: OK
@y
###### On Success: OK
@z

@x
```
200 OK
Content-Length: <length>
Docker-Content-Digest: <digest>
Content-Type: application/octet-stream
@y
```
200 OK
Content-Length: <length>
Docker-Content-Digest: <digest>
Content-Type: application/octet-stream
@z

@x
<blob binary data>
```
@y
<blob binary data>
```
@z

@x
The blob identified by `digest` is available. The blob content will be present in the body of the request.
@y
The blob identified by `digest` is available. The blob content will be present in the body of the request.
@z

@x
The following headers will be returned with the response:
@y
The following headers will be returned with the response:
@z

@x
|Name|Description|
|----|-----------|
|`Content-Length`|The length of the requested blob content.|
|`Docker-Content-Digest`|Digest of the targeted content for the request.|
@y
|Name|Description|
|----|-----------|
|`Content-Length`|The length of the requested blob content.|
|`Docker-Content-Digest`|Digest of the targeted content for the request.|
@z

@x
###### On Success: Temporary Redirect
@y
###### On Success: Temporary Redirect
@z

@x
```
307 Temporary Redirect
Location: <blob location>
Docker-Content-Digest: <digest>
```
@y
```
307 Temporary Redirect
Location: <blob location>
Docker-Content-Digest: <digest>
```
@z

@x
The blob identified by `digest` is available at the provided location.
@y
The blob identified by `digest` is available at the provided location.
@z

@x
The following headers will be returned with the response:
@y
The following headers will be returned with the response:
@z

@x
|Name|Description|
|----|-----------|
|`Location`|The location where the layer should be accessible.|
|`Docker-Content-Digest`|Digest of the targeted content for the request.|
@y
|Name|Description|
|----|-----------|
|`Location`|The location where the layer should be accessible.|
|`Docker-Content-Digest`|Digest of the targeted content for the request.|
@z

@x
###### On Failure: Bad Request
@y
###### On Failure: Bad Request
@z

@x
```
400 Bad Request
Content-Type: application/json; charset=utf-8
@y
```
400 Bad Request
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
There was a problem with the request that needs to be addressed by the client, such as an invalid `name` or `tag`.
@y
There was a problem with the request that needs to be addressed by the client, such as an invalid `name` or `tag`.
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `NAME_INVALID` | invalid repository name | Invalid repository name encountered either during manifest validation or any API operation. |
| `DIGEST_INVALID` | provided digest did not match uploaded content | When a blob is uploaded, the registry will check that the content matches the digest provided by the client. The error may include a detail structure with the key "digest", including the invalid digest string. This error may also be returned when a manifest includes an invalid layer digest. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `NAME_INVALID` | invalid repository name | Invalid repository name encountered either during manifest validation or any API operation. |
| `DIGEST_INVALID` | provided digest did not match uploaded content | When a blob is uploaded, the registry will check that the content matches the digest provided by the client. The error may include a detail structure with the key "digest", including the invalid digest string. This error may also be returned when a manifest includes an invalid layer digest. |
@z

@x
###### On Failure: Not Found
@y
###### On Failure: Not Found
@z

@x
```
404 Not Found
Content-Type: application/json; charset=utf-8
@y
```
404 Not Found
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The blob, identified by `name` and `digest`, is unknown to the registry.
@y
The blob, identified by `name` and `digest`, is unknown to the registry.
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `NAME_UNKNOWN` | repository name not known to registry | This is returned if the name used during an operation is unknown to the registry. |
| `BLOB_UNKNOWN` | blob unknown to registry | This error may be returned when a blob is unknown to the registry in a specified repository. This can be returned with a standard get or if a manifest references an unknown layer during upload. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `NAME_UNKNOWN` | repository name not known to registry | This is returned if the name used during an operation is unknown to the registry. |
| `BLOB_UNKNOWN` | blob unknown to registry | This error may be returned when a blob is unknown to the registry in a specified repository. This can be returned with a standard get or if a manifest references an unknown layer during upload. |
@z

@x
###### On Failure: Authentication Required
@y
###### On Failure: Authentication Required
@z

@x
```
401 Unauthorized
WWW-Authenticate: <scheme> realm="<realm>", ..."
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@y
```
401 Unauthorized
WWW-Authenticate: <scheme> realm="<realm>", ..."
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The client is not authenticated.
@y
The client is not authenticated.
@z

@x
The following headers will be returned on the response:
@y
The following headers will be returned on the response:
@z

@x
|Name|Description|
|----|-----------|
|`WWW-Authenticate`|An RFC7235 compliant authentication challenge header.|
|`Content-Length`|Length of the JSON response body.|
@y
|Name|Description|
|----|-----------|
|`WWW-Authenticate`|An RFC7235 compliant authentication challenge header.|
|`Content-Length`|Length of the JSON response body.|
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `UNAUTHORIZED` | authentication required | The access controller was unable to authenticate the client. Often this will be accompanied by a Www-Authenticate HTTP response header indicating how to authenticate. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `UNAUTHORIZED` | authentication required | The access controller was unable to authenticate the client. Often this will be accompanied by a Www-Authenticate HTTP response header indicating how to authenticate. |
@z

@x
###### On Failure: No Such Repository Error
@y
###### On Failure: No Such Repository Error
@z

@x
```
404 Not Found
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@y
```
404 Not Found
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The repository is not known to the registry.
@y
The repository is not known to the registry.
@z

@x
The following headers will be returned on the response:
@y
The following headers will be returned on the response:
@z

@x
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@y
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `NAME_UNKNOWN` | repository name not known to registry | This is returned if the name used during an operation is unknown to the registry. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `NAME_UNKNOWN` | repository name not known to registry | This is returned if the name used during an operation is unknown to the registry. |
@z

@x
###### On Failure: Access Denied
@y
###### On Failure: Access Denied
@z

@x
```
403 Forbidden
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@y
```
403 Forbidden
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The client does not have required access to the repository.
@y
The client does not have required access to the repository.
@z

@x
The following headers will be returned on the response:
@y
The following headers will be returned on the response:
@z

@x
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@y
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `DENIED` | requested access to the resource is denied | The access controller denied access for the operation on a resource. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `DENIED` | requested access to the resource is denied | The access controller denied access for the operation on a resource. |
@z

@x
###### On Failure: Too Many Requests
@y
###### On Failure: Too Many Requests
@z

@x
```
429 Too Many Requests
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@y
```
429 Too Many Requests
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The client made too many requests within a time interval.
@y
The client made too many requests within a time interval.
@z

@x
The following headers will be returned on the response:
@y
The following headers will be returned on the response:
@z

@x
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@y
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `TOOMANYREQUESTS` | too many requests | Returned when a client attempts to contact a service too many times |
@y
|Code|Message|Description|
|----|-------|-----------|
| `TOOMANYREQUESTS` | too many requests | Returned when a client attempts to contact a service too many times |
@z

@x
##### Fetch Blob Part
@y
##### Fetch Blob Part
@z

@x
```
GET /v2/<name>/blobs/<digest>
Host: <registry host>
Authorization: <scheme> <token>
Range: bytes=<start>-<end>
```
@y
```
GET /v2/<name>/blobs/<digest>
Host: <registry host>
Authorization: <scheme> <token>
Range: bytes=<start>-<end>
```
@z

@x
This endpoint may also support RFC7233 compliant range requests. Support can be detected by issuing a HEAD request. If the header `Accept-Range: bytes` is returned, range requests can be used to fetch partial content.
@y
This endpoint may also support RFC7233 compliant range requests. Support can be detected by issuing a HEAD request. If the header `Accept-Range: bytes` is returned, range requests can be used to fetch partial content.
@z

@x
The following parameters should be specified on the request:
@y
The following parameters should be specified on the request:
@z

@x
|Name|Kind|Description|
|----|----|-----------|
|`Host`|header|Standard HTTP Host Header. Should be set to the registry host.|
|`Authorization`|header|An RFC7235 compliant authorization header.|
|`Range`|header|HTTP Range header specifying blob chunk.|
|`name`|path|Name of the target repository.|
|`digest`|path|Digest of desired blob.|
@y
|Name|Kind|Description|
|----|----|-----------|
|`Host`|header|Standard HTTP Host Header. Should be set to the registry host.|
|`Authorization`|header|An RFC7235 compliant authorization header.|
|`Range`|header|HTTP Range header specifying blob chunk.|
|`name`|path|Name of the target repository.|
|`digest`|path|Digest of desired blob.|
@z

@x
###### On Success: Partial Content
@y
###### On Success: Partial Content
@z

@x
```
206 Partial Content
Content-Length: <length>
Content-Range: bytes <start>-<end>/<size>
Content-Type: application/octet-stream
@y
```
206 Partial Content
Content-Length: <length>
Content-Range: bytes <start>-<end>/<size>
Content-Type: application/octet-stream
@z

@x
<blob binary data>
```
@y
<blob binary data>
```
@z

@x
The blob identified by `digest` is available. The specified chunk of blob content will be present in the body of the request.
@y
The blob identified by `digest` is available. The specified chunk of blob content will be present in the body of the request.
@z

@x
The following headers will be returned with the response:
@y
The following headers will be returned with the response:
@z

@x
|Name|Description|
|----|-----------|
|`Content-Length`|The length of the requested blob chunk.|
|`Content-Range`|Content range of blob chunk.|
@y
|Name|Description|
|----|-----------|
|`Content-Length`|The length of the requested blob chunk.|
|`Content-Range`|Content range of blob chunk.|
@z

@x
###### On Failure: Bad Request
@y
###### On Failure: Bad Request
@z

@x
```
400 Bad Request
Content-Type: application/json; charset=utf-8
@y
```
400 Bad Request
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
There was a problem with the request that needs to be addressed by the client, such as an invalid `name` or `tag`.
@y
There was a problem with the request that needs to be addressed by the client, such as an invalid `name` or `tag`.
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `NAME_INVALID` | invalid repository name | Invalid repository name encountered either during manifest validation or any API operation. |
| `DIGEST_INVALID` | provided digest did not match uploaded content | When a blob is uploaded, the registry will check that the content matches the digest provided by the client. The error may include a detail structure with the key "digest", including the invalid digest string. This error may also be returned when a manifest includes an invalid layer digest. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `NAME_INVALID` | invalid repository name | Invalid repository name encountered either during manifest validation or any API operation. |
| `DIGEST_INVALID` | provided digest did not match uploaded content | When a blob is uploaded, the registry will check that the content matches the digest provided by the client. The error may include a detail structure with the key "digest", including the invalid digest string. This error may also be returned when a manifest includes an invalid layer digest. |
@z

@x
###### On Failure: Not Found
@y
###### On Failure: Not Found
@z

@x
```
404 Not Found
Content-Type: application/json; charset=utf-8
@y
```
404 Not Found
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `NAME_UNKNOWN` | repository name not known to registry | This is returned if the name used during an operation is unknown to the registry. |
| `BLOB_UNKNOWN` | blob unknown to registry | This error may be returned when a blob is unknown to the registry in a specified repository. This can be returned with a standard get or if a manifest references an unknown layer during upload. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `NAME_UNKNOWN` | repository name not known to registry | This is returned if the name used during an operation is unknown to the registry. |
| `BLOB_UNKNOWN` | blob unknown to registry | This error may be returned when a blob is unknown to the registry in a specified repository. This can be returned with a standard get or if a manifest references an unknown layer during upload. |
@z

@x
###### On Failure: Requested Range Not Satisfiable
@y
###### On Failure: Requested Range Not Satisfiable
@z

@x
```
416 Requested Range Not Satisfiable
```
@y
```
416 Requested Range Not Satisfiable
```
@z

@x
The range specification cannot be satisfied for the requested content. This can happen when the range is not formatted correctly or if the range is outside of the valid size of the content.
@y
The range specification cannot be satisfied for the requested content. This can happen when the range is not formatted correctly or if the range is outside of the valid size of the content.
@z

@x
###### On Failure: Authentication Required
@y
###### On Failure: Authentication Required
@z

@x
```
401 Unauthorized
WWW-Authenticate: <scheme> realm="<realm>", ..."
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@y
```
401 Unauthorized
WWW-Authenticate: <scheme> realm="<realm>", ..."
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The client is not authenticated.
@y
The client is not authenticated.
@z

@x
The following headers will be returned on the response:
@y
The following headers will be returned on the response:
@z

@x
|Name|Description|
|----|-----------|
|`WWW-Authenticate`|An RFC7235 compliant authentication challenge header.|
|`Content-Length`|Length of the JSON response body.|
@y
|Name|Description|
|----|-----------|
|`WWW-Authenticate`|An RFC7235 compliant authentication challenge header.|
|`Content-Length`|Length of the JSON response body.|
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `UNAUTHORIZED` | authentication required | The access controller was unable to authenticate the client. Often this will be accompanied by a Www-Authenticate HTTP response header indicating how to authenticate. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `UNAUTHORIZED` | authentication required | The access controller was unable to authenticate the client. Often this will be accompanied by a Www-Authenticate HTTP response header indicating how to authenticate. |
@z

@x
###### On Failure: No Such Repository Error
@y
###### On Failure: No Such Repository Error
@z

@x
```
404 Not Found
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@y
```
404 Not Found
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The repository is not known to the registry.
@y
The repository is not known to the registry.
@z

@x
The following headers will be returned on the response:
@y
The following headers will be returned on the response:
@z

@x
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@y
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `NAME_UNKNOWN` | repository name not known to registry | This is returned if the name used during an operation is unknown to the registry. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `NAME_UNKNOWN` | repository name not known to registry | This is returned if the name used during an operation is unknown to the registry. |
@z

@x
###### On Failure: Access Denied
@y
###### On Failure: Access Denied
@z

@x
```
403 Forbidden
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@y
```
403 Forbidden
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The client does not have required access to the repository.
@y
The client does not have required access to the repository.
@z

@x
The following headers will be returned on the response:
@y
The following headers will be returned on the response:
@z

@x
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@y
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `DENIED` | requested access to the resource is denied | The access controller denied access for the operation on a resource. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `DENIED` | requested access to the resource is denied | The access controller denied access for the operation on a resource. |
@z

@x
###### On Failure: Too Many Requests
@y
###### On Failure: Too Many Requests
@z

@x
```
429 Too Many Requests
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@y
```
429 Too Many Requests
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The client made too many requests within a time interval.
@y
The client made too many requests within a time interval.
@z

@x
The following headers will be returned on the response:
@y
The following headers will be returned on the response:
@z

@x
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@y
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `TOOMANYREQUESTS` | too many requests | Returned when a client attempts to contact a service too many times |
@y
|Code|Message|Description|
|----|-------|-----------|
| `TOOMANYREQUESTS` | too many requests | Returned when a client attempts to contact a service too many times |
@z

@x
#### DELETE Blob
@y
#### DELETE Blob
@z

@x
Delete the blob identified by `name` and `digest`
@y
Delete the blob identified by `name` and `digest`
@z

@x
```
DELETE /v2/<name>/blobs/<digest>
Host: <registry host>
Authorization: <scheme> <token>
```
@y
```
DELETE /v2/<name>/blobs/<digest>
Host: <registry host>
Authorization: <scheme> <token>
```
@z

@x
The following parameters should be specified on the request:
@y
The following parameters should be specified on the request:
@z

@x
|Name|Kind|Description|
|----|----|-----------|
|`Host`|header|Standard HTTP Host Header. Should be set to the registry host.|
|`Authorization`|header|An RFC7235 compliant authorization header.|
|`name`|path|Name of the target repository.|
|`digest`|path|Digest of desired blob.|
@y
|Name|Kind|Description|
|----|----|-----------|
|`Host`|header|Standard HTTP Host Header. Should be set to the registry host.|
|`Authorization`|header|An RFC7235 compliant authorization header.|
|`name`|path|Name of the target repository.|
|`digest`|path|Digest of desired blob.|
@z

@x
###### On Success: Accepted
@y
###### On Success: Accepted
@z

@x
```
202 Accepted
Content-Length: 0
Docker-Content-Digest: <digest>
```
@y
```
202 Accepted
Content-Length: 0
Docker-Content-Digest: <digest>
```
@z

@x
The following headers will be returned with the response:
@y
The following headers will be returned with the response:
@z

@x
|Name|Description|
|----|-----------|
|`Content-Length`|0|
|`Docker-Content-Digest`|Digest of the targeted content for the request.|
@y
|Name|Description|
|----|-----------|
|`Content-Length`|0|
|`Docker-Content-Digest`|Digest of the targeted content for the request.|
@z

@x
###### On Failure: Invalid Name or Digest
@y
###### On Failure: Invalid Name or Digest
@z

@x
```
400 Bad Request
```
@y
```
400 Bad Request
```
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `DIGEST_INVALID` | provided digest did not match uploaded content | When a blob is uploaded, the registry will check that the content matches the digest provided by the client. The error may include a detail structure with the key "digest", including the invalid digest string. This error may also be returned when a manifest includes an invalid layer digest. |
| `NAME_INVALID` | invalid repository name | Invalid repository name encountered either during manifest validation or any API operation. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `DIGEST_INVALID` | provided digest did not match uploaded content | When a blob is uploaded, the registry will check that the content matches the digest provided by the client. The error may include a detail structure with the key "digest", including the invalid digest string. This error may also be returned when a manifest includes an invalid layer digest. |
| `NAME_INVALID` | invalid repository name | Invalid repository name encountered either during manifest validation or any API operation. |
@z

@x
###### On Failure: Not Found
@y
###### On Failure: Not Found
@z

@x
```
404 Not Found
Content-Type: application/json; charset=utf-8
@y
```
404 Not Found
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The blob, identified by `name` and `digest`, is unknown to the registry.
@y
The blob, identified by `name` and `digest`, is unknown to the registry.
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `NAME_UNKNOWN` | repository name not known to registry | This is returned if the name used during an operation is unknown to the registry. |
| `BLOB_UNKNOWN` | blob unknown to registry | This error may be returned when a blob is unknown to the registry in a specified repository. This can be returned with a standard get or if a manifest references an unknown layer during upload. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `NAME_UNKNOWN` | repository name not known to registry | This is returned if the name used during an operation is unknown to the registry. |
| `BLOB_UNKNOWN` | blob unknown to registry | This error may be returned when a blob is unknown to the registry in a specified repository. This can be returned with a standard get or if a manifest references an unknown layer during upload. |
@z

@x
###### On Failure: Method Not Allowed
@y
###### On Failure: Method Not Allowed
@z

@x
```
405 Method Not Allowed
Content-Type: application/json; charset=utf-8
@y
```
405 Method Not Allowed
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
Blob delete is not allowed because the registry is configured as a pull-through cache or `delete` has been disabled
@y
Blob delete is not allowed because the registry is configured as a pull-through cache or `delete` has been disabled
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `UNSUPPORTED` | The operation is unsupported. | The operation was unsupported due to a missing implementation or invalid set of parameters. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `UNSUPPORTED` | The operation is unsupported. | The operation was unsupported due to a missing implementation or invalid set of parameters. |
@z

@x
###### On Failure: Authentication Required
@y
###### On Failure: Authentication Required
@z

@x
```
401 Unauthorized
WWW-Authenticate: <scheme> realm="<realm>", ..."
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@y
```
401 Unauthorized
WWW-Authenticate: <scheme> realm="<realm>", ..."
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The client is not authenticated.
@y
The client is not authenticated.
@z

@x
The following headers will be returned on the response:
@y
The following headers will be returned on the response:
@z

@x
|Name|Description|
|----|-----------|
|`WWW-Authenticate`|An RFC7235 compliant authentication challenge header.|
|`Content-Length`|Length of the JSON response body.|
@y
|Name|Description|
|----|-----------|
|`WWW-Authenticate`|An RFC7235 compliant authentication challenge header.|
|`Content-Length`|Length of the JSON response body.|
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `UNAUTHORIZED` | authentication required | The access controller was unable to authenticate the client. Often this will be accompanied by a Www-Authenticate HTTP response header indicating how to authenticate. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `UNAUTHORIZED` | authentication required | The access controller was unable to authenticate the client. Often this will be accompanied by a Www-Authenticate HTTP response header indicating how to authenticate. |
@z

@x
###### On Failure: No Such Repository Error
@y
###### On Failure: No Such Repository Error
@z

@x
```
404 Not Found
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@y
```
404 Not Found
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The repository is not known to the registry.
@y
The repository is not known to the registry.
@z

@x
The following headers will be returned on the response:
@y
The following headers will be returned on the response:
@z

@x
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@y
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `NAME_UNKNOWN` | repository name not known to registry | This is returned if the name used during an operation is unknown to the registry. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `NAME_UNKNOWN` | repository name not known to registry | This is returned if the name used during an operation is unknown to the registry. |
@z

@x
###### On Failure: Access Denied
@y
###### On Failure: Access Denied
@z

@x
```
403 Forbidden
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@y
```
403 Forbidden
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The client does not have required access to the repository.
@y
The client does not have required access to the repository.
@z

@x
The following headers will be returned on the response:
@y
The following headers will be returned on the response:
@z

@x
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@y
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `DENIED` | requested access to the resource is denied | The access controller denied access for the operation on a resource. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `DENIED` | requested access to the resource is denied | The access controller denied access for the operation on a resource. |
@z

@x
###### On Failure: Too Many Requests
@y
###### On Failure: Too Many Requests
@z

@x
```
429 Too Many Requests
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@y
```
429 Too Many Requests
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The client made too many requests within a time interval.
@y
The client made too many requests within a time interval.
@z

@x
The following headers will be returned on the response:
@y
The following headers will be returned on the response:
@z

@x
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@y
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `TOOMANYREQUESTS` | too many requests | Returned when a client attempts to contact a service too many times |
@y
|Code|Message|Description|
|----|-------|-----------|
| `TOOMANYREQUESTS` | too many requests | Returned when a client attempts to contact a service too many times |
@z

@x
### Initiate Blob Upload
@y
### Initiate Blob Upload
@z

@x
Initiate a blob upload. This endpoint can be used to create resumable uploads or monolithic uploads.
@y
Initiate a blob upload. This endpoint can be used to create resumable uploads or monolithic uploads.
@z

@x
#### POST Initiate Blob Upload
@y
#### POST Initiate Blob Upload
@z

@x
Initiate a resumable blob upload. If successful, an upload location will be provided to complete the upload. Optionally, if the `digest` parameter is present, the request body will be used to complete the upload in a single request.
@y
Initiate a resumable blob upload. If successful, an upload location will be provided to complete the upload. Optionally, if the `digest` parameter is present, the request body will be used to complete the upload in a single request.
@z

@x
##### Initiate Monolithic Blob Upload
@y
##### Initiate Monolithic Blob Upload
@z

@x
```
POST /v2/<name>/blobs/uploads/?digest=<digest>
Host: <registry host>
Authorization: <scheme> <token>
Content-Length: <length of blob>
Content-Type: application/octect-stream
@y
```
POST /v2/<name>/blobs/uploads/?digest=<digest>
Host: <registry host>
Authorization: <scheme> <token>
Content-Length: <length of blob>
Content-Type: application/octect-stream
@z

@x
<binary data>
```
@y
<binary data>
```
@z

@x
Upload a blob identified by the `digest` parameter in single request. This upload will not be resumable unless a recoverable error is returned.
@y
Upload a blob identified by the `digest` parameter in single request. This upload will not be resumable unless a recoverable error is returned.
@z

@x
The following parameters should be specified on the request:
@y
The following parameters should be specified on the request:
@z

@x
|Name|Kind|Description|
|----|----|-----------|
|`Host`|header|Standard HTTP Host Header. Should be set to the registry host.|
|`Authorization`|header|An RFC7235 compliant authorization header.|
|`Content-Length`|header||
|`name`|path|Name of the target repository.|
|`digest`|query|Digest of uploaded blob. If present, the upload will be completed, in a single request, with contents of the request body as the resulting blob.|
@y
|Name|Kind|Description|
|----|----|-----------|
|`Host`|header|Standard HTTP Host Header. Should be set to the registry host.|
|`Authorization`|header|An RFC7235 compliant authorization header.|
|`Content-Length`|header||
|`name`|path|Name of the target repository.|
|`digest`|query|Digest of uploaded blob. If present, the upload will be completed, in a single request, with contents of the request body as the resulting blob.|
@z

@x
###### On Success: Created
@y
###### On Success: Created
@z

@x
```
201 Created
Location: <blob location>
Content-Length: 0
Docker-Upload-UUID: <uuid>
```
@y
```
201 Created
Location: <blob location>
Content-Length: 0
Docker-Upload-UUID: <uuid>
```
@z

@x
The blob has been created in the registry and is available at the provided location.
@y
The blob has been created in the registry and is available at the provided location.
@z

@x
The following headers will be returned with the response:
@y
The following headers will be returned with the response:
@z

@x
|Name|Description|
|----|-----------|
|`Location`||
|`Content-Length`|The `Content-Length` header must be zero and the body must be empty.|
|`Docker-Upload-UUID`|Identifies the docker upload uuid for the current request.|
@y
|Name|Description|
|----|-----------|
|`Location`||
|`Content-Length`|The `Content-Length` header must be zero and the body must be empty.|
|`Docker-Upload-UUID`|Identifies the docker upload uuid for the current request.|
@z

@x
###### On Failure: Invalid Name or Digest
@y
###### On Failure: Invalid Name or Digest
@z

@x
```
400 Bad Request
```
@y
```
400 Bad Request
```
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `DIGEST_INVALID` | provided digest did not match uploaded content | When a blob is uploaded, the registry will check that the content matches the digest provided by the client. The error may include a detail structure with the key "digest", including the invalid digest string. This error may also be returned when a manifest includes an invalid layer digest. |
| `NAME_INVALID` | invalid repository name | Invalid repository name encountered either during manifest validation or any API operation. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `DIGEST_INVALID` | provided digest did not match uploaded content | When a blob is uploaded, the registry will check that the content matches the digest provided by the client. The error may include a detail structure with the key "digest", including the invalid digest string. This error may also be returned when a manifest includes an invalid layer digest. |
| `NAME_INVALID` | invalid repository name | Invalid repository name encountered either during manifest validation or any API operation. |
@z

@x
###### On Failure: Not allowed
@y
###### On Failure: Not allowed
@z

@x
```
405 Method Not Allowed
```
@y
```
405 Method Not Allowed
```
@z

@x
Blob upload is not allowed because the registry is configured as a pull-through cache or for some other reason
@y
Blob upload is not allowed because the registry is configured as a pull-through cache or for some other reason
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `UNSUPPORTED` | The operation is unsupported. | The operation was unsupported due to a missing implementation or invalid set of parameters. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `UNSUPPORTED` | The operation is unsupported. | The operation was unsupported due to a missing implementation or invalid set of parameters. |
@z

@x
###### On Failure: Authentication Required
@y
###### On Failure: Authentication Required
@z

@x
```
401 Unauthorized
WWW-Authenticate: <scheme> realm="<realm>", ..."
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@y
```
401 Unauthorized
WWW-Authenticate: <scheme> realm="<realm>", ..."
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The client is not authenticated.
@y
The client is not authenticated.
@z

@x
The following headers will be returned on the response:
@y
The following headers will be returned on the response:
@z

@x
|Name|Description|
|----|-----------|
|`WWW-Authenticate`|An RFC7235 compliant authentication challenge header.|
|`Content-Length`|Length of the JSON response body.|
@y
|Name|Description|
|----|-----------|
|`WWW-Authenticate`|An RFC7235 compliant authentication challenge header.|
|`Content-Length`|Length of the JSON response body.|
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `UNAUTHORIZED` | authentication required | The access controller was unable to authenticate the client. Often this will be accompanied by a Www-Authenticate HTTP response header indicating how to authenticate. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `UNAUTHORIZED` | authentication required | The access controller was unable to authenticate the client. Often this will be accompanied by a Www-Authenticate HTTP response header indicating how to authenticate. |
@z

@x
###### On Failure: No Such Repository Error
@y
###### On Failure: No Such Repository Error
@z

@x
```
404 Not Found
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@y
```
404 Not Found
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The repository is not known to the registry.
@y
The repository is not known to the registry.
@z

@x
The following headers will be returned on the response:
@y
The following headers will be returned on the response:
@z

@x
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@y
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `NAME_UNKNOWN` | repository name not known to registry | This is returned if the name used during an operation is unknown to the registry. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `NAME_UNKNOWN` | repository name not known to registry | This is returned if the name used during an operation is unknown to the registry. |
@z

@x
###### On Failure: Access Denied
@y
###### On Failure: Access Denied
@z

@x
```
403 Forbidden
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@y
```
403 Forbidden
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The client does not have required access to the repository.
@y
The client does not have required access to the repository.
@z

@x
The following headers will be returned on the response:
@y
The following headers will be returned on the response:
@z

@x
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@y
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `DENIED` | requested access to the resource is denied | The access controller denied access for the operation on a resource. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `DENIED` | requested access to the resource is denied | The access controller denied access for the operation on a resource. |
@z

@x
###### On Failure: Too Many Requests
@y
###### On Failure: Too Many Requests
@z

@x
```
429 Too Many Requests
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@y
```
429 Too Many Requests
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The client made too many requests within a time interval.
@y
The client made too many requests within a time interval.
@z

@x
The following headers will be returned on the response:
@y
The following headers will be returned on the response:
@z

@x
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@y
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `TOOMANYREQUESTS` | too many requests | Returned when a client attempts to contact a service too many times |
@y
|Code|Message|Description|
|----|-------|-----------|
| `TOOMANYREQUESTS` | too many requests | Returned when a client attempts to contact a service too many times |
@z

@x
##### Initiate Resumable Blob Upload
@y
##### Initiate Resumable Blob Upload
@z

@x
```
POST /v2/<name>/blobs/uploads/
Host: <registry host>
Authorization: <scheme> <token>
Content-Length: 0
```
@y
```
POST /v2/<name>/blobs/uploads/
Host: <registry host>
Authorization: <scheme> <token>
Content-Length: 0
```
@z

@x
Initiate a resumable blob upload with an empty request body.
@y
Initiate a resumable blob upload with an empty request body.
@z

@x
The following parameters should be specified on the request:
@y
The following parameters should be specified on the request:
@z

@x
|Name|Kind|Description|
|----|----|-----------|
|`Host`|header|Standard HTTP Host Header. Should be set to the registry host.|
|`Authorization`|header|An RFC7235 compliant authorization header.|
|`Content-Length`|header|The `Content-Length` header must be zero and the body must be empty.|
|`name`|path|Name of the target repository.|
@y
|Name|Kind|Description|
|----|----|-----------|
|`Host`|header|Standard HTTP Host Header. Should be set to the registry host.|
|`Authorization`|header|An RFC7235 compliant authorization header.|
|`Content-Length`|header|The `Content-Length` header must be zero and the body must be empty.|
|`name`|path|Name of the target repository.|
@z

@x
###### On Success: Accepted
@y
###### On Success: Accepted
@z

@x
```
202 Accepted
Content-Length: 0
Location: /v2/<name>/blobs/uploads/<uuid>
Range: 0-0
Docker-Upload-UUID: <uuid>
```
@y
```
202 Accepted
Content-Length: 0
Location: /v2/<name>/blobs/uploads/<uuid>
Range: 0-0
Docker-Upload-UUID: <uuid>
```
@z

@x
The upload has been created. The `Location` header must be used to complete the upload. The response should be identical to a `GET` request on the contents of the returned `Location` header.
@y
The upload has been created. The `Location` header must be used to complete the upload. The response should be identical to a `GET` request on the contents of the returned `Location` header.
@z

@x
The following headers will be returned with the response:
@y
The following headers will be returned with the response:
@z

@x
|Name|Description|
|----|-----------|
|`Content-Length`|The `Content-Length` header must be zero and the body must be empty.|
|`Location`|The location of the created upload. Clients should use the contents verbatim to complete the upload, adding parameters where required.|
|`Range`|Range header indicating the progress of the upload. When starting an upload, it will return an empty range, since no content has been received.|
|`Docker-Upload-UUID`|Identifies the docker upload uuid for the current request.|
@y
|Name|Description|
|----|-----------|
|`Content-Length`|The `Content-Length` header must be zero and the body must be empty.|
|`Location`|The location of the created upload. Clients should use the contents verbatim to complete the upload, adding parameters where required.|
|`Range`|Range header indicating the progress of the upload. When starting an upload, it will return an empty range, since no content has been received.|
|`Docker-Upload-UUID`|Identifies the docker upload uuid for the current request.|
@z

@x
###### On Failure: Invalid Name or Digest
@y
###### On Failure: Invalid Name or Digest
@z

@x
```
400 Bad Request
```
@y
```
400 Bad Request
```
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `DIGEST_INVALID` | provided digest did not match uploaded content | When a blob is uploaded, the registry will check that the content matches the digest provided by the client. The error may include a detail structure with the key "digest", including the invalid digest string. This error may also be returned when a manifest includes an invalid layer digest. |
| `NAME_INVALID` | invalid repository name | Invalid repository name encountered either during manifest validation or any API operation. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `DIGEST_INVALID` | provided digest did not match uploaded content | When a blob is uploaded, the registry will check that the content matches the digest provided by the client. The error may include a detail structure with the key "digest", including the invalid digest string. This error may also be returned when a manifest includes an invalid layer digest. |
| `NAME_INVALID` | invalid repository name | Invalid repository name encountered either during manifest validation or any API operation. |
@z

@x
###### On Failure: Authentication Required
@y
###### On Failure: Authentication Required
@z

@x
```
401 Unauthorized
WWW-Authenticate: <scheme> realm="<realm>", ..."
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@y
```
401 Unauthorized
WWW-Authenticate: <scheme> realm="<realm>", ..."
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The client is not authenticated.
@y
The client is not authenticated.
@z

@x
The following headers will be returned on the response:
@y
The following headers will be returned on the response:
@z

@x
|Name|Description|
|----|-----------|
|`WWW-Authenticate`|An RFC7235 compliant authentication challenge header.|
|`Content-Length`|Length of the JSON response body.|
@y
|Name|Description|
|----|-----------|
|`WWW-Authenticate`|An RFC7235 compliant authentication challenge header.|
|`Content-Length`|Length of the JSON response body.|
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `UNAUTHORIZED` | authentication required | The access controller was unable to authenticate the client. Often this will be accompanied by a Www-Authenticate HTTP response header indicating how to authenticate. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `UNAUTHORIZED` | authentication required | The access controller was unable to authenticate the client. Often this will be accompanied by a Www-Authenticate HTTP response header indicating how to authenticate. |
@z

@x
###### On Failure: No Such Repository Error
@y
###### On Failure: No Such Repository Error
@z

@x
```
404 Not Found
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@y
```
404 Not Found
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The repository is not known to the registry.
@y
The repository is not known to the registry.
@z

@x
The following headers will be returned on the response:
@y
The following headers will be returned on the response:
@z

@x
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@y
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `NAME_UNKNOWN` | repository name not known to registry | This is returned if the name used during an operation is unknown to the registry. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `NAME_UNKNOWN` | repository name not known to registry | This is returned if the name used during an operation is unknown to the registry. |
@z

@x
###### On Failure: Access Denied
@y
###### On Failure: Access Denied
@z

@x
```
403 Forbidden
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@y
```
403 Forbidden
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The client does not have required access to the repository.
@y
The client does not have required access to the repository.
@z

@x
The following headers will be returned on the response:
@y
The following headers will be returned on the response:
@z

@x
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@y
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `DENIED` | requested access to the resource is denied | The access controller denied access for the operation on a resource. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `DENIED` | requested access to the resource is denied | The access controller denied access for the operation on a resource. |
@z

@x
###### On Failure: Too Many Requests
@y
###### On Failure: Too Many Requests
@z

@x
```
429 Too Many Requests
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@y
```
429 Too Many Requests
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The client made too many requests within a time interval.
@y
The client made too many requests within a time interval.
@z

@x
The following headers will be returned on the response:
@y
The following headers will be returned on the response:
@z

@x
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@y
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `TOOMANYREQUESTS` | too many requests | Returned when a client attempts to contact a service too many times |
@y
|Code|Message|Description|
|----|-------|-----------|
| `TOOMANYREQUESTS` | too many requests | Returned when a client attempts to contact a service too many times |
@z

@x
##### Mount Blob
@y
##### Mount Blob
@z

@x
```
POST /v2/<name>/blobs/uploads/?mount=<digest>&from=<repository name>
Host: <registry host>
Authorization: <scheme> <token>
Content-Length: 0
```
@y
```
POST /v2/<name>/blobs/uploads/?mount=<digest>&from=<repository name>
Host: <registry host>
Authorization: <scheme> <token>
Content-Length: 0
```
@z

@x
Mount a blob identified by the `mount` parameter from another repository.
@y
Mount a blob identified by the `mount` parameter from another repository.
@z

@x
The following parameters should be specified on the request:
@y
The following parameters should be specified on the request:
@z

@x
|Name|Kind|Description|
|----|----|-----------|
|`Host`|header|Standard HTTP Host Header. Should be set to the registry host.|
|`Authorization`|header|An RFC7235 compliant authorization header.|
|`Content-Length`|header|The `Content-Length` header must be zero and the body must be empty.|
|`name`|path|Name of the target repository.|
|`mount`|query|Digest of blob to mount from the source repository.|
|`from`|query|Name of the source repository.|
@y
|Name|Kind|Description|
|----|----|-----------|
|`Host`|header|Standard HTTP Host Header. Should be set to the registry host.|
|`Authorization`|header|An RFC7235 compliant authorization header.|
|`Content-Length`|header|The `Content-Length` header must be zero and the body must be empty.|
|`name`|path|Name of the target repository.|
|`mount`|query|Digest of blob to mount from the source repository.|
|`from`|query|Name of the source repository.|
@z

@x
###### On Success: Created
@y
###### On Success: Created
@z

@x
```
201 Created
Location: <blob location>
Content-Length: 0
Docker-Upload-UUID: <uuid>
```
@y
```
201 Created
Location: <blob location>
Content-Length: 0
Docker-Upload-UUID: <uuid>
```
@z

@x
The blob has been mounted in the repository and is available at the provided location.
@y
The blob has been mounted in the repository and is available at the provided location.
@z

@x
The following headers will be returned with the response:
@y
The following headers will be returned with the response:
@z

@x
|Name|Description|
|----|-----------|
|`Location`||
|`Content-Length`|The `Content-Length` header must be zero and the body must be empty.|
|`Docker-Upload-UUID`|Identifies the docker upload uuid for the current request.|
@y
|Name|Description|
|----|-----------|
|`Location`||
|`Content-Length`|The `Content-Length` header must be zero and the body must be empty.|
|`Docker-Upload-UUID`|Identifies the docker upload uuid for the current request.|
@z

@x
###### On Failure: Invalid Name or Digest
@y
###### On Failure: Invalid Name or Digest
@z

@x
```
400 Bad Request
```
@y
```
400 Bad Request
```
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `DIGEST_INVALID` | provided digest did not match uploaded content | When a blob is uploaded, the registry will check that the content matches the digest provided by the client. The error may include a detail structure with the key "digest", including the invalid digest string. This error may also be returned when a manifest includes an invalid layer digest. |
| `NAME_INVALID` | invalid repository name | Invalid repository name encountered either during manifest validation or any API operation. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `DIGEST_INVALID` | provided digest did not match uploaded content | When a blob is uploaded, the registry will check that the content matches the digest provided by the client. The error may include a detail structure with the key "digest", including the invalid digest string. This error may also be returned when a manifest includes an invalid layer digest. |
| `NAME_INVALID` | invalid repository name | Invalid repository name encountered either during manifest validation or any API operation. |
@z

@x
###### On Failure: Not allowed
@y
###### On Failure: Not allowed
@z

@x
```
405 Method Not Allowed
```
@y
```
405 Method Not Allowed
```
@z

@x
Blob mount is not allowed because the registry is configured as a pull-through cache or for some other reason
@y
Blob mount is not allowed because the registry is configured as a pull-through cache or for some other reason
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `UNSUPPORTED` | The operation is unsupported. | The operation was unsupported due to a missing implementation or invalid set of parameters. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `UNSUPPORTED` | The operation is unsupported. | The operation was unsupported due to a missing implementation or invalid set of parameters. |
@z

@x
###### On Failure: Authentication Required
@y
###### On Failure: Authentication Required
@z

@x
```
401 Unauthorized
WWW-Authenticate: <scheme> realm="<realm>", ..."
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@y
```
401 Unauthorized
WWW-Authenticate: <scheme> realm="<realm>", ..."
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The client is not authenticated.
@y
The client is not authenticated.
@z

@x
The following headers will be returned on the response:
@y
The following headers will be returned on the response:
@z

@x
|Name|Description|
|----|-----------|
|`WWW-Authenticate`|An RFC7235 compliant authentication challenge header.|
|`Content-Length`|Length of the JSON response body.|
@y
|Name|Description|
|----|-----------|
|`WWW-Authenticate`|An RFC7235 compliant authentication challenge header.|
|`Content-Length`|Length of the JSON response body.|
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `UNAUTHORIZED` | authentication required | The access controller was unable to authenticate the client. Often this will be accompanied by a Www-Authenticate HTTP response header indicating how to authenticate. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `UNAUTHORIZED` | authentication required | The access controller was unable to authenticate the client. Often this will be accompanied by a Www-Authenticate HTTP response header indicating how to authenticate. |
@z

@x
###### On Failure: No Such Repository Error
@y
###### On Failure: No Such Repository Error
@z

@x
```
404 Not Found
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@y
```
404 Not Found
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The repository is not known to the registry.
@y
The repository is not known to the registry.
@z

@x
The following headers will be returned on the response:
@y
The following headers will be returned on the response:
@z

@x
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@y
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `NAME_UNKNOWN` | repository name not known to registry | This is returned if the name used during an operation is unknown to the registry. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `NAME_UNKNOWN` | repository name not known to registry | This is returned if the name used during an operation is unknown to the registry. |
@z

@x
###### On Failure: Access Denied
@y
###### On Failure: Access Denied
@z

@x
```
403 Forbidden
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@y
```
403 Forbidden
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The client does not have required access to the repository.
@y
The client does not have required access to the repository.
@z

@x
The following headers will be returned on the response:
@y
The following headers will be returned on the response:
@z

@x
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@y
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `DENIED` | requested access to the resource is denied | The access controller denied access for the operation on a resource. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `DENIED` | requested access to the resource is denied | The access controller denied access for the operation on a resource. |
@z

@x
###### On Failure: Too Many Requests
@y
###### On Failure: Too Many Requests
@z

@x
```
429 Too Many Requests
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@y
```
429 Too Many Requests
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The client made too many requests within a time interval.
@y
The client made too many requests within a time interval.
@z

@x
The following headers will be returned on the response:
@y
The following headers will be returned on the response:
@z

@x
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@y
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `TOOMANYREQUESTS` | too many requests | Returned when a client attempts to contact a service too many times |
@y
|Code|Message|Description|
|----|-------|-----------|
| `TOOMANYREQUESTS` | too many requests | Returned when a client attempts to contact a service too many times |
@z

@x
### Blob Upload
@y
### Blob Upload
@z

@x
Interact with blob uploads. Clients should never assemble URLs for this endpoint and should only take it through the `Location` header on related API requests. The `Location` header and its parameters should be preserved by clients, using the latest value returned via upload related API calls.
@y
Interact with blob uploads. Clients should never assemble URLs for this endpoint and should only take it through the `Location` header on related API requests. The `Location` header and its parameters should be preserved by clients, using the latest value returned via upload related API calls.
@z

@x
#### GET Blob Upload
@y
#### GET Blob Upload
@z

@x
Retrieve status of upload identified by `uuid`. The primary purpose of this endpoint is to resolve the current status of a resumable upload.
@y
Retrieve status of upload identified by `uuid`. The primary purpose of this endpoint is to resolve the current status of a resumable upload.
@z

@x
```
GET /v2/<name>/blobs/uploads/<uuid>
Host: <registry host>
Authorization: <scheme> <token>
```
@y
```
GET /v2/<name>/blobs/uploads/<uuid>
Host: <registry host>
Authorization: <scheme> <token>
```
@z

@x
Retrieve the progress of the current upload, as reported by the `Range` header.
@y
Retrieve the progress of the current upload, as reported by the `Range` header.
@z

@x
The following parameters should be specified on the request:
@y
The following parameters should be specified on the request:
@z

@x
|Name|Kind|Description|
|----|----|-----------|
|`Host`|header|Standard HTTP Host Header. Should be set to the registry host.|
|`Authorization`|header|An RFC7235 compliant authorization header.|
|`name`|path|Name of the target repository.|
|`uuid`|path|A uuid identifying the upload. This field can accept characters that match `[a-zA-Z0-9-_.=]+`.|
@y
|Name|Kind|Description|
|----|----|-----------|
|`Host`|header|Standard HTTP Host Header. Should be set to the registry host.|
|`Authorization`|header|An RFC7235 compliant authorization header.|
|`name`|path|Name of the target repository.|
|`uuid`|path|A uuid identifying the upload. This field can accept characters that match `[a-zA-Z0-9-_.=]+`.|
@z

@x
###### On Success: Upload Progress
@y
###### On Success: Upload Progress
@z

@x
```
204 No Content
Range: 0-<offset>
Content-Length: 0
Docker-Upload-UUID: <uuid>
```
@y
```
204 No Content
Range: 0-<offset>
Content-Length: 0
Docker-Upload-UUID: <uuid>
```
@z

@x
The upload is known and in progress. The last received offset is available in the `Range` header.
@y
The upload is known and in progress. The last received offset is available in the `Range` header.
@z

@x
The following headers will be returned with the response:
@y
The following headers will be returned with the response:
@z

@x
|Name|Description|
|----|-----------|
|`Range`|Range indicating the current progress of the upload.|
|`Content-Length`|The `Content-Length` header must be zero and the body must be empty.|
|`Docker-Upload-UUID`|Identifies the docker upload uuid for the current request.|
@y
|Name|Description|
|----|-----------|
|`Range`|Range indicating the current progress of the upload.|
|`Content-Length`|The `Content-Length` header must be zero and the body must be empty.|
|`Docker-Upload-UUID`|Identifies the docker upload uuid for the current request.|
@z

@x
###### On Failure: Bad Request
@y
###### On Failure: Bad Request
@z

@x
```
400 Bad Request
Content-Type: application/json; charset=utf-8
@y
```
400 Bad Request
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
There was an error processing the upload and it must be restarted.
@y
There was an error processing the upload and it must be restarted.
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `DIGEST_INVALID` | provided digest did not match uploaded content | When a blob is uploaded, the registry will check that the content matches the digest provided by the client. The error may include a detail structure with the key "digest", including the invalid digest string. This error may also be returned when a manifest includes an invalid layer digest. |
| `NAME_INVALID` | invalid repository name | Invalid repository name encountered either during manifest validation or any API operation. |
| `BLOB_UPLOAD_INVALID` | blob upload invalid | The blob upload encountered an error and can no longer proceed. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `DIGEST_INVALID` | provided digest did not match uploaded content | When a blob is uploaded, the registry will check that the content matches the digest provided by the client. The error may include a detail structure with the key "digest", including the invalid digest string. This error may also be returned when a manifest includes an invalid layer digest. |
| `NAME_INVALID` | invalid repository name | Invalid repository name encountered either during manifest validation or any API operation. |
| `BLOB_UPLOAD_INVALID` | blob upload invalid | The blob upload encountered an error and can no longer proceed. |
@z

@x
###### On Failure: Not Found
@y
###### On Failure: Not Found
@z

@x
```
404 Not Found
Content-Type: application/json; charset=utf-8
@y
```
404 Not Found
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The upload is unknown to the registry. The upload must be restarted.
@y
The upload is unknown to the registry. The upload must be restarted.
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `BLOB_UPLOAD_UNKNOWN` | blob upload unknown to registry | If a blob upload has been cancelled or was never started, this error code may be returned. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `BLOB_UPLOAD_UNKNOWN` | blob upload unknown to registry | If a blob upload has been cancelled or was never started, this error code may be returned. |
@z

@x
###### On Failure: Authentication Required
@y
###### On Failure: Authentication Required
@z

@x
```
401 Unauthorized
WWW-Authenticate: <scheme> realm="<realm>", ..."
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@y
```
401 Unauthorized
WWW-Authenticate: <scheme> realm="<realm>", ..."
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The client is not authenticated.
@y
The client is not authenticated.
@z

@x
The following headers will be returned on the response:
@y
The following headers will be returned on the response:
@z

@x
|Name|Description|
|----|-----------|
|`WWW-Authenticate`|An RFC7235 compliant authentication challenge header.|
|`Content-Length`|Length of the JSON response body.|
@y
|Name|Description|
|----|-----------|
|`WWW-Authenticate`|An RFC7235 compliant authentication challenge header.|
|`Content-Length`|Length of the JSON response body.|
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `UNAUTHORIZED` | authentication required | The access controller was unable to authenticate the client. Often this will be accompanied by a Www-Authenticate HTTP response header indicating how to authenticate. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `UNAUTHORIZED` | authentication required | The access controller was unable to authenticate the client. Often this will be accompanied by a Www-Authenticate HTTP response header indicating how to authenticate. |
@z

@x
###### On Failure: No Such Repository Error
@y
###### On Failure: No Such Repository Error
@z

@x
```
404 Not Found
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@y
```
404 Not Found
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The repository is not known to the registry.
@y
The repository is not known to the registry.
@z

@x
The following headers will be returned on the response:
@y
The following headers will be returned on the response:
@z

@x
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@y
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `NAME_UNKNOWN` | repository name not known to registry | This is returned if the name used during an operation is unknown to the registry. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `NAME_UNKNOWN` | repository name not known to registry | This is returned if the name used during an operation is unknown to the registry. |
@z

@x
###### On Failure: Access Denied
@y
###### On Failure: Access Denied
@z

@x
```
403 Forbidden
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@y
```
403 Forbidden
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The client does not have required access to the repository.
@y
The client does not have required access to the repository.
@z

@x
The following headers will be returned on the response:
@y
The following headers will be returned on the response:
@z

@x
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@y
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `DENIED` | requested access to the resource is denied | The access controller denied access for the operation on a resource. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `DENIED` | requested access to the resource is denied | The access controller denied access for the operation on a resource. |
@z

@x
###### On Failure: Too Many Requests
@y
###### On Failure: Too Many Requests
@z

@x
```
429 Too Many Requests
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@y
```
429 Too Many Requests
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The client made too many requests within a time interval.
@y
The client made too many requests within a time interval.
@z

@x
The following headers will be returned on the response:
@y
The following headers will be returned on the response:
@z

@x
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@y
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `TOOMANYREQUESTS` | too many requests | Returned when a client attempts to contact a service too many times |
@y
|Code|Message|Description|
|----|-------|-----------|
| `TOOMANYREQUESTS` | too many requests | Returned when a client attempts to contact a service too many times |
@z

@x
#### PATCH Blob Upload
@y
#### PATCH Blob Upload
@z

@x
Upload a chunk of data for the specified upload.
@y
Upload a chunk of data for the specified upload.
@z

@x
##### Stream upload
@y
##### Stream upload
@z

@x
```
PATCH /v2/<name>/blobs/uploads/<uuid>
Host: <registry host>
Authorization: <scheme> <token>
Content-Type: application/octet-stream
@y
```
PATCH /v2/<name>/blobs/uploads/<uuid>
Host: <registry host>
Authorization: <scheme> <token>
Content-Type: application/octet-stream
@z

@x
<binary data>
```
@y
<binary data>
```
@z

@x
Upload a stream of data to upload without completing the upload.
@y
Upload a stream of data to upload without completing the upload.
@z

@x
The following parameters should be specified on the request:
@y
The following parameters should be specified on the request:
@z

@x
|Name|Kind|Description|
|----|----|-----------|
|`Host`|header|Standard HTTP Host Header. Should be set to the registry host.|
|`Authorization`|header|An RFC7235 compliant authorization header.|
|`name`|path|Name of the target repository.|
|`uuid`|path|A uuid identifying the upload. This field can accept characters that match `[a-zA-Z0-9-_.=]+`.|
@y
|Name|Kind|Description|
|----|----|-----------|
|`Host`|header|Standard HTTP Host Header. Should be set to the registry host.|
|`Authorization`|header|An RFC7235 compliant authorization header.|
|`name`|path|Name of the target repository.|
|`uuid`|path|A uuid identifying the upload. This field can accept characters that match `[a-zA-Z0-9-_.=]+`.|
@z

@x
###### On Success: Data Accepted
@y
###### On Success: Data Accepted
@z

@x
```
204 No Content
Location: /v2/<name>/blobs/uploads/<uuid>
Range: 0-<offset>
Content-Length: 0
Docker-Upload-UUID: <uuid>
```
@y
```
204 No Content
Location: /v2/<name>/blobs/uploads/<uuid>
Range: 0-<offset>
Content-Length: 0
Docker-Upload-UUID: <uuid>
```
@z

@x
The stream of data has been accepted and the current progress is available in the range header. The updated upload location is available in the `Location` header.
@y
The stream of data has been accepted and the current progress is available in the range header. The updated upload location is available in the `Location` header.
@z

@x
The following headers will be returned with the response:
@y
The following headers will be returned with the response:
@z

@x
|Name|Description|
|----|-----------|
|`Location`|The location of the upload. Clients should assume this changes after each request. Clients should use the contents verbatim to complete the upload, adding parameters where required.|
|`Range`|Range indicating the current progress of the upload.|
|`Content-Length`|The `Content-Length` header must be zero and the body must be empty.|
|`Docker-Upload-UUID`|Identifies the docker upload uuid for the current request.|
@y
|Name|Description|
|----|-----------|
|`Location`|The location of the upload. Clients should assume this changes after each request. Clients should use the contents verbatim to complete the upload, adding parameters where required.|
|`Range`|Range indicating the current progress of the upload.|
|`Content-Length`|The `Content-Length` header must be zero and the body must be empty.|
|`Docker-Upload-UUID`|Identifies the docker upload uuid for the current request.|
@z

@x
###### On Failure: Bad Request
@y
###### On Failure: Bad Request
@z

@x
```
400 Bad Request
Content-Type: application/json; charset=utf-8
@y
```
400 Bad Request
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
There was an error processing the upload and it must be restarted.
@y
There was an error processing the upload and it must be restarted.
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `DIGEST_INVALID` | provided digest did not match uploaded content | When a blob is uploaded, the registry will check that the content matches the digest provided by the client. The error may include a detail structure with the key "digest", including the invalid digest string. This error may also be returned when a manifest includes an invalid layer digest. |
| `NAME_INVALID` | invalid repository name | Invalid repository name encountered either during manifest validation or any API operation. |
| `BLOB_UPLOAD_INVALID` | blob upload invalid | The blob upload encountered an error and can no longer proceed. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `DIGEST_INVALID` | provided digest did not match uploaded content | When a blob is uploaded, the registry will check that the content matches the digest provided by the client. The error may include a detail structure with the key "digest", including the invalid digest string. This error may also be returned when a manifest includes an invalid layer digest. |
| `NAME_INVALID` | invalid repository name | Invalid repository name encountered either during manifest validation or any API operation. |
| `BLOB_UPLOAD_INVALID` | blob upload invalid | The blob upload encountered an error and can no longer proceed. |
@z

@x
###### On Failure: Not Found
@y
###### On Failure: Not Found
@z

@x
```
404 Not Found
Content-Type: application/json; charset=utf-8
@y
```
404 Not Found
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The upload is unknown to the registry. The upload must be restarted.
@y
The upload is unknown to the registry. The upload must be restarted.
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `BLOB_UPLOAD_UNKNOWN` | blob upload unknown to registry | If a blob upload has been cancelled or was never started, this error code may be returned. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `BLOB_UPLOAD_UNKNOWN` | blob upload unknown to registry | If a blob upload has been cancelled or was never started, this error code may be returned. |
@z

@x
###### On Failure: Authentication Required
@y
###### On Failure: Authentication Required
@z

@x
```
401 Unauthorized
WWW-Authenticate: <scheme> realm="<realm>", ..."
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@y
```
401 Unauthorized
WWW-Authenticate: <scheme> realm="<realm>", ..."
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The client is not authenticated.
@y
The client is not authenticated.
@z

@x
The following headers will be returned on the response:
@y
The following headers will be returned on the response:
@z

@x
|Name|Description|
|----|-----------|
|`WWW-Authenticate`|An RFC7235 compliant authentication challenge header.|
|`Content-Length`|Length of the JSON response body.|
@y
|Name|Description|
|----|-----------|
|`WWW-Authenticate`|An RFC7235 compliant authentication challenge header.|
|`Content-Length`|Length of the JSON response body.|
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `UNAUTHORIZED` | authentication required | The access controller was unable to authenticate the client. Often this will be accompanied by a Www-Authenticate HTTP response header indicating how to authenticate. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `UNAUTHORIZED` | authentication required | The access controller was unable to authenticate the client. Often this will be accompanied by a Www-Authenticate HTTP response header indicating how to authenticate. |
@z

@x
###### On Failure: No Such Repository Error
@y
###### On Failure: No Such Repository Error
@z

@x
```
404 Not Found
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@y
```
404 Not Found
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The repository is not known to the registry.
@y
The repository is not known to the registry.
@z

@x
The following headers will be returned on the response:
@y
The following headers will be returned on the response:
@z

@x
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@y
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `NAME_UNKNOWN` | repository name not known to registry | This is returned if the name used during an operation is unknown to the registry. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `NAME_UNKNOWN` | repository name not known to registry | This is returned if the name used during an operation is unknown to the registry. |
@z

@x
###### On Failure: Access Denied
@y
###### On Failure: Access Denied
@z

@x
```
403 Forbidden
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@y
```
403 Forbidden
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The client does not have required access to the repository.
@y
The client does not have required access to the repository.
@z

@x
The following headers will be returned on the response:
@y
The following headers will be returned on the response:
@z

@x
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@y
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `DENIED` | requested access to the resource is denied | The access controller denied access for the operation on a resource. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `DENIED` | requested access to the resource is denied | The access controller denied access for the operation on a resource. |
@z

@x
###### On Failure: Too Many Requests
@y
###### On Failure: Too Many Requests
@z

@x
```
429 Too Many Requests
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@y
```
429 Too Many Requests
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The client made too many requests within a time interval.
@y
The client made too many requests within a time interval.
@z

@x
The following headers will be returned on the response:
@y
The following headers will be returned on the response:
@z

@x
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@y
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `TOOMANYREQUESTS` | too many requests | Returned when a client attempts to contact a service too many times |
@y
|Code|Message|Description|
|----|-------|-----------|
| `TOOMANYREQUESTS` | too many requests | Returned when a client attempts to contact a service too many times |
@z

@x
##### Chunked upload
@y
##### Chunked upload
@z

@x
```
PATCH /v2/<name>/blobs/uploads/<uuid>
Host: <registry host>
Authorization: <scheme> <token>
Content-Range: <start of range>-<end of range, inclusive>
Content-Length: <length of chunk>
Content-Type: application/octet-stream
@y
```
PATCH /v2/<name>/blobs/uploads/<uuid>
Host: <registry host>
Authorization: <scheme> <token>
Content-Range: <start of range>-<end of range, inclusive>
Content-Length: <length of chunk>
Content-Type: application/octet-stream
@z

@x
<binary chunk>
```
@y
<binary chunk>
```
@z

@x
Upload a chunk of data to specified upload without completing the upload. The data will be uploaded to the specified Content Range.
@y
Upload a chunk of data to specified upload without completing the upload. The data will be uploaded to the specified Content Range.
@z

@x
The following parameters should be specified on the request:
@y
The following parameters should be specified on the request:
@z

@x
|Name|Kind|Description|
|----|----|-----------|
|`Host`|header|Standard HTTP Host Header. Should be set to the registry host.|
|`Authorization`|header|An RFC7235 compliant authorization header.|
|`Content-Range`|header|Range of bytes identifying the desired block of content represented by the body. Start must the end offset retrieved via status check plus one. Note that this is a non-standard use of the `Content-Range` header.|
|`Content-Length`|header|Length of the chunk being uploaded, corresponding the length of the request body.|
|`name`|path|Name of the target repository.|
|`uuid`|path|A uuid identifying the upload. This field can accept characters that match `[a-zA-Z0-9-_.=]+`.|
@y
|Name|Kind|Description|
|----|----|-----------|
|`Host`|header|Standard HTTP Host Header. Should be set to the registry host.|
|`Authorization`|header|An RFC7235 compliant authorization header.|
|`Content-Range`|header|Range of bytes identifying the desired block of content represented by the body. Start must the end offset retrieved via status check plus one. Note that this is a non-standard use of the `Content-Range` header.|
|`Content-Length`|header|Length of the chunk being uploaded, corresponding the length of the request body.|
|`name`|path|Name of the target repository.|
|`uuid`|path|A uuid identifying the upload. This field can accept characters that match `[a-zA-Z0-9-_.=]+`.|
@z

@x
###### On Success: Chunk Accepted
@y
###### On Success: Chunk Accepted
@z

@x
```
204 No Content
Location: /v2/<name>/blobs/uploads/<uuid>
Range: 0-<offset>
Content-Length: 0
Docker-Upload-UUID: <uuid>
```
@y
```
204 No Content
Location: /v2/<name>/blobs/uploads/<uuid>
Range: 0-<offset>
Content-Length: 0
Docker-Upload-UUID: <uuid>
```
@z

@x
The chunk of data has been accepted and the current progress is available in the range header. The updated upload location is available in the `Location` header.
@y
The chunk of data has been accepted and the current progress is available in the range header. The updated upload location is available in the `Location` header.
@z

@x
The following headers will be returned with the response:
@y
The following headers will be returned with the response:
@z

@x
|Name|Description|
|----|-----------|
|`Location`|The location of the upload. Clients should assume this changes after each request. Clients should use the contents verbatim to complete the upload, adding parameters where required.|
|`Range`|Range indicating the current progress of the upload.|
|`Content-Length`|The `Content-Length` header must be zero and the body must be empty.|
|`Docker-Upload-UUID`|Identifies the docker upload uuid for the current request.|
@y
|Name|Description|
|----|-----------|
|`Location`|The location of the upload. Clients should assume this changes after each request. Clients should use the contents verbatim to complete the upload, adding parameters where required.|
|`Range`|Range indicating the current progress of the upload.|
|`Content-Length`|The `Content-Length` header must be zero and the body must be empty.|
|`Docker-Upload-UUID`|Identifies the docker upload uuid for the current request.|
@z

@x
###### On Failure: Bad Request
@y
###### On Failure: Bad Request
@z

@x
```
400 Bad Request
Content-Type: application/json; charset=utf-8
@y
```
400 Bad Request
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
There was an error processing the upload and it must be restarted.
@y
There was an error processing the upload and it must be restarted.
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `DIGEST_INVALID` | provided digest did not match uploaded content | When a blob is uploaded, the registry will check that the content matches the digest provided by the client. The error may include a detail structure with the key "digest", including the invalid digest string. This error may also be returned when a manifest includes an invalid layer digest. |
| `NAME_INVALID` | invalid repository name | Invalid repository name encountered either during manifest validation or any API operation. |
| `BLOB_UPLOAD_INVALID` | blob upload invalid | The blob upload encountered an error and can no longer proceed. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `DIGEST_INVALID` | provided digest did not match uploaded content | When a blob is uploaded, the registry will check that the content matches the digest provided by the client. The error may include a detail structure with the key "digest", including the invalid digest string. This error may also be returned when a manifest includes an invalid layer digest. |
| `NAME_INVALID` | invalid repository name | Invalid repository name encountered either during manifest validation or any API operation. |
| `BLOB_UPLOAD_INVALID` | blob upload invalid | The blob upload encountered an error and can no longer proceed. |
@z

@x
###### On Failure: Not Found
@y
###### On Failure: Not Found
@z

@x
```
404 Not Found
Content-Type: application/json; charset=utf-8
@y
```
404 Not Found
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The upload is unknown to the registry. The upload must be restarted.
@y
The upload is unknown to the registry. The upload must be restarted.
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `BLOB_UPLOAD_UNKNOWN` | blob upload unknown to registry | If a blob upload has been cancelled or was never started, this error code may be returned. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `BLOB_UPLOAD_UNKNOWN` | blob upload unknown to registry | If a blob upload has been cancelled or was never started, this error code may be returned. |
@z

@x
###### On Failure: Requested Range Not Satisfiable
@y
###### On Failure: Requested Range Not Satisfiable
@z

@x
```
416 Requested Range Not Satisfiable
```
@y
```
416 Requested Range Not Satisfiable
```
@z

@x
The `Content-Range` specification cannot be accepted, either because it does not overlap with the current progress or it is invalid.
@y
The `Content-Range` specification cannot be accepted, either because it does not overlap with the current progress or it is invalid.
@z

@x
###### On Failure: Authentication Required
@y
###### On Failure: Authentication Required
@z

@x
```
401 Unauthorized
WWW-Authenticate: <scheme> realm="<realm>", ..."
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@y
```
401 Unauthorized
WWW-Authenticate: <scheme> realm="<realm>", ..."
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The client is not authenticated.
@y
The client is not authenticated.
@z

@x
The following headers will be returned on the response:
@y
The following headers will be returned on the response:
@z

@x
|Name|Description|
|----|-----------|
|`WWW-Authenticate`|An RFC7235 compliant authentication challenge header.|
|`Content-Length`|Length of the JSON response body.|
@y
|Name|Description|
|----|-----------|
|`WWW-Authenticate`|An RFC7235 compliant authentication challenge header.|
|`Content-Length`|Length of the JSON response body.|
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `UNAUTHORIZED` | authentication required | The access controller was unable to authenticate the client. Often this will be accompanied by a Www-Authenticate HTTP response header indicating how to authenticate. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `UNAUTHORIZED` | authentication required | The access controller was unable to authenticate the client. Often this will be accompanied by a Www-Authenticate HTTP response header indicating how to authenticate. |
@z

@x
###### On Failure: No Such Repository Error
@y
###### On Failure: No Such Repository Error
@z

@x
```
404 Not Found
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@y
```
404 Not Found
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The repository is not known to the registry.
@y
The repository is not known to the registry.
@z

@x
The following headers will be returned on the response:
@y
The following headers will be returned on the response:
@z

@x
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@y
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `NAME_UNKNOWN` | repository name not known to registry | This is returned if the name used during an operation is unknown to the registry. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `NAME_UNKNOWN` | repository name not known to registry | This is returned if the name used during an operation is unknown to the registry. |
@z

@x
###### On Failure: Access Denied
@y
###### On Failure: Access Denied
@z

@x
```
403 Forbidden
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@y
```
403 Forbidden
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The client does not have required access to the repository.
@y
The client does not have required access to the repository.
@z

@x
The following headers will be returned on the response:
@y
The following headers will be returned on the response:
@z

@x
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@y
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `DENIED` | requested access to the resource is denied | The access controller denied access for the operation on a resource. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `DENIED` | requested access to the resource is denied | The access controller denied access for the operation on a resource. |
@z

@x
###### On Failure: Too Many Requests
@y
###### On Failure: Too Many Requests
@z

@x
```
429 Too Many Requests
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@y
```
429 Too Many Requests
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The client made too many requests within a time interval.
@y
The client made too many requests within a time interval.
@z

@x
The following headers will be returned on the response:
@y
The following headers will be returned on the response:
@z

@x
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@y
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `TOOMANYREQUESTS` | too many requests | Returned when a client attempts to contact a service too many times |
@y
|Code|Message|Description|
|----|-------|-----------|
| `TOOMANYREQUESTS` | too many requests | Returned when a client attempts to contact a service too many times |
@z

@x
#### PUT Blob Upload
@y
#### PUT Blob Upload
@z

@x
Complete the upload specified by `uuid`, optionally appending the body as the final chunk.
@y
Complete the upload specified by `uuid`, optionally appending the body as the final chunk.
@z

@x
```
PUT /v2/<name>/blobs/uploads/<uuid>?digest=<digest>
Host: <registry host>
Authorization: <scheme> <token>
Content-Length: <length of data>
Content-Type: application/octet-stream
@y
```
PUT /v2/<name>/blobs/uploads/<uuid>?digest=<digest>
Host: <registry host>
Authorization: <scheme> <token>
Content-Length: <length of data>
Content-Type: application/octet-stream
@z

@x
<binary data>
```
@y
<binary data>
```
@z

@x
Complete the upload, providing all the data in the body, if necessary. A request without a body will just complete the upload with previously uploaded content.
@y
Complete the upload, providing all the data in the body, if necessary. A request without a body will just complete the upload with previously uploaded content.
@z

@x
The following parameters should be specified on the request:
@y
The following parameters should be specified on the request:
@z

@x
|Name|Kind|Description|
|----|----|-----------|
|`Host`|header|Standard HTTP Host Header. Should be set to the registry host.|
|`Authorization`|header|An RFC7235 compliant authorization header.|
|`Content-Length`|header|Length of the data being uploaded, corresponding to the length of the request body. May be zero if no data is provided.|
|`name`|path|Name of the target repository.|
|`uuid`|path|A uuid identifying the upload. This field can accept characters that match `[a-zA-Z0-9-_.=]+`.|
|`digest`|query|Digest of uploaded blob.|
@y
|Name|Kind|Description|
|----|----|-----------|
|`Host`|header|Standard HTTP Host Header. Should be set to the registry host.|
|`Authorization`|header|An RFC7235 compliant authorization header.|
|`Content-Length`|header|Length of the data being uploaded, corresponding to the length of the request body. May be zero if no data is provided.|
|`name`|path|Name of the target repository.|
|`uuid`|path|A uuid identifying the upload. This field can accept characters that match `[a-zA-Z0-9-_.=]+`.|
|`digest`|query|Digest of uploaded blob.|
@z

@x
###### On Success: Upload Complete
@y
###### On Success: Upload Complete
@z

@x
```
204 No Content
Location: <blob location>
Content-Range: <start of range>-<end of range, inclusive>
Content-Length: 0
Docker-Content-Digest: <digest>
```
@y
```
204 No Content
Location: <blob location>
Content-Range: <start of range>-<end of range, inclusive>
Content-Length: 0
Docker-Content-Digest: <digest>
```
@z

@x
The upload has been completed and accepted by the registry. The canonical location will be available in the `Location` header.
@y
The upload has been completed and accepted by the registry. The canonical location will be available in the `Location` header.
@z

@x
The following headers will be returned with the response:
@y
The following headers will be returned with the response:
@z

@x
|Name|Description|
|----|-----------|
|`Location`|The canonical location of the blob for retrieval|
|`Content-Range`|Range of bytes identifying the desired block of content represented by the body. Start must match the end of offset retrieved via status check. Note that this is a non-standard use of the `Content-Range` header.|
|`Content-Length`|The `Content-Length` header must be zero and the body must be empty.|
|`Docker-Content-Digest`|Digest of the targeted content for the request.|
@y
|Name|Description|
|----|-----------|
|`Location`|The canonical location of the blob for retrieval|
|`Content-Range`|Range of bytes identifying the desired block of content represented by the body. Start must match the end of offset retrieved via status check. Note that this is a non-standard use of the `Content-Range` header.|
|`Content-Length`|The `Content-Length` header must be zero and the body must be empty.|
|`Docker-Content-Digest`|Digest of the targeted content for the request.|
@z

@x
###### On Failure: Bad Request
@y
###### On Failure: Bad Request
@z

@x
```
400 Bad Request
Content-Type: application/json; charset=utf-8
@y
```
400 Bad Request
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
There was an error processing the upload and it must be restarted.
@y
There was an error processing the upload and it must be restarted.
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `DIGEST_INVALID` | provided digest did not match uploaded content | When a blob is uploaded, the registry will check that the content matches the digest provided by the client. The error may include a detail structure with the key "digest", including the invalid digest string. This error may also be returned when a manifest includes an invalid layer digest. |
| `NAME_INVALID` | invalid repository name | Invalid repository name encountered either during manifest validation or any API operation. |
| `BLOB_UPLOAD_INVALID` | blob upload invalid | The blob upload encountered an error and can no longer proceed. |
| `UNSUPPORTED` | The operation is unsupported. | The operation was unsupported due to a missing implementation or invalid set of parameters. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `DIGEST_INVALID` | provided digest did not match uploaded content | When a blob is uploaded, the registry will check that the content matches the digest provided by the client. The error may include a detail structure with the key "digest", including the invalid digest string. This error may also be returned when a manifest includes an invalid layer digest. |
| `NAME_INVALID` | invalid repository name | Invalid repository name encountered either during manifest validation or any API operation. |
| `BLOB_UPLOAD_INVALID` | blob upload invalid | The blob upload encountered an error and can no longer proceed. |
| `UNSUPPORTED` | The operation is unsupported. | The operation was unsupported due to a missing implementation or invalid set of parameters. |
@z

@x
###### On Failure: Not Found
@y
###### On Failure: Not Found
@z

@x
```
404 Not Found
Content-Type: application/json; charset=utf-8
@y
```
404 Not Found
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The upload is unknown to the registry. The upload must be restarted.
@y
The upload is unknown to the registry. The upload must be restarted.
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `BLOB_UPLOAD_UNKNOWN` | blob upload unknown to registry | If a blob upload has been cancelled or was never started, this error code may be returned. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `BLOB_UPLOAD_UNKNOWN` | blob upload unknown to registry | If a blob upload has been cancelled or was never started, this error code may be returned. |
@z

@x
###### On Failure: Authentication Required
@y
###### On Failure: Authentication Required
@z

@x
```
401 Unauthorized
WWW-Authenticate: <scheme> realm="<realm>", ..."
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@y
```
401 Unauthorized
WWW-Authenticate: <scheme> realm="<realm>", ..."
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The client is not authenticated.
@y
The client is not authenticated.
@z

@x
The following headers will be returned on the response:
@y
The following headers will be returned on the response:
@z

@x
|Name|Description|
|----|-----------|
|`WWW-Authenticate`|An RFC7235 compliant authentication challenge header.|
|`Content-Length`|Length of the JSON response body.|
@y
|Name|Description|
|----|-----------|
|`WWW-Authenticate`|An RFC7235 compliant authentication challenge header.|
|`Content-Length`|Length of the JSON response body.|
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `UNAUTHORIZED` | authentication required | The access controller was unable to authenticate the client. Often this will be accompanied by a Www-Authenticate HTTP response header indicating how to authenticate. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `UNAUTHORIZED` | authentication required | The access controller was unable to authenticate the client. Often this will be accompanied by a Www-Authenticate HTTP response header indicating how to authenticate. |
@z

@x
###### On Failure: No Such Repository Error
@y
###### On Failure: No Such Repository Error
@z

@x
```
404 Not Found
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@y
```
404 Not Found
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The repository is not known to the registry.
@y
The repository is not known to the registry.
@z

@x
The following headers will be returned on the response:
@y
The following headers will be returned on the response:
@z

@x
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@y
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `NAME_UNKNOWN` | repository name not known to registry | This is returned if the name used during an operation is unknown to the registry. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `NAME_UNKNOWN` | repository name not known to registry | This is returned if the name used during an operation is unknown to the registry. |
@z

@x
###### On Failure: Access Denied
@y
###### On Failure: Access Denied
@z

@x
```
403 Forbidden
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@y
```
403 Forbidden
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The client does not have required access to the repository.
@y
The client does not have required access to the repository.
@z

@x
The following headers will be returned on the response:
@y
The following headers will be returned on the response:
@z

@x
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@y
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `DENIED` | requested access to the resource is denied | The access controller denied access for the operation on a resource. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `DENIED` | requested access to the resource is denied | The access controller denied access for the operation on a resource. |
@z

@x
###### On Failure: Too Many Requests
@y
###### On Failure: Too Many Requests
@z

@x
```
429 Too Many Requests
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@y
```
429 Too Many Requests
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The client made too many requests within a time interval.
@y
The client made too many requests within a time interval.
@z

@x
The following headers will be returned on the response:
@y
The following headers will be returned on the response:
@z

@x
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@y
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `TOOMANYREQUESTS` | too many requests | Returned when a client attempts to contact a service too many times |
@y
|Code|Message|Description|
|----|-------|-----------|
| `TOOMANYREQUESTS` | too many requests | Returned when a client attempts to contact a service too many times |
@z

@x
#### DELETE Blob Upload
@y
#### DELETE Blob Upload
@z

@x
Cancel outstanding upload processes, releasing associated resources. If this is not called, the unfinished uploads will eventually timeout.
@y
Cancel outstanding upload processes, releasing associated resources. If this is not called, the unfinished uploads will eventually timeout.
@z

@x
```
DELETE /v2/<name>/blobs/uploads/<uuid>
Host: <registry host>
Authorization: <scheme> <token>
Content-Length: 0
```
@y
```
DELETE /v2/<name>/blobs/uploads/<uuid>
Host: <registry host>
Authorization: <scheme> <token>
Content-Length: 0
```
@z

@x
Cancel the upload specified by `uuid`.
@y
Cancel the upload specified by `uuid`.
@z

@x
The following parameters should be specified on the request:
@y
The following parameters should be specified on the request:
@z

@x
|Name|Kind|Description|
|----|----|-----------|
|`Host`|header|Standard HTTP Host Header. Should be set to the registry host.|
|`Authorization`|header|An RFC7235 compliant authorization header.|
|`Content-Length`|header|The `Content-Length` header must be zero and the body must be empty.|
|`name`|path|Name of the target repository.|
|`uuid`|path|A uuid identifying the upload. This field can accept characters that match `[a-zA-Z0-9-_.=]+`.|
@y
|Name|Kind|Description|
|----|----|-----------|
|`Host`|header|Standard HTTP Host Header. Should be set to the registry host.|
|`Authorization`|header|An RFC7235 compliant authorization header.|
|`Content-Length`|header|The `Content-Length` header must be zero and the body must be empty.|
|`name`|path|Name of the target repository.|
|`uuid`|path|A uuid identifying the upload. This field can accept characters that match `[a-zA-Z0-9-_.=]+`.|
@z

@x
###### On Success: Upload Deleted
@y
###### On Success: Upload Deleted
@z

@x
```
204 No Content
Content-Length: 0
```
@y
```
204 No Content
Content-Length: 0
```
@z

@x
The upload has been successfully deleted.
@y
The upload has been successfully deleted.
@z

@x
The following headers will be returned with the response:
@y
The following headers will be returned with the response:
@z

@x
|Name|Description|
|----|-----------|
|`Content-Length`|The `Content-Length` header must be zero and the body must be empty.|
@y
|Name|Description|
|----|-----------|
|`Content-Length`|The `Content-Length` header must be zero and the body must be empty.|
@z

@x
###### On Failure: Bad Request
@y
###### On Failure: Bad Request
@z

@x
```
400 Bad Request
Content-Type: application/json; charset=utf-8
@y
```
400 Bad Request
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
An error was encountered processing the delete. The client may ignore this error.
@y
An error was encountered processing the delete. The client may ignore this error.
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `NAME_INVALID` | invalid repository name | Invalid repository name encountered either during manifest validation or any API operation. |
| `BLOB_UPLOAD_INVALID` | blob upload invalid | The blob upload encountered an error and can no longer proceed. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `NAME_INVALID` | invalid repository name | Invalid repository name encountered either during manifest validation or any API operation. |
| `BLOB_UPLOAD_INVALID` | blob upload invalid | The blob upload encountered an error and can no longer proceed. |
@z

@x
###### On Failure: Not Found
@y
###### On Failure: Not Found
@z

@x
```
404 Not Found
Content-Type: application/json; charset=utf-8
@y
```
404 Not Found
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The upload is unknown to the registry. The client may ignore this error and assume the upload has been deleted.
@y
The upload is unknown to the registry. The client may ignore this error and assume the upload has been deleted.
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `BLOB_UPLOAD_UNKNOWN` | blob upload unknown to registry | If a blob upload has been cancelled or was never started, this error code may be returned. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `BLOB_UPLOAD_UNKNOWN` | blob upload unknown to registry | If a blob upload has been cancelled or was never started, this error code may be returned. |
@z

@x
###### On Failure: Authentication Required
@y
###### On Failure: Authentication Required
@z

@x
```
401 Unauthorized
WWW-Authenticate: <scheme> realm="<realm>", ..."
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@y
```
401 Unauthorized
WWW-Authenticate: <scheme> realm="<realm>", ..."
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The client is not authenticated.
@y
The client is not authenticated.
@z

@x
The following headers will be returned on the response:
@y
The following headers will be returned on the response:
@z

@x
|Name|Description|
|----|-----------|
|`WWW-Authenticate`|An RFC7235 compliant authentication challenge header.|
|`Content-Length`|Length of the JSON response body.|
@y
|Name|Description|
|----|-----------|
|`WWW-Authenticate`|An RFC7235 compliant authentication challenge header.|
|`Content-Length`|Length of the JSON response body.|
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `UNAUTHORIZED` | authentication required | The access controller was unable to authenticate the client. Often this will be accompanied by a Www-Authenticate HTTP response header indicating how to authenticate. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `UNAUTHORIZED` | authentication required | The access controller was unable to authenticate the client. Often this will be accompanied by a Www-Authenticate HTTP response header indicating how to authenticate. |
@z

@x
###### On Failure: No Such Repository Error
@y
###### On Failure: No Such Repository Error
@z

@x
```
404 Not Found
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@y
```
404 Not Found
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The repository is not known to the registry.
@y
The repository is not known to the registry.
@z

@x
The following headers will be returned on the response:
@y
The following headers will be returned on the response:
@z

@x
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@y
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `NAME_UNKNOWN` | repository name not known to registry | This is returned if the name used during an operation is unknown to the registry. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `NAME_UNKNOWN` | repository name not known to registry | This is returned if the name used during an operation is unknown to the registry. |
@z

@x
###### On Failure: Access Denied
@y
###### On Failure: Access Denied
@z

@x
```
403 Forbidden
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@y
```
403 Forbidden
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The client does not have required access to the repository.
@y
The client does not have required access to the repository.
@z

@x
The following headers will be returned on the response:
@y
The following headers will be returned on the response:
@z

@x
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@y
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `DENIED` | requested access to the resource is denied | The access controller denied access for the operation on a resource. |
@y
|Code|Message|Description|
|----|-------|-----------|
| `DENIED` | requested access to the resource is denied | The access controller denied access for the operation on a resource. |
@z

@x
###### On Failure: Too Many Requests
@y
###### On Failure: Too Many Requests
@z

@x
```
429 Too Many Requests
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@y
```
429 Too Many Requests
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@z

@x
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@y
{
	"errors:" [
	    {
            "code": <error code>,
            "message": "<error message>",
            "detail": ...
        },
        ...
    ]
}
```
@z

@x
The client made too many requests within a time interval.
@y
The client made too many requests within a time interval.
@z

@x
The following headers will be returned on the response:
@y
The following headers will be returned on the response:
@z

@x
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@y
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@z

@x
The error codes that may be included in the response body are enumerated below:
@y
The error codes that may be included in the response body are enumerated below:
@z

@x
|Code|Message|Description|
|----|-------|-----------|
| `TOOMANYREQUESTS` | too many requests | Returned when a client attempts to contact a service too many times |
@y
|Code|Message|Description|
|----|-------|-----------|
| `TOOMANYREQUESTS` | too many requests | Returned when a client attempts to contact a service too many times |
@z

@x
### Catalog
@y
### Catalog
@z

@x
List a set of available repositories in the local registry cluster. Does not provide any indication of what may be available upstream. Applications can only determine if a repository is available but not if it is not available.
@y
List a set of available repositories in the local registry cluster. Does not provide any indication of what may be available upstream. Applications can only determine if a repository is available but not if it is not available.
@z

@x
#### GET Catalog
@y
#### GET Catalog
@z

@x
Retrieve a sorted, json list of repositories available in the registry.
@y
Retrieve a sorted, json list of repositories available in the registry.
@z

@x
##### Catalog Fetch
@y
##### Catalog Fetch
@z

@x
```
GET /v2/_catalog
```
@y
```
GET /v2/_catalog
```
@z

@x
Request an unabridged list of repositories available.  The implementation may impose a maximum limit and return a partial set with pagination links.
@y
Request an unabridged list of repositories available.  The implementation may impose a maximum limit and return a partial set with pagination links.
@z

@x
###### On Success: OK
@y
###### On Success: OK
@z

@x
```
200 OK
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@y
```
200 OK
Content-Length: <length>
Content-Type: application/json; charset=utf-8
@z

@x
{
	"repositories": [
		<name>,
		...
	]
}
```
@y
{
	"repositories": [
		<name>,
		...
	]
}
```
@z

@x
Returns the unabridged list of repositories as a json response.
@y
Returns the unabridged list of repositories as a json response.
@z

@x
The following headers will be returned with the response:
@y
The following headers will be returned with the response:
@z

@x
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@y
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
@z

@x
##### Catalog Fetch Paginated
@y
##### Catalog Fetch Paginated
@z

@x
```
GET /v2/_catalog?n=<integer>&last=<integer>
```
@y
```
GET /v2/_catalog?n=<integer>&last=<integer>
```
@z

@x
Return the specified portion of repositories.
@y
Return the specified portion of repositories.
@z

@x
The following parameters should be specified on the request:
@y
The following parameters should be specified on the request:
@z

@x
|Name|Kind|Description|
|----|----|-----------|
|`n`|query|Limit the number of entries in each response. It not present, all entries will be returned.|
|`last`|query|Result set will include values lexically after last.|
@y
|Name|Kind|Description|
|----|----|-----------|
|`n`|query|Limit the number of entries in each response. It not present, all entries will be returned.|
|`last`|query|Result set will include values lexically after last.|
@z

@x
###### On Success: OK
@y
###### On Success: OK
@z

@x
```
200 OK
Content-Length: <length>
Link: <<url>?n=<last n value>&last=<last entry from response>>; rel="next"
Content-Type: application/json; charset=utf-8
@y
```
200 OK
Content-Length: <length>
Link: <<url>?n=<last n value>&last=<last entry from response>>; rel="next"
Content-Type: application/json; charset=utf-8
@z

@x
{
	"repositories": [
		<name>,
		...
	]
	"next": "<url>?last=<name>&n=<last value of n>"
}
```
@y
{
	"repositories": [
		<name>,
		...
	]
	"next": "<url>?last=<name>&n=<last value of n>"
}
```
@z

@x
The following headers will be returned with the response:
@y
The following headers will be returned with the response:
@z

@x
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
|`Link`|RFC5988 compliant rel='next' with URL to next result set, if available|
@y
|Name|Description|
|----|-----------|
|`Content-Length`|Length of the JSON response body.|
|`Link`|RFC5988 compliant rel='next' with URL to next result set, if available|
@z
