%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Docker Engine 19.03 release notes
toc_min: 1
toc_max: 2
skip_read_time: true
---
@y
---
title: Docker Engine 19.03 リリースノート
toc_min: 1
toc_max: 2
skip_read_time: true
---
@z

@x
## 19.03.13
2020-09-16
@y
## 19.03.13
2020-09-16
@z

@x
### Builder
@y
### Builder
@z

@x
- buildkit: Fix nil dereference in cache logic [moby/moby#41279](https://github.com/moby/moby/pull/41279)
- buildkit: Treat Unix sockets as regular files during COPY/ADD [moby/moby#41269](https://github.com/moby/moby/pull/41269)
- buildkit: Ignore system and security xattrs in calculation to ensure consistent COPY caching regardless of SELinux environment [moby/moby#41222](https://github.com/moby/moby/pull/41222)
- buildkit: Make `--cache-from` behavior more reliable [moby/moby#41222](https://github.com/moby/moby/pull/41222)
- buildkit: Fix infinite loop burning CPU when exporting cache [moby/moby#41185](https://github.com/moby/moby/pull/41185)
@y
{% comment %}
- buildkit: Fix nil dereference in cache logic [moby/moby#41279](https://github.com/moby/moby/pull/41279)
- buildkit: Treat Unix sockets as regular files during COPY/ADD [moby/moby#41269](https://github.com/moby/moby/pull/41269)
- buildkit: Ignore system and security xattrs in calculation to ensure consistent COPY caching regardless of SELinux environment [moby/moby#41222](https://github.com/moby/moby/pull/41222)
- buildkit: Make `--cache-from` behavior more reliable [moby/moby#41222](https://github.com/moby/moby/pull/41222)
- buildkit: Fix infinite loop burning CPU when exporting cache [moby/moby#41185](https://github.com/moby/moby/pull/41185)
{% endcomment %}
- buildkit: キャッシュロジックにおける nil 参照を修正しました。
  [moby/moby#41279](https://github.com/moby/moby/pull/41279)
- buildkit: COPY/ADD の処理中は Unix ソケットを通常ファイルとして取り扱います。
  [moby/moby#41269](https://github.com/moby/moby/pull/41269)
- buildkit: SELinux 環境であっても、計算処理中はシステムおよびセキュリティ xattrs を無視することで、COPY 時に安定したキャッシングとなるようにしました。
  [moby/moby#41222](https://github.com/moby/moby/pull/41222)
- buildkit: `--cache-from` による処理をより安定化させました。
  [moby/moby#41222](https://github.com/moby/moby/pull/41222)
- buildkit: キャッシュエクスポート時の CPU 無限ループ書き込みを修正しました。
  [moby/moby#41185](https://github.com/moby/moby/pull/41185)
@z

@x
### Client
@y
{% comment %}
### Client
{% endcomment %}
{: #client }
### クライアント
@z

@x
- Bump Golang 1.13.15 [docker/cli#2674](https://github.com/docker/cli/pull/2674)
- Fix config file permission issues (~/.docker/config.json) [docker/cli#2631](https://github.com/docker/cli/pull/2631)
- build: Fix panic on terminals with zero height [docker/cli#2719](https://github.com/docker/cli/pull/2719)
- windows: Fix potential issue with newline character in console [docker/cli#2623](https://github.com/docker/cli/pull/2623)
@y
{% comment %}
- Bump Golang 1.13.15 [docker/cli#2674](https://github.com/docker/cli/pull/2674)
- Fix config file permission issues (~/.docker/config.json) [docker/cli#2631](https://github.com/docker/cli/pull/2631)
- build: Fix panic on terminals with zero height [docker/cli#2719](https://github.com/docker/cli/pull/2719)
- windows: Fix potential issue with newline character in console [docker/cli#2623](https://github.com/docker/cli/pull/2623)
{% endcomment %}
- Golang 1.13.15 へのアップデート。
  [docker/cli#2674](https://github.com/docker/cli/pull/2674)
- 設定ファイル（~/.docker/config.json）のパーミッション問題を修正しました。
  [docker/cli#2631](https://github.com/docker/cli/pull/2631)
- build: 高さゼロのターミナルにおける panic を修正しました。
  [docker/cli#2719](https://github.com/docker/cli/pull/2719)
- windows: コンソール画面での改行文字に関する潜在的な問題を修正しました。
  [docker/cli#2623](https://github.com/docker/cli/pull/2623)
@z

@x
### Networking
@y
{% comment %}
### Networking
{% endcomment %}
{: #networking }
### ネットワーク
@z

@x
- Clean up network sandbox on failure [moby/moby#41081](https://github.com/moby/moby/pull/41081)
- Fix shallow error messages by forwarding deadline-related errors to user [moby/moby#41312](https://github.com/moby/moby/pull/41312)
- Fix leaking of netns file descriptors [moby/moby#41287](https://github.com/moby/moby/41287)
@y
{% comment %}
- Clean up network sandbox on failure [moby/moby#41081](https://github.com/moby/moby/pull/41081)
- Fix shallow error messages by forwarding deadline-related errors to user [moby/moby#41312](https://github.com/moby/moby/pull/41312)
- Fix leaking of netns file descriptors [moby/moby#41287](https://github.com/moby/moby/41287)
{% endcomment %}
- 処理失敗時にネットワークサンドボックスを削除しました。
  [moby/moby#41081](https://github.com/moby/moby/pull/41081)
- deadline に関するエラーをユーザーにフォワードすることによって、情報量の少ないエラーメッセージを修正しました。
  [moby/moby#41312](https://github.com/moby/moby/pull/41312)
- ファイルディスクリプター netns の漏れを修正しました。
  [moby/moby#41287](https://github.com/moby/moby/pull/41287)
@z

@x
### Rootless
@y
### Rootless
@z

@x
- Fix port forwarder resource leak [moby/moby#41277](https://github.com/moby/moby/pull/41277)
@y
{% comment %}
- Fix port forwarder resource leak [moby/moby#41277](https://github.com/moby/moby/pull/41277)
{% endcomment %}
- port forwarder のリソースリークを修正しました。
  [moby/moby#41277](https://github.com/moby/moby/pull/41277)
@z

@x
### Runtime
@y
{% comment %}
### Runtime
{% endcomment %}
{: #runtime }
### ランタイム
@z

@x
- Bump Golang 1.13.15 [moby/moby#41334](https://github.com/moby/moby/pull/41334)
- Update to containerd 1.3.7 [moby/moby#40408](https://github.com/moby/moby/pull/40408)
@y
{% comment %}
- Bump Golang 1.13.15 [moby/moby#41334](https://github.com/moby/moby/pull/41334)
- Update to containerd 1.3.7 [moby/moby#40408](https://github.com/moby/moby/pull/40408)
{% endcomment %}
- Golang 1.13.15 へのアップデート。
  [moby/moby#41334](https://github.com/moby/moby/pull/41334)
- containerd 1.3.7 へのアップデート。
  [moby/moby#40408](https://github.com/moby/moby/pull/40408)
@z

@x
### Windows
@y
### Windows
@z

@x
- Fix slow Windows container start time when using servercore image [moby/moby#41192](https://github.com/moby/moby/pull/41192)
@y
{% comment %}
- Fix slow Windows container start time when using servercore image [moby/moby#41192](https://github.com/moby/moby/pull/41192)
{% endcomment %}
- servercore イメージ利用時に、Windows コンテナーの起動が遅くなることを修正しました。
  [moby/moby#41192](https://github.com/moby/moby/pull/41192)
@z

@x
## 19.03.12
2020-06-18
@y
## 19.03.12
2020-06-18
@z

@x
### Client
@y
{% comment %}
### Client
{% endcomment %}
{: #client-1 }
### クライアント
@z

@x
- Fix bug preventing logout from registry when using multiple config files (e.g. Windows vs WSL2 when using Docker Desktop) [docker/cli#2592](https://github.com/docker/cli/pull/2592)
- Fix regression preventing context metadata to be read [docker/cli#2586](https://github.com/docker/cli/pull/2586)
- Bump Golang 1.13.12 [docker/cli#2575](https://github.com/docker/cli/pull/2575)
@y
- Fix bug preventing logout from registry when using multiple config files (e.g. Windows vs WSL2 when using Docker Desktop) [docker/cli#2592](https://github.com/docker/cli/pull/2592)
- Fix regression preventing context metadata to be read [docker/cli#2586](https://github.com/docker/cli/pull/2586)
- Bump Golang 1.13.12 [docker/cli#2575](https://github.com/docker/cli/pull/2575)
@z

@x
### Networking
@y
{% comment %}
### Networking
{% endcomment %}
{: #networking-1 }
### ネットワーク
@z

@x
- Fix regression preventing daemon start up in a systemd-nspawn environment [moby/moby#41124](https://github.com/moby/moby/pull/41124) [moby/libnetwork#2567](https://github.com/moby/libnetwork/pull/2567)
- Fix the retry logic for creating overlay networks in swarm [moby/moby#41124](https://github.com/moby/moby/pull/41124) [moby/libnetwork#2565](https://github.com/moby/libnetwork/pull/2565)
@y
{% comment %}
- Fix regression preventing daemon start up in a systemd-nspawn environment [moby/moby#41124](https://github.com/moby/moby/pull/41124) [moby/libnetwork#2567](https://github.com/moby/libnetwork/pull/2567)
- Fix the retry logic for creating overlay networks in swarm [moby/moby#41124](https://github.com/moby/moby/pull/41124) [moby/libnetwork#2565](https://github.com/moby/libnetwork/pull/2565)
{% endcomment %}
- Fix regression preventing daemon start up in a systemd-nspawn environment [moby/moby#41124](https://github.com/moby/moby/pull/41124) [moby/libnetwork#2567](https://github.com/moby/libnetwork/pull/2567)
- Fix the retry logic for creating overlay networks in swarm [moby/moby#41124](https://github.com/moby/moby/pull/41124) [moby/libnetwork#2565](https://github.com/moby/libnetwork/pull/2565)
@z

@x
### Runtime
@y
{% comment %}
### Runtime
{% endcomment %}
{: #runtime-1 }
### ランタイム
@z

@x
- Bump Golang 1.13.12 [moby/moby#41082](https://github.com/moby/moby/pull/41082)
@y
{% comment %}
- Bump Golang 1.13.12 [moby/moby#41082](https://github.com/moby/moby/pull/41082)
{% endcomment %}
- Bump Golang 1.13.12 [moby/moby#41082](https://github.com/moby/moby/pull/41082)
@z

@x
## 19.03.11
2020-06-01
@y
## 19.03.11
2020-06-01
@z

@x
### Network
@y
{% comment %}
### Network
{% endcomment %}
{: #network }
### ネットワーク
@z

@x
Disable IPv6 Router Advertisements to prevent address spoofing. [CVE-2020-13401](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13401)
@y
{% comment %}
Disable IPv6 Router Advertisements to prevent address spoofing. [CVE-2020-13401](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13401)
{% endcomment %}
アドレススプーフィングを防止するため、IPv6 ルーター広告（Router Advertisements）を無効にする。
[CVE-2020-13401](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13401)
@z

@x
**Description**
@y
{% comment %}
**Description**
{% endcomment %}
**内容説明**
@z

@x
In the Docker default configuration, the container network interface is a virtual ethernet link going to the host (veth interface).
In this configuration, an attacker able to run a process as root in a container can send and receive arbitrary packets to the host using the `CAP_NET_RAW` capability (present in the default configuration).
@y
{% comment %}
In the Docker default configuration, the container network interface is a virtual ethernet link going to the host (veth interface).
In this configuration, an attacker able to run a process as root in a container can send and receive arbitrary packets to the host using the `CAP_NET_RAW` capability (present in the default configuration).
{% endcomment %}
In the Docker default configuration, the container network interface is a virtual ethernet link going to the host (veth interface).
In this configuration, an attacker able to run a process as root in a container can send and receive arbitrary packets to the host using the `CAP_NET_RAW` capability (present in the default configuration).
@z

@x
If IPv6 is not totally disabled on the host (via `ipv6.disable=1` on the kernel cmdline), it will be either unconfigured or configured on some interfaces, but it’s pretty likely that ipv6 forwarding is disabled, that is, `/proc/sys/net/ipv6/conf//forwarding == 0`. Also by default, `/proc/sys/net/ipv6/conf//accept_ra == 1`. The combination of these 2 sysctls means that the host accepts router advertisements and configures the IPv6 stack using them.
@y
{% comment %}
If IPv6 is not totally disabled on the host (via `ipv6.disable=1` on the kernel cmdline), it will be either unconfigured or configured on some interfaces, but it’s pretty likely that ipv6 forwarding is disabled, that is, `/proc/sys/net/ipv6/conf//forwarding == 0`. Also by default, `/proc/sys/net/ipv6/conf//accept_ra == 1`. The combination of these 2 sysctls means that the host accepts router advertisements and configures the IPv6 stack using them.
{% endcomment %}
If IPv6 is not totally disabled on the host (via `ipv6.disable=1` on the kernel cmdline), it will be either unconfigured or configured on some interfaces, but it’s pretty likely that ipv6 forwarding is disabled, that is, `/proc/sys/net/ipv6/conf//forwarding == 0`. Also by default, `/proc/sys/net/ipv6/conf//accept_ra == 1`. The combination of these 2 sysctls means that the host accepts router advertisements and configures the IPv6 stack using them.
@z

@x
By sending “rogue” router advertisements from a container, an attacker can reconfigure the host to redirect part or all of the IPv6 traffic of the host to the attacker-controlled container.
@y
{% comment %}
By sending “rogue” router advertisements from a container, an attacker can reconfigure the host to redirect part or all of the IPv6 traffic of the host to the attacker-controlled container.
{% endcomment %}
By sending “rogue” router advertisements from a container, an attacker can reconfigure the host to redirect part or all of the IPv6 traffic of the host to the attacker-controlled container.
@z

@x
Even if there was no IPv6 traffic before, if the DNS returns A (IPv4) and AAAA (IPv6) records, many HTTP libraries will try to connect via IPv6 first then fallback to IPv4, giving an opportunity to the attacker to respond.
If by chance the host has a vulnerability like last year’s RCE in apt (CVE-2019-3462), the attacker can now escalate to the host.
@y
{% comment %}
Even if there was no IPv6 traffic before, if the DNS returns A (IPv4) and AAAA (IPv6) records, many HTTP libraries will try to connect via IPv6 first then fallback to IPv4, giving an opportunity to the attacker to respond.
If by chance the host has a vulnerability like last year’s RCE in apt (CVE-2019-3462), the attacker can now escalate to the host.
{% endcomment %}
Even if there was no IPv6 traffic before, if the DNS returns A (IPv4) and AAAA (IPv6) records, many HTTP libraries will try to connect via IPv6 first then fallback to IPv4, giving an opportunity to the attacker to respond.
If by chance the host has a vulnerability like last year’s RCE in apt (CVE-2019-3462), the attacker can now escalate to the host.
@z

@x
As `CAP_NET_ADMIN` is not present by default for Docker containers, the attacker can’t configure the IPs they want to MitM, they can’t use iptables to NAT or REDIRECT the traffic, and they can’t use `IP_TRANSPARENT`.
The attacker can however still use `CAP_NET_RAW` and implement a tcp/ip stack in user space.
@y
{% comment %}
As `CAP_NET_ADMIN` is not present by default for Docker containers, the attacker can’t configure the IPs they want to MitM, they can’t use iptables to NAT or REDIRECT the traffic, and they can’t use `IP_TRANSPARENT`.
The attacker can however still use `CAP_NET_RAW` and implement a tcp/ip stack in user space.
{% endcomment %}
As `CAP_NET_ADMIN` is not present by default for Docker containers, the attacker can’t configure the IPs they want to MitM, they can’t use iptables to NAT or REDIRECT the traffic, and they can’t use `IP_TRANSPARENT`.
The attacker can however still use `CAP_NET_RAW` and implement a tcp/ip stack in user space.
@z

@x
See [kubernetes/kubernetes#91507](https://github.com/kubernetes/kubernetes/issues/91507) for related issues.
@y
{% comment %}
See [kubernetes/kubernetes#91507](https://github.com/kubernetes/kubernetes/issues/91507) for related issues.
{% endcomment %}
See [kubernetes/kubernetes#91507](https://github.com/kubernetes/kubernetes/issues/91507) for related issues.
@z

@x
## 19.03.10
2020-05-29
@y
## 19.03.10
2020-05-29
@z

@x
### Client
@y
{% comment %}
### Client
{% endcomment %}
{: #client-2 }
### クライアント
@z

@x
- Fix version negotiation with older engine. [docker/cli#2538](https://github.com/docker/cli/pull/2538)
- Avoid setting SSH flags through hostname. [docker/cli#2560](https://github.com/docker/cli/pull/2560)
- Fix panic when DOCKER_CLI_EXPERIMENTAL is invalid. [docker/cli#2558](https://github.com/docker/cli/pull/2558)
- Avoid potential panic on s390x by upgrading Go to 1.13.11. [docker/cli#2532](https://github.com/docker/cli/pull/2532)
@y
{% comment %}
- Fix version negotiation with older engine. [docker/cli#2538](https://github.com/docker/cli/pull/2538)
- Avoid setting SSH flags through hostname. [docker/cli#2560](https://github.com/docker/cli/pull/2560)
- Fix panic when DOCKER_CLI_EXPERIMENTAL is invalid. [docker/cli#2558](https://github.com/docker/cli/pull/2558)
- Avoid potential panic on s390x by upgrading Go to 1.13.11. [docker/cli#2532](https://github.com/docker/cli/pull/2532)
{% endcomment %}
- Fix version negotiation with older engine. [docker/cli#2538](https://github.com/docker/cli/pull/2538)
- Avoid setting SSH flags through hostname. [docker/cli#2560](https://github.com/docker/cli/pull/2560)
- DOCKER_CLI_EXPERIMENTAL が不適切な場合の panic エラーを修正。[docker/cli#2558](https://github.com/docker/cli/pull/2558)
- Go 1.13.11 へアップグレードした際、s390x 上での潜在的な panic エラーの回避。[docker/cli#2532](https://github.com/docker/cli/pull/2532)
@z

@x
### Networking
@y
### Networking
@z

@x
- Fix DNS fallback regression. [moby/moby#41009](https://github.com/moby/moby/pull/41009)
@y
{% comment %}
- Fix DNS fallback regression. [moby/moby#41009](https://github.com/moby/moby/pull/41009)
{% endcomment %}
- Fix DNS fallback regression. [moby/moby#41009](https://github.com/moby/moby/pull/41009)
@z

@x
### Runtime
@y
### Runtime
@z

@x
- Avoid potential panic on s390x by upgrading Go to 1.13.11. [moby/moby#40978](https://github.com/moby/moby/pull/40978)
@y
{% comment %}
{% endcomment %}
- Avoid potential panic on s390x by upgrading Go to 1.13.11. [moby/moby#40978](https://github.com/moby/moby/pull/40978)
@z

@x
### Packaging
@y
### Packaging
@z

@x
- Fix ARM builds on ARM64. [moby/moby#41027](https://github.com/moby/moby/pull/41027)
@y
{% comment %}
{% endcomment %}
- Fix ARM builds on ARM64. [moby/moby#41027](https://github.com/moby/moby/pull/41027)
@z

@x
## 19.03.9
2020-05-14
@y
## 19.03.9
2020-05-14
@z

@x
### Builder
@y
### Builder
@z

@x
- buildkit: Fix concurrent map write panic when building multiple images in parallel. [moby/moby#40780](https://github.com/moby/moby/pull/40780)
- buildkit: Fix issue preventing chowning of non-root-owned files between stages with userns. [moby/moby#40955](https://github.com/moby/moby/pull/40955)
- Avoid creation of irrelevant temporary files on Windows. [moby/moby#40877](https://github.com/moby/moby/pull/40877)
@y
{% comment %}
{% endcomment %}
- buildkit: Fix concurrent map write panic when building multiple images in parallel. [moby/moby#40780](https://github.com/moby/moby/pull/40780)
- buildkit: Fix issue preventing chowning of non-root-owned files between stages with userns. [moby/moby#40955](https://github.com/moby/moby/pull/40955)
- Avoid creation of irrelevant temporary files on Windows. [moby/moby#40877](https://github.com/moby/moby/pull/40877)
@z

@x
### Client
@y
### Client
@z

@x
- Fix panic on single-character volumes. [docker/cli#2471](https://github.com/docker/cli/pull/2471)
- Lazy daemon feature detection to avoid long timeouts on simple commands. [docker/cli#2442](https://github.com/docker/cli/pull/2442)
- docker context inspect on Windows is now faster. [docker/cli#2516](https://github.com/docker/cli/pull/2516)
- Bump Golang 1.13.10. [docker/cli#2431](https://github.com/docker/cli/pull/2431)
- Bump gopkg.in/yaml.v2 to v2.2.8. [docker/cli#2470](https://github.com/docker/cli/pull/2470)
@y
{% comment %}
{% endcomment %}
- Fix panic on single-character volumes. [docker/cli#2471](https://github.com/docker/cli/pull/2471)
- Lazy daemon feature detection to avoid long timeouts on simple commands. [docker/cli#2442](https://github.com/docker/cli/pull/2442)
- docker context inspect on Windows is now faster. [docker/cli#2516](https://github.com/docker/cli/pull/2516)
- Bump Golang 1.13.10. [docker/cli#2431](https://github.com/docker/cli/pull/2431)
- Bump gopkg.in/yaml.v2 to v2.2.8. [docker/cli#2470](https://github.com/docker/cli/pull/2470)
@z

@x
### Logging
@y
### Logging
@z

@x
- Avoid situation preventing container logs to rotate due to closing a closed log file. [moby/moby#40921](https://github.com/moby/moby/pull/40921)
@y
{% comment %}
{% endcomment %}
- Avoid situation preventing container logs to rotate due to closing a closed log file. [moby/moby#40921](https://github.com/moby/moby/pull/40921)
@z

@x
### Networking
@y
### Networking
@z

@x
- Fix potential panic upon restart. [moby/moby#40809](https://github.com/moby/moby/pull/40809)
- Assign the correct network value to the default bridge Subnet field. [moby/moby#40565](https://github.com/moby/moby/pull/40565)
@y
{% comment %}
{% endcomment %}
- Fix potential panic upon restart. [moby/moby#40809](https://github.com/moby/moby/pull/40809)
- Assign the correct network value to the default bridge Subnet field. [moby/moby#40565](https://github.com/moby/moby/pull/40565)
@z

@x
### Runtime
@y
### Runtime
@z

@x
- Fix docker crash when creating namespaces with UID in /etc/subuid and /etc/subgid. [moby/moby#40562](https://github.com/moby/moby/pull/40562)
- Improve ARM platform matching. [moby/moby#40758](https://github.com/moby/moby/pull/40758)
- overlay2: show backing filesystem. [moby/moby#40652](https://github.com/moby/moby/pull/40652)
- Update CRIU to v3.13 "Silicon Willet". [moby/moby#40850](https://github.com/moby/moby/pull/40850)
- Only show registry v2 schema1 deprecation warning upon successful fallback, as opposed to any registry error. [moby/moby#40681](https://github.com/moby/moby/pull/40681)
- Use FILE_SHARE_DELETE for log files on Windows. [moby/moby#40563](https://github.com/moby/moby/pull/40563)
- Bump Golang 1.13.10. [moby/moby#40803](https://github.com/moby/moby/pull/40803)
@y
{% comment %}
{% endcomment %}
- Fix docker crash when creating namespaces with UID in /etc/subuid and /etc/subgid. [moby/moby#40562](https://github.com/moby/moby/pull/40562)
- Improve ARM platform matching. [moby/moby#40758](https://github.com/moby/moby/pull/40758)
- overlay2: show backing filesystem. [moby/moby#40652](https://github.com/moby/moby/pull/40652)
- Update CRIU to v3.13 "Silicon Willet". [moby/moby#40850](https://github.com/moby/moby/pull/40850)
- Only show registry v2 schema1 deprecation warning upon successful fallback, as opposed to any registry error. [moby/moby#40681](https://github.com/moby/moby/pull/40681)
- Use FILE_SHARE_DELETE for log files on Windows. [moby/moby#40563](https://github.com/moby/moby/pull/40563)
- Bump Golang 1.13.10. [moby/moby#40803](https://github.com/moby/moby/pull/40803)
@z

@x
### Rootless
@y
### Rootless
@z

@x
- Now rootlesskit-docker-proxy returns detailed error message on exposing privileged ports. [moby/moby#40863](https://github.com/moby/moby/pull/40863)
- Supports numeric ID in /etc/subuid and /etc/subgid. [moby/moby#40951](https://github.com/moby/moby/pull/40951)
@y
{% comment %}
{% endcomment %}
- Now rootlesskit-docker-proxy returns detailed error message on exposing privileged ports. [moby/moby#40863](https://github.com/moby/moby/pull/40863)
- Supports numeric ID in /etc/subuid and /etc/subgid. [moby/moby#40951](https://github.com/moby/moby/pull/40951)
@z

@x
### Security
@y
### Security
@z

@x
- apparmor: add missing rules for userns. [moby/moby#40564](https://github.com/moby/moby/pull/40564)
- SElinux: fix ENOTSUP errors not being detected when relabeling. [moby/moby#40946](https://github.com/moby/moby/pull/40946)
@y
{% comment %}
{% endcomment %}
- apparmor: add missing rules for userns. [moby/moby#40564](https://github.com/moby/moby/pull/40564)
- SElinux: fix ENOTSUP errors not being detected when relabeling. [moby/moby#40946](https://github.com/moby/moby/pull/40946)
@z

@x
### Swarm
@y
### Swarm
@z

@x
- Increase refill rate for logger to avoid hanging on service logs. [moby/moby#40628](https://github.com/moby/moby/pull/40628)
- Fix issue where single swarm manager is stuck in Down state after reboot. [moby/moby#40831](https://github.com/moby/moby/pull/40831)
- tasks.db no longer grows indefinitely. [moby/moby#40831](https://github.com/moby/moby/pull/40831)
@y
{% comment %}
{% endcomment %}
- Increase refill rate for logger to avoid hanging on service logs. [moby/moby#40628](https://github.com/moby/moby/pull/40628)
- Fix issue where single swarm manager is stuck in Down state after reboot. [moby/moby#40831](https://github.com/moby/moby/pull/40831)
- tasks.db no longer grows indefinitely. [moby/moby#40831](https://github.com/moby/moby/pull/40831)
@z

@x
## 19.03.8
2020-03-10
@y
## 19.03.8
2020-03-10
@z

@x
### Runtime
@y
{% comment %}
{% endcomment %}
### Runtime
@z

@x
- Improve mitigation for [CVE-2019-14271](https://nvd.nist.gov/vuln/detail/CVE-2019-14271) for some nscd configuration.
@y
{% comment %}
{% endcomment %}
- Improve mitigation for [CVE-2019-14271](https://nvd.nist.gov/vuln/detail/CVE-2019-14271) for some nscd configuration.
@z

@x
## 19.03.7
2020-03-03
@y
## 19.03.7
2020-03-03
@z

@x
### Builder
@y
{% comment %}
{% endcomment %}
### Builder
@z

@x
- builder-next: Fix deadlock issues in corner cases. [moby/moby#40557](https://github.com/moby/moby/pull/40557)
@y
{% comment %}
{% endcomment %}
- builder-next: Fix deadlock issues in corner cases. [moby/moby#40557](https://github.com/moby/moby/pull/40557)
@z

@x
### Runtime
@y
{% comment %}
{% endcomment %}
### Runtime
@z

@x
* overlay: remove modprobe execs. [moby/moby#40462](https://github.com/moby/moby/pull/40462)
* selinux: display better error messages when setting file labels. [moby/moby#40547](https://github.com/moby/moby/pull/40547)
* Speed up initial stats collection. [moby/moby#40549](https://github.com/moby/moby/pull/40549)
- rootless: use certs.d from XDG_CONFIG_HOME. [moby/moby#40461](https://github.com/moby/moby/pull/40461)
- Bump Golang 1.12.17. [moby/moby#40533](https://github.com/moby/moby/pull/40533) 
- Bump google.golang.org/grpc to v1.23.1. [moby/moby#40566](https://github.com/moby/moby/pull/40566)
- Update containerd binary to v1.2.13. [moby/moby#40540](https://github.com/moby/moby/pull/40540)
- Prevent showing stopped containers as running in an edge case. [moby/moby#40555](https://github.com/moby/moby/pull/40555)
- Prevent potential lock. [moby/moby#40604](https://github.com/moby/moby/pull/40604)
@y
{% comment %}
{% endcomment %}
* overlay: remove modprobe execs. [moby/moby#40462](https://github.com/moby/moby/pull/40462)
* selinux: display better error messages when setting file labels. [moby/moby#40547](https://github.com/moby/moby/pull/40547)
* Speed up initial stats collection. [moby/moby#40549](https://github.com/moby/moby/pull/40549)
- rootless: use certs.d from XDG_CONFIG_HOME. [moby/moby#40461](https://github.com/moby/moby/pull/40461)
- Bump Golang 1.12.17. [moby/moby#40533](https://github.com/moby/moby/pull/40533) 
- Bump google.golang.org/grpc to v1.23.1. [moby/moby#40566](https://github.com/moby/moby/pull/40566)
- Update containerd binary to v1.2.13. [moby/moby#40540](https://github.com/moby/moby/pull/40540)
- Prevent showing stopped containers as running in an edge case. [moby/moby#40555](https://github.com/moby/moby/pull/40555)
- Prevent potential lock. [moby/moby#40604](https://github.com/moby/moby/pull/40604)
@z

@x
### Client
@y
{% comment %}
{% endcomment %}
### Client
@z

@x
- Bump Golang 1.12.17. [docker/cli#2342](https://github.com/docker/cli/pull/2342)
- Bump google.golang.org/grpc to v1.23.1. [docker/cli#1884](https://github.com/docker/cli/pull/1884) [docker/cli#2373](https://github.com/docker/cli/pull/2373)
@y
{% comment %}
{% endcomment %}
- Bump Golang 1.12.17. [docker/cli#2342](https://github.com/docker/cli/pull/2342)
- Bump google.golang.org/grpc to v1.23.1. [docker/cli#1884](https://github.com/docker/cli/pull/1884) [docker/cli#2373](https://github.com/docker/cli/pull/2373)
@z

@x
## 19.03.6
2020-02-12
@y
## 19.03.6
2020-02-12
@z

@x
### Builder
@y
{% comment %}
{% endcomment %}
### Builder
@z

@x
- builder-next: Allow modern sign hashes for ssh forwarding. [docker/engine#453](https://github.com/docker/engine/pull/453)
- builder-next: Clear onbuild rules after triggering. [docker/engine#453](https://github.com/docker/engine/pull/453)
- builder-next: Fix issue with directory permissions when usernamespaces is enabled. [moby/moby#40440](https://github.com/moby/moby/pull/40440)
- Bump hcsshim to fix docker build failing on Windows 1903. [docker/engine#429](https://github.com/docker/engine/pull/429)
@y
{% comment %}
{% endcomment %}
- builder-next: Allow modern sign hashes for ssh forwarding. [docker/engine#453](https://github.com/docker/engine/pull/453)
- builder-next: Clear onbuild rules after triggering. [docker/engine#453](https://github.com/docker/engine/pull/453)
- builder-next: Fix issue with directory permissions when usernamespaces is enabled. [moby/moby#40440](https://github.com/moby/moby/pull/40440)
- Bump hcsshim to fix docker build failing on Windows 1903. [docker/engine#429](https://github.com/docker/engine/pull/429)
@z

@x
### Networking
@y
{% comment %}
{% endcomment %}
### Networking
@z

@x
- Shorten controller ID in exec-root to not hit UNIX_PATH_MAX. [docker/engine#424](https://github.com/docker/engine/pull/424)
- Fix panic in drivers/overlay/encryption.go. [docker/engine#424](https://github.com/docker/engine/pull/424)
- Fix hwaddr set race between us and udev. [docker/engine#439](https://github.com/docker/engine/pull/439)
@y
{% comment %}
{% endcomment %}
- Shorten controller ID in exec-root to not hit UNIX_PATH_MAX. [docker/engine#424](https://github.com/docker/engine/pull/424)
- Fix panic in drivers/overlay/encryption.go. [docker/engine#424](https://github.com/docker/engine/pull/424)
- Fix hwaddr set race between us and udev. [docker/engine#439](https://github.com/docker/engine/pull/439)
@z

@x
### Runtime
@y
{% comment %}
{% endcomment %}
### Runtime
@z

@x
* Bump Golang 1.12.16. [moby/moby#40433](https://github.com/moby/moby/pull/40433)
* Update containerd binary to v1.2.12. [moby/moby#40433](https://github.com/moby/moby/pull/40453)
* Update to runc v1.0.0-rc10. [moby/moby#40433](https://github.com/moby/moby/pull/40453)
- Fix possible runtime panic in Lgetxattr. [docker/engine#454](https://github.com/docker/engine/pull/454)
- rootless: fix proxying UDP packets. [docker/engine#434](https://github.com/docker/engine/pull/434)
@y
{% comment %}
{% endcomment %}
* Bump Golang 1.12.16. [moby/moby#40433](https://github.com/moby/moby/pull/40433)
* Update containerd binary to v1.2.12. [moby/moby#40433](https://github.com/moby/moby/pull/40453)
* Update to runc v1.0.0-rc10. [moby/moby#40433](https://github.com/moby/moby/pull/40453)
- Fix possible runtime panic in Lgetxattr. [docker/engine#454](https://github.com/docker/engine/pull/454)
- rootless: fix proxying UDP packets. [docker/engine#434](https://github.com/docker/engine/pull/434)
@z

@x
## 19.03.5
2019-11-14
@y
## 19.03.5
2019-11-14
@z

@x
### Builder
@y
{% comment %}
{% endcomment %}
### Builder
@z

@x
* builder-next: Added `entitlements` in builder config. [docker/engine#412](https://github.com/docker/engine/pull/412)
* Fix builder-next: permission errors on using build secrets or ssh forwarding with userns-remap. [docker/engine#420](https://github.com/docker/engine/pull/420)
* Fix builder-next: copying a symlink inside an already copied directory. [docker/engine#420](https://github.com/docker/engine/pull/420)
@y
{% comment %}
{% endcomment %}
* builder-next: Added `entitlements` in builder config. [docker/engine#412](https://github.com/docker/engine/pull/412)
* Fix builder-next: permission errors on using build secrets or ssh forwarding with userns-remap. [docker/engine#420](https://github.com/docker/engine/pull/420)
* Fix builder-next: copying a symlink inside an already copied directory. [docker/engine#420](https://github.com/docker/engine/pull/420)
@z

@x
### Packaging
@y
{% comment %}
{% endcomment %}
### Packaging
@z

@x
* Support RHEL 8 packages
@y
{% comment %}
{% endcomment %}
* Support RHEL 8 packages
@z

@x
### Runtime
@y
{% comment %}
{% endcomment %}
### Runtime
@z

@x
* Bump Golang to 1.12.12. [docker/engine#418](https://github.com/docker/engine/pull/418)
* Update to RootlessKit to v0.7.0 to harden slirp4netns with mount namespace and seccomp. [docker/engine#397](https://github.com/docker/engine/pull/397)
* Fix to propagate GetContainer error from event processor. [docker/engine#407](https://github.com/docker/engine/pull/407)
* Fix push of OCI image. [docker/engine#405](https://github.com/docker/engine/pull/405)
@y
{% comment %}
{% endcomment %}
* Bump Golang to 1.12.12. [docker/engine#418](https://github.com/docker/engine/pull/418)
* Update to RootlessKit to v0.7.0 to harden slirp4netns with mount namespace and seccomp. [docker/engine#397](https://github.com/docker/engine/pull/397)
* Fix to propagate GetContainer error from event processor. [docker/engine#407](https://github.com/docker/engine/pull/407)
* Fix push of OCI image. [docker/engine#405](https://github.com/docker/engine/pull/405)
@z

@x
## 19.03.4
2019-10-17
@y
## 19.03.4
2019-10-17
@z

@x
### Networking
@y
{% comment %}
{% endcomment %}
### Networking
@z

@x
* Rollback libnetwork changes to fix `DOCKER-USER` iptables chain issue. [docker/engine#404](https://github.com/docker/engine/pull/404)
@y
{% comment %}
{% endcomment %}
* Rollback libnetwork changes to fix `DOCKER-USER` iptables chain issue. [docker/engine#404](https://github.com/docker/engine/pull/404)
@z

@x
### Known Issues
@y
{% comment %}
{% endcomment %}
### Known Issues
@z

@x
#### Existing
@y
{% comment %}
{% endcomment %}
#### Existing
@z

@x
* In some circumstances with large clusters, Docker information might, as part of the Swarm section,
  include the error `code = ResourceExhausted desc = grpc: received message larger than
  max (5351376 vs. 4194304)`. This does not indicate any failure or misconfiguration by the user,
  and requires no response.
* Orchestrator port conflict can occur when redeploying all services as new. Due to many Swarm manager
  requests in a short amount of time, some services are not able to receive traffic and are causing a `404`
  error after being deployed.
     - **Workaround:** restart all tasks via `docker service update --force`.
* [CVE-2018-15664](https://nvd.nist.gov/vuln/detail/CVE-2018-15664) symlink-exchange attack with directory traversal. Workaround until proper fix is available in upcoming patch release: `docker pause` container before doing file operations. [moby/moby#39252](https://github.com/moby/moby/pull/39252)
* `docker cp` regression due to CVE mitigation. An error is produced when the source of `docker cp` is set to `/`.
@y
{% comment %}
{% endcomment %}
* In some circumstances with large clusters, Docker information might, as part of the Swarm section,
  include the error `code = ResourceExhausted desc = grpc: received message larger than
  max (5351376 vs. 4194304)`. This does not indicate any failure or misconfiguration by the user,
  and requires no response.
* Orchestrator port conflict can occur when redeploying all services as new. Due to many Swarm manager
  requests in a short amount of time, some services are not able to receive traffic and are causing a `404`
  error after being deployed.
     - **Workaround:** restart all tasks via `docker service update --force`.
* [CVE-2018-15664](https://nvd.nist.gov/vuln/detail/CVE-2018-15664) symlink-exchange attack with directory traversal. Workaround until proper fix is available in upcoming patch release: `docker pause` container before doing file operations. [moby/moby#39252](https://github.com/moby/moby/pull/39252)
* `docker cp` regression due to CVE mitigation. An error is produced when the source of `docker cp` is set to `/`.
@z

@x
## 19.03.3
2019-10-08
@y
## 19.03.3
2019-10-08
@z

@x
### Security
@y
{% comment %}
{% endcomment %}
### Security
@z

@x
* Patched `runc` in containerd. [CVE-2017-18367](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-18367)
@y
{% comment %}
{% endcomment %}
* Patched `runc` in containerd. [CVE-2017-18367](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-18367)
@z

@x
### Builder
@y
{% comment %}
{% endcomment %}
### Builder
@z

@x
* Fix builder-next: resolve digest for third party registries. [docker/engine#339](https://github.com/docker/engine/pull/339)
@y
{% comment %}
{% endcomment %}
* Fix builder-next: resolve digest for third party registries. [docker/engine#339](https://github.com/docker/engine/pull/339)
@z

@x
* Fix builder-next: user namespace builds when daemon started with socket activation. [docker/engine#373](https://github.com/docker/engine/pull/373)
@y
{% comment %}
{% endcomment %}
* Fix builder-next: user namespace builds when daemon started with socket activation. [docker/engine#373](https://github.com/docker/engine/pull/373)
@z

@x
* Fix builder-next; session: release forwarded ssh socket connection per connection. [docker/engine#373](https://github.com/docker/engine/pull/373)
@y
{% comment %}
{% endcomment %}
* Fix builder-next; session: release forwarded ssh socket connection per connection. [docker/engine#373](https://github.com/docker/engine/pull/373)
@z

@x
* Fix build-next: llbsolver: error on multiple cache importers. [docker/engine#373](https://github.com/docker/engine/pull/373)
@y
{% comment %}
{% endcomment %}
* Fix build-next: llbsolver: error on multiple cache importers. [docker/engine#373](https://github.com/docker/engine/pull/373)
@z

@x
### Client
@y
{% comment %}
{% endcomment %}
### Client
@z

@x
* Added support for Docker Template 0.1.6.
@y
{% comment %}
{% endcomment %}
* Added support for Docker Template 0.1.6.
@z

@x
* Mitigate against YAML files that have excessive aliasing. [docker/cli#2119](https://github.com/docker/cli/pull/2119)
@y
{% comment %}
{% endcomment %}
* Mitigate against YAML files that have excessive aliasing. [docker/cli#2119](https://github.com/docker/cli/pull/2119)
@z

@x
### Runtime
@y
{% comment %}
{% endcomment %}
### Runtime
@z

@x
* Bump Golang to 1.12.10. [docker/engine#387](https://github.com/docker/engine/pull/387)
@y
{% comment %}
{% endcomment %}
* Bump Golang to 1.12.10. [docker/engine#387](https://github.com/docker/engine/pull/387)
@z

@x
* Bump containerd to 1.2.10. [docker/engine#385](https://github.com/docker/engine/pull/385)
@y
{% comment %}
{% endcomment %}
* Bump containerd to 1.2.10. [docker/engine#385](https://github.com/docker/engine/pull/385)
@z

@x
* Distribution: modify warning logic when pulling v2 schema1 manifests. [docker/engine#368](https://github.com/docker/engine/pull/368)
@y
{% comment %}
{% endcomment %}
* Distribution: modify warning logic when pulling v2 schema1 manifests. [docker/engine#368](https://github.com/docker/engine/pull/368)
@z

@x
* Fix `POST /images/create` returning a 500 status code when providing an incorrect platform option. [docker/engine#365](https://github.com/docker/engine/pull/365)
@y
{% comment %}
{% endcomment %}
* Fix `POST /images/create` returning a 500 status code when providing an incorrect platform option. [docker/engine#365](https://github.com/docker/engine/pull/365)
@z

@x
* Fix `POST /build` returning a 500 status code when providing an incorrect platform option. [docker/engine#365](https://github.com/docker/engine/pull/365)
@y
{% comment %}
{% endcomment %}
* Fix `POST /build` returning a 500 status code when providing an incorrect platform option. [docker/engine#365](https://github.com/docker/engine/pull/365)
@z

@x
* Fix panic on 32-bit ARMv7 caused by misaligned struct member. [docker/engine#363](https://github.com/docker/engine/pull/363)
@y
{% comment %}
{% endcomment %}
* Fix panic on 32-bit ARMv7 caused by misaligned struct member. [docker/engine#363](https://github.com/docker/engine/pull/363)
@z

@x
* Fix to return "invalid parameter" when linking to non-existing container. [docker/engine#352](https://github.com/docker/engine/pull/352)
@y
{% comment %}
{% endcomment %}
* Fix to return "invalid parameter" when linking to non-existing container. [docker/engine#352](https://github.com/docker/engine/pull/352)
@z

@x
* Fix overlay2: busy error on mount when using kernel >= 5.2. [docker/engine#332](https://github.com/docker/engine/pull/332)
@y
{% comment %}
{% endcomment %}
* Fix overlay2: busy error on mount when using kernel >= 5.2. [docker/engine#332](https://github.com/docker/engine/pull/332)
@z

@x
* Fix `docker rmi` stuck in certain misconfigured systems, e.g. dead NFS share. [docker/engine#335](https://github.com/docker/engine/pull/335)
@y
{% comment %}
{% endcomment %}
* Fix `docker rmi` stuck in certain misconfigured systems, e.g. dead NFS share. [docker/engine#335](https://github.com/docker/engine/pull/335)
@z

@x
* Fix handling of blocked I/O of exec'd processes. [docker/engine#296](https://github.com/docker/engine/pull/296)
@y
{% comment %}
{% endcomment %}
* Fix handling of blocked I/O of exec'd processes. [docker/engine#296](https://github.com/docker/engine/pull/296)
@z

@x
* Fix jsonfile logger: follow logs stuck when `max-size` is set and `max-file=1`. [docker/engine#378](https://github.com/docker/engine/pull/378)
@y
{% comment %}
{% endcomment %}
* Fix jsonfile logger: follow logs stuck when `max-size` is set and `max-file=1`. [docker/engine#378](https://github.com/docker/engine/pull/378)
@z

@x
### Known Issues
@y
{% comment %}
{% endcomment %}
### Known Issues
@z

@x
#### New
@y
{% comment %}
{% endcomment %}
#### New
@z

@x
* `DOCKER-USER` iptables chain is missing: [docker/for-linux#810](https://github.com/docker/for-linux/issues/810).
  Users cannot perform additional container network traffic filtering on top of
  this iptables chain. You are not affected by this issue if you are not
  customizing iptable chains on top of `DOCKER-USER`.
     - **Workaround:** Insert the iptables chain after the docker daemon starts.
       For example:
       ```
       iptables -N DOCKER-USER
       iptables -I FORWARD -j DOCKER-USER
       iptables -A DOCKER-USER -j RETURN
       ```
@y
{% comment %}
{% endcomment %}
* `DOCKER-USER` iptables chain is missing: [docker/for-linux#810](https://github.com/docker/for-linux/issues/810).
  Users cannot perform additional container network traffic filtering on top of
  this iptables chain. You are not affected by this issue if you are not
  customizing iptable chains on top of `DOCKER-USER`.
     - **Workaround:** Insert the iptables chain after the docker daemon starts.
       For example:
       ```
       iptables -N DOCKER-USER
       iptables -I FORWARD -j DOCKER-USER
       iptables -A DOCKER-USER -j RETURN
       ```
@z

@x
#### Existing
@y
{% comment %}
{% endcomment %}
#### Existing
@z

@x
* In some circumstances with large clusters, docker information might, as part of the Swarm section,
  include the error `code = ResourceExhausted desc = grpc: received message larger than
  max (5351376 vs. 4194304)`. This does not indicate any failure or misconfiguration by the user,
  and requires no response.
* Orchestrator port conflict can occur when redeploying all services as new. Due to many swarm manager
  requests in a short amount of time, some services are not able to receive traffic and are causing a `404`
  error after being deployed.
     - **Workaround:** restart all tasks via `docker service update --force`.
* [CVE-2018-15664](https://nvd.nist.gov/vuln/detail/CVE-2018-15664) symlink-exchange attack with directory traversal. Workaround until proper fix is available in upcoming patch release: `docker pause` container before doing file operations. [moby/moby#39252](https://github.com/moby/moby/pull/39252)
* `docker cp` regression due to CVE mitigation. An error is produced when the source of `docker cp` is set to `/`.
@y
{% comment %}
{% endcomment %}
* In some circumstances with large clusters, docker information might, as part of the Swarm section,
  include the error `code = ResourceExhausted desc = grpc: received message larger than
  max (5351376 vs. 4194304)`. This does not indicate any failure or misconfiguration by the user,
  and requires no response.
* Orchestrator port conflict can occur when redeploying all services as new. Due to many swarm manager
  requests in a short amount of time, some services are not able to receive traffic and are causing a `404`
  error after being deployed.
     - **Workaround:** restart all tasks via `docker service update --force`.
* [CVE-2018-15664](https://nvd.nist.gov/vuln/detail/CVE-2018-15664) symlink-exchange attack with directory traversal. Workaround until proper fix is available in upcoming patch release: `docker pause` container before doing file operations. [moby/moby#39252](https://github.com/moby/moby/pull/39252)
* `docker cp` regression due to CVE mitigation. An error is produced when the source of `docker cp` is set to `/`.
@z

@x
## 19.03.2
2019-09-03
@y
## 19.03.2
2019-09-03
@z

@x
### Builder
@y
{% comment %}
{% endcomment %}
### Builder
@z

@x
* Fix `COPY --from` to non-existing directory on Windows. [moby/moby#39695](https://github.com/moby/moby/pull/39695)
@y
{% comment %}
{% endcomment %}
* Fix `COPY --from` to non-existing directory on Windows. [moby/moby#39695](https://github.com/moby/moby/pull/39695)
@z

@x
* Fix builder-next: metadata commands not having created time in history. [moby/moby#39456](https://github.com/moby/moby/issues/39456)
@y
* Fix builder-next: metadata commands not having created time in history. [moby/moby#39456](https://github.com/moby/moby/issues/39456)
@z

@x
* Fix builder-next: close progress on layer export error. [moby/moby#39782](https://github.com/moby/moby/pull/39782)
@y
* Fix builder-next: close progress on layer export error. [moby/moby#39782](https://github.com/moby/moby/pull/39782)
@z

@x
* Update buildkit to 588c73e1e4. [moby/moby#39781](https://github.com/moby/moby/pull/39781)
@y
* Update buildkit to 588c73e1e4. [moby/moby#39781](https://github.com/moby/moby/pull/39781)
@z

@x
### Client
@y
### Client
@z

@x
* Fix Windows absolute path detection on non-Windows [docker/cli#1990](https://github.com/docker/cli/pull/1990)
@y
* Fix Windows absolute path detection on non-Windows [docker/cli#1990](https://github.com/docker/cli/pull/1990)
@z

@x
* Fix to zsh completion script for `docker login --username`.
@y
* Fix to zsh completion script for `docker login --username`.
@z

@x
* Fix context: produce consistent output on `context create`. [docker/cli#1985](https://github.com/docker/cli/pull/1874)
@y
* Fix context: produce consistent output on `context create`. [docker/cli#1985](https://github.com/docker/cli/pull/1874)
@z

@x
* Fix support for HTTP proxy env variable. [docker/cli#2059](https://github.com/docker/cli/pull/2059)
@y
* Fix support for HTTP proxy env variable. [docker/cli#2059](https://github.com/docker/cli/pull/2059)
@z

@x
### Logging
@y
### Logging
@z

@x
* Fix for reading journald logs. [moby/moby#37819](https://github.com/moby/moby/pull/37819) [moby/moby#38859](https://github.com/moby/moby/pull/38859)
@y
* Fix for reading journald logs. [moby/moby#37819](https://github.com/moby/moby/pull/37819) [moby/moby#38859](https://github.com/moby/moby/pull/38859)
@z

@x
### Networking
@y
### Networking
@z

@x
* Prevent panic on network attached to a container with disabled networking. [moby/moby#39589](https://github.com/moby/moby/pull/39589)
@y
* Prevent panic on network attached to a container with disabled networking. [moby/moby#39589](https://github.com/moby/moby/pull/39589)
@z

@x
### Runtime
@y
### Runtime
@z

@x
* Bump Golang to 1.12.8.
@y
* Bump Golang to 1.12.8.
@z

@x
* Fix a potential engine panic when using XFS disk quota for containers. [moby/moby#39644](https://github.com/moby/moby/pull/39644)
@y
* Fix a potential engine panic when using XFS disk quota for containers. [moby/moby#39644](https://github.com/moby/moby/pull/39644)
@z

@x
### Swarm
@y
### Swarm
@z

@x
* Fix an issue where nodes with several tasks could not be removed. [docker/swarmkit#2867](https://github.com/docker/swarmkit/pull/2867)
@y
* Fix an issue where nodes with several tasks could not be removed. [docker/swarmkit#2867](https://github.com/docker/swarmkit/pull/2867)
@z

@x
### Known issues
@y
### Known issues
@z

@x
* In some circumstances with large clusters, docker information might, as part of the Swarm section,
  include the error `code = ResourceExhausted desc = grpc: received message larger than
  max (5351376 vs. 4194304)`. This does not indicate any failure or misconfiguration by the user,
  and requires no response.
* Orchestrator port conflict can occur when redeploying all services as new. Due to many swarm manager
  requests in a short amount of time, some services are not able to receive traffic and are causing a `404`
  error after being deployed.
     - Workaround: restart all tasks via `docker service update --force`.
@y
* In some circumstances with large clusters, docker information might, as part of the Swarm section,
  include the error `code = ResourceExhausted desc = grpc: received message larger than
  max (5351376 vs. 4194304)`. This does not indicate any failure or misconfiguration by the user,
  and requires no response.
* Orchestrator port conflict can occur when redeploying all services as new. Due to many swarm manager
  requests in a short amount of time, some services are not able to receive traffic and are causing a `404`
  error after being deployed.
     - Workaround: restart all tasks via `docker service update --force`.
@z

@x
* Traffic cannot egress the HOST because of missing Iptables rules in the FORWARD chain
  The missing rules are :
     ```
     /sbin/iptables --wait -C FORWARD -o docker_gwbridge -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
     /sbin/iptables --wait -C FORWARD -o docker0 -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
     ```
     - Workaround: Add these rules back using a script and cron definitions. The script
     must contain '-C' commands to check for the presence of a rule and '-A' commands to add
     rules back. Run the script on a cron in regular intervals, for example, every <x> minutes.
     - Affected versions: 18.09.1, 19.03.0
* [CVE-2018-15664](https://nvd.nist.gov/vuln/detail/CVE-2018-15664) symlink-exchange attack with directory traversal. Workaround until proper fix is available in upcoming patch release: `docker pause` container before doing file operations. [moby/moby#39252](https://github.com/moby/moby/pull/39252)
* `docker cp` regression due to CVE mitigation. An error is produced when the source of `docker cp` is set to `/`.
@y
* Traffic cannot egress the HOST because of missing Iptables rules in the FORWARD chain
  The missing rules are :
     ```
     /sbin/iptables --wait -C FORWARD -o docker_gwbridge -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
     /sbin/iptables --wait -C FORWARD -o docker0 -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
     ```
     - Workaround: Add these rules back using a script and cron definitions. The script
     must contain '-C' commands to check for the presence of a rule and '-A' commands to add
     rules back. Run the script on a cron in regular intervals, for example, every <x> minutes.
     - Affected versions: 18.09.1, 19.03.0
* [CVE-2018-15664](https://nvd.nist.gov/vuln/detail/CVE-2018-15664) symlink-exchange attack with directory traversal. Workaround until proper fix is available in upcoming patch release: `docker pause` container before doing file operations. [moby/moby#39252](https://github.com/moby/moby/pull/39252)
* `docker cp` regression due to CVE mitigation. An error is produced when the source of `docker cp` is set to `/`.
@z

@x
## 19.03.1
2019-07-25
@y
## 19.03.1
2019-07-25
@z

@x
### Security
@y
### Security
@z

@x
 * Fixed loading of nsswitch based config inside chroot under Glibc. [CVE-2019-14271](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-14271)
@y
 * Fixed loading of nsswitch based config inside chroot under Glibc. [CVE-2019-14271](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-14271)
@z

@x
### Known issues
@y
### Known issues
@z

@x
 * In some circumstances, in large clusters, docker information might, as part of the Swarm section,
 include the error `code = ResourceExhausted desc = grpc: received message larger than
 max (5351376 vs. 4194304)`. This does not indicate any failure or misconfiguration by the user,
 and requires no response.
 * Orchestrator port conflict can occur when redeploying all services as new. Due to many swarm manager
 requests in a short amount of time, some services are not able to receive traffic and are causing a `404`
 error after being deployed.
    - Workaround: restart all tasks via `docker service update --force`.
@y
 * In some circumstances, in large clusters, docker information might, as part of the Swarm section,
 include the error `code = ResourceExhausted desc = grpc: received message larger than
 max (5351376 vs. 4194304)`. This does not indicate any failure or misconfiguration by the user,
 and requires no response.
 * Orchestrator port conflict can occur when redeploying all services as new. Due to many swarm manager
 requests in a short amount of time, some services are not able to receive traffic and are causing a `404`
 error after being deployed.
    - Workaround: restart all tasks via `docker service update --force`.
@z

@x
 * Traffic cannot egress the HOST because of missing Iptables rules in the FORWARD chain
 The missing rules are :
     ```
     /sbin/iptables --wait -C FORWARD -o docker_gwbridge -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
     /sbin/iptables --wait -C FORWARD -o docker0 -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
     ```
     - Workaround: Add these rules back using a script and cron definitions. The script
     must contain '-C' commands to check for the presence of a rule and '-A' commands to add
     rules back. Run the script on a cron in regular intervals, for example, every <x> minutes.
     - Affected versions: 18.09.1, 19.03.0
 * [CVE-2018-15664](https://nvd.nist.gov/vuln/detail/CVE-2018-15664) symlink-exchange attack with directory traversal. Workaround until proper fix is available in upcoming patch release: `docker pause` container before doing file operations. [moby/moby#39252](https://github.com/moby/moby/pull/39252)
 * `docker cp` regression due to CVE mitigation. An error is produced when the source of `docker cp` is set to `/`.
@y
 * Traffic cannot egress the HOST because of missing Iptables rules in the FORWARD chain
 The missing rules are :
     ```
     /sbin/iptables --wait -C FORWARD -o docker_gwbridge -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
     /sbin/iptables --wait -C FORWARD -o docker0 -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
     ```
     - Workaround: Add these rules back using a script and cron definitions. The script
     must contain '-C' commands to check for the presence of a rule and '-A' commands to add
     rules back. Run the script on a cron in regular intervals, for example, every <x> minutes.
     - Affected versions: 18.09.1, 19.03.0
 * [CVE-2018-15664](https://nvd.nist.gov/vuln/detail/CVE-2018-15664) symlink-exchange attack with directory traversal. Workaround until proper fix is available in upcoming patch release: `docker pause` container before doing file operations. [moby/moby#39252](https://github.com/moby/moby/pull/39252)
 * `docker cp` regression due to CVE mitigation. An error is produced when the source of `docker cp` is set to `/`.
@z

@x
## 19.03.0
2019-07-22
@y
## 19.03.0
2019-07-22
@z

@x
### Builder
@y
### Builder
@z

@x
* Fixed `COPY --from` to preserve ownership. [moby/moby#38599](https://github.com/moby/moby/pull/38599)
* builder-next:
@y
* Fixed `COPY --from` to preserve ownership. [moby/moby#38599](https://github.com/moby/moby/pull/38599)
* builder-next:
@z

@x
    - Added inline cache support `--cache-from`. [docker/engine#215](https://github.com/docker/engine/pull/215)
    - Outputs configuration allowed. [moby/moby#38898](https://github.com/moby/moby/pull/38898)
    - Fixed gcr workaround token cache. [docker/engine#212](https://github.com/docker/engine/pull/212)
    - `stopprogress` called on download error. [docker/engine#215](https://github.com/docker/engine/pull/215)
    - Buildkit now uses systemd's `resolv.conf`. [docker/engine#260](https://github.com/docker/engine/pull/260).
    - Setting buildkit outputs now allowed. [docker/cli#1766](https://github.com/docker/cli/pull/1766)
    - Look for Dockerfile specific dockerignore file (for example, Dockerfile.dockerignore) for
        ignored paths. [docker/engine#215](https://github.com/docker/engine/pull/215)
    - Automatically detect if process execution is possible for x86, arm, and arm64 binaries.
        [docker/engine#215](https://github.com/docker/engine/pull/215)
    - Updated buildkit to 1f89ec1. [docker/engine#260](https://github.com/docker/engine/pull/260)
    - Use Dockerfile frontend version `docker/dockerfile:1.1` by default.
        [docker/engine#215](https://github.com/docker/engine/pull/215)
    - No longer rely on an external image for COPY/ADD operations.
        [docker/engine#215](https://github.com/docker/engine/pull/215)
@y
    - Added inline cache support `--cache-from`. [docker/engine#215](https://github.com/docker/engine/pull/215)
    - Outputs configuration allowed. [moby/moby#38898](https://github.com/moby/moby/pull/38898)
    - Fixed gcr workaround token cache. [docker/engine#212](https://github.com/docker/engine/pull/212)
    - `stopprogress` called on download error. [docker/engine#215](https://github.com/docker/engine/pull/215)
    - Buildkit now uses systemd's `resolv.conf`. [docker/engine#260](https://github.com/docker/engine/pull/260).
    - Setting buildkit outputs now allowed. [docker/cli#1766](https://github.com/docker/cli/pull/1766)
    - Look for Dockerfile specific dockerignore file (for example, Dockerfile.dockerignore) for
        ignored paths. [docker/engine#215](https://github.com/docker/engine/pull/215)
    - Automatically detect if process execution is possible for x86, arm, and arm64 binaries.
        [docker/engine#215](https://github.com/docker/engine/pull/215)
    - Updated buildkit to 1f89ec1. [docker/engine#260](https://github.com/docker/engine/pull/260)
    - Use Dockerfile frontend version `docker/dockerfile:1.1` by default.
        [docker/engine#215](https://github.com/docker/engine/pull/215)
    - No longer rely on an external image for COPY/ADD operations.
        [docker/engine#215](https://github.com/docker/engine/pull/215)
@z

@x
### Client
@y
### Client
@z

@x
* Added `--pids-limit` flag to `docker update`. [docker/cli#1765](https://github.com/docker/cli/pull/1765)
* Added systctl support for services. [docker/cli#1754](https://github.com/docker/cli/pull/1754)
* Added support for `template_driver` in compose files. [docker/cli#1746](https://github.com/docker/cli/pull/1746)
* Added `--device` support for Windows. [docker/cli#1606](https://github.com/docker/cli/pull/1606)
* Added support for Data Path Port configuration. [docker/cli#1509](https://github.com/docker/cli/pull/1509)
* Added fast context switch: commands. [docker/cli#1501](https://github.com/docker/cli/pull/1501)
* Support added for `--mount type=bind,bind-nonrecursive,...` [docker/cli#1430](https://github.com/docker/cli/pull/1430)
* Added maximum replicas per node. [docker/cli#1612](https://github.com/docker/cli/pull/1612)
* Added option to pull images quietly. [docker/cli#882](https://github.com/docker/cli/pull/882)
* Added a separate `--domainname` flag. [docker/cli#1130](https://github.com/docker/cli/pull/1130)
* Added support for secret drivers in `docker stack deploy`. [docker/cli#1783](https://github.com/docker/cli/pull/1783)
* Added ability to use swarm `Configs` as `CredentialSpecs` on services.
[docker/cli#1781](https://github.com/docker/cli/pull/1781)
* Added `--security-opt systempaths=unconfined` support. [docker/cli#1808](https://github.com/docker/cli/pull/1808)
* Added basic framework for writing and running CLI plugins. [docker/cli#1564](https://github.com/docker/cli/pull/1564)
  [docker/cli#1898](https://github.com/docker/cli/pull/1898)
* Bumped Docker App to v0.8.0. [docker/docker-ce-packaging#341](https://github.com/docker/docker-ce-packaging/pull/341)
* Added support for Docker buildx. [docker/docker-ce-packaging#336](https://github.com/docker/docker-ce-packaging/pull/336)
* Added support for Docker Assemble v0.36.0.
* Added support for Docker Cluster v1.0.0-rc2.
* Added support for Docker Template v0.1.4.
* Added support for Docker Registry v0.1.0-rc1.
* Bumped google.golang.org/grpc to v1.20.1. [docker/cli#1884](https://github.com/docker/cli/pull/1884)
* CLI changed to pass driver specific options to `docker run`. [docker/cli#1767](https://github.com/docker/cli/pull/1767)
* Bumped Golang 1.12.5. [docker/cli#1875](https://github.com/docker/cli/pull/1875)
* `docker system info` output now segregates information relevant to the client and daemon.
[docker/cli#1638](https://github.com/docker/cli/pull/1638)
* (Experimental) When targeting Kubernetes, added support for `x-pull-secret: some-pull-secret` in
compose-files service configs. [docker/cli#1617](https://github.com/docker/cli/pull/1617)
* (Experimental) When targeting Kubernetes, added support for `x-pull-policy: <Never|Always|IfNotPresent>`
in compose-files service configs. [docker/cli#1617](https://github.com/docker/cli/pull/1617)
* cp, save, export: Now preventing overwriting irregular files. [docker/cli#1515](https://github.com/docker/cli/pull/1515)
* npipe volume type on stack file now allowed. [docker/cli#1195](https://github.com/docker/cli/pull/1195)
* Fixed tty initial size error. [docker/cli#1529](https://github.com/docker/cli/pull/1529)
* Fixed problem with labels copying value from environment variables.
[docker/cli#1671](https://github.com/docker/cli/pull/1671)
@y
* Added `--pids-limit` flag to `docker update`. [docker/cli#1765](https://github.com/docker/cli/pull/1765)
* Added systctl support for services. [docker/cli#1754](https://github.com/docker/cli/pull/1754)
* Added support for `template_driver` in compose files. [docker/cli#1746](https://github.com/docker/cli/pull/1746)
* Added `--device` support for Windows. [docker/cli#1606](https://github.com/docker/cli/pull/1606)
* Added support for Data Path Port configuration. [docker/cli#1509](https://github.com/docker/cli/pull/1509)
* Added fast context switch: commands. [docker/cli#1501](https://github.com/docker/cli/pull/1501)
* Support added for `--mount type=bind,bind-nonrecursive,...` [docker/cli#1430](https://github.com/docker/cli/pull/1430)
* Added maximum replicas per node. [docker/cli#1612](https://github.com/docker/cli/pull/1612)
* Added option to pull images quietly. [docker/cli#882](https://github.com/docker/cli/pull/882)
* Added a separate `--domainname` flag. [docker/cli#1130](https://github.com/docker/cli/pull/1130)
* Added support for secret drivers in `docker stack deploy`. [docker/cli#1783](https://github.com/docker/cli/pull/1783)
* Added ability to use swarm `Configs` as `CredentialSpecs` on services.
[docker/cli#1781](https://github.com/docker/cli/pull/1781)
* Added `--security-opt systempaths=unconfined` support. [docker/cli#1808](https://github.com/docker/cli/pull/1808)
* Added basic framework for writing and running CLI plugins. [docker/cli#1564](https://github.com/docker/cli/pull/1564)
  [docker/cli#1898](https://github.com/docker/cli/pull/1898)
* Bumped Docker App to v0.8.0. [docker/docker-ce-packaging#341](https://github.com/docker/docker-ce-packaging/pull/341)
* Added support for Docker buildx. [docker/docker-ce-packaging#336](https://github.com/docker/docker-ce-packaging/pull/336)
* Added support for Docker Assemble v0.36.0.
* Added support for Docker Cluster v1.0.0-rc2.
* Added support for Docker Template v0.1.4.
* Added support for Docker Registry v0.1.0-rc1.
* Bumped google.golang.org/grpc to v1.20.1. [docker/cli#1884](https://github.com/docker/cli/pull/1884)
* CLI changed to pass driver specific options to `docker run`. [docker/cli#1767](https://github.com/docker/cli/pull/1767)
* Bumped Golang 1.12.5. [docker/cli#1875](https://github.com/docker/cli/pull/1875)
* `docker system info` output now segregates information relevant to the client and daemon.
[docker/cli#1638](https://github.com/docker/cli/pull/1638)
* (Experimental) When targeting Kubernetes, added support for `x-pull-secret: some-pull-secret` in
compose-files service configs. [docker/cli#1617](https://github.com/docker/cli/pull/1617)
* (Experimental) When targeting Kubernetes, added support for `x-pull-policy: <Never|Always|IfNotPresent>`
in compose-files service configs. [docker/cli#1617](https://github.com/docker/cli/pull/1617)
* cp, save, export: Now preventing overwriting irregular files. [docker/cli#1515](https://github.com/docker/cli/pull/1515)
* npipe volume type on stack file now allowed. [docker/cli#1195](https://github.com/docker/cli/pull/1195)
* Fixed tty initial size error. [docker/cli#1529](https://github.com/docker/cli/pull/1529)
* Fixed problem with labels copying value from environment variables.
[docker/cli#1671](https://github.com/docker/cli/pull/1671)
@z

@x
### API
@y
### API
@z

@x
* Updated API version to v1.40. [moby/moby#38089](https://github.com/moby/moby/pull/38089)
* Added warnings to `/info` endpoint, and moved detection to the daemon.
[moby/moby#37502](https://github.com/moby/moby/pull/37502)
* Added HEAD support for `/_ping` endpoint. [moby/moby#38570](https://github.com/moby/moby/pull/38570)
* Added `Cache-Control` headers to disable caching `/_ping` endpoint.
[moby/moby#38569](https://github.com/moby/moby/pull/38569)
* Added `containerd`, `runc`, and `docker-init` versions to `/version`.
[moby/moby#37974](https://github.com/moby/moby/pull/37974)
* Added undocumented `/grpc` endpoint and registered BuildKit's controller.
[moby/moby#38990](https://github.com/moby/moby/pull/38990)
@y
* Updated API version to v1.40. [moby/moby#38089](https://github.com/moby/moby/pull/38089)
* Added warnings to `/info` endpoint, and moved detection to the daemon.
[moby/moby#37502](https://github.com/moby/moby/pull/37502)
* Added HEAD support for `/_ping` endpoint. [moby/moby#38570](https://github.com/moby/moby/pull/38570)
* Added `Cache-Control` headers to disable caching `/_ping` endpoint.
[moby/moby#38569](https://github.com/moby/moby/pull/38569)
* Added `containerd`, `runc`, and `docker-init` versions to `/version`.
[moby/moby#37974](https://github.com/moby/moby/pull/37974)
* Added undocumented `/grpc` endpoint and registered BuildKit's controller.
[moby/moby#38990](https://github.com/moby/moby/pull/38990)
@z

@x
### Experimental
* Enabled checkpoint/restore of containers with TTY. [moby/moby#38405](https://github.com/moby/moby/pull/38405)
* LCOW: Added support for memory and CPU limits. [moby/moby#37296](https://github.com/moby/moby/pull/37296)
* Windows: Added ContainerD runtime. [moby/moby#38541](https://github.com/moby/moby/pull/38541)
* Windows: LCOW now requires Windows RS5+. [moby/moby#39108](https://github.com/moby/moby/pull/39108)
@y
### Experimental
* Enabled checkpoint/restore of containers with TTY. [moby/moby#38405](https://github.com/moby/moby/pull/38405)
* LCOW: Added support for memory and CPU limits. [moby/moby#37296](https://github.com/moby/moby/pull/37296)
* Windows: Added ContainerD runtime. [moby/moby#38541](https://github.com/moby/moby/pull/38541)
* Windows: LCOW now requires Windows RS5+. [moby/moby#39108](https://github.com/moby/moby/pull/39108)
@z

@x
### Security
@y
### Security
@z

@x
* mount: added BindOptions.NonRecursive (API v1.40). [moby/moby#38003](https://github.com/moby/moby/pull/38003)
* seccomp: whitelisted `io_pgetevents()`. [moby/moby#38895](https://github.com/moby/moby/pull/38895)
* seccomp: `ptrace(2)` for 4.8+ kernels now allowed. [moby/moby#38137](https://github.com/moby/moby/pull/38137)
@y
* mount: added BindOptions.NonRecursive (API v1.40). [moby/moby#38003](https://github.com/moby/moby/pull/38003)
* seccomp: whitelisted `io_pgetevents()`. [moby/moby#38895](https://github.com/moby/moby/pull/38895)
* seccomp: `ptrace(2)` for 4.8+ kernels now allowed. [moby/moby#38137](https://github.com/moby/moby/pull/38137)
@z

@x
### Runtime
@y
### Runtime
@z

@x
* Running `dockerd` as a non-root user (Rootless mode) is now allowed.
[moby/moby#380050](https://github.com/moby/moby/pull/38050)
* Rootless: optional support provided for `lxc-user-nic` SUID binary.
[docker/engine#208](https://github.com/docker/engine/pull/208)
* Added DeviceRequests to HostConfig to support NVIDIA GPUs. [moby/moby#38828](https://github.com/moby/moby/pull/38828)
* Added `--device` support for Windows. [moby/moby#37638](https://github.com/moby/moby/pull/37638)
* Added `memory.kernelTCP` support for linux. [moby/moby#37043](https://github.com/moby/moby/pull/37043)
* Windows credential specs can now be passed directly to the engine.
[moby/moby#38777](https://github.com/moby/moby/pull/38777)
* Added pids-limit support in docker update. [moby/moby#32519](https://github.com/moby/moby/pull/32519)
* Added support for exact list of capabilities. [moby/moby#38380](https://github.com/moby/moby/pull/38380)
* daemon: Now use 'private' ipc mode by default. [moby/moby#35621](https://github.com/moby/moby/pull/35621)
* daemon: switched to semaphore-gated WaitGroup for startup tasks. [moby/moby#38301](https://github.com/moby/moby/pull/38301)
* Now use `idtools.LookupGroup` instead of parsing `/etc/group` file for docker.sock ownership to
fix: `api.go doesn't respect nsswitch.conf`. [moby/moby#38126](https://github.com/moby/moby/pull/38126)
* cli: fixed images filter when using multi reference filter. [moby/moby#38171](https://github.com/moby/moby/pull/38171)
* Bumped Golang to 1.12.5. [docker/engine#209](https://github.com/docker/engine/pull/209)
* Bumped `containerd` to 1.2.6. [moby/moby#39016](https://github.com/moby/moby/pull/39016)
* Bumped `runc` to 1.0.0-rc8, opencontainers/selinux v1.2.2. [docker/engine#210](https://github.com/docker/engine/pull/210)
* Bumped `google.golang.org/grpc` to v1.20.1. [docker/engine#215](https://github.com/docker/engine/pull/215)
* Performance optimized in aufs and layer store for massively parallel container creation/removal.
[moby/moby#39135](https://github.com/moby/moby/pull/39135) [moby/moby#39209](https://github.com/moby/moby/pull/39209)
* Root is now passed to chroot for chroot Tar/Untar (CVE-2018-15664)
[moby/moby#39292](https://github.com/moby/moby/pull/39292)
* Fixed `docker --init` with /dev bind mount. [moby/moby#37665](https://github.com/moby/moby/pull/37665)
* The right device number is now fetched when greater than 255 and using the `--device-read-bps` option.
[moby/moby#39212](https://github.com/moby/moby/pull/39212)
* Fixed `Path does not exist` error when path definitely exists. [moby/moby#39251](https://github.com/moby/moby/pull/39251)
@y
* Running `dockerd` as a non-root user (Rootless mode) is now allowed.
[moby/moby#380050](https://github.com/moby/moby/pull/38050)
* Rootless: optional support provided for `lxc-user-nic` SUID binary.
[docker/engine#208](https://github.com/docker/engine/pull/208)
* Added DeviceRequests to HostConfig to support NVIDIA GPUs. [moby/moby#38828](https://github.com/moby/moby/pull/38828)
* Added `--device` support for Windows. [moby/moby#37638](https://github.com/moby/moby/pull/37638)
* Added `memory.kernelTCP` support for linux. [moby/moby#37043](https://github.com/moby/moby/pull/37043)
* Windows credential specs can now be passed directly to the engine.
[moby/moby#38777](https://github.com/moby/moby/pull/38777)
* Added pids-limit support in docker update. [moby/moby#32519](https://github.com/moby/moby/pull/32519)
* Added support for exact list of capabilities. [moby/moby#38380](https://github.com/moby/moby/pull/38380)
* daemon: Now use 'private' ipc mode by default. [moby/moby#35621](https://github.com/moby/moby/pull/35621)
* daemon: switched to semaphore-gated WaitGroup for startup tasks. [moby/moby#38301](https://github.com/moby/moby/pull/38301)
* Now use `idtools.LookupGroup` instead of parsing `/etc/group` file for docker.sock ownership to
fix: `api.go doesn't respect nsswitch.conf`. [moby/moby#38126](https://github.com/moby/moby/pull/38126)
* cli: fixed images filter when using multi reference filter. [moby/moby#38171](https://github.com/moby/moby/pull/38171)
* Bumped Golang to 1.12.5. [docker/engine#209](https://github.com/docker/engine/pull/209)
* Bumped `containerd` to 1.2.6. [moby/moby#39016](https://github.com/moby/moby/pull/39016)
* Bumped `runc` to 1.0.0-rc8, opencontainers/selinux v1.2.2. [docker/engine#210](https://github.com/docker/engine/pull/210)
* Bumped `google.golang.org/grpc` to v1.20.1. [docker/engine#215](https://github.com/docker/engine/pull/215)
* Performance optimized in aufs and layer store for massively parallel container creation/removal.
[moby/moby#39135](https://github.com/moby/moby/pull/39135) [moby/moby#39209](https://github.com/moby/moby/pull/39209)
* Root is now passed to chroot for chroot Tar/Untar (CVE-2018-15664)
[moby/moby#39292](https://github.com/moby/moby/pull/39292)
* Fixed `docker --init` with /dev bind mount. [moby/moby#37665](https://github.com/moby/moby/pull/37665)
* The right device number is now fetched when greater than 255 and using the `--device-read-bps` option.
[moby/moby#39212](https://github.com/moby/moby/pull/39212)
* Fixed `Path does not exist` error when path definitely exists. [moby/moby#39251](https://github.com/moby/moby/pull/39251)
@z

@x
### Networking
@y
### Networking
@z

@x
* Moved IPVLAN driver out of experimental.
[moby/moby#38983](https://github.com/moby/moby/pull/38983)
* Added support for 'dangling' filter. [moby/moby#31551](https://github.com/moby/moby/pull/31551)
[docker/libnetwork#2230](https://github.com/docker/libnetwork/pull/2230)
* Load balancer sandbox is now deleted when a service is updated with `--network-rm`.
[docker/engine#213](https://github.com/docker/engine/pull/213)
* Windows: Now forcing a nil IP specified in `PortBindings` to IPv4zero (0.0.0.0).
[docker/libnetwork#2376](https://github.com/docker/libnetwork/pull/2376)
@y
* Moved IPVLAN driver out of experimental.
[moby/moby#38983](https://github.com/moby/moby/pull/38983)
* Added support for 'dangling' filter. [moby/moby#31551](https://github.com/moby/moby/pull/31551)
[docker/libnetwork#2230](https://github.com/docker/libnetwork/pull/2230)
* Load balancer sandbox is now deleted when a service is updated with `--network-rm`.
[docker/engine#213](https://github.com/docker/engine/pull/213)
* Windows: Now forcing a nil IP specified in `PortBindings` to IPv4zero (0.0.0.0).
[docker/libnetwork#2376](https://github.com/docker/libnetwork/pull/2376)
@z

@x
### Swarm
@y
### Swarm
@z

@x
* Added support for maximum replicas per node. [moby/moby#37940](https://github.com/moby/moby/pull/37940)
* Added support for GMSA CredentialSpecs from Swarmkit configs. [moby/moby#38632](https://github.com/moby/moby/pull/38632)
* Added support for sysctl options in services. [moby/moby#37701](https://github.com/moby/moby/pull/37701)
* Added support for filtering on node labels. [moby/moby#37650](https://github.com/moby/moby/pull/37650)
* Windows: Support added for named pipe mounts in docker service create + stack yml.
[moby/moby#37400](https://github.com/moby/moby/pull/37400)
* VXLAN UDP Port configuration now supported. [moby/moby#38102](https://github.com/moby/moby/pull/38102)
* Now using Service Placement Constraints in Enforcer. [docker/swarmkit#2857](https://github.com/docker/swarmkit/pull/2857)
* Increased max recv gRPC message size for nodes and secrets.
[docker/engine#256](https://github.com/docker/engine/pull/256)
@y
* Added support for maximum replicas per node. [moby/moby#37940](https://github.com/moby/moby/pull/37940)
* Added support for GMSA CredentialSpecs from Swarmkit configs. [moby/moby#38632](https://github.com/moby/moby/pull/38632)
* Added support for sysctl options in services. [moby/moby#37701](https://github.com/moby/moby/pull/37701)
* Added support for filtering on node labels. [moby/moby#37650](https://github.com/moby/moby/pull/37650)
* Windows: Support added for named pipe mounts in docker service create + stack yml.
[moby/moby#37400](https://github.com/moby/moby/pull/37400)
* VXLAN UDP Port configuration now supported. [moby/moby#38102](https://github.com/moby/moby/pull/38102)
* Now using Service Placement Constraints in Enforcer. [docker/swarmkit#2857](https://github.com/docker/swarmkit/pull/2857)
* Increased max recv gRPC message size for nodes and secrets.
[docker/engine#256](https://github.com/docker/engine/pull/256)
@z

@x
### Logging
@y
### Logging
@z

@x
* Enabled gcplogs driver on Windows. [moby/moby#37717](https://github.com/moby/moby/pull/37717)
* Added zero padding for RFC5424 syslog format. [moby/moby#38335](https://github.com/moby/moby/pull/38335)
* Added `IMAGE_NAME` attribute to `journald` log events. [moby/moby#38032](https://github.com/moby/moby/pull/38032)
@y
* Enabled gcplogs driver on Windows. [moby/moby#37717](https://github.com/moby/moby/pull/37717)
* Added zero padding for RFC5424 syslog format. [moby/moby#38335](https://github.com/moby/moby/pull/38335)
* Added `IMAGE_NAME` attribute to `journald` log events. [moby/moby#38032](https://github.com/moby/moby/pull/38032)
@z

@x
### Deprecation
@y
### Deprecation
@z

@x
* Deprecate image manifest v2 schema1 in favor of v2 schema2. Future version of Docker will remove
support for v2 schema1 althogether. [moby/moby#39365](https://github.com/moby/moby/pull/39365)
* Removed v1.10 migrator. [moby/moby#38265](https://github.com/moby/moby/pull/38265)
* Now skipping deprecated storage-drivers in auto-selection. [moby/moby#38019](https://github.com/moby/moby/pull/38019)
* Deprecated `aufs` storage driver and added warning. [moby/moby#38090](https://github.com/moby/moby/pull/38090)
* Removed support for 17.09.
@y
* Deprecate image manifest v2 schema1 in favor of v2 schema2. Future version of Docker will remove
support for v2 schema1 althogether. [moby/moby#39365](https://github.com/moby/moby/pull/39365)
* Removed v1.10 migrator. [moby/moby#38265](https://github.com/moby/moby/pull/38265)
* Now skipping deprecated storage-drivers in auto-selection. [moby/moby#38019](https://github.com/moby/moby/pull/38019)
* Deprecated `aufs` storage driver and added warning. [moby/moby#38090](https://github.com/moby/moby/pull/38090)
* Removed support for 17.09.
@z

@x
For more information on deprecated flags and APIs, refer to
https://docs.docker.com/engine/deprecated/ for target removal dates.
@y
For more information on deprecated flags and APIs, refer to
https://docs.docker.com/engine/deprecated/ for target removal dates.
@z

@x
### Known issues
@y
### Known issues
@z

@x
* In some circumstances with large clusters, docker information might, as part of the Swarm section,
include the error `code = ResourceExhausted desc = grpc: received message larger than
max (5351376 vs. 4194304)`. This does not indicate any failure or misconfiguration by the user,
and requires no response.
* Orchestrator port conflict can occur when redeploying all services as new. Due to many swarm manager
requests in a short amount of time, some services are not able to receive traffic and are causing a `404`
error after being deployed.
   - Workaround: restart all tasks via `docker service update --force`.
@y
* In some circumstances with large clusters, docker information might, as part of the Swarm section,
include the error `code = ResourceExhausted desc = grpc: received message larger than
max (5351376 vs. 4194304)`. This does not indicate any failure or misconfiguration by the user,
and requires no response.
* Orchestrator port conflict can occur when redeploying all services as new. Due to many swarm manager
requests in a short amount of time, some services are not able to receive traffic and are causing a `404`
error after being deployed.
   - Workaround: restart all tasks via `docker service update --force`.
@z

@x
* Traffic cannot egress the HOST because of missing Iptables rules in the FORWARD chain
The missing rules are :
    ```
    /sbin/iptables --wait -C FORWARD -o docker_gwbridge -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
    /sbin/iptables --wait -C FORWARD -o docker0 -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
    ```
    - Workaround: Add these rules back using a script and cron definitions. The script
    must contain '-C' commands to check for the presence of a rule and '-A' commands to add
    rules back. Run the script on a cron in regular intervals, for example, every <x> minutes.
    - Affected versions: 18.09.1, 19.03.0
* [CVE-2018-15664](https://nvd.nist.gov/vuln/detail/CVE-2018-15664) symlink-exchange attack with directory traversal. Workaround until proper fix is available in upcoming patch release: `docker pause` container before doing file operations. [moby/moby#39252](https://github.com/moby/moby/pull/39252)
* `docker cp` regression due to CVE mitigation. An error is produced when the source of `docker cp` is set to `/`.
@y
* Traffic cannot egress the HOST because of missing Iptables rules in the FORWARD chain
The missing rules are :
    ```
    /sbin/iptables --wait -C FORWARD -o docker_gwbridge -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
    /sbin/iptables --wait -C FORWARD -o docker0 -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
    ```
    - Workaround: Add these rules back using a script and cron definitions. The script
    must contain '-C' commands to check for the presence of a rule and '-A' commands to add
    rules back. Run the script on a cron in regular intervals, for example, every <x> minutes.
    - Affected versions: 18.09.1, 19.03.0
* [CVE-2018-15664](https://nvd.nist.gov/vuln/detail/CVE-2018-15664) symlink-exchange attack with directory traversal. Workaround until proper fix is available in upcoming patch release: `docker pause` container before doing file operations. [moby/moby#39252](https://github.com/moby/moby/pull/39252)
* `docker cp` regression due to CVE mitigation. An error is produced when the source of `docker cp` is set to `/`.
@z
