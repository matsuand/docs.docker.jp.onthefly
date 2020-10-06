%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Isolate containers within a user namespace
keywords: security, namespaces
title: Isolate containers with a user namespace
---
@y
---
description: Isolate containers within a user namespace
keywords: security, namespaces
title: ユーザー名前空間を使ったコンテナーの分離
---
@z

@x
Linux namespaces provide isolation for running processes, limiting their access
to system resources without the running process being aware of the limitations.
For more information on Linux namespaces, see
[Linux namespaces](https://www.linux.com/news/understanding-and-securing-linux-namespaces){: target="_blank" class="_" }.
@y
{% comment %}
Linux namespaces provide isolation for running processes, limiting their access
to system resources without the running process being aware of the limitations.
For more information on Linux namespaces, see
[Linux namespaces](https://www.linux.com/news/understanding-and-securing-linux-namespaces){: target="_blank" class="_" }.
{% endcomment %}
Linux の名前空間は、プロセスによるシステムリソースへのアクセスを制限しながら、プロセスを分離して実行します。
実行されたプロセスにとっては、アクセスが制限されていることはわかりません。
Linux の名前空間に関する詳細は [Linux 名前空間](https://www.linux.com/news/understanding-and-securing-linux-namespaces){: target="_blank" class="_" } を参照してください。
@z

@x
The best way to prevent privilege-escalation attacks from within a container is
to configure your container's applications to run as unprivileged users. For
containers whose processes must run as the `root` user within the container, you
can re-map this user to a less-privileged user on the Docker host. The mapped
user is assigned a range of UIDs which function within the namespace as normal
UIDs from 0 to 65536, but have no privileges on the host machine itself.
@y
{% comment %}
The best way to prevent privilege-escalation attacks from within a container is
to configure your container's applications to run as unprivileged users. For
containers whose processes must run as the `root` user within the container, you
can re-map this user to a less-privileged user on the Docker host. The mapped
user is assigned a range of UIDs which function within the namespace as normal
UIDs from 0 to 65536, but have no privileges on the host machine itself.
{% endcomment %}
コンテナー内部からの権限昇格による攻撃を防ぐ最大の方法は、コンテナーのアプリケーションを非特権ユーザーで実行することです。
コンテナー内において、プロセスを `root` ユーザーで実行しなければならない場合は、この `root` ユーザーを、Docker ホスト上のより権限の少ないユーザーに再割り当て（re-map）します。
名前空間内では通常 0 から 65536 という範囲の UID が正しく機能しますが、割り当て対象のユーザーには、この範囲内で UID を定めます。
ただしこの UID はホストマシン上では何の権限もないものです。
@z

@x
## About remapping and subordinate user and group IDs
@y
{% comment %}
## About remapping and subordinate user and group IDs
{% endcomment %}
{: #about-remapping-and-subordinate-user-and-group-ids }
## ユーザー ID、グループ ID の再割り当てとサブ ID
@z

@x
The remapping itself is handled by two files: `/etc/subuid` and `/etc/subgid`.
Each file works the same, but one is concerned with the user ID range, and the
other with the group ID range. Consider the following entry in `/etc/subuid`:
@y
{% comment %}
The remapping itself is handled by two files: `/etc/subuid` and `/etc/subgid`.
Each file works the same, but one is concerned with the user ID range, and the
other with the group ID range. Consider the following entry in `/etc/subuid`:
{% endcomment %}
再割り当て自体は 2 つのファイル、`/etc/subuid` と `/etc/subgid` によって扱われます。
2 つのファイルとも同様の動作をしますが、一方はユーザー ID 範囲に関して、他方はグループ ID 範囲に関して取り扱うものです。
`/etc/subuid` 内に以下のエントリーがあるとします。
@z

@x
```none
testuser:231072:65536
```
@y
```none
testuser:231072:65536
```
@z

@x
This means that `testuser` is assigned a subordinate user ID range of `231072`
and the next 65536 integers in sequence. UID `231072` is mapped within the
namespace (within the container, in this case) as UID `0` (`root`). UID `231073`
is mapped as UID `1`, and so forth. If a process attempts to escalate privilege
outside of the namespace, the process is running as an unprivileged high-number
UID on the host, which does not even map to a real user. This means the process
has no privileges on the host system at all.
@y
{% comment %}
This means that `testuser` is assigned a subordinate user ID range of `231072`
and the next 65536 integers in sequence. UID `231072` is mapped within the
namespace (within the container, in this case) as UID `0` (`root`). UID `231073`
is mapped as UID `1`, and so forth. If a process attempts to escalate privilege
outside of the namespace, the process is running as an unprivileged high-number
UID on the host, which does not even map to a real user. This means the process
has no privileges on the host system at all.
{% endcomment %}
上の意味は、`testuser` のサブ ID を `231072` から 65536 個分の連続した整数範囲で割り当てるものです。
UID `231072` は、名前空間内（ここではコンテナー内）においては UID `0`（`root`）に割り当てられています。
同じく UID `231073` は UID `1` へ割り当てられています。
以下同様です。
名前空間の外部から権限昇格を試みるようなプロセスがあったとします。
ホスト上では権限を持たない大きな数値の UID によってプロセスが起動しており、その UID は現実のユーザーには割り当てられていません。
つまりそのプロセスは、ホストシステム上での権限をまったく持たないということです。
@z

@x
> Multiple ranges
>
> It is possible to assign multiple subordinate ranges for a given user or group
> by adding multiple non-overlapping mappings for the same user or group in the
> `/etc/subuid` or `/etc/subgid` file. In this case, Docker uses only the first
> five mappings, in accordance with the kernel's limitation of only five entries
> in `/proc/self/uid_map` and `/proc/self/gid_map`.
@y
{% comment %}
> Multiple ranges
>
> It is possible to assign multiple subordinate ranges for a given user or group
> by adding multiple non-overlapping mappings for the same user or group in the
> `/etc/subuid` or `/etc/subgid` file. In this case, Docker uses only the first
> five mappings, in accordance with the kernel's limitation of only five entries
> in `/proc/self/uid_map` and `/proc/self/gid_map`.
{% endcomment %}
> 複数の範囲指定
>
> 1 つのユーザーまたはグループに対して、サブ ID の範囲を複数割り当てることができます。
> これを行うには `/etc/subuid` または `/etc/subgid` において 1 つのユーザーあるいはグループに対して、互いに重複しない範囲指定を複数行います。
> これを行った場合、Docker は複数の範囲指定の中から、はじめの 5 つ分のみを利用します。
> カーネルが `/proc/self/uid_map` や `/proc/self/gid_map` において、5 つ分のエントリーしか取り扱わないという制約に従ったものです。
@z

@x
When you configure Docker to use the `userns-remap` feature, you can optionally
specify an existing user and/or group, or you can specify `default`. If you
specify `default`, a user and group `dockremap` is created and used for this
purpose.
@y
{% comment %}
When you configure Docker to use the `userns-remap` feature, you can optionally
specify an existing user and/or group, or you can specify `default`. If you
specify `default`, a user and group `dockremap` is created and used for this
purpose.
{% endcomment %}
Docker において `userns-remap` 機能を利用する際には、必要に応じて既存のユーザーやグループを指定することができます。
あるいは `default` を指定することもできます。
`default` を指定した場合、`dockremap` というユーザーおよびグループが生成され、この機能のために利用されます。
@z

@x
> **Warning**: Some distributions, such as RHEL and CentOS 7.3, do not
> automatically add the new group to the `/etc/subuid` and `/etc/subgid` files.
> You are responsible for editing these files and assigning non-overlapping
> ranges, in this case. This step is covered in [Prerequisites](#prerequisites).
{: .warning-vanila }
@y
{% comment %}
> **Warning**: Some distributions, such as RHEL and CentOS 7.3, do not
> automatically add the new group to the `/etc/subuid` and `/etc/subgid` files.
> You are responsible for editing these files and assigning non-overlapping
> ranges, in this case. This step is covered in [Prerequisites](#prerequisites).
{: .warning-vanila }
{% endcomment %}
> **警告**: RHEL や CentOS 7.3 などのディストリビューションにおいて、 `/etc/subuid` と `/etc/subgid` に対して新たなグループの追加を自動では行わないものがあります。
> その場合はこれらのファイルを編集する必要があり、他とは重複しないような範囲指定を行う必要があります。
> このことは [前提条件](#prerequisites) において触れています。
{: .warning-vanila }
@z

@x
It is very important that the ranges do not overlap, so that a process cannot gain
access in a different namespace. On most Linux distributions, system utilities
manage the ranges for you when you add or remove users.
@y
{% comment %}
It is very important that the ranges do not overlap, so that a process cannot gain
access in a different namespace. On most Linux distributions, system utilities
manage the ranges for you when you add or remove users.
{% endcomment %}
範囲指定は重複していないことがとても重要です。
そうなっていないと、プロセスが別の名前空間内でのアクセスを実現できません。
Linux ディストリビューションの多くでは、ユーザーの追加、削除を行う際の ID 範囲指定を制御するシステムユーティリティーを提供しています。
@z

@x
This re-mapping is transparent to the container, but introduces some
configuration complexity in situations where the container needs access to
resources on the Docker host, such as bind mounts into areas of the filesystem
that the system user cannot write to. From a security standpoint, it is best to
avoid these situations.
@y
{% comment %}
This re-mapping is transparent to the container, but introduces some
configuration complexity in situations where the container needs access to
resources on the Docker host, such as bind mounts into areas of the filesystem
that the system user cannot write to. From a security standpoint, it is best to
avoid these situations.
{% endcomment %}
この再割り当ての機能は、コンテナーにおいてはわかりやすいものです。
ただし設定を行う上では複雑な状況がありえます。
たとえば Docker ホスト上のリソースにコンテナーがアクセスする必要がある場合です。
具体的にバインドマウントでは、システムユーザーが書き込み不能なファイルシステムの領域にマウントを行います。
セキュリティの観点からは、こういった状況は避けることが一番です。
@z

@x
## Prerequisites
@y
{% comment %}
## Prerequisites
{% endcomment %}
{: #prerequisites }
## 前提条件
@z

@x
1.  The subordinate UID and GID ranges must be associated with an existing user,
    even though the association is an implementation detail. The user owns
    the namespaced storage directories under `/var/lib/docker/`. If you don't
    want to use an existing user, Docker can create one for you and use that. If
    you want to use an existing username or user ID, it must already exist.
    Typically, this means that the relevant entries need to be in
    `/etc/passwd` and `/etc/group`, but if you are using a different
    authentication back-end, this requirement may translate differently.
@y
{% comment %}
1.  The subordinate UID and GID ranges must be associated with an existing user,
    even though the association is an implementation detail. The user owns
    the namespaced storage directories under `/var/lib/docker/`. If you don't
    want to use an existing user, Docker can create one for you and use that. If
    you want to use an existing username or user ID, it must already exist.
    Typically, this means that the relevant entries need to be in
    `/etc/passwd` and `/etc/group`, but if you are using a different
    authentication back-end, this requirement may translate differently.
{% endcomment %}
1.  サブ UID とサブ GID の設定範囲は、既存ユーザーに対して関連づいていなければなりません。
    ただし関連づけは、実装上の都合によるものです。
    ユーザーは `/var/lib/docker/` 配下に、名前空間により分けられた保存ディレクトリを所有します。
    既存ユーザーを利用したくない場合は、Docker がかわりにユーザーを生成して利用してくれます。
    逆に既存ユーザーの名前または ID を利用したい場合は、あらかじめ存在していなければなりません。
    通常は `/etc/passwd` や `/etc/group` 内に、対応するエントリーが存在していなければなりませんが、別の認証システムをバックエンドに利用している場合は、そのファイルのエントリーは、別の形で取り扱われることになります。
@z

@x
    To verify this, use the `id` command:
@y
    {% comment %}
    To verify this, use the `id` command:
    {% endcomment %}
    上のことを確認するために `id` コマンドを実行します。
@z

@x
    ```bash
    $ id testuser
@y
    ```bash
    $ id testuser
@z

@x
    uid=1001(testuser) gid=1001(testuser) groups=1001(testuser)
    ```
@y
    uid=1001(testuser) gid=1001(testuser) groups=1001(testuser)
    ```
@z

@x
2.  The way the namespace remapping is handled on the host is using two files,
    `/etc/subuid` and `/etc/subgid`. These files are typically managed
    automatically when you add or remove users or groups, but on a few
    distributions such as RHEL and CentOS 7.3, you may need to manage these
    files manually.
@y
{% comment %}
2.  The way the namespace remapping is handled on the host is using two files,
    `/etc/subuid` and `/etc/subgid`. These files are typically managed
    automatically when you add or remove users or groups, but on a few
    distributions such as RHEL and CentOS 7.3, you may need to manage these
    files manually.
{% endcomment %}
2.  名前空間の再割り当てがホスト上において処理される際には、2 つのファイルが利用されます。
    `/etc/subuid` と `/etc/subgid` です。
    このファイルは通常は、ユーザーやグループの追加、削除の際に、自動的に生成管理されます。
    ただし RHEL や CentOS 7.3 のような一部のディストリビューションでは、このファイルの手動での管理を必要とするものがあります。
@z

@x
    Each file contains three fields: the username or ID of the user, followed by
    a beginning UID or GID (which is treated as UID or GID 0 within the namespace)
    and a maximum number of UIDs or GIDs available to the user. For instance,
    given the following entry:
@y
    {% comment %}
    Each file contains three fields: the username or ID of the user, followed by
    a beginning UID or GID (which is treated as UID or GID 0 within the namespace)
    and a maximum number of UIDs or GIDs available to the user. For instance,
    given the following entry:
    {% endcomment %}
    この 2 つのファイルでは 3 つの項目が記述されます。
    ユーザー名あるいはユーザー ID、続いて UID または GID の開始値（名前空間内では UID または GID がゼロとして扱われるもの）、最後にそのユーザーにおいて利用可能な UID または GID の最大数です。
    たとえば以下のようなエントリーがあったとします。
@z

@x
    ```none
    testuser:231072:65536
    ```
@y
    ```none
    testuser:231072:65536
    ```
@z

@x
    This means that user-namespaced processes started by `testuser` are
    owned by host UID `231072` (which looks like UID `0` inside the
    namespace) through 296607 (231072 + 65536 - 1). These ranges should not overlap,
    to ensure that namespaced processes cannot access each other's namespaces.
@y
    {% comment %}
    This means that user-namespaced processes started by `testuser` are
    owned by host UID `231072` (which looks like UID `0` inside the
    namespace) through 296607 (231072 + 65536 - 1). These ranges should not overlap,
    to ensure that namespaced processes cannot access each other's namespaces.
    {% endcomment %}
    上が意味することは以下のとおりです。
    `testuser` によって起動されたユーザー名前空間のプロセスは、ホスト上の `231072`（名前空間内では UID `0` として見えるもの）から `296607` (231072 + 65536 - 1) までの間の UID によって所有されます。
    この範囲は他と重複してはなりません。
    これを確実に行うことで、名前空間内のプロセスが別の名前空間へアクセスできないようにします。
@z

@x
    After adding your user, check `/etc/subuid` and `/etc/subgid` to see if your
    user has an entry in each. If not, you need to add it, being careful to
    avoid overlap.
@y
    {% comment %}
    After adding your user, check `/etc/subuid` and `/etc/subgid` to see if your
    user has an entry in each. If not, you need to add it, being careful to
    avoid overlap.
    {% endcomment %}
    ユーザーを追加したら `/etc/subuid` と `/etc/subgid` のそれぞれにおいて、追加したユーザーを表わすエントリーが含まれていることを確認してください。
    もしエントリーが存在しなければ、追加してください。
    ID の重複には十分に注意してください。
@z

@x
    If you want to use the `dockremap` user automatically created by Docker,
    check for the `dockremap` entry in these files **after**
    configuring and restarting Docker.
@y
    {% comment %}
    If you want to use the `dockremap` user automatically created by Docker,
    check for the `dockremap` entry in these files **after**
    configuring and restarting Docker.
    {% endcomment %}
    Docker によって自動的に生成される `dockremap` ユーザーを利用したい場合は、`dockremap` のエントリーがそのファイル内にあるかどうかを確認しますが、それは設定を行って Docker を再起動した **後に** 行ってください。
@z

@x
3.  If there are any locations on the Docker host where the unprivileged
    user needs to write, adjust the permissions of those locations
    accordingly. This is also true if you want to use the `dockremap` user
    automatically created by Docker, but you can't modify the
    permissions until after configuring and restarting Docker.
@y
{% comment %}
3.  If there are any locations on the Docker host where the unprivileged
    user needs to write, adjust the permissions of those locations
    accordingly. This is also true if you want to use the `dockremap` user
    automatically created by Docker, but you can't modify the
    permissions until after configuring and restarting Docker.
{% endcomment %}
3.  Docker ホスト上に、非特権ユーザーが書き込みを必要とするディレクトリがあるとします。
    その場合はそのディレクトリのパーミッションを適切に調整してください。
    これは Docker によって自動生成された `dockremap` ユーザーを利用する場合も同様ですが、このときにはパーミッション変更後に Docker を再起動しない限り、その設定変更は反映されません。
@z

@x
4.  Enabling `userns-remap` effectively masks existing image and container
    layers, as well as other Docker objects within `/var/lib/docker/`. This is
    because Docker needs to adjust the ownership of these resources and actually
    stores them in a subdirectory within `/var/lib/docker/`. It is best to enable
    this feature on a new Docker installation rather than an existing one.
@y
{% comment %}
4.  Enabling `userns-remap` effectively masks existing image and container
    layers, as well as other Docker objects within `/var/lib/docker/`. This is
    because Docker needs to adjust the ownership of these resources and actually
    stores them in a subdirectory within `/var/lib/docker/`. It is best to enable
    this feature on a new Docker installation rather than an existing one.
{% endcomment %}
4.  `userns-remap` を有効にすることで、既存イメージやコンテナーのレイヤーは効果的に保護されます。
    これは `/var/lib/docker/` 内にある Docker オブジェクトすべてについて言えることです。
    そもそも Docker ではそういったリソース類の所有者を調整する必要があり、そうして `/var/lib/docker/` 内のサブディレクトリに情報を保存するからです。
    新たな Docker インストールの際に、この機能を有効にして利用していくことがベストです。
@z

@x
    Along the same lines, if you disable `userns-remap` you can't access any
    of the resources created while it was enabled.
@y
    {% comment %}
    Along the same lines, if you disable `userns-remap` you can't access any
    of the resources created while it was enabled.
    {% endcomment %}
    同じような話として、`userns-remap` を無効化すると、有効化していたときに生成したリソースへは、いっさいアクセスできなくなります。
@z

@x
5.  Check the [limitations](#user-namespace-known-limitations) on user
    namespaces to be sure your use case is possible.
@y
{% comment %}
5.  Check the [limitations](#user-namespace-known-limitations) on user
    namespaces to be sure your use case is possible.
{% endcomment %}
5.  ユーザー名前空間に関する [制約](#user-namespace-known-limitations) を確認し、利用することが可能かどうかを判断してください。
@z

@x
## Enable userns-remap on the daemon
@y
{% comment %}
## Enable userns-remap on the daemon
{% endcomment %}
{: #enable-userns-remap-on-the-daemon }
## デーモン上での userns-remap の有効化
@z

@x
You can start `dockerd` with the `--userns-remap` flag or follow this
procedure to configure the daemon using the `daemon.json` configuration file.
The `daemon.json` method is recommended. If you use the flag, use the following
command as a model:
@y
{% comment %}
You can start `dockerd` with the `--userns-remap` flag or follow this
procedure to configure the daemon using the `daemon.json` configuration file.
The `daemon.json` method is recommended. If you use the flag, use the following
command as a model:
{% endcomment %}
`dockerd` の実行時には `--userns-remap` フラグを利用することができます。
または以降の手順に示すように、設定ファイル `daemon.json` を使ってデーモンを設定することができます。
`daemon.json` ファイルを用いる方法が推奨されます。
フラグを利用する方法をとる場合、コマンドのひな形は以下のようになります。
@z

@x
```bash
$ dockerd --userns-remap="testuser:testuser"
```
@y
```bash
$ dockerd --userns-remap="testuser:testuser"
```
@z

@x
1.  Edit `/etc/docker/daemon.json`. Assuming the file was previously empty, the
    following entry enables `userns-remap` using user and group called
    `testuser`. You can address the user and group by ID or name. You only need to
    specify the group name or ID if it is different from the user name or ID. If
    you provide both the user and group name or ID, separate them by a colon
    (`:`) character. The following formats all work for the value, assuming
    the UID and GID of `testuser` are `1001`:
@y
{% comment %}
1.  Edit `/etc/docker/daemon.json`. Assuming the file was previously empty, the
    following entry enables `userns-remap` using user and group called
    `testuser`. You can address the user and group by ID or name. You only need to
    specify the group name or ID if it is different from the user name or ID. If
    you provide both the user and group name or ID, separate them by a colon
    (`:`) character. The following formats all work for the value, assuming
    the UID and GID of `testuser` are `1001`:
{% endcomment %}
1.  `/etc/docker/daemon.json` を編集します。
    ファイルはまったくの空であったとします。
    以下に示す項目は、`testuser` というユーザーおよびグループを使って `userns-remap` を有効にするものです。
    ユーザーやグループは、ID と名前のいずれでも指定が可能です。
    グループ名やグループ ID は、それがユーザー名またはユーザー ID とは異なる場合のみ、指定することが必要です。
    ユーザーとグループの名前あるいは ID をともに指定する場合は、両者をコロン（`:`）で区切ります。
    以下の書式は、すべて有効な指定です。
    ここで `testuser` の UID および GID は `1001` であるものとします。
@z

@x
    - `testuser`
    - `testuser:testuser`
    - `1001`
    - `1001:1001`
    - `testuser:1001`
    - `1001:testuser`
@y
    - `testuser`
    - `testuser:testuser`
    - `1001`
    - `1001:1001`
    - `testuser:1001`
    - `1001:testuser`
@z

@x
    ```json
    {
      "userns-remap": "testuser"
    }
    ```
@y
    ```json
    {
      "userns-remap": "testuser"
    }
    ```
@z

@x
    > **Note**: To use the `dockremap` user and have Docker create it for you,
    > set the value to `default` rather than `testuser`.
@y
    {% comment %}
    > **Note**: To use the `dockremap` user and have Docker create it for you,
    > set the value to `default` rather than `testuser`.
    {% endcomment %}
    > **メモ**: `dockremap` ユーザーは Docker が生成します。
    > `dockremap` ユーザーを利用する場合は、設定値に `testuser` ではなく `default` を指定してください。
@z

@x
    Save the file and restart Docker.
@y
    {% comment %}
    Save the file and restart Docker.
    {% endcomment %}
    ファイルを保存して Docker を再起動します。
@z

@x
2.  If you are using the `dockremap` user, verify that Docker created it using
    the `id` command.
@y
{% comment %}
2.  If you are using the `dockremap` user, verify that Docker created it using
    the `id` command.
{% endcomment %}
2.  `dockremap` ユーザーを利用する場合は、`id` コマンドを実行して Docker がそのユーザーを生成していることを確認します。
@z

@x
    ```bash
    $ id dockremap
@y
    ```bash
    $ id dockremap
@z

@x
    uid=112(dockremap) gid=116(dockremap) groups=116(dockremap)
    ```
@y
    uid=112(dockremap) gid=116(dockremap) groups=116(dockremap)
    ```
@z

@x
    Verify that the entry has been added to `/etc/subuid` and `/etc/subgid`:
@y
    {% comment %}
    Verify that the entry has been added to `/etc/subuid` and `/etc/subgid`:
    {% endcomment %}
    `/etc/subuid` と `/etc/subgid` に対してエントリーが追加されていることを確認します。
@z

@x
    ```bash
    $ grep dockremap /etc/subuid
@y
    ```bash
    $ grep dockremap /etc/subuid
@z

@x
    dockremap:231072:65536
@y
    dockremap:231072:65536
@z

@x
    $ grep dockremap /etc/subgid
@y
    $ grep dockremap /etc/subgid
@z

@x
    dockremap:231072:65536
    ```
@y
    dockremap:231072:65536
    ```
@z

@x
    If these entries are not present, edit the files as the `root` user and
    assign a starting UID and GID that is the highest-assigned one plus the
    offset (in this case, `65536`). Be careful not to allow any overlap in the
    ranges.
@y
    {% comment %}
    If these entries are not present, edit the files as the `root` user and
    assign a starting UID and GID that is the highest-assigned one plus the
    offset (in this case, `65536`). Be careful not to allow any overlap in the
    ranges.
    {% endcomment %}
    上のようなエントリーが存在しない場合は、`root` ユーザーになってこのファイルを編集します。
    そして UID または GID の開始値として、すでに割り当てられている最大値を割り当て、これに加えてオフセット値（ここでは `65536`）を指定します。
    複数の範囲指定のそれぞれにて ID の重複がないようにします。
@z

@x
3.  Verify that previous images are not available using the `docker image ls`
    command. The output should be empty.
@y
{% comment %}
3.  Verify that previous images are not available using the `docker image ls`
    command. The output should be empty.
{% endcomment %}
3.  `docker image ls` コマンドを実行し、以前利用していたイメージがないことを確認します。
    出力には何も表示されないはずです。
@z

@x
4.  Start a container from the `hello-world` image.
@y
{% comment %}
4.  Start a container from the `hello-world` image.
{% endcomment %}
4.  `hello-world` イメージを使ってコンテナーを起動します。
@z

@x
    ```bash
    $ docker run hello-world
    ```
@y
    ```bash
    $ docker run hello-world
    ```
@z

@x
4.  Verify that a namespaced directory exists within `/var/lib/docker/` named
    with the UID and GID of the namespaced user, owned by that UID and GID,
    and not group-or-world-readable. Some of the subdirectories are still
    owned by `root` and have different permissions.
@y
{% comment %}
4.  Verify that a namespaced directory exists within `/var/lib/docker/` named
    with the UID and GID of the namespaced user, owned by that UID and GID,
    and not group-or-world-readable. Some of the subdirectories are still
    owned by `root` and have different permissions.
{% endcomment %}
4.  `/var/lib/docker/` 配下に名前空間によるディレクトリがあることを確認します。
    ディレクトリ名には、名前空間におけるユーザーの UID と GID が用いられています。
    その所有は UID および GID であり、グループやワールドは読み込み権限がありません。
    サブディレクトリの中には `root` が所有しているものがあり、パーミッションも別のものになっています。
@z

@x
    ```bash
    $ sudo ls -ld /var/lib/docker/231072.231072/
@y
    ```bash
    $ sudo ls -ld /var/lib/docker/231072.231072/
@z

@x
    drwx------ 11 231072 231072 11 Jun 21 21:19 /var/lib/docker/231072.231072/
@y
    drwx------ 11 231072 231072 11 Jun 21 21:19 /var/lib/docker/231072.231072/
@z

@x
    $ sudo ls -l /var/lib/docker/231072.231072/
@y
    $ sudo ls -l /var/lib/docker/231072.231072/
@z

@x
    total 14
    drwx------ 5 231072 231072 5 Jun 21 21:19 aufs
    drwx------ 3 231072 231072 3 Jun 21 21:21 containers
    drwx------ 3 root   root   3 Jun 21 21:19 image
    drwxr-x--- 3 root   root   3 Jun 21 21:19 network
    drwx------ 4 root   root   4 Jun 21 21:19 plugins
    drwx------ 2 root   root   2 Jun 21 21:19 swarm
    drwx------ 2 231072 231072 2 Jun 21 21:21 tmp
    drwx------ 2 root   root   2 Jun 21 21:19 trust
    drwx------ 2 231072 231072 3 Jun 21 21:19 volumes
    ```
@y
    total 14
    drwx------ 5 231072 231072 5 Jun 21 21:19 aufs
    drwx------ 3 231072 231072 3 Jun 21 21:21 containers
    drwx------ 3 root   root   3 Jun 21 21:19 image
    drwxr-x--- 3 root   root   3 Jun 21 21:19 network
    drwx------ 4 root   root   4 Jun 21 21:19 plugins
    drwx------ 2 root   root   2 Jun 21 21:19 swarm
    drwx------ 2 231072 231072 2 Jun 21 21:21 tmp
    drwx------ 2 root   root   2 Jun 21 21:19 trust
    drwx------ 2 231072 231072 3 Jun 21 21:19 volumes
    ```
@z

@x
    Your directory listing may have some differences, especially if you
    use a different container storage driver than `aufs`.
@y
    {% comment %}
    Your directory listing may have some differences, especially if you
    use a different container storage driver than `aufs`.
    {% endcomment %}
    特にコンテナーのストレージドライバーとして `aufs` 以外のものを利用している場合に、ディレクトリの一覧は、上とは異なる場合があります。
@z

@x
    The directories which are owned by the remapped user are used instead
    of the same directories directly beneath `/var/lib/docker/` and the
    unused versions (such as `/var/lib/docker/tmp/` in the example here)
    can be removed. Docker does not use them while `userns-remap` is
    enabled.
@y
    {% comment %}
    The directories which are owned by the remapped user are used instead
    of the same directories directly beneath `/var/lib/docker/` and the
    unused versions (such as `/var/lib/docker/tmp/` in the example here)
    can be removed. Docker does not use them while `userns-remap` is
    enabled.
    {% endcomment %}
    再割り当てによるユーザーが所有するディレクトリは、`/var/lib/docker/` 直下にある同名ディレクトリとは切り離されて利用されます。
    同名ディレクトリの使用しなくなった方（この例においては `/var/lib/docker/tmp/` など）は削除してかまいません。
    Docker は `userns-remap` が有効になっている間は、それを利用しません。
@z

@x
## Disable namespace remapping for a container
@y
{% comment %}
## Disable namespace remapping for a container
{% endcomment %}
{: #disable-namespace-remapping-for-a-container }
## コンテナーの名前空間再割り当ての無効化
@z

@x
If you enable user namespaces on the daemon, all containers are started with
user namespaces enabled by default. In some situations, such as privileged
containers, you may need to disable user namespaces for a specific container.
See
[user namespace known limitations](#user-namespace-known-limitations)
for some of these limitations.
@y
{% comment %}
If you enable user namespaces on the daemon, all containers are started with
user namespaces enabled by default. In some situations, such as privileged
containers, you may need to disable user namespaces for a specific container.
See
[user namespace known limitations](#user-namespace-known-limitations)
for some of these limitations.
{% endcomment %}
デーモンにおいてユーザー名前空間を有効にした場合に、コンテナーを起動すると、どのコンテナーにおいてもデフォルトでユーザー名前空間が有効になります。
特定の権限により実行されているコンテナーのような場合には、そのコンテナーに対してユーザー名前空間を明示的に無効にすることが必要になります。
そういった制約に関しては [ユーザー名前空間における既知の制約](#user-namespace-known-limitations) を参照してください。
@z

@x
To disable user namespaces for a specific container, add the `--userns=host`
flag to the `docker container create`, `docker container run`, or `docker container exec` command.
@y
{% comment %}
To disable user namespaces for a specific container, add the `--userns=host`
flag to the `docker container create`, `docker container run`, or `docker container exec` command.
{% endcomment %}
特定のコンテナーに対してユーザー名前空間を無効とするには、`docker container create`、`docker container run`、`docker container exec` の各コマンド実行の際に `--userns=host` フラグを追加します。
@z

@x
There is a side effect when using this flag: user remapping will not be enabled for that container but, because the read-only (image) layers are shared between containers, ownership of the containers filesystem will still be remapped.
@y
{% comment %}
There is a side effect when using this flag: user remapping will not be enabled for that container but, because the read-only (image) layers are shared between containers, ownership of the containers filesystem will still be remapped.
{% endcomment %}
このフラグを利用した場合には副作用があります。
ユーザーの再割り当てはそのコンテナーにおいて有効になりませんが、読み込み専用の（イメージ）レイヤーはコンテナー間で共有されるため、コンテナーのファイルシステムの所有者は、再割り当てされたままです。
@z

@x
What this means is that the whole container filesystem will belong to the user specified in the `--userns-remap` daemon config (`231072` in the example above). This can lead to unexpected behavior of programs inside the container. For instance `sudo` (which checks that its binaries belong to user `0`) or binaries with a `setuid` flag.
@y
{% comment %}
What this means is that the whole container filesystem will belong to the user specified in the `--userns-remap` daemon config (`231072` in the example above). This can lead to unexpected behavior of programs inside the container. For instance `sudo` (which checks that its binaries belong to user `0`) or binaries with a `setuid` flag.
{% endcomment %}
これは以下を意味します。
コンテナーのファイルシステムはすべて、デーモンフラグ `--userns-remap` において指定されたユーザー（上の例では `231072`）に属します。
このことから、コンテナー内のプログラムが予期しない動作となることがあります。
たとえば `sudo`（実行するバイナリがユーザー `0` に属するかどうかを確認する）や `setuid` フラグがついている実行バイナリの場合です。
@z

@x
## User namespace known limitations
@y
{% comment %}
## User namespace known limitations
{% endcomment %}
{: #user-namespace-known-limitations }
## ユーザー名前空間における既知の制約
@z

@x
The following standard Docker features are incompatible with running a Docker
daemon with user namespaces enabled:
@y
{% comment %}
The following standard Docker features are incompatible with running a Docker
daemon with user namespaces enabled:
{% endcomment %}
以下に示す標準的な Docker の機能は、ユーザー名前空間を有効にして Docker デーモンを起動した際には、動作が変わります。
@z

@x
- sharing PID or NET namespaces with the host (`--pid=host` or `--network=host`).
- external (volume or storage) drivers which are unaware or incapable of using
  daemon user mappings.
- Using the `--privileged` mode flag on `docker run` without also specifying
  `--userns=host`.
@y
{% comment %}
- sharing PID or NET namespaces with the host (`--pid=host` or `--network=host`).
- external (volume or storage) drivers which are unaware or incapable of using
  daemon user mappings.
- Using the `--privileged` mode flag on `docker run` without also specifying
  `--userns=host`.
{% endcomment %}
- ホストの指定（`--pid=host` or `--network=host`）を行った PID 名前空間や NET 名前空間の共有。
- デーモンのユーザー名前空間利用について、その利用がわからない、あるいは処理できない外部の（ボリュームまたはストレージ）ドライバー。
- `docker run` の実行において `--userns=host` がなく `--privileged` モードフラグを指定した場合。
@z

@x
User namespaces are an advanced feature and require coordination with other
capabilities. For example, if volumes are mounted from the host, file ownership
must be pre-arranged need read or write access to the volume contents.
@y
{% comment %}
User namespaces are an advanced feature and require coordination with other
capabilities. For example, if volumes are mounted from the host, file ownership
must be pre-arranged need read or write access to the volume contents.
{% endcomment %}
ユーザー名前空間は応用的な機能であって、他のケーパビリティーと連携が必要になります。
たとえばホストからボリュームをマウントするときには、あらかじめファイルの所有権を整備しておく必要があり、ボリューム内への読み書きの権限を与えておく必要があります。
@z

@x
While the root user inside a user-namespaced container process has many of the
expected privileges of the superuser within the container, the Linux kernel
imposes restrictions based on internal knowledge that this is a user-namespaced
process. One notable restriction is the inability to use the `mknod` command.
Permission is denied for device creation within the container when run by
the `root` user.
@y
{% comment %}
While the root user inside a user-namespaced container process has many of the
expected privileges of the superuser within the container, the Linux kernel
imposes restrictions based on internal knowledge that this is a user-namespaced
process. One notable restriction is the inability to use the `mknod` command.
Permission is denied for device creation within the container when run by
the `root` user.
{% endcomment %}
ユーザー名前空間を利用したコンテナーのプロセス内において root ユーザーは、コンテナー内のスーパーユーザーとして期待される数多くの権限を持ちます。
しかし Linux カーネルは、そこがユーザー名前空間内のプロセスであることを知っていて、それに基づいた機能制約を課します。
明らかな制約の例が、`mknod` コマンドを使えなくすることです。
`root` ユーザーによって実行されているコンテナー内においては、デバイスの生成は拒否されます。
@z
