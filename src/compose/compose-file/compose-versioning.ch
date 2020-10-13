%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Compose file reference
keywords: fig, composition, compose, versions, upgrading, docker
title: Compose file versions and upgrading
---
@y
---
description: Compose ファイルリファレンス
keywords: fig, composition, compose, versions, upgrading, docker
title: Compose ファイルのバージョンとアップグレード
---
@z

@x
The Compose file is a [YAML](https://yaml.org) file defining services,
networks, and volumes for a Docker application.
@y
{% comment %}
The Compose file is a [YAML](https://yaml.org) file defining services,
networks, and volumes for a Docker application.
{% endcomment %}
Compose ファイルは [YAML](https://yaml.org) 形式のファイルであり、Docker アプリケーションに対してサービス、ネットワーク、ボリュームを定義します。
@z

@x
The Compose file formats are now described in these references, specific to each version.
@y
{% comment %}
The Compose file formats are now described in these references, specific to each version.
{% endcomment %}
Compose ファイルのフォーマットは、各バージョンごとに以下のリファレンスに記述しています。
@z

@x
| **Reference file**                                    | **What changed in this version** |
|:------------------------------------------------------|:---------------------------------|
| [Version 3](index.md) (most current, and recommended) | [Version 3 updates](#version-3)  |
| [Version 2](compose-file-v2.md)                       | [Version 2 updates](#version-2)  |
| [Version 1](compose-file-v1.md)                       | [Version 1 updates](#version-1)  |
@y
{% comment %}
| **Reference file**                                    | **What changed in this version** |
|:------------------------------------------------------|:---------------------------------|
| [Version 3](index.md) (most current, and recommended) | [Version 3 updates](#version-3)  |
| [Version 2](compose-file-v2.md)                       | [Version 2 updates](#version-2)  |
| [Version 1](compose-file-v1.md)                       | [Version 1 updates](#version-1)  |
{% endcomment %}
| **リファレンスファイル**                        | **各バージョンでの変更点**           |
|:------------------------------------------------|:-------------------------------------|
| [バージョン 3](index.md) （最新版、利用を推奨） | [バージョン 3 での変更](#version-3)  |
| [バージョン 2](compose-file-v2.md)              | [バージョン 2 での変更](#version-2)  |
| [バージョン 1](compose-file-v1.md)              | [バージョン 1 での変更](#version-1)  |
@z

@x
The topics below explain the differences among the versions, Docker Engine
compatibility, and [how to upgrade](#upgrading).
@y
{% comment %}
The topics below explain the differences among the versions, Docker Engine
compatibility, and [how to upgrade](#upgrading).
{% endcomment %}
The topics below explain the differences among the versions, Docker Engine
compatibility, and [how to upgrade](#upgrading).
@z

@x
## Compatibility matrix
@y
{% comment %}
## Compatibility matrix
{% endcomment %}
## 互換マトリックス
{: #compatibility-matrix }
@z

@x
There are several versions of the Compose file format – 1, 2, 2.x, and 3.x
@y
{% comment %}
There are several versions of the Compose file format – 1, 2, 2.x, and 3.x
{% endcomment %}
There are several versions of the Compose file format – 1, 2, 2.x, and 3.x
@z

@x
{% include content/compose-matrix.md %}
@y
{% include content/compose-matrix.md %}
@z

@x
> Looking for more detail on Docker and Compose compatibility?
>
> We recommend keeping up-to-date with newer releases as much as possible.
However, if you are using an older version of Docker and want to determine which
Compose release is compatible, refer to the [Compose release
notes](https://github.com/docker/compose/releases/). Each set of release notes
gives details on which versions of Docker Engine are supported, along
with compatible Compose file format versions. (See also, the discussion in
[issue #3404](https://github.com/docker/docker.github.io/issues/3404).)
@y
{% comment %}
> Looking for more detail on Docker and Compose compatibility?
>
> We recommend keeping up-to-date with newer releases as much as possible.
However, if you are using an older version of Docker and want to determine which
Compose release is compatible, refer to the [Compose release
notes](https://github.com/docker/compose/releases/). Each set of release notes
gives details on which versions of Docker Engine are supported, along
with compatible Compose file format versions. (See also, the discussion in
[issue #3404](https://github.com/docker/docker.github.io/issues/3404).)
{% endcomment %}
> Looking for more detail on Docker and Compose compatibility?
>
> We recommend keeping up-to-date with newer releases as much as possible.
However, if you are using an older version of Docker and want to determine which
Compose release is compatible, refer to the [Compose release
notes](https://github.com/docker/compose/releases/). Each set of release notes
gives details on which versions of Docker Engine are supported, along
with compatible Compose file format versions. (See also, the discussion in
[issue #3404](https://github.com/docker/docker.github.io/issues/3404).)
@z

@x
For details on versions and how to upgrade, see
[Versioning](compose-versioning.md#versioning) and
[Upgrading](compose-versioning.md#upgrading).
@y
{% comment %}
For details on versions and how to upgrade, see
[Versioning](compose-versioning.md#versioning) and
[Upgrading](compose-versioning.md#upgrading).
{% endcomment %}
For details on versions and how to upgrade, see
[Versioning](compose-versioning.md#versioning) and
[Upgrading](compose-versioning.md#upgrading).
@z

@x
## Versioning
@y
{% comment %}
## Versioning
{% endcomment %}
## バージョンづけ
{: #versioning }
@z

@x
There are currently three versions of the Compose file format:
@y
{% comment %}
There are currently three versions of the Compose file format:
{% endcomment %}
Compose ファイルフォーマットには、現在のところ 3 つのバージョンがあります。
@z

@x
- Version 1, the legacy format. This is specified by
omitting a `version` key at the root of the YAML.
@y
{% comment %}
- Version 1, the legacy format. This is specified by
omitting a `version` key at the root of the YAML.
{% endcomment %}
- バージョン 1。 
  古いフォーマットです。
  YAML ファイルのルートにおいて `version` キーを省略することで指定されます。
@z

@x
- Version 2.x. This is specified with a `version: '2'` or `version: '2.1'`, etc., entry at the root of the YAML.
@y
{% comment %}
- Version 2.x. This is specified with a `version: '2'` or `version: '2.1'`, etc., entry at the root of the YAML.
{% endcomment %}
- バージョン 2.x。
  YAML ファイルのルートにおいて、`version: '2'` または `version: '2.1'` などのように記述することで指定されます。
@z

@x
- Version 3.x, the latest and recommended version, designed to
be cross-compatible between Compose and the Docker Engine's
[swarm mode](../../engine/swarm/index.md). This is specified with a `version: '3'` or `version: '3.1'`, etc., entry at the root of the YAML.
@y
{% comment %}
- Version 3.x, the latest and recommended version, designed to
be cross-compatible between Compose and the Docker Engine's
[swarm mode](../../engine/swarm/index.md). This is specified with a `version: '3'` or `version: '3.1'`, etc., entry at the root of the YAML.
{% endcomment %}
- Version 3.x, the latest and recommended version, designed to
be cross-compatible between Compose and the Docker Engine's
[swarm mode](../../engine/swarm/index.md). This is specified with a `version: '3'` or `version: '3.1'`, etc., entry at the root of the YAML.
@z

@x
> ### v2 and v3 Declaration
>
> **Note**: When specifying the Compose file version to use, make sure to
> specify both the _major_ and _minor_ numbers. If no minor version is given,
> `0` is used by default and not the latest minor version.
@y
{% comment %}
> ### v2 and v3 Declaration
>
> **Note**: When specifying the Compose file version to use, make sure to
> specify both the _major_ and _minor_ numbers. If no minor version is given,
> `0` is used by default and not the latest minor version.
{% endcomment %}
> ### v2 and v3 Declaration
>
> **Note**: When specifying the Compose file version to use, make sure to
> specify both the _major_ and _minor_ numbers. If no minor version is given,
> `0` is used by default and not the latest minor version.
@z

@x
The [Compatibility Matrix](#compatibility-matrix) shows Compose file versions mapped to Docker Engine releases.
@y
{% comment %}
The [Compatibility Matrix](#compatibility-matrix) shows Compose file versions mapped to Docker Engine releases.
{% endcomment %}
The [Compatibility Matrix](#compatibility-matrix) shows Compose file versions mapped to Docker Engine releases.
@z

@x
To move your project to a later version, see the [Upgrading](#upgrading)
section.
@y
{% comment %}
To move your project to a later version, see the [Upgrading](#upgrading)
section.
{% endcomment %}
To move your project to a later version, see the [Upgrading](#upgrading)
section.
@z

@x
> **Note**: If you're using
> [multiple Compose files](../extends.md#multiple-compose-files) or
> [extending services](../extends.md#extending-services), each file must be of the
> same version - you cannot, for example, mix version 1 and 2 in a single
> project.
@y
{% comment %}
> **Note**: If you're using
> [multiple Compose files](../extends.md#multiple-compose-files) or
> [extending services](../extends.md#extending-services), each file must be of the
> same version - you cannot, for example, mix version 1 and 2 in a single
> project.
{% endcomment %}
> **Note**: If you're using
> [multiple Compose files](../extends.md#multiple-compose-files) or
> [extending services](../extends.md#extending-services), each file must be of the
> same version - you cannot, for example, mix version 1 and 2 in a single
> project.
@z

@x
Several things differ depending on which version you use:
@y
{% comment %}
Several things differ depending on which version you use:
{% endcomment %}
Several things differ depending on which version you use:
@z

@x
- The structure and permitted configuration keys
- The minimum Docker Engine version you must be running
- Compose's behaviour with regards to networking
@y
{% comment %}
- The structure and permitted configuration keys
- The minimum Docker Engine version you must be running
- Compose's behaviour with regards to networking
{% endcomment %}
- The structure and permitted configuration keys
- The minimum Docker Engine version you must be running
- Compose's behaviour with regards to networking
@z

@x
These differences are explained below.
@y
{% comment %}
These differences are explained below.
{% endcomment %}
These differences are explained below.
@z

@x
### Version 1
@y
{% comment %}
### Version 1
{% endcomment %}
### バージョン 1
{: #version-1 }
@z

@x
Compose files that do not declare a version are considered "version 1". In those
files, all the [services](index.md#service-configuration-reference) are
declared at the root of the document.
@y
Compose files that do not declare a version are considered "version 1". In those
files, all the [services](index.md#service-configuration-reference) are
declared at the root of the document.
@z

@x
Version 1 is supported by **Compose up to 1.6.x**. It will be deprecated in a
future Compose release.
@y
Version 1 is supported by **Compose up to 1.6.x**. It will be deprecated in a
future Compose release.
@z

@x
Version 1 files cannot declare named
[volumes](index.md#volume-configuration-reference), [networks](index.md#network-configuration-reference) or
[build arguments](index.md#args).
@y
Version 1 files cannot declare named
[volumes](index.md#volume-configuration-reference), [networks](index.md#network-configuration-reference) or
[build arguments](index.md#args).
@z

@x
Compose does not take advantage of [networking](../networking.md) when you
use version 1: every container is placed on the default `bridge` network and is
reachable from every other container at its IP address. You need to use
[links](compose-file-v1.md#links) to enable discovery between containers.
@y
Compose does not take advantage of [networking](../networking.md) when you
use version 1: every container is placed on the default `bridge` network and is
reachable from every other container at its IP address. You need to use
[links](compose-file-v1.md#links) to enable discovery between containers.
@z

@x
Example:
@y
Example:
@z

@x
    web:
      build: .
      ports:
       - "5000:5000"
      volumes:
       - .:/code
      links:
       - redis
    redis:
      image: redis
@y
    web:
      build: .
      ports:
       - "5000:5000"
      volumes:
       - .:/code
      links:
       - redis
    redis:
      image: redis
@z

@x
### Version 2
@y
### Version 2
@z

@x
Compose files using the version 2 syntax must indicate the version number at
the root of the document. All [services](compose-file-v2.md#service-configuration-reference)
must be declared under the `services` key.
@y
Compose files using the version 2 syntax must indicate the version number at
the root of the document. All [services](compose-file-v2.md#service-configuration-reference)
must be declared under the `services` key.
@z

@x
Version 2 files are supported by **Compose 1.6.0+** and require a Docker Engine
of version **1.10.0+**.
@y
Version 2 files are supported by **Compose 1.6.0+** and require a Docker Engine
of version **1.10.0+**.
@z

@x
Named [volumes](compose-file-v2.md#volume-configuration-reference) can be declared under the
`volumes` key, and [networks](compose-file-v2.md#network-configuration-reference) can be declared
under the `networks` key.
@y
Named [volumes](compose-file-v2.md#volume-configuration-reference) can be declared under the
`volumes` key, and [networks](compose-file-v2.md#network-configuration-reference) can be declared
under the `networks` key.
@z

@x
By default, every container joins an application-wide default network, and is
discoverable at a hostname that's the same as the service name. This means
[links](compose-file-v2.md#links) are largely unnecessary. For more details, see
[Networking in Compose](../networking.md).
@y
By default, every container joins an application-wide default network, and is
discoverable at a hostname that's the same as the service name. This means
[links](compose-file-v2.md#links) are largely unnecessary. For more details, see
[Networking in Compose](../networking.md).
@z

@x
> **Note**: When specifying the Compose file version to use, make sure to
> specify both the _major_ and _minor_ numbers. If no minor version is given,
> `0` is used by default and not the latest minor version. As a result, features added in
> later versions will not be supported. For example:
>
> ```yaml
> version: "2"
> ```
> 
> is equivalent to:
> 
> ```yaml
> version: "2.0"
> ```
@y
> **Note**: When specifying the Compose file version to use, make sure to
> specify both the _major_ and _minor_ numbers. If no minor version is given,
> `0` is used by default and not the latest minor version. As a result, features added in
> later versions will not be supported. For example:
>
> ```yaml
> version: "2"
> ```
> 
> is equivalent to:
> 
> ```yaml
> version: "2.0"
> ```
@z

@x
Simple example:
@y
Simple example:
@z

@x
    version: "{{ site.compose_file_v2 }}"
    services:
      web:
        build: .
        ports:
         - "5000:5000"
        volumes:
         - .:/code
      redis:
        image: redis
@y
    version: "{{ site.compose_file_v2 }}"
    services:
      web:
        build: .
        ports:
         - "5000:5000"
        volumes:
         - .:/code
      redis:
        image: redis
@z

@x
A more extended example, defining volumes and networks:
@y
A more extended example, defining volumes and networks:
@z

@x
    version: "{{ site.compose_file_v2 }}"
    services:
      web:
        build: .
        ports:
         - "5000:5000"
        volumes:
         - .:/code
        networks:
          - front-tier
          - back-tier
      redis:
        image: redis
        volumes:
          - redis-data:/var/lib/redis
        networks:
          - back-tier
    volumes:
      redis-data:
        driver: local
    networks:
      front-tier:
        driver: bridge
      back-tier:
        driver: bridge
@y
    version: "{{ site.compose_file_v2 }}"
    services:
      web:
        build: .
        ports:
         - "5000:5000"
        volumes:
         - .:/code
        networks:
          - front-tier
          - back-tier
      redis:
        image: redis
        volumes:
          - redis-data:/var/lib/redis
        networks:
          - back-tier
    volumes:
      redis-data:
        driver: local
    networks:
      front-tier:
        driver: bridge
      back-tier:
        driver: bridge
@z

@x
Several other options were added to support networking, such as:
@y
Several other options were added to support networking, such as:
@z

@x
* [`aliases`](compose-file-v2.md#aliases)
@y
* [`aliases`](compose-file-v2.md#aliases)
@z

@x
* The [`depends_on`](compose-file-v2.md#depends_on) option can be used in place of links to indicate dependencies
between services and startup order.
@y
* The [`depends_on`](compose-file-v2.md#depends_on) option can be used in place of links to indicate dependencies
between services and startup order.
@z

@x
      version: "{{ site.compose_file_v2 }}"
      services:
        web:
          build: .
          depends_on:
            - db
            - redis
        redis:
          image: redis
        db:
          image: postgres
@y
      version: "{{ site.compose_file_v2 }}"
      services:
        web:
          build: .
          depends_on:
            - db
            - redis
        redis:
          image: redis
        db:
          image: postgres
@z

@x
* [`ipv4_address`, `ipv6_address`](compose-file-v2.md#ipv4address-ipv6address)
@y
* [`ipv4_address`, `ipv6_address`](compose-file-v2.md#ipv4address-ipv6address)
@z

@x
[Variable substitution](compose-file-v2.md#variable-substitution) also was added in Version 2.
@y
[Variable substitution](compose-file-v2.md#variable-substitution) also was added in Version 2.
@z

@x
### Version 2.1
@y
### Version 2.1
@z

@x
An upgrade of [version 2](#version-2) that introduces new parameters only
available with Docker Engine version **1.12.0+**. Version 2.1 files are
supported by **Compose 1.9.0+**.
@y
An upgrade of [version 2](#version-2) that introduces new parameters only
available with Docker Engine version **1.12.0+**. Version 2.1 files are
supported by **Compose 1.9.0+**.
@z

@x
Introduces the following additional parameters:
@y
Introduces the following additional parameters:
@z

@x
- [`link_local_ips`](compose-file-v2.md#link_local_ips)
- [`isolation`](compose-file-v2.md#isolation) in build configurations and
  service definitions
- `labels` for [volumes](compose-file-v2.md#volume-configuration-reference),
  [networks](compose-file-v2.md#network-configuration-reference), and
  [build](index.md#build)
- `name` for [volumes](compose-file-v2.md#volume-configuration-reference)
- [`userns_mode`](compose-file-v2.md#userns_mode)
- [`healthcheck`](compose-file-v2.md#healthcheck)
- [`sysctls`](compose-file-v2.md#sysctls)
- [`pids_limit`](compose-file-v2.md#pids_limit)
- [`oom_kill_disable`](compose-file-v2.md#cpu-and-other-resources)
- [`cpu_period`](compose-file-v2.md#cpu-and-other-resources)
@y
- [`link_local_ips`](compose-file-v2.md#link_local_ips)
- [`isolation`](compose-file-v2.md#isolation) in build configurations and
  service definitions
- `labels` for [volumes](compose-file-v2.md#volume-configuration-reference),
  [networks](compose-file-v2.md#network-configuration-reference), and
  [build](index.md#build)
- `name` for [volumes](compose-file-v2.md#volume-configuration-reference)
- [`userns_mode`](compose-file-v2.md#userns_mode)
- [`healthcheck`](compose-file-v2.md#healthcheck)
- [`sysctls`](compose-file-v2.md#sysctls)
- [`pids_limit`](compose-file-v2.md#pids_limit)
- [`oom_kill_disable`](compose-file-v2.md#cpu-and-other-resources)
- [`cpu_period`](compose-file-v2.md#cpu-and-other-resources)
@z

@x
### Version 2.2
@y
### Version 2.2
@z

@x
An upgrade of [version 2.1](#version-21) that introduces new parameters only
available with Docker Engine version **1.13.0+**.  Version 2.2 files are
supported by **Compose 1.13.0+**. This version also allows you to specify
default scale numbers inside the service's configuration.
@y
An upgrade of [version 2.1](#version-21) that introduces new parameters only
available with Docker Engine version **1.13.0+**.  Version 2.2 files are
supported by **Compose 1.13.0+**. This version also allows you to specify
default scale numbers inside the service's configuration.
@z

@x
Introduces the following additional parameters:
@y
Introduces the following additional parameters:
@z

@x
- [`init`](compose-file-v2.md#init)
- [`scale`](compose-file-v2.md#scale)
- [`cpu_rt_runtime` and `cpu_rt_period`](compose-file-v2.md#cpu_rt_runtime-cpu_rt_period)
- [`network`](compose-file-v2.md#network) for [build configurations](compose-file-v2.md#build)
@y
- [`init`](compose-file-v2.md#init)
- [`scale`](compose-file-v2.md#scale)
- [`cpu_rt_runtime` and `cpu_rt_period`](compose-file-v2.md#cpu_rt_runtime-cpu_rt_period)
- [`network`](compose-file-v2.md#network) for [build configurations](compose-file-v2.md#build)
@z

@x
### Version 2.3
@y
### Version 2.3
@z

@x
An upgrade of [version 2.2](#version-22) that introduces new parameters only
available with Docker Engine version **17.06.0+**. Version 2.3 files are
supported by **Compose 1.16.0+**.
@y
An upgrade of [version 2.2](#version-22) that introduces new parameters only
available with Docker Engine version **17.06.0+**. Version 2.3 files are
supported by **Compose 1.16.0+**.
@z

@x
Introduces the following additional parameters:
@y
Introduces the following additional parameters:
@z

@x
- [`target`](compose-file-v2.md#target), [`extra_hosts`](compose-file-v2.md#extra_hosts-1) and
  [`shm_size`](compose-file-v2.md#shmsize) for [build configurations](compose-file-v2.md#build)
- `start_period` for [`healthchecks`](compose-file-v2.md#healthcheck)
- ["Long syntax" for volumes](compose-file-v2.md#long-syntax)
- [`runtime`](compose-file-v2.md#runtime) for service definitions
- [`device_cgroup_rules`](compose-file-v2.md#device_cgroup_rules)
@y
- [`target`](compose-file-v2.md#target), [`extra_hosts`](compose-file-v2.md#extra_hosts-1) and
  [`shm_size`](compose-file-v2.md#shmsize) for [build configurations](compose-file-v2.md#build)
- `start_period` for [`healthchecks`](compose-file-v2.md#healthcheck)
- ["Long syntax" for volumes](compose-file-v2.md#long-syntax)
- [`runtime`](compose-file-v2.md#runtime) for service definitions
- [`device_cgroup_rules`](compose-file-v2.md#device_cgroup_rules)
@z

@x
### Version 2.4
@y
{% comment %}
### Version 2.4
{% endcomment %}
### バージョン 2.4
@z

@x
An upgrade of [version 2.3](#version-23) that introduces new parameters only
available with Docker Engine version **17.12.0+**. Version 2.4 files are
supported by **Compose 1.21.0+**.
@y
An upgrade of [version 2.3](#version-23) that introduces new parameters only
available with Docker Engine version **17.12.0+**. Version 2.4 files are
supported by **Compose 1.21.0+**.
@z

@x
Introduces the following additional parameters:
@y
{% comment %}
Introduces the following additional parameters:
{% endcomment %}
以下のパラメーターが追加されました。
@z

@x
- [`platform`](compose-file-v2.md#platform) for service definitions
- Support for extension fields at the root of service, network, and volume
  definitions
@y
{% comment %}
- [`platform`](compose-file-v2.md#platform) for service definitions
- Support for extension fields at the root of service, network, and volume
  definitions
{% endcomment %}
- サービス定義における [`platform`](compose-file-v2.md#platform)
- Support for extension fields at the root of service, network, and volume
  definitions
@z

@x
### Version 3
@y
{% comment %}
### Version 3
{% endcomment %}
### バージョン 3
@z

@x
Designed to be cross-compatible between Compose and the Docker Engine's
[swarm mode](/engine/swarm/), version 3 removes several options and adds
several more.
@y
Designed to be cross-compatible between Compose and the Docker Engine's
[swarm mode](/engine/swarm/), version 3 removes several options and adds
several more.
@z

@x
- Removed: `volume_driver`, `volumes_from`, `cpu_shares`, `cpu_quota`,
`cpuset`, `mem_limit`, `memswap_limit`, `extends`, `group_add`. See
the [upgrading](#upgrading) guide for how to migrate away from these.
(For more information on `extends`, see [Extending services](../extends.md#extending-services).)
@y
- Removed: `volume_driver`, `volumes_from`, `cpu_shares`, `cpu_quota`,
`cpuset`, `mem_limit`, `memswap_limit`, `extends`, `group_add`. See
the [upgrading](#upgrading) guide for how to migrate away from these.
(For more information on `extends`, see [Extending services](../extends.md#extending-services).)
@z

@x
- Added: [deploy](index.md#deploy)
@y
- Added: [deploy](index.md#deploy)
@z

@x
> **Note**: When specifying the Compose file version to use, make sure to
> specify both the _major_ and _minor_ numbers. If no minor version is given,
> `0` is used by default and not the latest minor version. As a result, features added in
> later versions will not be supported. For example:
>
> ```yaml
> version: "3"
> ```
> 
> is equivalent to:
> 
> ```yaml
> version: "3.0"
> ```
@y
> **Note**: When specifying the Compose file version to use, make sure to
> specify both the _major_ and _minor_ numbers. If no minor version is given,
> `0` is used by default and not the latest minor version. As a result, features added in
> later versions will not be supported. For example:
>
> ```yaml
> version: "3"
> ```
> 
> is equivalent to:
> 
> ```yaml
> version: "3.0"
> ```
@z

@x
### Version 3.1
@y
### Version 3.1
@z

@x
An upgrade of [version 3](#version-3) that introduces new parameters only
available with Docker Engine version **1.13.1+**, and higher.
@y
An upgrade of [version 3](#version-3) that introduces new parameters only
available with Docker Engine version **1.13.1+**, and higher.
@z

@x
Introduces the following additional parameters:
@y
Introduces the following additional parameters:
@z

@x
- [`secrets`](index.md#secrets)
@y
- [`secrets`](index.md#secrets)
@z

@x
### Version 3.2
@y
### Version 3.2
@z

@x
An upgrade of [version 3](#version-3) that introduces new parameters only
available with Docker Engine version **17.04.0+**, and higher.
@y
An upgrade of [version 3](#version-3) that introduces new parameters only
available with Docker Engine version **17.04.0+**, and higher.
@z

@x
Introduces the following additional parameters:
@y
Introduces the following additional parameters:
@z

@x
- [`cache_from`](index.md#cache_from) in [build configurations](index.md#build)
- Long syntax for [ports](index.md#ports) and [volume mounts](index.md#volumes)
- [`attachable`](index.md#attachable) network driver option
- [deploy `endpoint_mode`](index.md#endpoint_mode)
- [deploy placement `preference`](index.md#placement)
@y
- [`cache_from`](index.md#cache_from) in [build configurations](index.md#build)
- Long syntax for [ports](index.md#ports) and [volume mounts](index.md#volumes)
- [`attachable`](index.md#attachable) network driver option
- [deploy `endpoint_mode`](index.md#endpoint_mode)
- [deploy placement `preference`](index.md#placement)
@z

@x
### Version 3.3
@y
### Version 3.3
@z

@x
An upgrade of [version 3](#version-3) that introduces new parameters only
available with Docker Engine version **17.06.0+**, and higher.
@y
An upgrade of [version 3](#version-3) that introduces new parameters only
available with Docker Engine version **17.06.0+**, and higher.
@z

@x
Introduces the following additional parameters:
@y
Introduces the following additional parameters:
@z

@x
- [build `labels`](index.md#build)
- [`credential_spec`](index.md#credential_spec)
- [`configs`](index.md#configs)
@y
- [build `labels`](index.md#build)
- [`credential_spec`](index.md#credential_spec)
- [`configs`](index.md#configs)
@z

@x
### Version 3.4
@y
### Version 3.4
@z

@x
An upgrade of [version 3](#version-3) that introduces new parameters. It is
only available with Docker Engine version **17.09.0** and higher.
@y
An upgrade of [version 3](#version-3) that introduces new parameters. It is
only available with Docker Engine version **17.09.0** and higher.
@z

@x
Introduces the following additional parameters:
@y
Introduces the following additional parameters:
@z

@x
- [`target`](index.md#target) and [`network`](index.md#network) in
  [build configurations](index.md#build)
- `start_period` for [`healthchecks`](index.md#healthcheck)
- `order` for [update configurations](index.md#update_config)
- `name` for [volumes](index.md#volume-configuration-reference)
@y
- [`target`](index.md#target) and [`network`](index.md#network) in
  [build configurations](index.md#build)
- `start_period` for [`healthchecks`](index.md#healthcheck)
- `order` for [update configurations](index.md#update_config)
- `name` for [volumes](index.md#volume-configuration-reference)
@z

@x
### Version 3.5
@y
### Version 3.5
@z

@x
An upgrade of [version 3](#version-3) that introduces new parameters. It is
only available with Docker Engine version **17.12.0** and higher.
@y
An upgrade of [version 3](#version-3) that introduces new parameters. It is
only available with Docker Engine version **17.12.0** and higher.
@z

@x
Introduces the following additional parameters:
@y
Introduces the following additional parameters:
@z

@x
- [`isolation`](index.md#isolation) in service definitions
- `name` for networks, secrets and configs
- `shm_size` in [build configurations](index.md#build)
@y
- [`isolation`](index.md#isolation) in service definitions
- `name` for networks, secrets and configs
- `shm_size` in [build configurations](index.md#build)
@z

@x
### Version 3.6
@y
### Version 3.6
@z

@x
An upgrade of [version 3](#version-3) that introduces new parameters. It is
only available with Docker Engine version **18.02.0** and higher.
@y
An upgrade of [version 3](#version-3) that introduces new parameters. It is
only available with Docker Engine version **18.02.0** and higher.
@z

@x
Introduces the following additional parameters:
@y
Introduces the following additional parameters:
@z

@x
- [`tmpfs` size](index.md#long-syntax-3) for `tmpfs`-type mounts
@y
- [`tmpfs` size](index.md#long-syntax-3) for `tmpfs`-type mounts
@z

@x
### Version 3.7
@y
### Version 3.7
@z

@x
An upgrade of [version 3](#version-3) that introduces new parameters. It is
only available with Docker Engine version **18.06.0** and higher.
@y
An upgrade of [version 3](#version-3) that introduces new parameters. It is
only available with Docker Engine version **18.06.0** and higher.
@z

@x
Introduces the following additional parameters:
@y
Introduces the following additional parameters:
@z

@x
- [`init`](index.md#init) in service definitions
- [`rollback_config`](index.md#rollback_config) in deploy configurations
- Support for extension fields at the root of service, network, volume, secret
  and config definitions
@y
- [`init`](index.md#init) in service definitions
- [`rollback_config`](index.md#rollback_config) in deploy configurations
- Support for extension fields at the root of service, network, volume, secret
  and config definitions
@z

@x
### Version 3.8
@y
### Version 3.8
@z

@x
An upgrade of [version 3](#version-3) that introduces new parameters. It is
only available with Docker Engine version **19.03.0** and higher.
@y
An upgrade of [version 3](#version-3) that introduces new parameters. It is
only available with Docker Engine version **19.03.0** and higher.
@z

@x
Introduces the following additional parameters:
@y
Introduces the following additional parameters:
@z

@x
- [`max_replicas_per_node`](index.md#max_replicas_per_node) in placement
  configurations
- `template_driver` option for [config](index.md#configs-configuration-reference)
   and [secret](index.md#secrets-configuration-reference) configurations. This
   option is only supported when deploying swarm services using
   `docker stack deploy`.
- `driver` and `driver_opts` option for [secret](index.md#secrets-configuration-reference)
   configurations. This option is only supported when deploying swarm services
   using `docker stack deploy`.
@y
- [`max_replicas_per_node`](index.md#max_replicas_per_node) in placement
  configurations
- `template_driver` option for [config](index.md#configs-configuration-reference)
   and [secret](index.md#secrets-configuration-reference) configurations. This
   option is only supported when deploying swarm services using
   `docker stack deploy`.
- `driver` and `driver_opts` option for [secret](index.md#secrets-configuration-reference)
   configurations. This option is only supported when deploying swarm services
   using `docker stack deploy`.
@z

@x
## Upgrading
@y
## Upgrading
@z

@x
### Version 2.x to 3.x
@y
### Version 2.x to 3.x
@z

@x
Between versions 2.x and 3.x, the structure of the Compose file is the same, but
several options have been removed:
@y
Between versions 2.x and 3.x, the structure of the Compose file is the same, but
several options have been removed:
@z

@x
-   `volume_driver`: Instead of setting the volume driver on the service, define
    a volume using the
    [top-level `volumes` option](index.md#volume-configuration-reference)
    and specify the driver there.
@y
-   `volume_driver`: Instead of setting the volume driver on the service, define
    a volume using the
    [top-level `volumes` option](index.md#volume-configuration-reference)
    and specify the driver there.
@z

@x
        version: "{{ site.compose_file_v3 }}"
        services:
          db:
            image: postgres
            volumes:
              - data:/var/lib/postgresql/data
        volumes:
          data:
            driver: mydriver
@y
        version: "{{ site.compose_file_v3 }}"
        services:
          db:
            image: postgres
            volumes:
              - data:/var/lib/postgresql/data
        volumes:
          data:
            driver: mydriver
@z

@x
-   `volumes_from`: To share a volume between services, define it using the
    [top-level `volumes` option](index.md#volume-configuration-reference)
    and reference it from each service that shares it using the
    [service-level `volumes` option](index.md#driver).
@y
-   `volumes_from`: To share a volume between services, define it using the
    [top-level `volumes` option](index.md#volume-configuration-reference)
    and reference it from each service that shares it using the
    [service-level `volumes` option](index.md#driver).
@z

@x
-   `cpu_shares`, `cpu_quota`, `cpuset`, `mem_limit`, `memswap_limit`: These
    have been replaced by the [resources](index.md#resources) key under
    `deploy`. `deploy` configuration only takes effect when using
    `docker stack deploy`, and is ignored by `docker-compose`.
@y
-   `cpu_shares`, `cpu_quota`, `cpuset`, `mem_limit`, `memswap_limit`: These
    have been replaced by the [resources](index.md#resources) key under
    `deploy`. `deploy` configuration only takes effect when using
    `docker stack deploy`, and is ignored by `docker-compose`.
@z

@x
-   `extends`: This option has been removed for `version: "3.x"`
Compose files. (For more information, see [Extending services](../extends.md#extending-services).)
-   `group_add`: This option has been removed for `version: "3.x"` Compose files.
-   `pids_limit`: This option has not been introduced in `version: "3.x"` Compose files.
-   `link_local_ips` in `networks`: This option has not been introduced in
    `version: "3.x"` Compose files.
@y
-   `extends`: This option has been removed for `version: "3.x"`
Compose files. (For more information, see [Extending services](../extends.md#extending-services).)
-   `group_add`: This option has been removed for `version: "3.x"` Compose files.
-   `pids_limit`: This option has not been introduced in `version: "3.x"` Compose files.
-   `link_local_ips` in `networks`: This option has not been introduced in
    `version: "3.x"` Compose files.
@z

@x
### Version 1 to 2.x
@y
### Version 1 to 2.x
@z

@x
In the majority of cases, moving from version 1 to 2 is a very simple process:
@y
In the majority of cases, moving from version 1 to 2 is a very simple process:
@z

@x
1. Indent the whole file by one level and put a `services:` key at the top.
2. Add a `version: '2'` line at the top of the file.
@y
1. Indent the whole file by one level and put a `services:` key at the top.
2. Add a `version: '2'` line at the top of the file.
@z

@x
It's more complicated if you're using particular configuration features:
@y
It's more complicated if you're using particular configuration features:
@z

@x
-   `dockerfile`: This now lives under the `build` key:
@y
-   `dockerfile`: This now lives under the `build` key:
@z

@x
        build:
          context: .
          dockerfile: Dockerfile-alternate
@y
        build:
          context: .
          dockerfile: Dockerfile-alternate
@z

@x
-   `log_driver`, `log_opt`: These now live under the `logging` key:
@y
-   `log_driver`, `log_opt`: These now live under the `logging` key:
@z

@x
        logging:
          driver: syslog
          options:
            syslog-address: "tcp://192.168.0.42:123"
@y
        logging:
          driver: syslog
          options:
            syslog-address: "tcp://192.168.0.42:123"
@z

@x
-   `links` with environment variables: environment variables created by
    links, such as `CONTAINERNAME_PORT`, ` have been deprecated for some time. In the new Docker network system,
    they have been removed. You should either connect directly to the
    appropriate hostname or set the relevant environment variable yourself,
    using the link hostname:
@y
-   `links` with environment variables: environment variables created by
    links, such as `CONTAINERNAME_PORT`, ` have been deprecated for some time. In the new Docker network system,
    they have been removed. You should either connect directly to the
    appropriate hostname or set the relevant environment variable yourself,
    using the link hostname:
@z

@x
        web:
          links:
            - db
          environment:
            - DB_PORT=tcp://db:5432
@y
        web:
          links:
            - db
          environment:
            - DB_PORT=tcp://db:5432
@z

@x
-   `external_links`: Compose uses Docker networks when running version 2
    projects, so links behave slightly differently. In particular, two
    containers must be connected to at least one network in common in order to
    communicate, even if explicitly linked together.
@y
-   `external_links`: Compose uses Docker networks when running version 2
    projects, so links behave slightly differently. In particular, two
    containers must be connected to at least one network in common in order to
    communicate, even if explicitly linked together.
@z

@x
    Either connect the external container to your app's
    [default network](../networking.md), or connect both the external container and
    your service's containers to an
    [external network](../networking.md#use-a-pre-existing-network).
@y
    Either connect the external container to your app's
    [default network](../networking.md), or connect both the external container and
    your service's containers to an
    [external network](../networking.md#use-a-pre-existing-network).
@z

@x
-   `net`: This is now replaced by [network_mode](index.md#network_mode):
@y
-   `net`: This is now replaced by [network_mode](index.md#network_mode):
@z

@x
        net: host    ->  network_mode: host
        net: bridge  ->  network_mode: bridge
        net: none    ->  network_mode: none
@y
        net: host    ->  network_mode: host
        net: bridge  ->  network_mode: bridge
        net: none    ->  network_mode: none
@z

@x
    If you're using `net: "container:[service name]"`, you must now use
    `network_mode: "service:[service name]"` instead.
@y
    If you're using `net: "container:[service name]"`, you must now use
    `network_mode: "service:[service name]"` instead.
@z

@x
        net: "container:web"  ->  network_mode: "service:web"
@y
        net: "container:web"  ->  network_mode: "service:web"
@z

@x
    If you're using `net: "container:[container name/id]"`, the value does not
    need to change.
@y
    If you're using `net: "container:[container name/id]"`, the value does not
    need to change.
@z

@x
        net: "container:cont-name"  ->  network_mode: "container:cont-name"
        net: "container:abc12345"   ->  network_mode: "container:abc12345"
@y
        net: "container:cont-name"  ->  network_mode: "container:cont-name"
        net: "container:abc12345"   ->  network_mode: "container:abc12345"
@z

@x
-   `volumes` with named volumes: these must now be explicitly declared in a
    top-level `volumes` section of your Compose file. If a service mounts a
    named volume called `data`, you must declare a `data` volume in your
    top-level `volumes` section. The whole file might look like this:
@y
-   `volumes` with named volumes: these must now be explicitly declared in a
    top-level `volumes` section of your Compose file. If a service mounts a
    named volume called `data`, you must declare a `data` volume in your
    top-level `volumes` section. The whole file might look like this:
@z

@x
        version: "{{ site.compose_file_v2 }}"
        services:
          db:
            image: postgres
            volumes:
              - data:/var/lib/postgresql/data
        volumes:
          data: {}
@y
        version: "{{ site.compose_file_v2 }}"
        services:
          db:
            image: postgres
            volumes:
              - data:/var/lib/postgresql/data
        volumes:
          data: {}
@z

@x
    By default, Compose creates a volume whose name is prefixed with your
    project name. If you want it to just be called `data`, declare it as
    external:
@y
    By default, Compose creates a volume whose name is prefixed with your
    project name. If you want it to just be called `data`, declare it as
    external:
@z

@x
        volumes:
          data:
            external: true
@y
        volumes:
          data:
            external: true
@z

@x
## Compatibility mode
@y
## Compatibility mode
@z

@x
`docker-compose` 1.20.0 introduces a new `--compatibility` flag designed to
help developers transition to version 3 more easily. When enabled,
`docker-compose` reads the `deploy` section of each service's definition and
attempts to translate it into the equivalent version 2 parameter. Currently,
the following deploy keys are translated:
@y
`docker-compose` 1.20.0 introduces a new `--compatibility` flag designed to
help developers transition to version 3 more easily. When enabled,
`docker-compose` reads the `deploy` section of each service's definition and
attempts to translate it into the equivalent version 2 parameter. Currently,
the following deploy keys are translated:
@z

@x
- [resources](index.md#resources) limits and memory reservations
- [replicas](index.md#replicas)
- [restart_policy](index.md#restart_policy) `condition` and `max_attempts`
@y
- [resources](index.md#resources) limits and memory reservations
- [replicas](index.md#replicas)
- [restart_policy](index.md#restart_policy) `condition` and `max_attempts`
@z

@x
All other keys are ignored and produce a warning if present. You can review
the configuration that will be used to deploy by using the `--compatibility`
flag with the `config` command.
@y
All other keys are ignored and produce a warning if present. You can review
the configuration that will be used to deploy by using the `--compatibility`
flag with the `config` command.
@z

@x
> Do not use this in production!
>
> We recommend against using `--compatibility` mode in production. Because the
> resulting configuration is only an approximate using non-Swarm mode
> properties, it may produce unexpected results.
@y
> Do not use this in production!
>
> We recommend against using `--compatibility` mode in production. Because the
> resulting configuration is only an approximate using non-Swarm mode
> properties, it may produce unexpected results.
@z

@x
## Compose file format references
@y
## Compose file format references
@z

@x
- [Compose file version 3](index.md)
- [Compose file version 2](compose-file-v2.md)
- [Compose file version 1](compose-file-v1.md)
@y
- [Compose file version 3](index.md)
- [Compose file version 2](compose-file-v2.md)
- [Compose file version 1](compose-file-v1.md)
@z
