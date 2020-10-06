%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
aliases: ["/engine/misc/deprecated/"]
description: "Deprecated Features."
keywords: "docker, documentation, about, technology, deprecate"
---
@y
---
title: 廃止となった Engine 機能
aliases: ["/engine/misc/deprecated/"]
description: "Deprecated Features."
keywords: "docker, documentation, about, technology, deprecate"
---
@z

@x
<!-- This file is maintained within the docker/cli GitHub
     repository at https://github.com/docker/cli/. Make all
     pull requests against that repo. If you see this file in
     another repository, consider it read-only there, as it will
     periodically be overwritten by the definitive file. Pull
     requests which include edits to this file in other repositories
     will be rejected.
-->
@y
<!-- This file is maintained within the docker/cli GitHub
     repository at https://github.com/docker/cli/. Make all
     pull requests against that repo. If you see this file in
     another repository, consider it read-only there, as it will
     periodically be overwritten by the definitive file. Pull
     requests which include edits to this file in other repositories
     will be rejected.
-->
@z

@x 日本語訳では、title追加を独自に行ったため、以下を削除
# Deprecated Engine Features
@y
{% comment %}
# Deprecated Engine Features
{% endcomment %}
@z

@x
The following list of features are deprecated in Engine.
To learn more about Docker Engine's deprecation policy,
see [Feature Deprecation Policy](https://docs.docker.com/engine/#feature-deprecation-policy).
@y
{% comment %}
The following list of features are deprecated in Engine.
To learn more about Docker Engine's deprecation policy,
see [Feature Deprecation Policy](https://docs.docker.com/engine/#feature-deprecation-policy).
{% endcomment %}
以下に示す機能一覧は Engine において廃止決定されたものです。
Docker Engine における廃止決定ポリシーについては [廃止決定に関するポリシー]({{ site.baseurl }}/engine/#feature-deprecation-policy) を参照してください。
@z

@x
### Pushing and pulling with image manifest v2 schema 1
@y
{% comment %}
### Pushing and pulling with image manifest v2 schema 1
{% endcomment %}
{: #pushing-and-pulling-with-image-manifest-v2-schema-1 }
### イメージプッシュとプルに関するマニフェスト v2 スキーム 1
@z

@x
**Deprecated in Release: v19.03.0**
@y
{% comment %}
**Deprecated in Release: v19.03.0**
{% endcomment %}
**廃止決定されたリリース: v19.03.0**
@z

@x
**Target For Removal In Release: v19.09.0**
@y
{% comment %}
**Target For Removal In Release: v19.09.0**
{% endcomment %}
**削除対象とされたリリース: v19.09.0**
@z

@x
The image manifest
[v2 schema 1](https://github.com/docker/distribution/blob/fda42e5ef908bdba722d435ff1f330d40dfcd56c/docs/spec/manifest-v2-1.md)
format is deprecated in favor of the
[v2 schema 2](https://github.com/docker/distribution/blob/fda42e5ef908bdba722d435ff1f330d40dfcd56c/docs/spec/manifest-v2-2.md) format.
@y
{% comment %}
The image manifest
[v2 schema 1](https://github.com/docker/distribution/blob/fda42e5ef908bdba722d435ff1f330d40dfcd56c/docs/spec/manifest-v2-1.md)
format is deprecated in favor of the
[v2 schema 2](https://github.com/docker/distribution/blob/fda42e5ef908bdba722d435ff1f330d40dfcd56c/docs/spec/manifest-v2-2.md) format.
{% endcomment %}
イメージマニフェスト [v2 スキーム 1](https://github.com/docker/distribution/blob/fda42e5ef908bdba722d435ff1f330d40dfcd56c/docs/spec/manifest-v2-1.md) フォーマットは廃止決定され、[v2 スキーム 2](https://github.com/docker/distribution/blob/fda42e5ef908bdba722d435ff1f330d40dfcd56c/docs/spec/manifest-v2-2.md) フォーマットに変わります。
@z

@x
If the registry you are using still supports v2 schema 1, urge their administrators to move to v2 schema 2.
@y
{% comment %}
If the registry you are using still supports v2 schema 1, urge their administrators to move to v2 schema 2.
{% endcomment %}
利用中のレジストリが v2 スキーマ 1 対応の場合は、v2 スキーマ 2 への移行を管理者へ伝えてください。
@z

@x
### Legacy "overlay" storage driver
@y
{% comment %}
### Legacy "overlay" storage driver
{% endcomment %}
{: #legacy-overlay-storage-driver }
### 古い「overlay」ストレージドライバー
@z

@x
**Deprecated in Release: v18.09.0**
@y
{% comment %}
**Deprecated in Release: v18.09.0**
{% endcomment %}
**廃止決定されたリリース: v18.09.0**
@z

@x
The `overlay` storage driver is deprecated in favor of the `overlay2` storage
driver, which has all the benefits of `overlay`, without its limitations (excessive
inode consumption). The legacy `overlay` storage driver will be removed in a future
release. Users of the `overlay` storage driver should migrate to the `overlay2`
storage driver.
@y
{% comment %}
The `overlay` storage driver is deprecated in favor of the `overlay2` storage
driver, which has all the benefits of `overlay`, without its limitations (excessive
inode consumption). The legacy `overlay` storage driver will be removed in a future
release. Users of the `overlay` storage driver should migrate to the `overlay2`
storage driver.
{% endcomment %}
`overlay` ストレージドライバーは廃止決定され、`overlay2` に変わりました。
`overlay2` は `overlay` の機能をすべて引き継いだ上で、その制約（過剰な inode 消費に関する制約）が取り除かれています。
この古い `overlay` ストレージドライバーは、将来のリリースにおいて削除される予定です。
`overlay` ストレージドライバーの利用者は、`overlay2` ストレージドライバーに移行するようにしてください。
@z

@x
The legacy `overlay` storage driver allowed using overlayFS-backed filesystems
on pre 4.x kernels. Now that all supported distributions are able to run `overlay2`
(as they are either on kernel 4.x, or have support for multiple lowerdirs
backported), there is no reason to keep maintaining the `overlay` storage driver.
@y
{% comment %}
The legacy `overlay` storage driver allowed using overlayFS-backed filesystems
on pre 4.x kernels. Now that all supported distributions are able to run `overlay2`
(as they are either on kernel 4.x, or have support for multiple lowerdirs
backported), there is no reason to keep maintaining the `overlay` storage driver.
{% endcomment %}
古い `overlay` ストレージドライバーでは、それまでの 4.x カーネル上において overlayFS をベースとしたファイルシステムを用いていました。
現在はサポートされているディストリビューションは、すべてにおいて `overlay2` が利用できるようになっています。
（たとえカーネルが 4.x の場合や、下層側ディレクトリを複数可能とするサポートがある場合でも利用可能です。）
`overlay` ストレージドライバーの保守を続ける理由は、もはやなくなりました。
@z

@x
### device mapper storage driver
@y
{% comment %}
### device mapper storage driver
{% endcomment %}
{: #device-mapper-storage-driver }
### device mapper ストレージドライバー
@z

@x
**Deprecated in Release: v18.09.0**
@y
{% comment %}
**Deprecated in Release: v18.09.0**
{% endcomment %}
**廃止決定されたリリース: v18.09.0**
@z

@x
The `devicemapper` storage driver is deprecated in favor of `overlay2`, and will
be removed in a future release. Users of the `devicemapper` storage driver are
recommended to migrate to a different storage driver, such as `overlay2`, which
is now the default storage driver.
@y
{% comment %}
The `devicemapper` storage driver is deprecated in favor of `overlay2`, and will
be removed in a future release. Users of the `devicemapper` storage driver are
recommended to migrate to a different storage driver, such as `overlay2`, which
is now the default storage driver.
{% endcomment %}
`devicemapper` ストレージドライバーは廃止決定され、`overlay2` に変わりました。
そして将来のリリースにおいて削除される予定です。
`devicemapper` ストレージドライバーの利用者は、現在デフォルトのストレージドライバーとなっている `overlay2` などの、別のストレージドライバーへの移行が求められます。
@z

@x
The `devicemapper` storage driver facilitates running Docker on older (3.x) kernels
that have no support for other storage drivers (such as overlay2, or AUFS).
@y
{% comment %}
The `devicemapper` storage driver facilitates running Docker on older (3.x) kernels
that have no support for other storage drivers (such as overlay2, or AUFS).
{% endcomment %}
`devicemapper` ストレージドライバーは、かつての 3.x カーネル上において Docker を稼動させることを勧めていましたが、そのカーネルでは、他のストレージドライバー（overlay2 や AUFS など）はサポートされません。
@z

@x
Now that support for `overlay2` is added to all supported distros (as they are
either on kernel 4.x, or have support for multiple lowerdirs backported), there
is no reason to continue maintenance of the `devicemapper` storage driver.
@y
{% comment %}
Now that support for `overlay2` is added to all supported distros (as they are
either on kernel 4.x, or have support for multiple lowerdirs backported), there
is no reason to continue maintenance of the `devicemapper` storage driver.
{% endcomment %}
今では `overlay2` への対応が、サポートされているディストリビューションに追加されたため、（たとえカーネルが 4.x の場合や、下層側ディレクトリを複数可能とするサポートがある場合であっても）`devicemapper` ストレージドライバーの保守を続ける理由は、もはやなくなりました。
@z

@x
### AuFS storage driver
@y
{% comment %}
### AuFS storage driver
{% endcomment %}
{: #aufs-storage-driver }
### AuFS ストレージドライバー
@z

@x
**Deprecated in Release: v19.03.0**
@y
{% comment %}
**Deprecated in Release: v19.03.0**
{% endcomment %}
**廃止決定されたリリース: v19.03.0**
@z

@x
The `aufs` storage driver is deprecated in favor of `overlay2`, and will
be removed in a future release. Users of the `aufs` storage driver are
recommended to migrate to a different storage driver, such as `overlay2`, which
is now the default storage driver.
@y
{% comment %}
The `aufs` storage driver is deprecated in favor of `overlay2`, and will
be removed in a future release. Users of the `aufs` storage driver are
recommended to migrate to a different storage driver, such as `overlay2`, which
is now the default storage driver.
{% endcomment %}
`aufs` ストレージドライバーは廃止決定され `overlay2` に変わりました。
将来リリースにおいて削除される予定です。
`aufs` ストレージドライバーの利用者は、現在デフォルトのストレージドライバーとなっている `overlay2` などの、別のストレージドライバーへの移行が求められます。
@z

@x
The `aufs` storage driver facilitates running Docker on distros that have no
support for OverlayFS, such as Ubuntu 14.04 LTS, which originally shipped with
a 3.14 kernel.
@y
{% comment %}
The `aufs` storage driver facilitates running Docker on distros that have no
support for OverlayFS, such as Ubuntu 14.04 LTS, which originally shipped with
a 3.14 kernel.
{% endcomment %}
`aufs` ストレージドライバーは、OverlayFS をサポートしていない、たとえば Ubuntu 14.04 LTS などのディストリビューションにおいて Docker を稼動させる際にその利用を勧めていましたが、もともとは 3.14 カーネルにおいて提供されたものでした。
@z

@x
Now that Ubuntu 14.04 is no longer a supported distro for Docker, and `overlay2`
is available to all supported distros (as they are either on kernel 4.x, or have
support for multiple lowerdirs backported), there is no reason to continue
maintenance of the `aufs` storage driver.
@y
{% comment %}
Now that Ubuntu 14.04 is no longer a supported distro for Docker, and `overlay2`
is available to all supported distros (as they are either on kernel 4.x, or have
support for multiple lowerdirs backported), there is no reason to continue
maintenance of the `aufs` storage driver.
{% endcomment %}
現在 Ubuntu 14.04 は Docker においてサポートされるディストリビューションではなくなりました。
また `overlay2` への対応が、サポートされているディストリビューションに追加されたため、（たとえカーネルが 4.x の場合や、下層側ディレクトリを複数可能とするサポートがある場合であっても）`aufs` ストレージドライバーの保守を続ける理由は、もはやなくなりました。
@z

@x
### Reserved namespaces in engine labels
@y
{% comment %}
### Reserved namespaces in engine labels
{% endcomment %}
{: #reserved-namespaces-in-engine-labels }
### Engine ラベルでの予約されている名前空間
@z

@x
**Deprecated in Release: v18.06.0**
@y
{% comment %}
**Deprecated in Release: v18.06.0**
{% endcomment %}
**廃止決定されたリリース: v18.06.0**
@z

@x
The namespaces `com.docker.*`, `io.docker.*`, and `org.dockerproject.*` in engine labels
were always documented to be reserved, but there was never any enforcement.
@y
{% comment %}
The namespaces `com.docker.*`, `io.docker.*`, and `org.dockerproject.*` in engine labels
were always documented to be reserved, but there was never any enforcement.
{% endcomment %}
Engine ラベルにおいて用いられる名前空間 `com.docker.*`、`io.docker.*`、`org.dockerproject.*` は、予約されたものとして常々説明されてきましたが、強制されるものではありませんでした。
@z

@x
Usage of these namespaces will now cause a warning in the engine logs to discourage their
use, and will error instead in 18.12 and above.
@y
{% comment %}
Usage of these namespaces will now cause a warning in the engine logs to discourage their
use, and will error instead in 18.12 and above.
{% endcomment %}
今後はこの名前空間を利用した際に、これを利用しないよう、Engine のログに警告が出力されます。
これは 18.12 またはそれ以降においてはエラーとなります。
@z

@x
### Asynchronous `service create` and `service update`
@y
{% comment %}
### Asynchronous `service create` and `service update`
{% endcomment %}
### `service create` と `service update` の非同期実行
@z

@x
**Deprecated In Release: v17.05.0**
@y
{% comment %}
**Deprecated In Release: v17.05.0**
{% endcomment %}
**廃止決定されたリリース: v17.05.0**
@z

@x
**Disabled by default in release: [v17.10](https://github.com/docker/docker-ce/releases/tag/v17.10.0-ce)**
@y
{% comment %}
**Disabled by default in release: [v17.10](https://github.com/docker/docker-ce/releases/tag/v17.10.0-ce)**
{% endcomment %}
**デフォルトで無効となったリリース: [v17.10](https://github.com/docker/docker-ce/releases/tag/v17.10.0-ce)**
@z

@x
Docker 17.05.0 added an optional `--detach=false` option to make the
`docker service create` and `docker service update` work synchronously. This
option will be enabled by default in Docker 17.10, at which point the `--detach`
flag can be used to use the previous (asynchronous) behavior.
@y
{% comment %}
Docker 17.05.0 added an optional `--detach=false` option to make the
`docker service create` and `docker service update` work synchronously. This
option will be enabled by default in Docker 17.10, at which point the `--detach`
flag can be used to use the previous (asynchronous) behavior.
{% endcomment %}
17.05.0 では、任意のオプション `--detach=false` が追加され、`docker service create` と `docker service update` を同期して動作させることができるようになりました。
Docker 17.10 において、このオプションのデフォルト値は enable となります。
その場合 `--detach` フラグは、以前の（非同期の）動作を行うために利用するものとなります。
@z

@x
The default for this option will also be changed accordingly for `docker service rollback`
and `docker service scale` in Docker 17.10.
@y
{% comment %}
The default for this option will also be changed accordingly for `docker service rollback`
and `docker service scale` in Docker 17.10.
{% endcomment %}
このオプションのデフォルトは Docker 17.10 における `docker service rollback`、`docker service scale` においても変更されます。
@z

@x
### `-g` and `--graph` flags on `dockerd`
@y
{% comment %}
### `-g` and `--graph` flags on `dockerd`
{% endcomment %}
{: #-g-and---graph-flags-on-dockerd }
### `dockerd` における `-g` フラグと `--graph` フラグ
@z

@x
**Deprecated In Release: v17.05.0**
@y
{% comment %}
**Deprecated In Release: v17.05.0**
{% endcomment %}
**廃止決定されたリリース: v17.05.0**
@z

@x
The `-g` or `--graph` flag for the `dockerd` or `docker daemon` command was
used to indicate the directory in which to store persistent data and resource
configuration and has been replaced with the more descriptive `--data-root`
flag.
@y
{% comment %}
The `-g` or `--graph` flag for the `dockerd` or `docker daemon` command was
used to indicate the directory in which to store persistent data and resource
configuration and has been replaced with the more descriptive `--data-root`
flag.
{% endcomment %}
`dockerd` または `docker daemon` コマンドにおける `-g` または `--graph` フラグは、恒常的なデータやリソース設定の保存場所とするディレクトリを指定するものでした。
これは、よりわかりやすい `--data-root` というものに変わります。
flag.
@z

@x
These flags were added before Docker 1.0, so will not be _removed_, only
_hidden_, to discourage their use.
@y
{% comment %}
These flags were added before Docker 1.0, so will not be _removed_, only
_hidden_, to discourage their use.
{% endcomment %}
このフラグが追加されたのは Docker 1.0 以前であるため、**削除** はされず **隠された** フラグとなり、その利用は勧められないものとなりました。
@z

@x
### Top-level network properties in NetworkSettings
@y
{% comment %}
### Top-level network properties in NetworkSettings
{% endcomment %}
{: #top-level-network-properties-in-networksettings }
### NetworkSettings 配下のトップレベルのネットワークプロパティ
@z

@x
**Deprecated In Release: [v1.13.0](https://github.com/docker/docker/releases/tag/v1.13.0)**
@y
{% comment %}
**Deprecated In Release: [v1.13.0](https://github.com/docker/docker/releases/tag/v1.13.0)**
{% endcomment %}
**廃止決定されたリリース: [v1.13.0](https://github.com/docker/docker/releases/tag/v1.13.0)**
@z

@x
**Target For Removal In Release: v17.12**
@y
{% comment %}
**Target For Removal In Release: v17.12**
{% endcomment %}
**削除対象とされたリリース: v17.12**
@z

@x
When inspecting a container, `NetworkSettings` contains top-level information
about the default ("bridge") network;
@y
{% comment %}
When inspecting a container, `NetworkSettings` contains top-level information
about the default ("bridge") network;
{% endcomment %}
コンテナー定義の `NetworkSettings` 配下に、デフォルトの「bridge」ネットワークに関する情報がトップベレルにおいて設定されます。
@z

@x
`EndpointID`, `Gateway`, `GlobalIPv6Address`, `GlobalIPv6PrefixLen`, `IPAddress`,
`IPPrefixLen`, `IPv6Gateway`, and `MacAddress`.
@y
{% comment %}
`EndpointID`, `Gateway`, `GlobalIPv6Address`, `GlobalIPv6PrefixLen`, `IPAddress`,
`IPPrefixLen`, `IPv6Gateway`, and `MacAddress`.
{% endcomment %}
`EndpointID`, `Gateway`, `GlobalIPv6Address`, `GlobalIPv6PrefixLen`, `IPAddress`,
`IPPrefixLen`, `IPv6Gateway`, `MacAddress` です。
@z

@x
These properties are deprecated in favor of per-network properties in
`NetworkSettings.Networks`. These properties were already "deprecated" in
docker 1.9, but kept around for backward compatibility.
@y
{% comment %}
These properties are deprecated in favor of per-network properties in
`NetworkSettings.Networks`. These properties were already "deprecated" in
docker 1.9, but kept around for backward compatibility.
{% endcomment %}
このプロパティは廃止決定され、`NetworkSettings.Networks` 内での各ネットワークごとのプロパティに変わります。
このプロパティは、すでに Docker 1.9 において「廃止決定」されていましたが、下位互換のために残されていました。
@z

@x
Refer to [#17538](https://github.com/docker/docker/pull/17538) for further
information.
@y
{% comment %}
Refer to [#17538](https://github.com/docker/docker/pull/17538) for further
information.
{% endcomment %}
詳細については [#17538](https://github.com/docker/docker/pull/17538) を参照してください。
@z

@x
### `filter` param for `/images/json` endpoint
@y
{% comment %}
### `filter` param for `/images/json` endpoint
{% endcomment %}
{: #filter-param-for-imagesjson-endpoint }
### エンドポイント `/images/json` の `filter` パラメーター
@z

@x
**Deprecated In Release: [v1.13.0](https://github.com/docker/docker/releases/tag/v1.13.0)**
@y
{% comment %}
**Deprecated In Release: [v1.13.0](https://github.com/docker/docker/releases/tag/v1.13.0)**
{% endcomment %}
**廃止決定されたリリース: [v1.13.0](https://github.com/docker/docker/releases/tag/v1.13.0)**
@z

@x
**Target For Removal In Release: v17.12**
@y
{% comment %}
**Target For Removal In Release: v17.12**
{% endcomment %}
**削除対象とされたリリース: v17.12**
@z

@x
The `filter` param to filter the list of image by reference (name or name:tag) is now implemented as a regular filter, named `reference`.
@y
{% comment %}
The `filter` param to filter the list of image by reference (name or name:tag) is now implemented as a regular filter, named `reference`.
{% endcomment %}
`filter` パラメーターは、（イメージ名やイメージ名：タグの形で）イメージを一覧表示する際のフィルターですが、現在は通常のフィルター `reference` として実装されました。
@z

@x
### `repository:shortid` image references
@y
{% comment %}
### `repository:shortid` image references
{% endcomment %}
{: #repositoryshortid-image-references }
### `repository:shortid` によるイメージ参照
@z

@x
**Deprecated In Release: [v1.13.0](https://github.com/docker/docker/releases/tag/v1.13.0)**
@y
{% comment %}
**Deprecated In Release: [v1.13.0](https://github.com/docker/docker/releases/tag/v1.13.0)**
{% endcomment %}
**廃止決定されたリリース: [v1.13.0](https://github.com/docker/docker/releases/tag/v1.13.0)**
@z

@x
**Removed In Release: v17.12**
@y
{% comment %}
**Removed In Release: v17.12**
{% endcomment %}
**削除されたリリース: v17.12**
@z

@x
The `repository:shortid` syntax for referencing images is very little used,
collides with tag references, and can be confused with digest references.
@y
{% comment %}
The `repository:shortid` syntax for referencing images is very little used,
collides with tag references, and can be confused with digest references.
{% endcomment %}
イメージを参照するための構文 `repository:shortid` は利用されることが少なく、タグ参照とまぎらわしく、さらにダイジェスト参照とも混同されます。
@z

@x
Support for the `repository:shortid` notation to reference images was removed
in Docker 17.12.
@y
{% comment %}
Support for the `repository:shortid` notation to reference images was removed
in Docker 17.12.
{% endcomment %}
`repository:shortid` によってイメージ参照を行うこの記述方法は、Docker 17.12 において削除されました。
@z

@x
### `docker daemon` subcommand
@y
{% comment %}
### `docker daemon` subcommand
{% endcomment %}
{: #docker-daemon-subcommand }
### `docker daemon` サブコマンド
@z

@x
**Deprecated In Release: [v1.13.0](https://github.com/docker/docker/releases/tag/v1.13.0)**
@y
{% comment %}
**Deprecated In Release: [v1.13.0](https://github.com/docker/docker/releases/tag/v1.13.0)**
{% endcomment %}
**廃止決定されたリリース: [v1.13.0](https://github.com/docker/docker/releases/tag/v1.13.0)**
@z

@x
**Removed In Release: v17.12**
@y
{% comment %}
**Removed In Release: v17.12**
{% endcomment %}
**削除されたリリース: v17.12**
@z

@x
The daemon is moved to a separate binary (`dockerd`), and should be used instead.
@y
{% comment %}
The daemon is moved to a separate binary (`dockerd`), and should be used instead.
{% endcomment %}
デーモンは個別のバイナリ（`dockerd`）として分離されたため、こちらを用いることになります。
@z

@x
### Duplicate keys with conflicting values in engine labels
@y
{% comment %}
### Duplicate keys with conflicting values in engine labels
{% endcomment %}
{: #duplicate-keys-with-conflicting-values-in-engine-labels }
### Engine ラベルでのキー重複による値の衝突
@z

@x
**Deprecated In Release: [v1.13.0](https://github.com/docker/docker/releases/tag/v1.13.0)**
@y
{% comment %}
**Deprecated In Release: [v1.13.0](https://github.com/docker/docker/releases/tag/v1.13.0)**
{% endcomment %}
**廃止決定されたリリース: [v1.13.0](https://github.com/docker/docker/releases/tag/v1.13.0)**
@z

@x
**Removed In Release: v17.12**
@y
{% comment %}
**Removed In Release: v17.12**
{% endcomment %}
**削除されたリリース: v17.12**
@z

@x
When setting duplicate keys with conflicting values, an error will be produced, and the daemon
will fail to start.
@y
{% comment %}
When setting duplicate keys with conflicting values, an error will be produced, and the daemon
will fail to start.
{% endcomment %}
重複したキーが設定されその値が衝突した場合、エラーが発生することになります。
この場合、デーモンは起動されなくなります。
@z

@x
### `MAINTAINER` in Dockerfile
@y
{% comment %}
### `MAINTAINER` in Dockerfile
{% endcomment %}
{: #maintainer-in-dockerfile }
### Dockerfile における `MAINTAINER`
@z

@x
**Deprecated In Release: [v1.13.0](https://github.com/docker/docker/releases/tag/v1.13.0)**
@y
{% comment %}
**Deprecated In Release: [v1.13.0](https://github.com/docker/docker/releases/tag/v1.13.0)**
{% endcomment %}
**廃止決定されたリリース: [v1.13.0](https://github.com/docker/docker/releases/tag/v1.13.0)**
@z

@x
`MAINTAINER` was an early very limited form of `LABEL` which should be used instead.
@y
{% comment %}
`MAINTAINER` was an early very limited form of `LABEL` which should be used instead.
{% endcomment %}
`MAINTAINER` は `LABEL` の限定利用の形で当初利用されていましたが、代わりに `LABEL` を利用すべきものです。
@z

@x
### API calls without a version
@y
{% comment %}
### API calls without a version
{% endcomment %}
{: #api-calls-without-a-version }
### バージョンを含まない API コール
@z

@x
**Deprecated In Release: [v1.13.0](https://github.com/docker/docker/releases/tag/v1.13.0)**
@y
{% comment %}
**Deprecated In Release: [v1.13.0](https://github.com/docker/docker/releases/tag/v1.13.0)**
{% endcomment %}
**廃止決定されたリリース: [v1.13.0](https://github.com/docker/docker/releases/tag/v1.13.0)**
@z

@x
**Target For Removal In Release: v17.12**
@y
{% comment %}
**Target For Removal In Release: v17.12**
{% endcomment %}
**削除対象とされたリリース: v17.12**
@z

@x
API versions should be supplied to all API calls to ensure compatibility with
future Engine versions. Instead of just requesting, for example, the URL
`/containers/json`, you must now request `/v1.25/containers/json`.
@y
{% comment %}
API versions should be supplied to all API calls to ensure compatibility with
future Engine versions. Instead of just requesting, for example, the URL
`/containers/json`, you must now request `/v1.25/containers/json`.
{% endcomment %}
API 呼び出しにおいては、API バージョンを指定することが必要です。
これによって、将来の Engine バージョンとの互換性を保つためです。
URL において、たとえば単に `/containers/json` とするのではなく、`/v1.25/containers/json` とすることが今後必要になります。
@z

@x
### Backing filesystem without `d_type` support for overlay/overlay2
@y
{% comment %}
### Backing filesystem without `d_type` support for overlay/overlay2
{% endcomment %}
{: #backing-filesystem-without-d_type-support-for-overlayoverlay2 }
### overlay/overlay2 での `d_type` 未設定時のファイルシステム
@z

@x
**Deprecated In Release: [v1.13.0](https://github.com/docker/docker/releases/tag/v1.13.0)**
@y
{% comment %}
**Deprecated In Release: [v1.13.0](https://github.com/docker/docker/releases/tag/v1.13.0)**
{% endcomment %}
**廃止決定されたリリース: [v1.13.0](https://github.com/docker/docker/releases/tag/v1.13.0)**
@z

@x
**Removed In Release: v17.12**
@y
{% comment %}
**Removed In Release: v17.12**
{% endcomment %}
**削除されたリリース: v17.12**
@z

@x
The overlay and overlay2 storage driver does not work as expected if the backing
filesystem does not support `d_type`. For example, XFS does not support `d_type`
if it is formatted with the `ftype=0` option.
@y
{% comment %}
The overlay and overlay2 storage driver does not work as expected if the backing
filesystem does not support `d_type`. For example, XFS does not support `d_type`
if it is formatted with the `ftype=0` option.
{% endcomment %}
ストレージドライバー overlay と overlay2 は、これが基づいているファイルシステムが `d_type` に対応していない場合、期待されるような動作をしません。
たとえば XFS は `ftype=0` を使ってフォーマットされている場合には `d_type` をサポートしません。
@z

@x
Starting with Docker 17.12, new installations will not support running overlay2 on
a backing filesystem without `d_type` support. For existing installations that upgrade
to 17.12, a warning will be printed.
@y
{% comment %}
Starting with Docker 17.12, new installations will not support running overlay2 on
a backing filesystem without `d_type` support. For existing installations that upgrade
to 17.12, a warning will be printed.
{% endcomment %}
Docker 17.12 以降、`d_type` 未対応のファイルシステムへのサポートは、今後の overlay2 の開発において行われません。
17.12 までにアップグレードした既存バージョンでは、警告が出力されます。
@z

@x
Please also refer to [#27358](https://github.com/docker/docker/issues/27358) for
further information.
@y
{% comment %}
Please also refer to [#27358](https://github.com/docker/docker/issues/27358) for
further information.
{% endcomment %}
詳細は [#27358](https://github.com/docker/docker/issues/27358) を参照してください。
@z

@x
### Three arguments form in `docker import`
@y
{% comment %}
### Three arguments form in `docker import`
{% endcomment %}
{: #three-arguments-form-in-docker-import }
### `docker import` における 3 種類の引数形式
@z

@x
**Deprecated In Release: [v0.6.7](https://github.com/docker/docker/releases/tag/v0.6.7)**
@y
{% comment %}
**Deprecated In Release: [v0.6.7](https://github.com/docker/docker/releases/tag/v0.6.7)**
{% endcomment %}
**廃止決定されたリリース: [v0.6.7](https://github.com/docker/docker/releases/tag/v0.6.7)**
@z

@x
**Removed In Release: [v1.12.0](https://github.com/docker/docker/releases/tag/v1.12.0)**
@y
{% comment %}
**Removed In Release: [v1.12.0](https://github.com/docker/docker/releases/tag/v1.12.0)**
{% endcomment %}
**削除されたリリース: [v1.12.0](https://github.com/docker/docker/releases/tag/v1.12.0)**
@z

@x
The `docker import` command format `file|URL|- [REPOSITORY [TAG]]` is deprecated since November 2013. It's no more supported.
@y
{% comment %}
The `docker import` command format `file|URL|- [REPOSITORY [TAG]]` is deprecated since November 2013. It's no more supported.
{% endcomment %}
`docker import` におけるコマンド形式 `file|URL|- [REPOSITORY [TAG]]` は 2013 年 11 月頃に廃止決定されました。
今後はサポートされません。
@z

@x
### `-h` shorthand for `--help`
@y
{% comment %}
### `-h` shorthand for `--help`
{% endcomment %}
{: #-h-shorthand-for---help }
### `--help` の短い形式 `-h`
@z

@x
**Deprecated In Release: [v1.12.0](https://github.com/docker/docker/releases/tag/v1.12.0)**
@y
{% comment %}
**Deprecated In Release: [v1.12.0](https://github.com/docker/docker/releases/tag/v1.12.0)**
{% endcomment %}
**廃止決定されたリリース: [v1.12.0](https://github.com/docker/docker/releases/tag/v1.12.0)**
@z

@x
**Target For Removal In Release: v17.09**
@y
{% comment %}
**Target For Removal In Release: v17.09**
{% endcomment %}
**削除対象とされたリリース: v17.09**
@z

@x
The shorthand (`-h`) is less common than `--help` on Linux and cannot be used
on all subcommands (due to it conflicting with, e.g. `-h` / `--hostname` on
`docker create`). For this reason, the `-h` shorthand was not printed in the
"usage" output of subcommands, nor documented, and is now marked "deprecated".
@y
{% comment %}
The shorthand (`-h`) is less common than `--help` on Linux and cannot be used
on all subcommands (due to it conflicting with, e.g. `-h` / `--hostname` on
`docker create`). For this reason, the `-h` shorthand was not printed in the
"usage" output of subcommands, nor documented, and is now marked "deprecated".
{% endcomment %}
Linux において短い形式のオプション（`-h`）は、長い形式（`--help`）に比べて、あまり一般的ではありません。
そしてサブコマンドのすべてにおいて利用できるわけではありません。
（これは衝突が起きる場合があるためで、たとえば `docker create` には `-h` / `--hostname` があります。）
このようなわけで、短い形式の `-h` は、サブコマンドの利用方法の説明からなくし、ドキュメント化もしていません。
そして今後は「廃止決定」としてラベルづけします。
@z

@x
### `-e` and `--email` flags on `docker login`
@y
{% comment %}
### `-e` and `--email` flags on `docker login`
{% endcomment %}
{: #-e-and---email-flags-on-docker-login }
### `docker login` におけるフラグ `-e`、`--email`
@z

@x
**Deprecated In Release: [v1.11.0](https://github.com/docker/docker/releases/tag/v1.11.0)**
@y
{% comment %}
**Deprecated In Release: [v1.11.0](https://github.com/docker/docker/releases/tag/v1.11.0)**
{% endcomment %}
**廃止決定されたリリース: [v1.11.0](https://github.com/docker/docker/releases/tag/v1.11.0)**
@z

@x
**Removed In Release: [v17.06](https://github.com/docker/docker-ce/releases/tag/v17.06.0-ce)**
@y
{% comment %}
**Removed In Release: [v17.06](https://github.com/docker/docker-ce/releases/tag/v17.06.0-ce)**
{% endcomment %}
**削除されたリリース: [v17.06](https://github.com/docker/docker-ce/releases/tag/v17.06.0-ce)**
@z

@x
The docker login command is removing the ability to automatically register for an account with the target registry if the given username doesn't exist. Due to this change, the email flag is no longer required, and will be deprecated.
@y
{% comment %}
The docker login command is removing the ability to automatically register for an account with the target registry if the given username doesn't exist. Due to this change, the email flag is no longer required, and will be deprecated.
{% endcomment %}
docker login コマンドは、操作対象とするレジストリ上に、入力されたユーザー名が存在しなかった場合に、そのアカウントを自動的に登録していましたが、現在この機能は削除されています。
この変更により、email フラグは必要なくなったため、廃止決定となります。
@z

@x
### Separator (`:`) of `--security-opt` flag on `docker run`
@y
{% comment %}
### Separator (`:`) of `--security-opt` flag on `docker run`
{% endcomment %}
{: #separator--of---security-opt-flag-on-docker-run }
### `docker run` における `--security-opt` のセパレーター（`:`）
@z

@x
**Deprecated In Release: [v1.11.0](https://github.com/docker/docker/releases/tag/v1.11.0)**
@y
{% comment %}
**Deprecated In Release: [v1.11.0](https://github.com/docker/docker/releases/tag/v1.11.0)**
{% endcomment %}
**廃止決定されたリリース: [v1.11.0](https://github.com/docker/docker/releases/tag/v1.11.0)**
@z

@x
**Target For Removal In Release: v17.06**
@y
{% comment %}
**Target For Removal In Release: v17.06**
{% endcomment %}
**削除対象とされたリリース: v17.06**
@z

@x
The flag `--security-opt` doesn't use the colon separator (`:`) anymore to divide keys and values, it uses the equal symbol (`=`) for consistency with other similar flags, like `--storage-opt`.
@y
{% comment %}
The flag `--security-opt` doesn't use the colon separator (`:`) anymore to divide keys and values, it uses the equal symbol (`=`) for consistency with other similar flags, like `--storage-opt`.
{% endcomment %}
`--security-opt` フラグでは、キーと値を切り分けて指定するためのセパレーター（`:`）は、今後は利用しません。
これはたとえば `--storage-opt` のような同様のフラグと一貫性を持たせるために、イコール（`=`）を利用します。
@z

@x
### `/containers/(id or name)/copy` endpoint
@y
{% comment %}
### `/containers/(id or name)/copy` endpoint
{% endcomment %}
{: #containersid-or-namecopy-endpoint }
### エンドポイント `/containers/(IDまたは名前)/copy`
@z

@x
**Deprecated In Release: [v1.8.0](https://github.com/docker/docker/releases/tag/v1.8.0)**
@y
{% comment %}
**Deprecated In Release: [v1.8.0](https://github.com/docker/docker/releases/tag/v1.8.0)**
{% endcomment %}
**廃止決定されたリリース: [v1.8.0](https://github.com/docker/docker/releases/tag/v1.8.0)**
@z

@x
**Removed In Release: [v1.12.0](https://github.com/docker/docker/releases/tag/v1.12.0)**
@y
{% comment %}
**Removed In Release: [v1.12.0](https://github.com/docker/docker/releases/tag/v1.12.0)**
{% endcomment %}
**削除されたリリース: [v1.12.0](https://github.com/docker/docker/releases/tag/v1.12.0)**
@z

@x
The endpoint `/containers/(id or name)/copy` is deprecated in favor of `/containers/(id or name)/archive`.
@y
{% comment %}
The endpoint `/containers/(id or name)/copy` is deprecated in favor of `/containers/(id or name)/archive`.
{% endcomment %}
エンドポイント `/containers/(IDまたは名前)/copy` は廃止決定され、`/containers/(IDまたは名前)/archive` に変わります。
@z

@x
### Ambiguous event fields in API
@y
{% comment %}
### Ambiguous event fields in API
{% endcomment %}
{: #ambiguous-event-fields-in-api }
### イベント API の不明瞭な項目
@z

@x
**Deprecated In Release: [v1.10.0](https://github.com/docker/docker/releases/tag/v1.10.0)**
@y
{% comment %}
**Deprecated In Release: [v1.10.0](https://github.com/docker/docker/releases/tag/v1.10.0)**
{% endcomment %}
**廃止決定されたリリース: [v1.10.0](https://github.com/docker/docker/releases/tag/v1.10.0)**
@z

@x
The fields `ID`, `Status` and `From` in the events API have been deprecated in favor of a more rich structure.
See the events API documentation for the new format.
@y
{% comment %}
The fields `ID`, `Status` and `From` in the events API have been deprecated in favor of a more rich structure.
See the events API documentation for the new format.
{% endcomment %}
イベント API における以下の項目、`ID`、`Status`、`From` はすでに廃止決定されています。
これは、より表現が豊かな構造に変わります。
新たなフォーマットに関しては、イベント API のドキュメントを参照してください。
@z

@x
### `-f` flag on `docker tag`
@y
{% comment %}
### `-f` flag on `docker tag`
{% endcomment %}
{: #-f-flag-on-docker-tag }
### `docker tag` における `-f` フラグ
@z

@x
**Deprecated In Release: [v1.10.0](https://github.com/docker/docker/releases/tag/v1.10.0)**
@y
{% comment %}
**Deprecated In Release: [v1.10.0](https://github.com/docker/docker/releases/tag/v1.10.0)**
{% endcomment %}
**廃止決定されたリリース: [v1.10.0](https://github.com/docker/docker/releases/tag/v1.10.0)**
@z

@x
**Removed In Release: [v1.12.0](https://github.com/docker/docker/releases/tag/v1.12.0)**
@y
{% comment %}
**Removed In Release: [v1.12.0](https://github.com/docker/docker/releases/tag/v1.12.0)**
{% endcomment %}
**削除されたリリース: [v1.12.0](https://github.com/docker/docker/releases/tag/v1.12.0)**
@z

@x
To make tagging consistent across the various `docker` commands, the `-f` flag on the `docker tag` command is deprecated. It is not longer necessary to specify `-f` to move a tag from one image to another. Nor will `docker` generate an error if the `-f` flag is missing and the specified tag is already in use.
@y
{% comment %}
To make tagging consistent across the various `docker` commands, the `-f` flag on the `docker tag` command is deprecated. It is not longer necessary to specify `-f` to move a tag from one image to another. Nor will `docker` generate an error if the `-f` flag is missing and the specified tag is already in use.
{% endcomment %}
さまざまな `docker` コマンド間にてタグづけ機能に一貫性を持たせるために、`docker tag` コマンドの `-f` フラグは廃止決定されました。
1 つのイメージから別のイメージへタグを移動する際に、`-f` を指定する必要はなくなりました。
そして `-f` フラグの指定がなく、あるいは指定されたタグがすでに使用中であっても、`docker` ではエラーとなりません。
@z

@x
### HostConfig at API container start
@y
{% comment %}
### HostConfig at API container start
{% endcomment %}
{: #hostconfig-at-api-container-start }
### API の container start における HostConfig
@z

@x
**Deprecated In Release: [v1.10.0](https://github.com/docker/docker/releases/tag/v1.10.0)**
@y
{% comment %}
**Deprecated In Release: [v1.10.0](https://github.com/docker/docker/releases/tag/v1.10.0)**
{% endcomment %}
**廃止決定されたリリース: [v1.10.0](https://github.com/docker/docker/releases/tag/v1.10.0)**
@z

@x
**Removed In Release: [v1.12.0](https://github.com/docker/docker/releases/tag/v1.12.0)**
@y
{% comment %}
**Removed In Release: [v1.12.0](https://github.com/docker/docker/releases/tag/v1.12.0)**
{% endcomment %}
**削除されたリリース: [v1.12.0](https://github.com/docker/docker/releases/tag/v1.12.0)**
@z

@x
Passing an `HostConfig` to `POST /containers/{name}/start` is deprecated in favor of
defining it at container creation (`POST /containers/create`).
@y
{% comment %}
Passing an `HostConfig` to `POST /containers/{name}/start` is deprecated in favor of
defining it at container creation (`POST /containers/create`).
{% endcomment %}
`POST /containers/{name}/start` に対して `HostConfig` を設定することは廃止決定となりました。
代わりに、コンテナーの生成時（`POST /containers/create`）に定義するものとなります。
@z

@x
### `--before` and `--since` flags on `docker ps`
@y
{% comment %}
### `--before` and `--since` flags on `docker ps`
{% endcomment %}
{: #--before-and---since-flags-on-docker-ps }
### `docker ps` におけるフラグ `--before`、`--since`
@z

@x
**Deprecated In Release: [v1.10.0](https://github.com/docker/docker/releases/tag/v1.10.0)**
@y
{% comment %}
**Deprecated In Release: [v1.10.0](https://github.com/docker/docker/releases/tag/v1.10.0)**
{% endcomment %}
**廃止決定されたリリース: [v1.10.0](https://github.com/docker/docker/releases/tag/v1.10.0)**
@z

@x
**Removed In Release: [v1.12.0](https://github.com/docker/docker/releases/tag/v1.12.0)**
@y
{% comment %}
**Removed In Release: [v1.12.0](https://github.com/docker/docker/releases/tag/v1.12.0)**
{% endcomment %}
**削除されたリリース: [v1.12.0](https://github.com/docker/docker/releases/tag/v1.12.0)**
@z

@x
The `docker ps --before` and `docker ps --since` options are deprecated.
Use `docker ps --filter=before=...` and `docker ps --filter=since=...` instead.
@y
{% comment %}
The `docker ps --before` and `docker ps --since` options are deprecated.
Use `docker ps --filter=before=...` and `docker ps --filter=since=...` instead.
{% endcomment %}
`docker ps --before` と `docker ps --since` というオプション指定は廃止決定されました。
代わりに `docker ps --filter=before=...` や `docker ps --filter=since=...` を利用するものとなります。
@z

@x
### `--automated` and `--stars` flags on `docker search`
@y
{% comment %}
### `--automated` and `--stars` flags on `docker search`
{% endcomment %}
{: #--automated-and---stars-flags-on-docker-search }
### `docker search` におけるフラグ `--automated`、`--stars`
@z

@x
**Deprecated in Release: [v1.12.0](https://github.com/docker/docker/releases/tag/v1.12.0)**
@y
{% comment %}
**Deprecated in Release: [v1.12.0](https://github.com/docker/docker/releases/tag/v1.12.0)**
{% endcomment %}
**廃止決定されたリリース: [v1.12.0](https://github.com/docker/docker/releases/tag/v1.12.0)**
@z

@x
**Target For Removal In Release: v17.09**
@y
{% comment %}
**Target For Removal In Release: v17.09**
{% endcomment %}
**削除対象とされたリリース: v17.09**
@z

@x
The `docker search --automated` and `docker search --stars` options are deprecated.
Use `docker search --filter=is-automated=...` and `docker search --filter=stars=...` instead.
@y
{% comment %}
The `docker search --automated` and `docker search --stars` options are deprecated.
Use `docker search --filter=is-automated=...` and `docker search --filter=stars=...` instead.
{% endcomment %}
`docker search --automated` と `docker search --stars` というオプション指定は廃止決定されました。
代わりに `docker search --filter=is-automated=...` と `docker search --filter=stars=...` を利用するものとなります。
@z

@x
### Driver Specific Log Tags
@y
{% comment %}
### Driver Specific Log Tags
{% endcomment %}
{: #driver-specific-log-tags }
### ドライバー固有ログのタグづけ
@z

@x
**Deprecated In Release: [v1.9.0](https://github.com/docker/docker/releases/tag/v1.9.0)**
@y
{% comment %}
**Deprecated In Release: [v1.9.0](https://github.com/docker/docker/releases/tag/v1.9.0)**
{% endcomment %}
**廃止決定されたリリース: [v1.9.0](https://github.com/docker/docker/releases/tag/v1.9.0)**
@z

@x
**Removed In Release: [v1.12.0](https://github.com/docker/docker/releases/tag/v1.12.0)**
@y
{% comment %}
**Removed In Release: [v1.12.0](https://github.com/docker/docker/releases/tag/v1.12.0)**
{% endcomment %}
**削除されたリリース: [v1.12.0](https://github.com/docker/docker/releases/tag/v1.12.0)**
@z

@x
Log tags are now generated in a standard way across different logging drivers.
Because of which, the driver specific log tag options `syslog-tag`, `gelf-tag` and
`fluentd-tag` have been deprecated in favor of the generic `tag` option.
@y
{% comment %}
Log tags are now generated in a standard way across different logging drivers.
Because of which, the driver specific log tag options `syslog-tag`, `gelf-tag` and
`fluentd-tag` have been deprecated in favor of the generic `tag` option.
{% endcomment %}
ログのタグは、多くのログドライバーにおいて標準的な方式で生成されています。
このため、ドライバー固有のタグづけを行うオプション `syslog-tag`、`gelf-tag`、`fluentd-tag` は廃止決定とされています。
代わりに汎用的な `tag` オプションを利用します。
@z

@x
```bash
{% raw %}
docker --log-driver=syslog --log-opt tag="{{.ImageName}}/{{.Name}}/{{.ID}}"
{% endraw %}
```
@y
```bash
{% raw %}
docker --log-driver=syslog --log-opt tag="{{.ImageName}}/{{.Name}}/{{.ID}}"
{% endraw %}
```
@z

@x
### LXC built-in exec driver
@y
{% comment %}
### LXC built-in exec driver
{% endcomment %}
{: #lxc-built-in-exec-driver }
### LXC ビルトインの実行ドライバー
@z

@x
**Deprecated In Release: [v1.8.0](https://github.com/docker/docker/releases/tag/v1.8.0)**
@y
{% comment %}
**Deprecated In Release: [v1.8.0](https://github.com/docker/docker/releases/tag/v1.8.0)**
{% endcomment %}
**廃止決定されたリリース: [v1.8.0](https://github.com/docker/docker/releases/tag/v1.8.0)**
@z

@x
**Removed In Release: [v1.10.0](https://github.com/docker/docker/releases/tag/v1.10.0)**
@y
{% comment %}
**Removed In Release: [v1.10.0](https://github.com/docker/docker/releases/tag/v1.10.0)**
{% endcomment %}
**削除されたリリース: [v1.10.0](https://github.com/docker/docker/releases/tag/v1.10.0)**
@z

@x
The built-in LXC execution driver, the lxc-conf flag, and API fields have been removed.
@y
{% comment %}
The built-in LXC execution driver, the lxc-conf flag, and API fields have been removed.
{% endcomment %}
LXC ビルトインの実行ドライバー、lxc-config フラグ、API 項目は削除されました。
@z

@x
### Old Command Line Options
@y
{% comment %}
### Old Command Line Options
{% endcomment %}
### 古くなったコマンドラインオプション
@z

@x
**Deprecated In Release: [v1.8.0](https://github.com/docker/docker/releases/tag/v1.8.0)**
@y
{% comment %}
**Deprecated In Release: [v1.8.0](https://github.com/docker/docker/releases/tag/v1.8.0)**
{% endcomment %}
**廃止決定されたリリース: [v1.8.0](https://github.com/docker/docker/releases/tag/v1.8.0)**
@z

@x
**Removed In Release: [v1.10.0](https://github.com/docker/docker/releases/tag/v1.10.0)**
@y
{% comment %}
**Removed In Release: [v1.10.0](https://github.com/docker/docker/releases/tag/v1.10.0)**
{% endcomment %}
**削除されたリリース: [v1.10.0](https://github.com/docker/docker/releases/tag/v1.10.0)**
@z

@x
The flags `-d` and `--daemon` are deprecated in favor of the `daemon` subcommand:
@y
{% comment %}
The flags `-d` and `--daemon` are deprecated in favor of the `daemon` subcommand:
{% endcomment %}
フラグ `-d` と `--daemon` は廃止決定となり、`daemon` サブコマンドになりました。
@z

@x
    docker daemon -H ...
@y
    docker daemon -H ...
@z

@x
The following single-dash (`-opt`) variant of certain command line options
are deprecated and replaced with double-dash options (`--opt`):
@y
{% comment %}
The following single-dash (`-opt`) variant of certain command line options
are deprecated and replaced with double-dash options (`--opt`):
{% endcomment %}
以下のシングルダッシュ（`-opt` のような）形式のコマンドラインオプションは廃止決定となり、ダブルダッシュ（`--opt` のような）形式になりました。
@z

@x
    docker attach -nostdin
    docker attach -sig-proxy
    docker build -no-cache
    docker build -rm
    docker commit -author
    docker commit -run
    docker events -since
    docker history -notrunc
    docker images -notrunc
    docker inspect -format
    docker ps -beforeId
    docker ps -notrunc
    docker ps -sinceId
    docker rm -link
    docker run -cidfile
    docker run -dns
    docker run -entrypoint
    docker run -expose
    docker run -link
    docker run -lxc-conf
    docker run -n
    docker run -privileged
    docker run -volumes-from
    docker search -notrunc
    docker search -stars
    docker search -t
    docker search -trusted
    docker tag -force
@y
    docker attach -nostdin
    docker attach -sig-proxy
    docker build -no-cache
    docker build -rm
    docker commit -author
    docker commit -run
    docker events -since
    docker history -notrunc
    docker images -notrunc
    docker inspect -format
    docker ps -beforeId
    docker ps -notrunc
    docker ps -sinceId
    docker rm -link
    docker run -cidfile
    docker run -dns
    docker run -entrypoint
    docker run -expose
    docker run -link
    docker run -lxc-conf
    docker run -n
    docker run -privileged
    docker run -volumes-from
    docker search -notrunc
    docker search -stars
    docker search -t
    docker search -trusted
    docker tag -force
@z

@x
The following double-dash options are deprecated and have no replacement:
@y
{% comment %}
The following double-dash options are deprecated and have no replacement:
{% endcomment %}
以下のダブルダッシュによるオプションは廃止決定され、これに代わるものはありません。
@z

@x
    docker run --cpuset
    docker run --networking
    docker ps --since-id
    docker ps --before-id
    docker search --trusted
@y
    docker run --cpuset
    docker run --networking
    docker ps --since-id
    docker ps --before-id
    docker search --trusted
@z

@x
**Deprecated In Release: [v1.5.0](https://github.com/docker/docker/releases/tag/v1.5.0)**
@y
{% comment %}
**Deprecated In Release: [v1.5.0](https://github.com/docker/docker/releases/tag/v1.5.0)**
{% endcomment %}
**廃止決定されたリリース: [v1.5.0](https://github.com/docker/docker/releases/tag/v1.5.0)**
@z

@x
**Removed In Release: [v1.12.0](https://github.com/docker/docker/releases/tag/v1.12.0)**
@y
{% comment %}
**Removed In Release: [v1.12.0](https://github.com/docker/docker/releases/tag/v1.12.0)**
{% endcomment %}
**削除されたリリース: [v1.12.0](https://github.com/docker/docker/releases/tag/v1.12.0)**
@z

@x
The single-dash (`-help`) was removed, in favor of the double-dash `--help`
@y
{% comment %}
The single-dash (`-help`) was removed, in favor of the double-dash `--help`
{% endcomment %}
シングルダッシュ（`-help`）は削除されたため、代わりにダブルダッシュの `--help` を利用します。
@z

@x
    docker -help
    docker [COMMAND] -help
@y
    docker -help
    docker [COMMAND] -help
@z

@x
### `--run` flag on docker commit
@y
{% comment %}
### `--run` flag on docker commit
{% endcomment %}
{: #--run-flag-on-docker-commit }
### `docker commit` における `--run` フラグ
@z

@x
**Deprecated In Release: [v0.10.0](https://github.com/docker/docker/releases/tag/v0.10.0)**
@y
{% comment %}
**Deprecated In Release: [v0.10.0](https://github.com/docker/docker/releases/tag/v0.10.0)**
{% endcomment %}
**廃止決定されたリリース: [v0.10.0](https://github.com/docker/docker/releases/tag/v0.10.0)**
@z

@x
**Removed In Release: [v1.13.0](https://github.com/docker/docker/releases/tag/v1.13.0)**
@y
{% comment %}
**Removed In Release: [v1.13.0](https://github.com/docker/docker/releases/tag/v1.13.0)**
{% endcomment %}
**削除されたリリース: [v1.13.0](https://github.com/docker/docker/releases/tag/v1.13.0)**
@z

@x
The flag `--run` of the docker commit (and its short version `-run`) were deprecated in favor
of the `--changes` flag that allows to pass `Dockerfile` commands.
@y
{% comment %}
The flag `--run` of the docker commit (and its short version `-run`) were deprecated in favor
of the `--changes` flag that allows to pass `Dockerfile` commands.
{% endcomment %}
docker commit のフラグ `--run`（その短い版である `-run`）は廃止決定となっています。
代わりに `--changes` フラグを利用します。
これは `Dockerfile` コマンドに指定することも可能です。
@z

@x
### Interacting with V1 registries
@y
{% comment %}
### Interacting with V1 registries
{% endcomment %}
{: #interacting-with-v1-registries }
### V1 レジストリとのやりとり
@z

@x
**Disabled By Default In Release: v17.06**
@y
{% comment %}
**Disabled By Default In Release: v17.06**
{% endcomment %}
**デフォルトで無効とされたリリース: v17.06**
@z

@x
**Removed In Release: v17.12**
@y
{% comment %}
**Removed In Release: v17.12**
{% endcomment %}
**削除されたリリース: v17.12**
@z

@x
Version 1.8.3 added a flag (`--disable-legacy-registry=false`) which prevents the
docker daemon from `pull`, `push`, and `login` operations against v1
registries.  Though enabled by default, this signals the intent to deprecate
the v1 protocol.
@y
{% comment %}
Version 1.8.3 added a flag (`--disable-legacy-registry=false`) which prevents the
docker daemon from `pull`, `push`, and `login` operations against v1
registries.  Though enabled by default, this signals the intent to deprecate
the v1 protocol.
{% endcomment %}
1.8.3 においてフラグ `--disable-legacy-registry=false` が追加されました。
これは Docker デーモンが V1 レジストリに対して `pull`、`push`、`login` ができないようにするものです。
デフォルトは有効になっていますが、ゆくゆくは v1 プロトコルを廃止とする意図を示しています。
@z

@x
Support for the v1 protocol to the public registry was removed in 1.13. Any
mirror configurations using v1 should be updated to use a
[v2 registry mirror](https://docs.docker.com/registry/recipes/mirror/).
@y
{% comment %}
Support for the v1 protocol to the public registry was removed in 1.13. Any
mirror configurations using v1 should be updated to use a
[v2 registry mirror](https://docs.docker.com/registry/recipes/mirror/).
{% endcomment %}
公開レジストリに対する V1 プロトコルのサポートは、1.13 において削除されました。
V1 を利用したミラー設定は、すべて [v2 レジストリーミラー]({{ site.baseurl }}/registry/recipes/mirror/) を利用して更新する必要があります。
@z

@x
Starting with Docker 17.12, support for V1 registries has been removed, and the
`--disable-legacy-registry` flag can no longer be used, and `dockerd` will fail to
start when set.
@y
{% comment %}
Starting with Docker 17.12, support for V1 registries has been removed, and the
`--disable-legacy-registry` flag can no longer be used, and `dockerd` will fail to
start when set.
{% endcomment %}
Docker 17.12 以降は、V1 レジストリに対するサポートが削除されました。
そして `--disable-legacy-registry` フラグは今後利用できません。
これが設定されている場合、`dockerd` は処理に失敗します。
@z

@x
### `--disable-legacy-registry` override daemon option
@y
{% comment %}
### `--disable-legacy-registry` override daemon option
{% endcomment %}
{: #--disable-legacy-registry-override-daemon-option }
### オーバーライドデーモンオプション `--disable-legacy-registry`
@z

@x
**Disabled In Release: v17.12**
@y
{% comment %}
**Disabled In Release: v17.12**
{% endcomment %}
**無効化されたリリース: v17.12**
@z

@x
**Target For Removal In Release: v18.03**
@y
{% comment %}
**Target For Removal In Release: v18.03**
{% endcomment %}
**削除対象とされたリリース: v18.03**
@z

@x
The `--disable-legacy-registry` flag was disabled in Docker 17.12 and will print
an error when used. For this error to be printed, the flag itself is still present,
but hidden. The flag will be removed in Docker 18.03.
@y
{% comment %}
The `--disable-legacy-registry` flag was disabled in Docker 17.12 and will print
an error when used. For this error to be printed, the flag itself is still present,
but hidden. The flag will be removed in Docker 18.03.
{% endcomment %}
`--disable-legacy-registry` フラグは Docker 17.12 において無効化されました。
これを用いた場合にはエラー表示されます。
このエラー表示を行うことから、フラグそのものはまだ存在していますが、隠されています。
このフラグは Docker 18.03 において削除される予定です。
@z

@x
### Docker Content Trust ENV passphrase variables name change
@y
{% comment %}
### Docker Content Trust ENV passphrase variables name change
{% endcomment %}
{: #docker-content-trust-env-passphrase-variables-name-change }
### Docker コンテントトラストのパスフレーズ変数の名称変更
@z

@x
**Deprecated In Release: [v1.9.0](https://github.com/docker/docker/releases/tag/v1.9.0)**
@y
{% comment %}
**Deprecated In Release: [v1.9.0](https://github.com/docker/docker/releases/tag/v1.9.0)**
{% endcomment %}
**廃止決定されたリリース: [v1.9.0](https://github.com/docker/docker/releases/tag/v1.9.0)**
@z

@x
**Removed In Release: [v1.12.0](https://github.com/docker/docker/releases/tag/v1.12.0)**
@y
{% comment %}
**Removed In Release: [v1.12.0](https://github.com/docker/docker/releases/tag/v1.12.0)**
{% endcomment %}
**削除されたリリース: [v1.12.0](https://github.com/docker/docker/releases/tag/v1.12.0)**
@z

@x
Since 1.9, Docker Content Trust Offline key has been renamed to Root key and the Tagging key has been renamed to Repository key. Due to this renaming, we're also changing the corresponding environment variables
@y
{% comment %}
Since 1.9, Docker Content Trust Offline key has been renamed to Root key and the Tagging key has been renamed to Repository key. Due to this renaming, we're also changing the corresponding environment variables
{% endcomment %}
v1.9 以降、Docker コンテントトラストのオフライン鍵はルート鍵に、タギング鍵はリポジトリ鍵にそれぞれ名称変更されています。
この変更にともなって、対応する環境変数も変更されています。
@z

@x
- DOCKER_CONTENT_TRUST_OFFLINE_PASSPHRASE is now named DOCKER_CONTENT_TRUST_ROOT_PASSPHRASE
- DOCKER_CONTENT_TRUST_TAGGING_PASSPHRASE is now named DOCKER_CONTENT_TRUST_REPOSITORY_PASSPHRASE
@y
{% comment %}
- DOCKER_CONTENT_TRUST_OFFLINE_PASSPHRASE is now named DOCKER_CONTENT_TRUST_ROOT_PASSPHRASE
- DOCKER_CONTENT_TRUST_TAGGING_PASSPHRASE is now named DOCKER_CONTENT_TRUST_REPOSITORY_PASSPHRASE
{% endcomment %}
- DOCKER_CONTENT_TRUST_OFFLINE_PASSPHRASE は DOCKER_CONTENT_TRUST_ROOT_PASSPHRASE に名称変更されました。
- DOCKER_CONTENT_TRUST_TAGGING_PASSPHRASE は DOCKER_CONTENT_TRUST_REPOSITORY_PASSPHRASE に名称変更されました。
@z

@x
### `--api-enable-cors` flag on dockerd
@y
{% comment %}
### `--api-enable-cors` flag on dockerd
{% endcomment %}
{: #--api-enable-cors-flag-on-dockerd }
### dockerd の `--api-enable-cors` フラグ
@z

@x
**Deprecated In Release: [v1.6.0](https://github.com/docker/docker/releases/tag/v1.6.0)**
@y
{% comment %}
**Deprecated In Release: [v1.6.0](https://github.com/docker/docker/releases/tag/v1.6.0)**
{% endcomment %}
**廃止決定されたリリース: [v1.6.0](https://github.com/docker/docker/releases/tag/v1.6.0)**
@z

@x
**Removed In Release: [v17.09](https://github.com/docker/docker-ce/releases/tag/v17.09.0-ce)**
@y
{% comment %}
**Removed In Release: [v17.09](https://github.com/docker/docker-ce/releases/tag/v17.09.0-ce)**
{% endcomment %}
**削除リリース: [v17.09](https://github.com/docker/docker-ce/releases/tag/v17.09.0-ce)**
@z

@x
The flag `--api-enable-cors` is deprecated since v1.6.0. Use the flag
`--api-cors-header` instead.
@y
{% comment %}
The flag `--api-enable-cors` is deprecated since v1.6.0. Use the flag
`--api-cors-header` instead.
{% endcomment %}
フラグ `--api-enable-cors` は v1.6.0 より廃止決定されていました。
これに代わって、フラグ `--api-cors-header` を利用してください。
@z
