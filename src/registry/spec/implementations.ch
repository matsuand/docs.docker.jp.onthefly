%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
published: false
---
@y
---
published: false
---
@z

@x
# Distribution API Implementations
@y
# Distribution API Implementations
@z

@x
This is a list of known implementations of the Distribution API spec.
@y
This is a list of known implementations of the Distribution API spec.
@z

@x
## [Docker Distribution Registry](https://github.com/docker/distribution)
@y
## [Docker Distribution Registry](https://github.com/docker/distribution)
@z

@x
Docker distribution is the reference implementation of the distribution API
specification. It aims to fully implement the entire specification.
@y
Docker distribution is the reference implementation of the distribution API
specification. It aims to fully implement the entire specification.
@z

@x
### Releases
#### 2.0.1 (_in development_)
Implements API 2.0.1
@y
### Releases
#### 2.0.1 (_in development_)
Implements API 2.0.1
@z

@x
_Known Issues_
 - No resumable push support
 - Content ranges ignored
 - Blob upload status will always return a starting range of 0
@y
_Known Issues_
 - No resumable push support
 - Content ranges ignored
 - Blob upload status will always return a starting range of 0
@z

@x
#### 2.0.0
Implements API 2.0.0
@y
#### 2.0.0
Implements API 2.0.0
@z

@x
_Known Issues_
 - No resumable push support
 - No PATCH implementation for blob upload
 - Content ranges ignored
@y
_Known Issues_
 - No resumable push support
 - No PATCH implementation for blob upload
 - Content ranges ignored
@z
