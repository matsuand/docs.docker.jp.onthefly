%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: "Image Manifest V 2, Schema 1 "
description: "image manifest for the Registry."
keywords: registry, on-prem, images, tags, repository, distribution, api, advanced, manifest
---
@y
---
title: "Image Manifest V 2, Schema 1 "
description: "image manifest for the Registry."
keywords: registry, on-prem, images, tags, repository, distribution, api, advanced, manifest
---
@z

@x
# Image Manifest Version 2, Schema 1
@y
# Image Manifest Version 2, Schema 1
@z

@x
This document outlines the format of the V2 image manifest. The image
manifest described herein was introduced in the Docker daemon in the [v1.3.0
release](https://github.com/docker/docker/commit/9f482a66ab37ec396ac61ed0c00d59122ac07453).
It is a provisional manifest to provide a compatibility with the [V1 Image
format](https://github.com/docker/docker/blob/master/image/spec/v1.md), as the
requirements are defined for the [V2 Schema 2
image](https://github.com/docker/distribution/pull/62).
@y
This document outlines the format of the V2 image manifest. The image
manifest described herein was introduced in the Docker daemon in the [v1.3.0
release](https://github.com/docker/docker/commit/9f482a66ab37ec396ac61ed0c00d59122ac07453).
It is a provisional manifest to provide a compatibility with the [V1 Image
format](https://github.com/docker/docker/blob/master/image/spec/v1.md), as the
requirements are defined for the [V2 Schema 2
image](https://github.com/docker/distribution/pull/62).
@z

@x
Image manifests describe the various constituents of a docker image.  Image
manifests can be serialized to JSON format with the following media types:
@y
Image manifests describe the various constituents of a docker image.  Image
manifests can be serialized to JSON format with the following media types:
@z

@x
Manifest Type  | Media Type
------------- | -------------
manifest  | "application/vnd.docker.distribution.manifest.v1+json"
signed manifest  | "application/vnd.docker.distribution.manifest.v1+prettyjws"
@y
Manifest Type  | Media Type
------------- | -------------
manifest  | "application/vnd.docker.distribution.manifest.v1+json"
signed manifest  | "application/vnd.docker.distribution.manifest.v1+prettyjws"
@z

@x
*Note that "application/json" will also be accepted for schema 1.*
@y
*Note that "application/json" will also be accepted for schema 1.*
@z

@x
References:
@y
References:
@z

@x
 - [Proposal: JSON Registry API V2.1](https://github.com/docker/docker/issues/9015)
 - [Proposal: Provenance step 1 - Transform images for validation and verification](https://github.com/docker/docker/issues/8093)
@y
 - [Proposal: JSON Registry API V2.1](https://github.com/docker/docker/issues/9015)
 - [Proposal: Provenance step 1 - Transform images for validation and verification](https://github.com/docker/docker/issues/8093)
@z

@x
## *Manifest* Field Descriptions
@y
## *Manifest* Field Descriptions
@z

@x
Manifest provides the base accessible fields for working with V2 image format
 in the registry.
@y
Manifest provides the base accessible fields for working with V2 image format
 in the registry.
@z

@x
- **`name`** *string*
@y
- **`name`** *string*
@z

@x
	name is the name of the image's repository
@y
	name is the name of the image's repository
@z

@x
- **`tag`** *string*
@y
- **`tag`** *string*
@z

@x
	tag is the tag of the image
@y
	tag is the tag of the image
@z

@x
- **`architecture`** *string*
@y
- **`architecture`** *string*
@z

@x
   architecture is the host architecture on which this image is intended to
   run.  This is for information purposes and not currently used by the engine
@y
   architecture is the host architecture on which this image is intended to
   run.  This is for information purposes and not currently used by the engine
@z

@x
- **`fsLayers`** *array*
@y
- **`fsLayers`** *array*
@z

@x
   fsLayers is a list of filesystem layer blob sums contained in this image.
@y
   fsLayers is a list of filesystem layer blob sums contained in this image.
@z

@x
   An fsLayer is a struct consisting of the following fields
      - **`blobSum`** *digest.Digest*
@y
   An fsLayer is a struct consisting of the following fields
      - **`blobSum`** *digest.Digest*
@z

@x
      blobSum is the digest of the referenced filesystem image layer. A
      digest must be a sha256 hash.
@y
      blobSum is the digest of the referenced filesystem image layer. A
      digest must be a sha256 hash.
@z

@x
- **`history`** *array*
@y
- **`history`** *array*
@z

@x
   history is a list of unstructured historical data for v1 compatibility. It
   contains ID of the image layer and ID of the layer's parent layers.
@y
   history is a list of unstructured historical data for v1 compatibility. It
   contains ID of the image layer and ID of the layer's parent layers.
@z

@x
   history is a struct consisting of the following fields
   - **`v1Compatibility`** string
@y
   history is a struct consisting of the following fields
   - **`v1Compatibility`** string
@z

@x
      V1Compatibility is the raw V1 compatibility information. This will
      contain the JSON object describing the V1 of this image.
@y
      V1Compatibility is the raw V1 compatibility information. This will
      contain the JSON object describing the V1 of this image.
@z

@x
- **`schemaVersion`** *int*
@y
- **`schemaVersion`** *int*
@z

@x
   SchemaVersion is the image manifest schema that this image follows.
@y
   SchemaVersion is the image manifest schema that this image follows.
@z

@x
>**Note**:the length of `history` must be equal to the length of `fsLayers` and
>entries in each are correlated by index.
@y
>**Note**:the length of `history` must be equal to the length of `fsLayers` and
>entries in each are correlated by index.
@z

@x
## Signed Manifests
@y
## Signed Manifests
@z

@x
Signed manifests provides an envelope for a signed image manifest.  A signed
manifest consists of an image manifest along with an additional field
containing the signature of the manifest.
@y
Signed manifests provides an envelope for a signed image manifest.  A signed
manifest consists of an image manifest along with an additional field
containing the signature of the manifest.
@z

@x
The docker client can verify signed manifests and displays a message to the user.
@y
The docker client can verify signed manifests and displays a message to the user.
@z

@x
### Signing Manifests
@y
### Signing Manifests
@z

@x
Image manifests can be signed in two different ways: with a *libtrust* private
 key or an x509 certificate chain.  When signing with an x509 certificate chain,
 the public key of the first element in the chain must be the public key
 corresponding with the sign key.
@y
Image manifests can be signed in two different ways: with a *libtrust* private
 key or an x509 certificate chain.  When signing with an x509 certificate chain,
 the public key of the first element in the chain must be the public key
 corresponding with the sign key.
@z

@x
### Signed Manifest Field Description
@y
### Signed Manifest Field Description
@z

@x
Signed manifests include an image manifest and a list of signatures generated
by *libtrust*.  A signature consists of the following fields:
@y
Signed manifests include an image manifest and a list of signatures generated
by *libtrust*.  A signature consists of the following fields:
@z

@x
- **`header`** *[JOSE](http://tools.ietf.org/html/draft-ietf-jose-json-web-signature-31#section-2)*
@y
- **`header`** *[JOSE](http://tools.ietf.org/html/draft-ietf-jose-json-web-signature-31#section-2)*
@z

@x
   A [JSON Web Signature](http://self-issued.info/docs/draft-ietf-jose-json-web-signature.html)
@y
   A [JSON Web Signature](http://self-issued.info/docs/draft-ietf-jose-json-web-signature.html)
@z

@x
- **`signature`** *string*
@y
- **`signature`** *string*
@z

@x
	A signature for the image manifest, signed by a *libtrust* private key
@y
	A signature for the image manifest, signed by a *libtrust* private key
@z

@x
- **`protected`** *string*
@y
- **`protected`** *string*
@z

@x
	The signed protected header
@y
	The signed protected header
@z

@x
## Example Manifest
@y
## Example Manifest
@z

@x
*Example showing the official 'hello-world' image manifest.*
@y
*Example showing the official 'hello-world' image manifest.*
@z

@x
```
{
   "name": "hello-world",
   "tag": "latest",
   "architecture": "amd64",
   "fsLayers": [
      {
         "blobSum": "sha256:5f70bf18a086007016e948b04aed3b82103a36bea41755b6cddfaf10ace3c6ef"
      },
      {
         "blobSum": "sha256:5f70bf18a086007016e948b04aed3b82103a36bea41755b6cddfaf10ace3c6ef"
      },
      {
         "blobSum": "sha256:cc8567d70002e957612902a8e985ea129d831ebe04057d88fb644857caa45d11"
      },
      {
         "blobSum": "sha256:5f70bf18a086007016e948b04aed3b82103a36bea41755b6cddfaf10ace3c6ef"
      }
   ],
   "history": [
      {
         "v1Compatibility": "{\"id\":\"e45a5af57b00862e5ef5782a9925979a02ba2b12dff832fd0991335f4a11e5c5\",\"parent\":\"31cbccb51277105ba3ae35ce33c22b69c9e3f1002e76e4c736a2e8ebff9d7b5d\",\"created\":\"2014-12-31T22:57:59.178729048Z\",\"container\":\"27b45f8fb11795b52e9605b686159729b0d9ca92f76d40fb4f05a62e19c46b4f\",\"container_config\":{\"Hostname\":\"8ce6509d66e2\",\"Domainname\":\"\",\"User\":\"\",\"Memory\":0,\"MemorySwap\":0,\"CpuShares\":0,\"Cpuset\":\"\",\"AttachStdin\":false,\"AttachStdout\":false,\"AttachStderr\":false,\"PortSpecs\":null,\"ExposedPorts\":null,\"Tty\":false,\"OpenStdin\":false,\"StdinOnce\":false,\"Env\":[\"PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\"],\"Cmd\":[\"/bin/sh\",\"-c\",\"#(nop) CMD [/hello]\"],\"Image\":\"31cbccb51277105ba3ae35ce33c22b69c9e3f1002e76e4c736a2e8ebff9d7b5d\",\"Volumes\":null,\"WorkingDir\":\"\",\"Entrypoint\":null,\"NetworkDisabled\":false,\"MacAddress\":\"\",\"OnBuild\":[],\"SecurityOpt\":null,\"Labels\":null},\"docker_version\":\"1.4.1\",\"config\":{\"Hostname\":\"8ce6509d66e2\",\"Domainname\":\"\",\"User\":\"\",\"Memory\":0,\"MemorySwap\":0,\"CpuShares\":0,\"Cpuset\":\"\",\"AttachStdin\":false,\"AttachStdout\":false,\"AttachStderr\":false,\"PortSpecs\":null,\"ExposedPorts\":null,\"Tty\":false,\"OpenStdin\":false,\"StdinOnce\":false,\"Env\":[\"PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\"],\"Cmd\":[\"/hello\"],\"Image\":\"31cbccb51277105ba3ae35ce33c22b69c9e3f1002e76e4c736a2e8ebff9d7b5d\",\"Volumes\":null,\"WorkingDir\":\"\",\"Entrypoint\":null,\"NetworkDisabled\":false,\"MacAddress\":\"\",\"OnBuild\":[],\"SecurityOpt\":null,\"Labels\":null},\"architecture\":\"amd64\",\"os\":\"linux\",\"Size\":0}\n"
      },
      {
         "v1Compatibility": "{\"id\":\"e45a5af57b00862e5ef5782a9925979a02ba2b12dff832fd0991335f4a11e5c5\",\"parent\":\"31cbccb51277105ba3ae35ce33c22b69c9e3f1002e76e4c736a2e8ebff9d7b5d\",\"created\":\"2014-12-31T22:57:59.178729048Z\",\"container\":\"27b45f8fb11795b52e9605b686159729b0d9ca92f76d40fb4f05a62e19c46b4f\",\"container_config\":{\"Hostname\":\"8ce6509d66e2\",\"Domainname\":\"\",\"User\":\"\",\"Memory\":0,\"MemorySwap\":0,\"CpuShares\":0,\"Cpuset\":\"\",\"AttachStdin\":false,\"AttachStdout\":false,\"AttachStderr\":false,\"PortSpecs\":null,\"ExposedPorts\":null,\"Tty\":false,\"OpenStdin\":false,\"StdinOnce\":false,\"Env\":[\"PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\"],\"Cmd\":[\"/bin/sh\",\"-c\",\"#(nop) CMD [/hello]\"],\"Image\":\"31cbccb51277105ba3ae35ce33c22b69c9e3f1002e76e4c736a2e8ebff9d7b5d\",\"Volumes\":null,\"WorkingDir\":\"\",\"Entrypoint\":null,\"NetworkDisabled\":false,\"MacAddress\":\"\",\"OnBuild\":[],\"SecurityOpt\":null,\"Labels\":null},\"docker_version\":\"1.4.1\",\"config\":{\"Hostname\":\"8ce6509d66e2\",\"Domainname\":\"\",\"User\":\"\",\"Memory\":0,\"MemorySwap\":0,\"CpuShares\":0,\"Cpuset\":\"\",\"AttachStdin\":false,\"AttachStdout\":false,\"AttachStderr\":false,\"PortSpecs\":null,\"ExposedPorts\":null,\"Tty\":false,\"OpenStdin\":false,\"StdinOnce\":false,\"Env\":[\"PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\"],\"Cmd\":[\"/hello\"],\"Image\":\"31cbccb51277105ba3ae35ce33c22b69c9e3f1002e76e4c736a2e8ebff9d7b5d\",\"Volumes\":null,\"WorkingDir\":\"\",\"Entrypoint\":null,\"NetworkDisabled\":false,\"MacAddress\":\"\",\"OnBuild\":[],\"SecurityOpt\":null,\"Labels\":null},\"architecture\":\"amd64\",\"os\":\"linux\",\"Size\":0}\n"
      },
   ],
   "schemaVersion": 1,
   "signatures": [
      {
         "header": {
            "jwk": {
               "crv": "P-256",
               "kid": "OD6I:6DRK:JXEJ:KBM4:255X:NSAA:MUSF:E4VM:ZI6W:CUN2:L4Z6:LSF4",
               "kty": "EC",
               "x": "3gAwX48IQ5oaYQAYSxor6rYYc_6yjuLCjtQ9LUakg4A",
               "y": "t72ge6kIA1XOjqjVoEOiPPAURltJFBMGDSQvEGVB010"
            },
            "alg": "ES256"
         },
         "signature": "XREm0L8WNn27Ga_iE_vRnTxVMhhYY0Zst_FfkKopg6gWSoTOZTuW4rK0fg_IqnKkEKlbD83tD46LKEGi5aIVFg",
         "protected": "eyJmb3JtYXRMZW5ndGgiOjY2MjgsImZvcm1hdFRhaWwiOiJDbjAiLCJ0aW1lIjoiMjAxNS0wNC0wOFQxODo1Mjo1OVoifQ"
      }
   ]
}
@y
```
{
   "name": "hello-world",
   "tag": "latest",
   "architecture": "amd64",
   "fsLayers": [
      {
         "blobSum": "sha256:5f70bf18a086007016e948b04aed3b82103a36bea41755b6cddfaf10ace3c6ef"
      },
      {
         "blobSum": "sha256:5f70bf18a086007016e948b04aed3b82103a36bea41755b6cddfaf10ace3c6ef"
      },
      {
         "blobSum": "sha256:cc8567d70002e957612902a8e985ea129d831ebe04057d88fb644857caa45d11"
      },
      {
         "blobSum": "sha256:5f70bf18a086007016e948b04aed3b82103a36bea41755b6cddfaf10ace3c6ef"
      }
   ],
   "history": [
      {
         "v1Compatibility": "{\"id\":\"e45a5af57b00862e5ef5782a9925979a02ba2b12dff832fd0991335f4a11e5c5\",\"parent\":\"31cbccb51277105ba3ae35ce33c22b69c9e3f1002e76e4c736a2e8ebff9d7b5d\",\"created\":\"2014-12-31T22:57:59.178729048Z\",\"container\":\"27b45f8fb11795b52e9605b686159729b0d9ca92f76d40fb4f05a62e19c46b4f\",\"container_config\":{\"Hostname\":\"8ce6509d66e2\",\"Domainname\":\"\",\"User\":\"\",\"Memory\":0,\"MemorySwap\":0,\"CpuShares\":0,\"Cpuset\":\"\",\"AttachStdin\":false,\"AttachStdout\":false,\"AttachStderr\":false,\"PortSpecs\":null,\"ExposedPorts\":null,\"Tty\":false,\"OpenStdin\":false,\"StdinOnce\":false,\"Env\":[\"PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\"],\"Cmd\":[\"/bin/sh\",\"-c\",\"#(nop) CMD [/hello]\"],\"Image\":\"31cbccb51277105ba3ae35ce33c22b69c9e3f1002e76e4c736a2e8ebff9d7b5d\",\"Volumes\":null,\"WorkingDir\":\"\",\"Entrypoint\":null,\"NetworkDisabled\":false,\"MacAddress\":\"\",\"OnBuild\":[],\"SecurityOpt\":null,\"Labels\":null},\"docker_version\":\"1.4.1\",\"config\":{\"Hostname\":\"8ce6509d66e2\",\"Domainname\":\"\",\"User\":\"\",\"Memory\":0,\"MemorySwap\":0,\"CpuShares\":0,\"Cpuset\":\"\",\"AttachStdin\":false,\"AttachStdout\":false,\"AttachStderr\":false,\"PortSpecs\":null,\"ExposedPorts\":null,\"Tty\":false,\"OpenStdin\":false,\"StdinOnce\":false,\"Env\":[\"PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\"],\"Cmd\":[\"/hello\"],\"Image\":\"31cbccb51277105ba3ae35ce33c22b69c9e3f1002e76e4c736a2e8ebff9d7b5d\",\"Volumes\":null,\"WorkingDir\":\"\",\"Entrypoint\":null,\"NetworkDisabled\":false,\"MacAddress\":\"\",\"OnBuild\":[],\"SecurityOpt\":null,\"Labels\":null},\"architecture\":\"amd64\",\"os\":\"linux\",\"Size\":0}\n"
      },
      {
         "v1Compatibility": "{\"id\":\"e45a5af57b00862e5ef5782a9925979a02ba2b12dff832fd0991335f4a11e5c5\",\"parent\":\"31cbccb51277105ba3ae35ce33c22b69c9e3f1002e76e4c736a2e8ebff9d7b5d\",\"created\":\"2014-12-31T22:57:59.178729048Z\",\"container\":\"27b45f8fb11795b52e9605b686159729b0d9ca92f76d40fb4f05a62e19c46b4f\",\"container_config\":{\"Hostname\":\"8ce6509d66e2\",\"Domainname\":\"\",\"User\":\"\",\"Memory\":0,\"MemorySwap\":0,\"CpuShares\":0,\"Cpuset\":\"\",\"AttachStdin\":false,\"AttachStdout\":false,\"AttachStderr\":false,\"PortSpecs\":null,\"ExposedPorts\":null,\"Tty\":false,\"OpenStdin\":false,\"StdinOnce\":false,\"Env\":[\"PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\"],\"Cmd\":[\"/bin/sh\",\"-c\",\"#(nop) CMD [/hello]\"],\"Image\":\"31cbccb51277105ba3ae35ce33c22b69c9e3f1002e76e4c736a2e8ebff9d7b5d\",\"Volumes\":null,\"WorkingDir\":\"\",\"Entrypoint\":null,\"NetworkDisabled\":false,\"MacAddress\":\"\",\"OnBuild\":[],\"SecurityOpt\":null,\"Labels\":null},\"docker_version\":\"1.4.1\",\"config\":{\"Hostname\":\"8ce6509d66e2\",\"Domainname\":\"\",\"User\":\"\",\"Memory\":0,\"MemorySwap\":0,\"CpuShares\":0,\"Cpuset\":\"\",\"AttachStdin\":false,\"AttachStdout\":false,\"AttachStderr\":false,\"PortSpecs\":null,\"ExposedPorts\":null,\"Tty\":false,\"OpenStdin\":false,\"StdinOnce\":false,\"Env\":[\"PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\"],\"Cmd\":[\"/hello\"],\"Image\":\"31cbccb51277105ba3ae35ce33c22b69c9e3f1002e76e4c736a2e8ebff9d7b5d\",\"Volumes\":null,\"WorkingDir\":\"\",\"Entrypoint\":null,\"NetworkDisabled\":false,\"MacAddress\":\"\",\"OnBuild\":[],\"SecurityOpt\":null,\"Labels\":null},\"architecture\":\"amd64\",\"os\":\"linux\",\"Size\":0}\n"
      },
   ],
   "schemaVersion": 1,
   "signatures": [
      {
         "header": {
            "jwk": {
               "crv": "P-256",
               "kid": "OD6I:6DRK:JXEJ:KBM4:255X:NSAA:MUSF:E4VM:ZI6W:CUN2:L4Z6:LSF4",
               "kty": "EC",
               "x": "3gAwX48IQ5oaYQAYSxor6rYYc_6yjuLCjtQ9LUakg4A",
               "y": "t72ge6kIA1XOjqjVoEOiPPAURltJFBMGDSQvEGVB010"
            },
            "alg": "ES256"
         },
         "signature": "XREm0L8WNn27Ga_iE_vRnTxVMhhYY0Zst_FfkKopg6gWSoTOZTuW4rK0fg_IqnKkEKlbD83tD46LKEGi5aIVFg",
         "protected": "eyJmb3JtYXRMZW5ndGgiOjY2MjgsImZvcm1hdFRhaWwiOiJDbjAiLCJ0aW1lIjoiMjAxNS0wNC0wOFQxODo1Mjo1OVoifQ"
      }
   ]
}
@z

@x
```
@y
```
@z
