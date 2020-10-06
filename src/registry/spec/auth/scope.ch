%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: "Token Scope Documentation"
description: "Describes the scope and access fields used for registry authorization tokens"
keywords: registry, on-prem, images, tags, repository, distribution, advanced, access, scope
---
@y
---
title: "Token Scope Documentation"
description: "Describes the scope and access fields used for registry authorization tokens"
keywords: registry, on-prem, images, tags, repository, distribution, advanced, access, scope
---
@z

@x
# Docker Registry Token Scope and Access
@y
# Docker Registry Token Scope and Access
@z

@x
Tokens used by the registry are always restricted what resources they may
be used to access, where those resources may be accessed, and what actions
may be done on those resources. Tokens always have the context of a user which
the token was originally created for. This document describes how these
restrictions are represented and enforced by the authorization server and
resource providers.
@y
Tokens used by the registry are always restricted what resources they may
be used to access, where those resources may be accessed, and what actions
may be done on those resources. Tokens always have the context of a user which
the token was originally created for. This document describes how these
restrictions are represented and enforced by the authorization server and
resource providers.
@z

@x
## Scope Components
@y
## Scope Components
@z

@x
### Subject (Authenticated User)
@y
### Subject (Authenticated User)
@z

@x
The subject represents the user for which a token is valid. Any actions
performed using an access token should be considered on behalf of the subject.
This is included in the `sub` field of access token JWT. A refresh token should
be limited to a single subject and only be able to give out access tokens for
that subject.
@y
The subject represents the user for which a token is valid. Any actions
performed using an access token should be considered on behalf of the subject.
This is included in the `sub` field of access token JWT. A refresh token should
be limited to a single subject and only be able to give out access tokens for
that subject.
@z

@x
### Audience (Resource Provider)
@y
### Audience (Resource Provider)
@z

@x
The audience represents a resource provider which is intended to be able to
perform the actions specified in the access token. Any resource provider which
does not match the audience should not use that access token. The audience is
included in the `aud` field of the access token JWT. A refresh token should be
limited to a single audience and only be able to give out access tokens for that
audience.
@y
The audience represents a resource provider which is intended to be able to
perform the actions specified in the access token. Any resource provider which
does not match the audience should not use that access token. The audience is
included in the `aud` field of the access token JWT. A refresh token should be
limited to a single audience and only be able to give out access tokens for that
audience.
@z

@x
### Resource Type
@y
### Resource Type
@z

@x
The resource type represents the type of resource which the resource name is
intended to represent. This type may be specific to a resource provider but must
be understood by the authorization server in order to validate the subject
is authorized for a specific resource.
@y
The resource type represents the type of resource which the resource name is
intended to represent. This type may be specific to a resource provider but must
be understood by the authorization server in order to validate the subject
is authorized for a specific resource.
@z

@x
#### Resource Class
@y
#### Resource Class
@z

@x
The resource type might have a resource class which further classifies the
the resource name within the resource type. A class is not required and
is specific to the resource type.
@y
The resource type might have a resource class which further classifies the
the resource name within the resource type. A class is not required and
is specific to the resource type.
@z

@x
#### Example Resource Types
@y
#### Example Resource Types
@z

@x
 - `repository` - represents a single repository within a registry. A
repository may represent many manifest or content blobs, but the resource type
is considered the collections of those items. Actions which may be performed on
a `repository` are `pull` for accessing the collection and `push` for adding to
it. By default the `repository` type has the class of `image`.
 - `repository(plugin)` - represents a single repository of plugins within a
registry. A plugin repository has the same content and actions as a repository.
 - `registry` - represents the entire registry. Used for administrative actions
or lookup operations that span an entire registry.
@y
 - `repository` - represents a single repository within a registry. A
repository may represent many manifest or content blobs, but the resource type
is considered the collections of those items. Actions which may be performed on
a `repository` are `pull` for accessing the collection and `push` for adding to
it. By default the `repository` type has the class of `image`.
 - `repository(plugin)` - represents a single repository of plugins within a
registry. A plugin repository has the same content and actions as a repository.
 - `registry` - represents the entire registry. Used for administrative actions
or lookup operations that span an entire registry.
@z

@x
### Resource Name
@y
### Resource Name
@z

@x
The resource name represent the name which identifies a resource for a resource
provider. A resource is identified by this name and the provided resource type.
An example of a resource name would be the name component of an image tag, such
as "samalba/myapp" or "hostname/samalba/myapp".
@y
The resource name represent the name which identifies a resource for a resource
provider. A resource is identified by this name and the provided resource type.
An example of a resource name would be the name component of an image tag, such
as "samalba/myapp" or "hostname/samalba/myapp".
@z

@x
### Resource Actions
@y
### Resource Actions
@z

@x
The resource actions define the actions which the access token allows to be
performed on the identified resource. These actions are type specific but will
normally have actions identifying read and write access on the resource. Example
for the `repository` type are `pull` for read access and `push` for write
access.
@y
The resource actions define the actions which the access token allows to be
performed on the identified resource. These actions are type specific but will
normally have actions identifying read and write access on the resource. Example
for the `repository` type are `pull` for read access and `push` for write
access.
@z

@x
## Authorization Server Use
@y
## Authorization Server Use
@z

@x
Each access token request may include a scope and an audience. The subject is
always derived from the passed in credentials or refresh token. When using
a refresh token the passed in audience must match the audience defined for
the refresh token. The audience (resource provider) is provided using the
`service` field. Multiple resource scopes may be provided using multiple `scope`
fields on the `GET` request. The `POST` request only takes in a single
`scope` field but may use a space to separate a list of multiple resource
scopes.
@y
Each access token request may include a scope and an audience. The subject is
always derived from the passed in credentials or refresh token. When using
a refresh token the passed in audience must match the audience defined for
the refresh token. The audience (resource provider) is provided using the
`service` field. Multiple resource scopes may be provided using multiple `scope`
fields on the `GET` request. The `POST` request only takes in a single
`scope` field but may use a space to separate a list of multiple resource
scopes.
@z

@x
### Resource Scope Grammar
@y
### Resource Scope Grammar
@z

@x
```
scope                   := resourcescope [ ' ' resourcescope ]*
resourcescope           := resourcetype  ":" resourcename  ":" action [ ',' action ]*
resourcetype            := resourcetypevalue [ '(' resourcetypevalue ')' ]
resourcetypevalue       := /[a-z0-9]+/
resourcename            := [ hostname '/' ] component [ '/' component ]*
hostname                := hostcomponent ['.' hostcomponent]* [':' port-number]
hostcomponent           := /([a-zA-Z0-9]|[a-zA-Z0-9][a-zA-Z0-9-]*[a-zA-Z0-9])/
port-number             := /[0-9]+/
action                  := /[a-z]*/
component               := alpha-numeric [ separator alpha-numeric ]*
alpha-numeric           := /[a-z0-9]+/
separator               := /[_.]|__|[-]*/
```
Full reference grammar is defined
[here](https://godoc.org/github.com/docker/distribution/reference). Currently
the scope name grammar is a subset of the reference grammar.
@y
```
scope                   := resourcescope [ ' ' resourcescope ]*
resourcescope           := resourcetype  ":" resourcename  ":" action [ ',' action ]*
resourcetype            := resourcetypevalue [ '(' resourcetypevalue ')' ]
resourcetypevalue       := /[a-z0-9]+/
resourcename            := [ hostname '/' ] component [ '/' component ]*
hostname                := hostcomponent ['.' hostcomponent]* [':' port-number]
hostcomponent           := /([a-zA-Z0-9]|[a-zA-Z0-9][a-zA-Z0-9-]*[a-zA-Z0-9])/
port-number             := /[0-9]+/
action                  := /[a-z]*/
component               := alpha-numeric [ separator alpha-numeric ]*
alpha-numeric           := /[a-z0-9]+/
separator               := /[_.]|__|[-]*/
```
Full reference grammar is defined
[here](https://godoc.org/github.com/docker/distribution/reference). Currently
the scope name grammar is a subset of the reference grammar.
@z

@x
> **NOTE:** that the `resourcename` may contain one `:` due to a possible port
> number in the hostname component of the `resourcename`, so a naive
> implementation that interprets the first three `:`-delimited tokens of a
> `scope` to be the `resourcetype`, `resourcename`, and a list of `action`
> would be insufficient.
@y
> **NOTE:** that the `resourcename` may contain one `:` due to a possible port
> number in the hostname component of the `resourcename`, so a naive
> implementation that interprets the first three `:`-delimited tokens of a
> `scope` to be the `resourcetype`, `resourcename`, and a list of `action`
> would be insufficient.
@z

@x
## Resource Provider Use
@y
## Resource Provider Use
@z

@x
Once a resource provider has verified the authenticity of the scope through
JWT access token verification, the resource provider must ensure that scope
satisfies the request. The resource provider should match the given audience
according to name or URI the resource provider uses to identify itself. Any
denial based on subject is not defined here and is up to resource provider, the
subject is mainly provided for audit logs and any other user-specific rules
which may need to be provided but are not defined by the authorization server.
@y
Once a resource provider has verified the authenticity of the scope through
JWT access token verification, the resource provider must ensure that scope
satisfies the request. The resource provider should match the given audience
according to name or URI the resource provider uses to identify itself. Any
denial based on subject is not defined here and is up to resource provider, the
subject is mainly provided for audit logs and any other user-specific rules
which may need to be provided but are not defined by the authorization server.
@z

@x
The resource provider must ensure that ANY resource being accessed as the
result of a request has the appropriate access scope. Both the resource type
and resource name must match the accessed resource and an appropriate action
scope must be included.
@y
The resource provider must ensure that ANY resource being accessed as the
result of a request has the appropriate access scope. Both the resource type
and resource name must match the accessed resource and an appropriate action
scope must be included.
@z

@x
When appropriate authorization is not provided either due to lack of scope
or missing token, the resource provider to return a `WWW-AUTHENTICATE` HTTP
header with the `realm` as the authorization server, the `service` as the
expected audience identifying string, and a `scope` field for each required
resource scope to complete the request.
@y
When appropriate authorization is not provided either due to lack of scope
or missing token, the resource provider to return a `WWW-AUTHENTICATE` HTTP
header with the `realm` as the authorization server, the `service` as the
expected audience identifying string, and a `scope` field for each required
resource scope to complete the request.
@z

@x
## JWT Access Tokens
@y
## JWT Access Tokens
@z

@x
Each JWT access token may only have a single subject and audience but multiple
resource scopes. The subject and audience are put into standard JWT fields
`sub` and `aud`. The resource scope is put into the `access` field. The
structure of the access field can be seen in the
[jwt documentation](jwt.md).
@y
Each JWT access token may only have a single subject and audience but multiple
resource scopes. The subject and audience are put into standard JWT fields
`sub` and `aud`. The resource scope is put into the `access` field. The
structure of the access field can be seen in the
[jwt documentation](jwt.md).
@z

@x
## Refresh Tokens
@y
## Refresh Tokens
@z

@x
A refresh token must be defined for a single subject and audience. Further
restricting scope to specific type, name, and actions combinations should be
done by fetching an access token using the refresh token. Since the refresh
token is not scoped to specific resources for an audience, extra care should
be taken to only use the refresh token to negotiate new access tokens directly
with the authorization server, and never with a resource provider.
@y
A refresh token must be defined for a single subject and audience. Further
restricting scope to specific type, name, and actions combinations should be
done by fetching an access token using the refresh token. Since the refresh
token is not scoped to specific resources for an audience, extra care should
be taken to only use the refresh token to negotiate new access tokens directly
with the authorization server, and never with a resource provider.
@z
