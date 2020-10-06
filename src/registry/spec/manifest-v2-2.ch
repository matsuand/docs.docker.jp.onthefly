%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: "Image Manifest V 2, Schema 2 "
description: "image manifest for the Registry."
keywords: registry, on-prem, images, tags, repository, distribution, api, advanced, manifest
---
@y
---
title: "Image Manifest V 2, Schema 2 "
description: "image manifest for the Registry."
keywords: registry, on-prem, images, tags, repository, distribution, api, advanced, manifest
---
@z

@x
# Image Manifest Version 2, Schema 2
@y
# Image Manifest Version 2, Schema 2
@z

@x
This document outlines the format of the V2 image manifest, schema version 2.
The original (and provisional) image manifest for V2 (schema 1), was introduced
in the Docker daemon in the [v1.3.0
release](https://github.com/docker/docker/commit/9f482a66ab37ec396ac61ed0c00d59122ac07453)
and is specified in the [schema 1 manifest definition](manifest-v2-1.md)
@y
This document outlines the format of the V2 image manifest, schema version 2.
The original (and provisional) image manifest for V2 (schema 1), was introduced
in the Docker daemon in the [v1.3.0
release](https://github.com/docker/docker/commit/9f482a66ab37ec396ac61ed0c00d59122ac07453)
and is specified in the [schema 1 manifest definition](manifest-v2-1.md)
@z

@x
This second schema version has two primary goals. The first is to allow
multi-architecture images, through a "fat manifest" which references image
manifests for platform-specific versions of an image. The second is to
move the Docker engine towards content-addressable images, by supporting
an image model where the image's configuration can be hashed to generate
an ID for the image.
@y
This second schema version has two primary goals. The first is to allow
multi-architecture images, through a "fat manifest" which references image
manifests for platform-specific versions of an image. The second is to
move the Docker engine towards content-addressable images, by supporting
an image model where the image's configuration can be hashed to generate
an ID for the image.
@z

@x
# Media Types
@y
# Media Types
@z

@x
The following media types are used by the manifest formats described here, and
the resources they reference:
@y
The following media types are used by the manifest formats described here, and
the resources they reference:
@z

@x
- `application/vnd.docker.distribution.manifest.v1+json`: schema1 (existing manifest format)
- `application/vnd.docker.distribution.manifest.v2+json`: New image manifest format (schemaVersion = 2)
- `application/vnd.docker.distribution.manifest.list.v2+json`: Manifest list, aka "fat manifest"
- `application/vnd.docker.container.image.v1+json`: Container config JSON
- `application/vnd.docker.image.rootfs.diff.tar.gzip`: "Layer", as a gzipped tar
- `application/vnd.docker.image.rootfs.foreign.diff.tar.gzip`: "Layer", as a gzipped tar that should never be pushed
- `application/vnd.docker.plugin.v1+json`: Plugin config JSON
@y
- `application/vnd.docker.distribution.manifest.v1+json`: schema1 (existing manifest format)
- `application/vnd.docker.distribution.manifest.v2+json`: New image manifest format (schemaVersion = 2)
- `application/vnd.docker.distribution.manifest.list.v2+json`: Manifest list, aka "fat manifest"
- `application/vnd.docker.container.image.v1+json`: Container config JSON
- `application/vnd.docker.image.rootfs.diff.tar.gzip`: "Layer", as a gzipped tar
- `application/vnd.docker.image.rootfs.foreign.diff.tar.gzip`: "Layer", as a gzipped tar that should never be pushed
- `application/vnd.docker.plugin.v1+json`: Plugin config JSON
@z

@x
## Manifest List
@y
## Manifest List
@z

@x
The manifest list is the "fat manifest" which points to specific image manifests
for one or more platforms. Its use is optional, and relatively few images will
use one of these manifests. A client will distinguish a manifest list from an
image manifest based on the Content-Type returned in the HTTP response.
@y
The manifest list is the "fat manifest" which points to specific image manifests
for one or more platforms. Its use is optional, and relatively few images will
use one of these manifests. A client will distinguish a manifest list from an
image manifest based on the Content-Type returned in the HTTP response.
@z

@x
## *Manifest List* Field Descriptions
@y
## *Manifest List* Field Descriptions
@z

@x
- **`schemaVersion`** *int*
@y
- **`schemaVersion`** *int*
@z

@x
  This field specifies the image manifest schema version as an integer. This
  schema uses the version `2`.
@y
  This field specifies the image manifest schema version as an integer. This
  schema uses the version `2`.
@z

@x
- **`mediaType`** *string*
@y
- **`mediaType`** *string*
@z

@x
    The MIME type of the manifest list. This should be set to
    `application/vnd.docker.distribution.manifest.list.v2+json`.
@y
    The MIME type of the manifest list. This should be set to
    `application/vnd.docker.distribution.manifest.list.v2+json`.
@z

@x
- **`manifests`** *array*
@y
- **`manifests`** *array*
@z

@x
    The manifests field contains a list of manifests for specific platforms.
@y
    The manifests field contains a list of manifests for specific platforms.
@z

@x
    Fields of an object in the manifests list are:
@y
    Fields of an object in the manifests list are:
@z

@x
    - **`mediaType`** *string*
@y
    - **`mediaType`** *string*
@z

@x
        The MIME type of the referenced object. This will generally be
        `application/vnd.docker.distribution.manifest.v2+json`, but it could also
        be `application/vnd.docker.distribution.manifest.v1+json` if the manifest
        list references a legacy schema-1 manifest.
@y
        The MIME type of the referenced object. This will generally be
        `application/vnd.docker.distribution.manifest.v2+json`, but it could also
        be `application/vnd.docker.distribution.manifest.v1+json` if the manifest
        list references a legacy schema-1 manifest.
@z

@x
    - **`size`** *int*
@y
    - **`size`** *int*
@z

@x
        The size in bytes of the object. This field exists so that a client
        will have an expected size for the content before validating. If the
        length of the retrieved content does not match the specified length,
        the content should not be trusted.
@y
        The size in bytes of the object. This field exists so that a client
        will have an expected size for the content before validating. If the
        length of the retrieved content does not match the specified length,
        the content should not be trusted.
@z

@x
    - **`digest`** *string*
@y
    - **`digest`** *string*
@z

@x
        The digest of the content, as defined by the
        [Registry V2 HTTP API Specificiation](api.md#digest-parameter).
@y
        The digest of the content, as defined by the
        [Registry V2 HTTP API Specificiation](api.md#digest-parameter).
@z

@x
    - **`platform`** *object*
@y
    - **`platform`** *object*
@z

@x
        The platform object describes the platform which the image in the
        manifest runs on. A full list of valid operating system and architecture
        values are listed in the [Go language documentation for `$GOOS` and
        `$GOARCH`](https://golang.org/doc/install/source#environment)
@y
        The platform object describes the platform which the image in the
        manifest runs on. A full list of valid operating system and architecture
        values are listed in the [Go language documentation for `$GOOS` and
        `$GOARCH`](https://golang.org/doc/install/source#environment)
@z

@x
        - **`architecture`** *string*
@y
        - **`architecture`** *string*
@z

@x
            The architecture field specifies the CPU architecture, for example
            `amd64` or `ppc64le`.
@y
            The architecture field specifies the CPU architecture, for example
            `amd64` or `ppc64le`.
@z

@x
        - **`os`** *string*
@y
        - **`os`** *string*
@z

@x
            The os field specifies the operating system, for example
            `linux` or `windows`.
@y
            The os field specifies the operating system, for example
            `linux` or `windows`.
@z

@x
        - **`os.version`** *string*
@y
        - **`os.version`** *string*
@z

@x
            The optional os.version field specifies the operating system version,
            for example `10.0.10586`.
@y
            The optional os.version field specifies the operating system version,
            for example `10.0.10586`.
@z

@x
        - **`os.features`** *array*
@y
        - **`os.features`** *array*
@z

@x
            The optional os.features field specifies an array of strings,
            each listing a required OS feature (for example on Windows
            `win32k`).
@y
            The optional os.features field specifies an array of strings,
            each listing a required OS feature (for example on Windows
            `win32k`).
@z

@x
        - **`variant`** *string*
@y
        - **`variant`** *string*
@z

@x
            The optional variant field specifies a variant of the CPU, for
            example `armv6l` to specify a particular CPU variant of the ARM CPU.
@y
            The optional variant field specifies a variant of the CPU, for
            example `armv6l` to specify a particular CPU variant of the ARM CPU.
@z

@x
        - **`features`** *array*
@y
        - **`features`** *array*
@z

@x
            The optional features field specifies an array of strings, each
            listing a required CPU feature (for example `sse4` or `aes`).
@y
            The optional features field specifies an array of strings, each
            listing a required CPU feature (for example `sse4` or `aes`).
@z

@x
## Example Manifest List
@y
## Example Manifest List
@z

@x
*Example showing a simple manifest list pointing to image manifests for two platforms:*
```json
{
  "schemaVersion": 2,
  "mediaType": "application/vnd.docker.distribution.manifest.list.v2+json",
  "manifests": [
    {
      "mediaType": "application/vnd.docker.distribution.manifest.v2+json",
      "size": 7143,
      "digest": "sha256:e692418e4cbaf90ca69d05a66403747baa33ee08806650b51fab815ad7fc331f",
      "platform": {
        "architecture": "ppc64le",
        "os": "linux",
      }
    },
    {
      "mediaType": "application/vnd.docker.distribution.manifest.v2+json",
      "size": 7682,
      "digest": "sha256:5b0bcabd1ed22e9fb1310cf6c2dec7cdef19f0ad69efa1f392e94a4333501270",
      "platform": {
        "architecture": "amd64",
        "os": "linux",
        "features": [
          "sse4"
        ]
      }
    }
  ]
}
```
@y
*Example showing a simple manifest list pointing to image manifests for two platforms:*
```json
{
  "schemaVersion": 2,
  "mediaType": "application/vnd.docker.distribution.manifest.list.v2+json",
  "manifests": [
    {
      "mediaType": "application/vnd.docker.distribution.manifest.v2+json",
      "size": 7143,
      "digest": "sha256:e692418e4cbaf90ca69d05a66403747baa33ee08806650b51fab815ad7fc331f",
      "platform": {
        "architecture": "ppc64le",
        "os": "linux",
      }
    },
    {
      "mediaType": "application/vnd.docker.distribution.manifest.v2+json",
      "size": 7682,
      "digest": "sha256:5b0bcabd1ed22e9fb1310cf6c2dec7cdef19f0ad69efa1f392e94a4333501270",
      "platform": {
        "architecture": "amd64",
        "os": "linux",
        "features": [
          "sse4"
        ]
      }
    }
  ]
}
```
@z

@x
# Image Manifest
@y
# Image Manifest
@z

@x
The image manifest provides a configuration and a set of layers for a container
image. It's the direct replacement for the schema-1 manifest.
@y
The image manifest provides a configuration and a set of layers for a container
image. It's the direct replacement for the schema-1 manifest.
@z

@x
## *Image Manifest* Field Descriptions
@y
## *Image Manifest* Field Descriptions
@z

@x
- **`schemaVersion`** *int*
@y
- **`schemaVersion`** *int*
@z

@x
  This field specifies the image manifest schema version as an integer. This
  schema uses version `2`.
@y
  This field specifies the image manifest schema version as an integer. This
  schema uses version `2`.
@z

@x
- **`mediaType`** *string*
@y
- **`mediaType`** *string*
@z

@x
    The MIME type of the manifest. This should be set to
    `application/vnd.docker.distribution.manifest.v2+json`.
@y
    The MIME type of the manifest. This should be set to
    `application/vnd.docker.distribution.manifest.v2+json`.
@z

@x
- **`config`** *object*
@y
- **`config`** *object*
@z

@x
    The config field references a configuration object for a container, by
    digest. This configuration item is a JSON blob that the runtime uses
    to set up the container. This new schema uses a tweaked version
    of this configuration to allow image content-addressability on the
    daemon side.
@y
    The config field references a configuration object for a container, by
    digest. This configuration item is a JSON blob that the runtime uses
    to set up the container. This new schema uses a tweaked version
    of this configuration to allow image content-addressability on the
    daemon side.
@z

@x
    Fields of a config object are:
@y
    Fields of a config object are:
@z

@x
    - **`mediaType`** *string*
@y
    - **`mediaType`** *string*
@z

@x
        The MIME type of the referenced object. This should generally be
        `application/vnd.docker.container.image.v1+json`.
@y
        The MIME type of the referenced object. This should generally be
        `application/vnd.docker.container.image.v1+json`.
@z

@x
    - **`size`** *int*
@y
    - **`size`** *int*
@z

@x
        The size in bytes of the object. This field exists so that a client
        will have an expected size for the content before validating. If the
        length of the retrieved content does not match the specified length,
        the content should not be trusted.
@y
        The size in bytes of the object. This field exists so that a client
        will have an expected size for the content before validating. If the
        length of the retrieved content does not match the specified length,
        the content should not be trusted.
@z

@x
    - **`digest`** *string*
@y
    - **`digest`** *string*
@z

@x
        The digest of the content, as defined by the
        [Registry V2 HTTP API Specificiation](api.md#digest-parameter).
@y
        The digest of the content, as defined by the
        [Registry V2 HTTP API Specificiation](api.md#digest-parameter).
@z

@x
- **`layers`** *array*
@y
- **`layers`** *array*
@z

@x
    The layer list is ordered starting from the base image (opposite order of schema1).
@y
    The layer list is ordered starting from the base image (opposite order of schema1).
@z

@x
    Fields of an item in the layers list are:
@y
    Fields of an item in the layers list are:
@z

@x
    - **`mediaType`** *string*
@y
    - **`mediaType`** *string*
@z

@x
        The MIME type of the referenced object. This should
        generally be `application/vnd.docker.image.rootfs.diff.tar.gzip`.
        Layers of type
        `application/vnd.docker.image.rootfs.foreign.diff.tar.gzip` may be
        pulled from a remote location but they should never be pushed.
@y
        The MIME type of the referenced object. This should
        generally be `application/vnd.docker.image.rootfs.diff.tar.gzip`.
        Layers of type
        `application/vnd.docker.image.rootfs.foreign.diff.tar.gzip` may be
        pulled from a remote location but they should never be pushed.
@z

@x
    - **`size`** *int*
@y
    - **`size`** *int*
@z

@x
        The size in bytes of the object. This field exists so that a client
        will have an expected size for the content before validating. If the
        length of the retrieved content does not match the specified length,
        the content should not be trusted.
@y
        The size in bytes of the object. This field exists so that a client
        will have an expected size for the content before validating. If the
        length of the retrieved content does not match the specified length,
        the content should not be trusted.
@z

@x
    - **`digest`** *string*
@y
    - **`digest`** *string*
@z

@x
        The digest of the content, as defined by the
        [Registry V2 HTTP API Specificiation](api.md#digest-parameter).
@y
        The digest of the content, as defined by the
        [Registry V2 HTTP API Specificiation](api.md#digest-parameter).
@z

@x
    - **`urls`** *array*
@y
    - **`urls`** *array*
@z

@x
        Provides a list of URLs from which the content may be fetched. Content
        should be verified against the `digest` and `size`. This field is
        optional and uncommon.
@y
        Provides a list of URLs from which the content may be fetched. Content
        should be verified against the `digest` and `size`. This field is
        optional and uncommon.
@z

@x
## Example Image Manifest
@y
## Example Image Manifest
@z

@x
*Example showing an image manifest:*
```json
{
    "schemaVersion": 2,
    "mediaType": "application/vnd.docker.distribution.manifest.v2+json",
    "config": {
        "mediaType": "application/vnd.docker.container.image.v1+json",
        "size": 7023,
        "digest": "sha256:b5b2b2c507a0944348e0303114d8d93aaaa081732b86451d9bce1f432a537bc7"
    },
    "layers": [
        {
            "mediaType": "application/vnd.docker.image.rootfs.diff.tar.gzip",
            "size": 32654,
            "digest": "sha256:e692418e4cbaf90ca69d05a66403747baa33ee08806650b51fab815ad7fc331f"
        },
        {
            "mediaType": "application/vnd.docker.image.rootfs.diff.tar.gzip",
            "size": 16724,
            "digest": "sha256:3c3a4604a545cdc127456d94e421cd355bca5b528f4a9c1905b15da2eb4a4c6b"
        },
        {
            "mediaType": "application/vnd.docker.image.rootfs.diff.tar.gzip",
            "size": 73109,
            "digest": "sha256:ec4b8955958665577945c89419d1af06b5f7636b4ac3da7f12184802ad867736"
        }
    ]
}
```
@y
*Example showing an image manifest:*
```json
{
    "schemaVersion": 2,
    "mediaType": "application/vnd.docker.distribution.manifest.v2+json",
    "config": {
        "mediaType": "application/vnd.docker.container.image.v1+json",
        "size": 7023,
        "digest": "sha256:b5b2b2c507a0944348e0303114d8d93aaaa081732b86451d9bce1f432a537bc7"
    },
    "layers": [
        {
            "mediaType": "application/vnd.docker.image.rootfs.diff.tar.gzip",
            "size": 32654,
            "digest": "sha256:e692418e4cbaf90ca69d05a66403747baa33ee08806650b51fab815ad7fc331f"
        },
        {
            "mediaType": "application/vnd.docker.image.rootfs.diff.tar.gzip",
            "size": 16724,
            "digest": "sha256:3c3a4604a545cdc127456d94e421cd355bca5b528f4a9c1905b15da2eb4a4c6b"
        },
        {
            "mediaType": "application/vnd.docker.image.rootfs.diff.tar.gzip",
            "size": 73109,
            "digest": "sha256:ec4b8955958665577945c89419d1af06b5f7636b4ac3da7f12184802ad867736"
        }
    ]
}
```
@z

@x
# Backward compatibility
@y
# Backward compatibility
@z

@x
The registry will continue to accept uploads of manifests in both the old and
new formats.
@y
The registry will continue to accept uploads of manifests in both the old and
new formats.
@z

@x
When pushing images, clients which support the new manifest format should first
construct a manifest in the new format. If uploading this manifest fails,
presumably because the registry only supports the old format, the client may
fall back to uploading a manifest in the old format.
@y
When pushing images, clients which support the new manifest format should first
construct a manifest in the new format. If uploading this manifest fails,
presumably because the registry only supports the old format, the client may
fall back to uploading a manifest in the old format.
@z

@x
When pulling images, clients indicate support for this new version of the
manifest format by sending the
`application/vnd.docker.distribution.manifest.v2+json` and
`application/vnd.docker.distribution.manifest.list.v2+json` media types in an
`Accept` header when making a request to the `manifests` endpoint. Updated
clients should check the `Content-Type` header to see whether the manifest
returned from the endpoint is in the old format, or is an image manifest or
manifest list in the new format.
@y
When pulling images, clients indicate support for this new version of the
manifest format by sending the
`application/vnd.docker.distribution.manifest.v2+json` and
`application/vnd.docker.distribution.manifest.list.v2+json` media types in an
`Accept` header when making a request to the `manifests` endpoint. Updated
clients should check the `Content-Type` header to see whether the manifest
returned from the endpoint is in the old format, or is an image manifest or
manifest list in the new format.
@z

@x
If the manifest being requested uses the new format, and the appropriate media
type is not present in an `Accept` header, the registry will assume that the
client cannot handle the manifest as-is, and rewrite it on the fly into the old
format. If the object that would otherwise be returned is a manifest list, the
registry will look up the appropriate manifest for the amd64 platform and
linux OS, rewrite that manifest into the old format if necessary, and return
the result to the client. If no suitable manifest is found in the manifest
list, the registry will return a 404 error.
@y
If the manifest being requested uses the new format, and the appropriate media
type is not present in an `Accept` header, the registry will assume that the
client cannot handle the manifest as-is, and rewrite it on the fly into the old
format. If the object that would otherwise be returned is a manifest list, the
registry will look up the appropriate manifest for the amd64 platform and
linux OS, rewrite that manifest into the old format if necessary, and return
the result to the client. If no suitable manifest is found in the manifest
list, the registry will return a 404 error.
@z

@x
One of the challenges in rewriting manifests to the old format is that the old
format involves an image configuration for each layer in the manifest, but the
new format only provides one image configuration. To work around this, the
registry will create synthetic image configurations for all layers except the
top layer. These image configurations will not result in runnable images on
their own, but only serve to fill in the parent chain in a compatible way.
The IDs in these synthetic configurations will be derived from hashes of their
respective blobs. The registry will create these configurations and their IDs
using the same scheme as Docker 1.10 when it creates a legacy manifest to push
to a registry which doesn't support the new format.
@y
One of the challenges in rewriting manifests to the old format is that the old
format involves an image configuration for each layer in the manifest, but the
new format only provides one image configuration. To work around this, the
registry will create synthetic image configurations for all layers except the
top layer. These image configurations will not result in runnable images on
their own, but only serve to fill in the parent chain in a compatible way.
The IDs in these synthetic configurations will be derived from hashes of their
respective blobs. The registry will create these configurations and their IDs
using the same scheme as Docker 1.10 when it creates a legacy manifest to push
to a registry which doesn't support the new format.
@z
