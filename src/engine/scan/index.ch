%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Vulnerability scanning for Docker local images
description: Vulnerability scanning for Docker local images
keywords: Docker, scan, Snyk, images, local, CVE, vulnerability, security
toc_min: 1
toc_max: 2
---
@y
---
title: Docker ローカルイメージに対するぜい弱性スキャン
description: Dockerローカルイメージに対するぜい弱性スキャン。
keywords: Docker, scan, Snyk, images, local, CVE, vulnerability, security
toc_min: 1
toc_max: 2
---
@z

@x
{% include sign-up-cta.html
  body="Did you know that you can now get 10 free scans per month? Sign in to Docker to start scanning your images for vulnerabilities."
  header-text="Scan your images for free"
  target-url="https://www.docker.com/pricing?utm_source=docker&utm_medium=webreferral&utm_campaign=docs_driven_upgrade_scan"
%}
@y
{% include sign-up-cta.html
  body="1 ヶ月ごとに 10 個のスキャンが無料なのをご存知ですか？ Docker にサインインして、イメージのぜい弱性スキャンを行ってください。"
  header-text="無料のイメージスキャンを行ってください。"
  target-url="https://www.docker.com/pricing?utm_source=docker&utm_medium=webreferral&utm_campaign=docs_driven_upgrade_scan"
%}
@z

@x
Looking to speed up your development cycles? Quickly detect and learn how to remediate CVEs in your images by running `docker scan IMAGE_NAME`. Check out [How to scan images](#how-to-scan-images) for details.
@y
開発サイクルを早めたいと思いませんか？
CVE をすばやく検出して修復する方法として`docker scan IMAGE_NAME`を実行してください。
詳しくは [イメージのスキャン方法](#how-to-scan-images) を確認してください。
@z

@x
Vulnerability scanning for Docker local images  allows developers and development teams to review the security state of the container images and take actions to fix issues identified during the scan, resulting in more secure deployments. Docker Scan runs on Snyk engine, providing users with visibility into the security posture of their local Dockerfiles and local images.
@y
Docker のローカルイメージに対するぜい弱性スキャンは、開発者および開発チームにおいてコンテナーイメージのセキュリティ状況を明らかにするものであり、スキャン中に発覚した問題への対処につながります。
結果としてより安全なデプロイを実現するものです。
Docker スキャンは Snyk エンジンを使って動作します。
ローカルの Dockerfile やローカルイメージに対して、セキュリティ状況を可視化して示します。
@z

@x
Users trigger vulnerability scans through the CLI, and use the CLI to view the
scan results. The scan results contain a list of Common Vulnerabilities and
Exposures (CVEs), the sources, such as OS packages and libraries, versions in
which they were introduced, and a recommended fixed version (if available) to
remediate the CVEs discovered.
@y
ぜい弱性スキャンは CLI から起動し、CLI を使ってスキャン結果を確認します。
スキャン結果は、ぜい弱性情報データベース CVE（Common Vulnerabilities and Exposures）の一覧として構成され、そこにはぜい弱性の発生源、つまり OS パッケージやライブラリなど、またぜい弱性が発生したバージョン、CVE によって検出された問題を修復するための推奨される修正バージョン（入手可能である場合）が示されます。
@z

@x
> **Log4j 2 CVE-2021-44228**
>
> Versions of `docker Scan` earlier than `v0.11.0` are not able to detect [Log4j 2
> CVE-2021-44228](https://nvd.nist.gov/vuln/detail/CVE-2021-44228){:
> target="_blank" rel="noopener" class="_"}. You must update your Docker
> Desktop installation to 4.3.1 or higher to fix this issue. For more
> information, see [Scan images for Log4j 2 CVE](#scan-images-for-log4j-2-cve).
{: .important}
@y
> **Log4j 2 CVE-2021-44228**
>
> `docker scan`のバージョンが`v0.11.0`よりも古い場合、[Log4j 2
> CVE-2021-44228](https://nvd.nist.gov/vuln/detail/CVE-2021-44228){:
> target="_blank" rel="noopener" class="_"} を検出することができません。
> この問題を解決するためには Docker Desktop のバージョンが 4.3.1 またはそれ以降のものをインストールする必要があります。
> 詳しくは [Log4j 2 CVE に対するイメージスキャン](#scan-images-for-log4j-2-cve) を参照してください。
{: .important}
@z

@x
For information about the system requirements to run vulnerability scanning, see [Prerequisites](#prerequisites).
@y
ぜい弱性スキャンの実行に必要となるシステム要件については [前提条件](#prerequisites) を参照してください。
@z

@x
This page contains information about the `docker scan` CLI command. For
information about automatically scanning Docker images through Docker Hub, see
[Hub Vulnerability Scanning](/docker-hub/vulnerability-scanning/).
@y
本ページでは CLI コマンド`docker scan`の情報を示します。
Docker Hub を通じて Docker イメージを自動スキャンする情報に関しては [Docker Hub のぜい弱性スキャン]({{ site.baseurl }}/docker-hub/vulnerability-scanning/) を参照してください。
@z

@x
## Scan images for Log4j 2 CVE
@y
{: #scan-images-for-log4j-2-cve }
## Log4j 2 CVE に対するイメージスキャン
@z

@x
Docker Scan versions earlier than `v0.11.0` do not detect [Log4j 2
CVE-2021-44228](https://nvd.nist.gov/vuln/detail/CVE-2021-44228){:
target="_blank" rel="noopener" class="_"} when you scan your
images for vulnerabilities. You must update your Docker installation to the
latest version to fix this issue.
@y
Docker スキャンのバージョンが`v0.11.0`よりも古い場合、イメージのぜい弱性スキャンを行っても [Log4j 2
CVE-2021-44228](https://nvd.nist.gov/vuln/detail/CVE-2021-44228){:
target="_blank" rel="noopener" class="_"} を検出することができません。
この問題を解決するには Docker の最新版をインストールする必要があります。
@z

@x
If you are using the `docker scan` plugin shipped
with Docker Desktop, update Docker Desktop to version 4.3.1 or
higher. See the release notes for [Mac](../../desktop/mac/release-notes/index.md) and
[Windows](../../desktop/windows/release-notes/index.md) for download information.
@y
Docker Desktop に含まれている`docker scan`プラグインを利用している場合は、Docker Desktop のバージョンを 4.3.1 またはそれ以降にアップデートしてください。
ダウンロードに関しては、[Mac](../../desktop/mac/release-notes/index.md) のリリースノート、あるいは [Windows](../../desktop/windows/release-notes/index.md) のリリースノートを参照してください。
@z

@x
If you are using Linux, run the following command to manually install the latest
version of `docker scan`:
@y
Linux を利用している場合は、以下のコマンドを手作業により実行して、最新の`docker scan`をインストールします。
@z

@x
On `.deb` based distros, such as Ubuntu and Debian:
@y
Ubuntu や Debian のような`.deb`をベースとするディストリビューションでは、以下のようにします。
@z

@x
```console
$ apt-get update && apt-get install docker-scan-plugin
```
@y
```console
$ apt-get update && apt-get install docker-scan-plugin
```
@z

@x
On rpm-based distros, such as CentOS or Fedora:
@y
CentOS や Fedora のような rpm ベースのディストリビューションでは、以下のようにします。
@z

@x
```console
$ yum install docker-scan-plugin
```
@y
```console
$ yum install docker-scan-plugin
```
@z

@x
Alternatively, you can manually download the `docker scan` binaries from the [Docker Scan](https://github.com/docker/scan-cli-plugin/releases/tag/v0.11.0){:
target="_blank" rel="noopener" class="_"} GitHub repository and
[install](https://github.com/docker/scan-cli-plugin){:
target="_blank" rel="noopener" class="_"}  in the plugins directory.
@y
上とは別に`docker scan`のバイナリは、GitHub レジストリ [Docker Scan](https://github.com/docker/scan-cli-plugin/releases/tag/v0.11.0){:target="_blank" rel="noopener" class="_"} やプラグインディレクトリ内の [install](https://github.com/docker/scan-cli-plugin){:target="_blank" rel="noopener" class="_"}  からダウンロードすることができます。
@z

@x
### Verify the `docker scan` version
@y
{: #verify-the-docker-scan-version }
### `docker scan`のバージョン確認
@z

@x
After upgrading `docker scan`, verify you are running the latest version by
running the following command:
@y
`docker scan`のアップグレードを行ったら、インストールした`docker scan`が最新であるかどうかを、以下のコマンドを実行して確認します。
@z

@x
```console
$ docker scan --accept-license --version
Version:    v0.12.0
Git commit: 1074dd0
Provider:   Snyk (1.790.0 (standalone))
```
@y
```console
$ docker scan --accept-license --version
Version:    v0.12.0
Git commit: 1074dd0
Provider:   Snyk (1.790.0 (standalone))
```
@z

@x
If your code output contains `ORGAPACHELOGGINGLOG4J`, it is
likely that your code is affected by the Log4j 2 CVE-2021-44228 vulnerability. When you run the updated version of `docker scan`, you should also see a message
in the output log similar to:
@y
If your code output contains `ORGAPACHELOGGINGLOG4J`, it is
likely that your code is affected by the Log4j 2 CVE-2021-44228 vulnerability. When you run the updated version of `docker scan`, you should also see a message
in the output log similar to:
@z

@x
```console
Upgrade org.apache.logging.log4j:log4j-core@2.14.0 to org.apache.logging.log4j:log4j-core@2.15.0 to fix
✗ Arbitrary Code Execution (new) [Critical Severity][https://snyk.io/vuln/SNYK-JAVA-ORGAPACHELOGGINGLOG4J-2314720] in org.apache.logging.log4j:log4j-core@2.14.0
introduced by org.apache.logging.log4j:log4j-core@2.14.0
```
@y
```console
Upgrade org.apache.logging.log4j:log4j-core@2.14.0 to org.apache.logging.log4j:log4j-core@2.15.0 to fix
✗ Arbitrary Code Execution (new) [Critical Severity][https://snyk.io/vuln/SNYK-JAVA-ORGAPACHELOGGINGLOG4J-2314720] in org.apache.logging.log4j:log4j-core@2.14.0
introduced by org.apache.logging.log4j:log4j-core@2.14.0
```
@z

@x
For more information, read our blog post [Apache Log4j 2
CVE-2021-44228](https://www.docker.com/blog/apache-log4j-2-cve-2021-44228/){:
target="_blank" rel="noopener" class="_"}.
@y
For more information, read our blog post [Apache Log4j 2
CVE-2021-44228](https://www.docker.com/blog/apache-log4j-2-cve-2021-44228/){:
target="_blank" rel="noopener" class="_"}.
@z

@x
## How to scan images
@y
{: #how-to-scan-images }
## イメージのスキャン方法
@z

@x
The `docker scan` command allows you to scan existing Docker images using the image name or ID.  For example, run the following command to scan the hello-world image:
@y
`docker scan`コマンドは、イメージ名またはイメージ ID を指定して、既存の Docker イメージをスキャンします。
たとえば以下のコマンドは hello-world イメージをスキャンします。
@z

@x
```console
$ docker scan hello-world

Testing hello-world...

Organization:      docker-desktop-test
Package manager:   linux
Project name:      docker-image|hello-world
Docker image:      hello-world
Licenses:          enabled

✓ Tested 0 dependencies for known issues, no vulnerable paths found.

Note that we do not currently have vulnerability data for your image.
```
@y
```console
$ docker scan hello-world

Testing hello-world...

Organization:      docker-desktop-test
Package manager:   linux
Project name:      docker-image|hello-world
Docker image:      hello-world
Licenses:          enabled

✓ Tested 0 dependencies for known issues, no vulnerable paths found.

Note that we do not currently have vulnerability data for your image.
```
@z

@x
### Get a detailed scan report
@y
{: #get-a-detailed-scan-report }
### スキャン結果詳細
@z

@x
You can get a detailed scan report about a Docker image by providing the Dockerfile used to create the image. The syntax is `docker scan --file PATH_TO_DOCKERFILE DOCKER_IMAGE`.
@y
イメージを作り出すために用いられた Dockerfile を指定することで、Docker イメージに関する詳細なスキャン結果を得ることができます。
コマンド文法は`docker scan --file <Dockerfileへのパス> <Dockerイメージ>`というものです。
@z

@x
For example, if you apply the option to the `docker-scan` test image, it displays the following result:
@y
たとえばテストイメージに対してそのオプションを指定すると、以下のような結果が表示されます。
@z

@x
```console
$ docker scan --file Dockerfile docker-scan:e2e
Testing docker-scan:e2e
...
✗ High severity vulnerability found in perl
  Description: Integer Overflow or Wraparound
  Info: https://snyk.io/vuln/SNYK-DEBIAN10-PERL-570802
  Introduced through: git@1:2.20.1-2+deb10u3, meta-common-packages@meta
  From: git@1:2.20.1-2+deb10u3 > perl@5.28.1-6
  From: git@1:2.20.1-2+deb10u3 > liberror-perl@0.17027-2 > perl@5.28.1-6
  From: git@1:2.20.1-2+deb10u3 > perl@5.28.1-6 > perl/perl-modules-5.28@5.28.1-6
  and 3 more...
  Introduced by your base image (golang:1.14.6)

Organization:      docker-desktop-test
Package manager:   deb
Target file:       Dockerfile
Project name:      docker-image|99138c65ebc7
Docker image:      99138c65ebc7
Base image:        golang:1.14.6
Licenses:          enabled

Tested 200 dependencies for known issues, found 157 issues.

According to our scan, you are currently using the most secure version of the selected base image
```
@y
```console
$ docker scan --file Dockerfile docker-scan:e2e
Testing docker-scan:e2e
...
✗ High severity vulnerability found in perl
  Description: Integer Overflow or Wraparound
  Info: https://snyk.io/vuln/SNYK-DEBIAN10-PERL-570802
  Introduced through: git@1:2.20.1-2+deb10u3, meta-common-packages@meta
  From: git@1:2.20.1-2+deb10u3 > perl@5.28.1-6
  From: git@1:2.20.1-2+deb10u3 > liberror-perl@0.17027-2 > perl@5.28.1-6
  From: git@1:2.20.1-2+deb10u3 > perl@5.28.1-6 > perl/perl-modules-5.28@5.28.1-6
  and 3 more...
  Introduced by your base image (golang:1.14.6)

Organization:      docker-desktop-test
Package manager:   deb
Target file:       Dockerfile
Project name:      docker-image|99138c65ebc7
Docker image:      99138c65ebc7
Base image:        golang:1.14.6
Licenses:          enabled

Tested 200 dependencies for known issues, found 157 issues.

According to our scan, you are currently using the most secure version of the selected base image
```
@z

@x
### Excluding the base image
@y
{: #excluding-the-base-image }
### ベースイメージの除外
@z

@x
When using docker scan with the `--file` flag, you can also add the `--exclude-base` tag. This excludes the base image (specified in the Dockerfile using the `FROM` directive) vulnerabilities from your report. For example:
@y
`--file`フラグを使って docker scan を行う場合に`--exclude-base`フラグを同時に指定することができます。
このフラグは、ぜい弱性スキャン結果からベースイメージ（Dockerfile において`FROM`ディレクティブにより指定されたもの）を除外します。
たとえば以下のとおりです。
@z

@x
```console
$ docker scan --file Dockerfile --exclude-base docker-scan:e2e
Testing docker-scan:e2e
...
✗ Medium severity vulnerability found in libidn2/libidn2-0
  Description: Improper Input Validation
  Info: https://snyk.io/vuln/SNYK-DEBIAN10-LIBIDN2-474100
  Introduced through: iputils/iputils-ping@3:20180629-2+deb10u1, wget@1.20.1-1.1, curl@7.64.0-4+deb10u1, git@1:2.20.1-2+deb10u3
  From: iputils/iputils-ping@3:20180629-2+deb10u1 > libidn2/libidn2-0@2.0.5-1+deb10u1
  From: wget@1.20.1-1.1 > libidn2/libidn2-0@2.0.5-1+deb10u1
  From: curl@7.64.0-4+deb10u1 > curl/libcurl4@7.64.0-4+deb10u1 > libidn2/libidn2-0@2.0.5-1+deb10u1
  and 3 more...
  Introduced in your Dockerfile by 'RUN apk add -U --no-cache wget tar'



Organization:      docker-desktop-test
Package manager:   deb
Target file:       Dockerfile
Project name:      docker-image|99138c65ebc7
Docker image:      99138c65ebc7
Base image:        golang:1.14.6
Licenses:          enabled

Tested 200 dependencies for known issues, found 16 issues.
```
@y
```console
$ docker scan --file Dockerfile --exclude-base docker-scan:e2e
Testing docker-scan:e2e
...
✗ Medium severity vulnerability found in libidn2/libidn2-0
  Description: Improper Input Validation
  Info: https://snyk.io/vuln/SNYK-DEBIAN10-LIBIDN2-474100
  Introduced through: iputils/iputils-ping@3:20180629-2+deb10u1, wget@1.20.1-1.1, curl@7.64.0-4+deb10u1, git@1:2.20.1-2+deb10u3
  From: iputils/iputils-ping@3:20180629-2+deb10u1 > libidn2/libidn2-0@2.0.5-1+deb10u1
  From: wget@1.20.1-1.1 > libidn2/libidn2-0@2.0.5-1+deb10u1
  From: curl@7.64.0-4+deb10u1 > curl/libcurl4@7.64.0-4+deb10u1 > libidn2/libidn2-0@2.0.5-1+deb10u1
  and 3 more...
  Introduced in your Dockerfile by 'RUN apk add -U --no-cache wget tar'



Organization:      docker-desktop-test
Package manager:   deb
Target file:       Dockerfile
Project name:      docker-image|99138c65ebc7
Docker image:      99138c65ebc7
Base image:        golang:1.14.6
Licenses:          enabled

Tested 200 dependencies for known issues, found 16 issues.
```
@z

@x
### Viewing the JSON output
@y
{: #viewing-the-json-output }
### JSON 書式による出力
@z

@x
You can also display the scan result as a JSON output by adding the `--json` flag to the command. For example:
@y
コマンドに対して`--json`フラグを指定することで、スキャン結果を JSON 書式により表示することができます。
たとえば以下のとおりです。
@z

@x
```console
$ docker scan --json hello-world
{
  "vulnerabilities": [],
  "ok": true,
  "dependencyCount": 0,
  "org": "docker-desktop-test",
  "policy": "# Snyk (https://snyk.io) policy file, patches or ignores known vulnerabilities.\nversion: v1.19.0\nignore: {}\npatch: {}\n",
  "isPrivate": true,
  "licensesPolicy": {
    "severities": {},
    "orgLicenseRules": {
      "AGPL-1.0": {
        "licenseType": "AGPL-1.0",
        "severity": "high",
        "instructions": ""
      },
      ...
      "SimPL-2.0": {
        "licenseType": "SimPL-2.0",
        "severity": "high",
        "instructions": ""
      }
    }
  },
  "packageManager": "linux",
  "ignoreSettings": null,
  "docker": {
    "baseImageRemediation": {
      "code": "SCRATCH_BASE_IMAGE",
      "advice": [
        {
          "message": "Note that we do not currently have vulnerability data for your image.",
          "bold": true,
          "color": "yellow"
        }
      ]
    },
    "binariesVulns": {
      "issuesData": {},
      "affectedPkgs": {}
    }
  },
  "summary": "No known vulnerabilities",
  "filesystemPolicy": false,
  "uniqueCount": 0,
  "projectName": "docker-image|hello-world",
  "path": "hello-world"
}
```
@y
```console
$ docker scan --json hello-world
{
  "vulnerabilities": [],
  "ok": true,
  "dependencyCount": 0,
  "org": "docker-desktop-test",
  "policy": "# Snyk (https://snyk.io) policy file, patches or ignores known vulnerabilities.\nversion: v1.19.0\nignore: {}\npatch: {}\n",
  "isPrivate": true,
  "licensesPolicy": {
    "severities": {},
    "orgLicenseRules": {
      "AGPL-1.0": {
        "licenseType": "AGPL-1.0",
        "severity": "high",
        "instructions": ""
      },
      ...
      "SimPL-2.0": {
        "licenseType": "SimPL-2.0",
        "severity": "high",
        "instructions": ""
      }
    }
  },
  "packageManager": "linux",
  "ignoreSettings": null,
  "docker": {
    "baseImageRemediation": {
      "code": "SCRATCH_BASE_IMAGE",
      "advice": [
        {
          "message": "Note that we do not currently have vulnerability data for your image.",
          "bold": true,
          "color": "yellow"
        }
      ]
    },
    "binariesVulns": {
      "issuesData": {},
      "affectedPkgs": {}
    }
  },
  "summary": "No known vulnerabilities",
  "filesystemPolicy": false,
  "uniqueCount": 0,
  "projectName": "docker-image|hello-world",
  "path": "hello-world"
}
```
@z

@x
In addition to the `--json` flag, you can also use the `--group-issues` flag to display a vulnerability only once in the scan report:
@y
`--json`フラグに加えて`--group-issues`フラグを利用することもできます。
これはスキャン報告において 1 つのぜい弱性を 1 度だけ表示するものです。
@z

@x
```console
$ docker scan --json --group-issues docker-scan:e2e
{
    {
      "title": "Improper Check for Dropped Privileges",
      ...
      "packageName": "bash",
      "language": "linux",
      "packageManager": "debian:10",
      "description": "## Overview\nAn issue was discovered in disable_priv_mode in shell.c in GNU Bash through 5.0 patch 11. By default, if Bash is run with its effective UID not equal to its real UID, it will drop privileges by setting its effective UID to its real UID. However, it does so incorrectly. On Linux and other systems that support \"saved UID\" functionality, the saved UID is not dropped. An attacker with command execution in the shell can use \"enable -f\" for runtime loading of a new builtin, which can be a shared object that calls setuid() and therefore regains privileges. However, binaries running with an effective UID of 0 are unaffected.\n\n## References\n- [CONFIRM](https://security.netapp.com/advisory/ntap-20200430-0003/)\n- [Debian Security Tracker](https://security-tracker.debian.org/tracker/CVE-2019-18276)\n- [GitHub Commit](https://github.com/bminor/bash/commit/951bdaad7a18cc0dc1036bba86b18b90874d39ff)\n- [MISC](http://packetstormsecurity.com/files/155498/Bash-5.0-Patch-11-Privilege-Escalation.html)\n- [MISC](https://www.youtube.com/watch?v=-wGtxJ8opa8)\n- [Ubuntu CVE Tracker](http://people.ubuntu.com/~ubuntu-security/cve/CVE-2019-18276)\n",
      "identifiers": {
        "ALTERNATIVE": [],
        "CVE": [
          "CVE-2019-18276"
        ],
        "CWE": [
          "CWE-273"
        ]
      },
      "severity": "low",
      "severityWithCritical": "low",
      "cvssScore": 7.8,
      "CVSSv3": "CVSS:3.1/AV:L/AC:L/PR:L/UI:N/S:U/C:H/I:H/A:H/E:F",
      ...
      "from": [
        "docker-image|docker-scan@e2e",
        "bash@5.0-4"
      ],
      "upgradePath": [],
      "isUpgradable": false,
      "isPatchable": false,
      "name": "bash",
      "version": "5.0-4"
    },
    ...
    "summary": "880 vulnerable dependency paths",
      "filesystemPolicy": false,
      "filtered": {
        "ignore": [],
        "patch": []
      },
      "uniqueCount": 158,
      "projectName": "docker-image|docker-scan",
      "platform": "linux/amd64",
      "path": "docker-scan:e2e"
}
```
@y
```console
$ docker scan --json --group-issues docker-scan:e2e
{
    {
      "title": "Improper Check for Dropped Privileges",
      ...
      "packageName": "bash",
      "language": "linux",
      "packageManager": "debian:10",
      "description": "## Overview\nAn issue was discovered in disable_priv_mode in shell.c in GNU Bash through 5.0 patch 11. By default, if Bash is run with its effective UID not equal to its real UID, it will drop privileges by setting its effective UID to its real UID. However, it does so incorrectly. On Linux and other systems that support \"saved UID\" functionality, the saved UID is not dropped. An attacker with command execution in the shell can use \"enable -f\" for runtime loading of a new builtin, which can be a shared object that calls setuid() and therefore regains privileges. However, binaries running with an effective UID of 0 are unaffected.\n\n## References\n- [CONFIRM](https://security.netapp.com/advisory/ntap-20200430-0003/)\n- [Debian Security Tracker](https://security-tracker.debian.org/tracker/CVE-2019-18276)\n- [GitHub Commit](https://github.com/bminor/bash/commit/951bdaad7a18cc0dc1036bba86b18b90874d39ff)\n- [MISC](http://packetstormsecurity.com/files/155498/Bash-5.0-Patch-11-Privilege-Escalation.html)\n- [MISC](https://www.youtube.com/watch?v=-wGtxJ8opa8)\n- [Ubuntu CVE Tracker](http://people.ubuntu.com/~ubuntu-security/cve/CVE-2019-18276)\n",
      "identifiers": {
        "ALTERNATIVE": [],
        "CVE": [
          "CVE-2019-18276"
        ],
        "CWE": [
          "CWE-273"
        ]
      },
      "severity": "low",
      "severityWithCritical": "low",
      "cvssScore": 7.8,
      "CVSSv3": "CVSS:3.1/AV:L/AC:L/PR:L/UI:N/S:U/C:H/I:H/A:H/E:F",
      ...
      "from": [
        "docker-image|docker-scan@e2e",
        "bash@5.0-4"
      ],
      "upgradePath": [],
      "isUpgradable": false,
      "isPatchable": false,
      "name": "bash",
      "version": "5.0-4"
    },
    ...
    "summary": "880 vulnerable dependency paths",
      "filesystemPolicy": false,
      "filtered": {
        "ignore": [],
        "patch": []
      },
      "uniqueCount": 158,
      "projectName": "docker-image|docker-scan",
      "platform": "linux/amd64",
      "path": "docker-scan:e2e"
}
```
@z

@x
You can find all the sources of the vulnerability in the `from` section.
@y
ぜい弱性のもとになる情報は`from`の項目から知ることができます。
@z

@x
### Checking the dependency tree
@y
{: #checking-the-dependency-tree }
### 依存パッケージツリーの確認
@z

@x
To view the dependency tree of your image, use the --dependency-tree flag. This displays all the dependencies before the scan result. For example:
@y
イメージの依存パッケージを確認するには --dependency-tree フラグを利用します。
これはスキャン前に、依存パッケージをすべて表示するものです。
たとえば以下です。
@z

@x
```console
$ docker scan --dependency-tree debian:buster

$ docker-image|99138c65ebc7 @ latest
     ├─ ca-certificates @ 20200601~deb10u1
     │  └─ openssl @ 1.1.1d-0+deb10u3
     │     └─ openssl/libssl1.1 @ 1.1.1d-0+deb10u3
     ├─ curl @ 7.64.0-4+deb10u1
     │  └─ curl/libcurl4 @ 7.64.0-4+deb10u1
     │     ├─ e2fsprogs/libcom-err2 @ 1.44.5-1+deb10u3
     │     ├─ krb5/libgssapi-krb5-2 @ 1.17-3
     │     │  ├─ e2fsprogs/libcom-err2 @ 1.44.5-1+deb10u3
     │     │  ├─ krb5/libk5crypto3 @ 1.17-3
     │     │  │  └─ krb5/libkrb5support0 @ 1.17-3
     │     │  ├─ krb5/libkrb5-3 @ 1.17-3
     │     │  │  ├─ e2fsprogs/libcom-err2 @ 1.44.5-1+deb10u3
     │     │  │  ├─ krb5/libk5crypto3 @ 1.17-3
     │     │  │  ├─ krb5/libkrb5support0 @ 1.17-3
     │     │  │  └─ openssl/libssl1.1 @ 1.1.1d-0+deb10u3
     │     │  └─ krb5/libkrb5support0 @ 1.17-3
     │     ├─ libidn2/libidn2-0 @ 2.0.5-1+deb10u1
     │     │  └─ libunistring/libunistring2 @ 0.9.10-1
     │     ├─ krb5/libk5crypto3 @ 1.17-3
     │     ├─ krb5/libkrb5-3 @ 1.17-3
     │     ├─ openldap/libldap-2.4-2 @ 2.4.47+dfsg-3+deb10u2
     │     │  ├─ gnutls28/libgnutls30 @ 3.6.7-4+deb10u4
     │     │  │  ├─ nettle/libhogweed4 @ 3.4.1-1
     │     │  │  │  └─ nettle/libnettle6 @ 3.4.1-1
     │     │  │  ├─ libidn2/libidn2-0 @ 2.0.5-1+deb10u1
     │     │  │  ├─ nettle/libnettle6 @ 3.4.1-1
     │     │  │  ├─ p11-kit/libp11-kit0 @ 0.23.15-2
     │     │  │  │  └─ libffi/libffi6 @ 3.2.1-9
     │     │  │  ├─ libtasn1-6 @ 4.13-3
     │     │  │  └─ libunistring/libunistring2 @ 0.9.10-1
     │     │  ├─ cyrus-sasl2/libsasl2-2 @ 2.1.27+dfsg-1+deb10u1
     │     │  │  └─ cyrus-sasl2/libsasl2-modules-db @ 2.1.27+dfsg-1+deb10u1
     │     │  │     └─ db5.3/libdb5.3 @ 5.3.28+dfsg1-0.5
     │     │  └─ openldap/libldap-common @ 2.4.47+dfsg-3+deb10u2
     │     ├─ nghttp2/libnghttp2-14 @ 1.36.0-2+deb10u1
     │     ├─ libpsl/libpsl5 @ 0.20.2-2
     │     │  ├─ libidn2/libidn2-0 @ 2.0.5-1+deb10u1
     │     │  └─ libunistring/libunistring2 @ 0.9.10-1
     │     ├─ rtmpdump/librtmp1 @ 2.4+20151223.gitfa8646d.1-2
     │     │  ├─ gnutls28/libgnutls30 @ 3.6.7-4+deb10u4
     │     │  ├─ nettle/libhogweed4 @ 3.4.1-1
     │     │  └─ nettle/libnettle6 @ 3.4.1-1
     │     ├─ libssh2/libssh2-1 @ 1.8.0-2.1
     │     │  └─ libgcrypt20 @ 1.8.4-5
     │     └─ openssl/libssl1.1 @ 1.1.1d-0+deb10u3
     ├─ gnupg2/dirmngr @ 2.2.12-1+deb10u1
    ...

Organization:      docker-desktop-test
Package manager:   deb
Project name:      docker-image|99138c65ebc7
Docker image:      99138c65ebc7
Licenses:          enabled

Tested 200 dependencies for known issues, found 157 issues.

For more free scans that keep your images secure, sign up to Snyk at https://dockr.ly/3ePqVcp.
```
@y
```console
$ docker scan --dependency-tree debian:buster

$ docker-image|99138c65ebc7 @ latest
     ├─ ca-certificates @ 20200601~deb10u1
     │  └─ openssl @ 1.1.1d-0+deb10u3
     │     └─ openssl/libssl1.1 @ 1.1.1d-0+deb10u3
     ├─ curl @ 7.64.0-4+deb10u1
     │  └─ curl/libcurl4 @ 7.64.0-4+deb10u1
     │     ├─ e2fsprogs/libcom-err2 @ 1.44.5-1+deb10u3
     │     ├─ krb5/libgssapi-krb5-2 @ 1.17-3
     │     │  ├─ e2fsprogs/libcom-err2 @ 1.44.5-1+deb10u3
     │     │  ├─ krb5/libk5crypto3 @ 1.17-3
     │     │  │  └─ krb5/libkrb5support0 @ 1.17-3
     │     │  ├─ krb5/libkrb5-3 @ 1.17-3
     │     │  │  ├─ e2fsprogs/libcom-err2 @ 1.44.5-1+deb10u3
     │     │  │  ├─ krb5/libk5crypto3 @ 1.17-3
     │     │  │  ├─ krb5/libkrb5support0 @ 1.17-3
     │     │  │  └─ openssl/libssl1.1 @ 1.1.1d-0+deb10u3
     │     │  └─ krb5/libkrb5support0 @ 1.17-3
     │     ├─ libidn2/libidn2-0 @ 2.0.5-1+deb10u1
     │     │  └─ libunistring/libunistring2 @ 0.9.10-1
     │     ├─ krb5/libk5crypto3 @ 1.17-3
     │     ├─ krb5/libkrb5-3 @ 1.17-3
     │     ├─ openldap/libldap-2.4-2 @ 2.4.47+dfsg-3+deb10u2
     │     │  ├─ gnutls28/libgnutls30 @ 3.6.7-4+deb10u4
     │     │  │  ├─ nettle/libhogweed4 @ 3.4.1-1
     │     │  │  │  └─ nettle/libnettle6 @ 3.4.1-1
     │     │  │  ├─ libidn2/libidn2-0 @ 2.0.5-1+deb10u1
     │     │  │  ├─ nettle/libnettle6 @ 3.4.1-1
     │     │  │  ├─ p11-kit/libp11-kit0 @ 0.23.15-2
     │     │  │  │  └─ libffi/libffi6 @ 3.2.1-9
     │     │  │  ├─ libtasn1-6 @ 4.13-3
     │     │  │  └─ libunistring/libunistring2 @ 0.9.10-1
     │     │  ├─ cyrus-sasl2/libsasl2-2 @ 2.1.27+dfsg-1+deb10u1
     │     │  │  └─ cyrus-sasl2/libsasl2-modules-db @ 2.1.27+dfsg-1+deb10u1
     │     │  │     └─ db5.3/libdb5.3 @ 5.3.28+dfsg1-0.5
     │     │  └─ openldap/libldap-common @ 2.4.47+dfsg-3+deb10u2
     │     ├─ nghttp2/libnghttp2-14 @ 1.36.0-2+deb10u1
     │     ├─ libpsl/libpsl5 @ 0.20.2-2
     │     │  ├─ libidn2/libidn2-0 @ 2.0.5-1+deb10u1
     │     │  └─ libunistring/libunistring2 @ 0.9.10-1
     │     ├─ rtmpdump/librtmp1 @ 2.4+20151223.gitfa8646d.1-2
     │     │  ├─ gnutls28/libgnutls30 @ 3.6.7-4+deb10u4
     │     │  ├─ nettle/libhogweed4 @ 3.4.1-1
     │     │  └─ nettle/libnettle6 @ 3.4.1-1
     │     ├─ libssh2/libssh2-1 @ 1.8.0-2.1
     │     │  └─ libgcrypt20 @ 1.8.4-5
     │     └─ openssl/libssl1.1 @ 1.1.1d-0+deb10u3
     ├─ gnupg2/dirmngr @ 2.2.12-1+deb10u1
    ...

Organization:      docker-desktop-test
Package manager:   deb
Project name:      docker-image|99138c65ebc7
Docker image:      99138c65ebc7
Licenses:          enabled

Tested 200 dependencies for known issues, found 157 issues.

For more free scans that keep your images secure, sign up to Snyk at https://dockr.ly/3ePqVcp.
```
@z

@x
For more information about the vulnerability data, see [Docker Vulnerability Scanning CLI Cheat Sheet](https://goto.docker.com/rs/929-FJL-178/images/cheat-sheet-docker-desktop-vulnerability-scanning-CLI.pdf){: target="_blank" rel="noopener" class="_"}.
@y
ぜい弱性データの詳細については [Docker Vulnerability Scanning CLI Cheat Sheet](https://goto.docker.com/rs/929-FJL-178/images/cheat-sheet-docker-desktop-vulnerability-scanning-CLI.pdf){: target="_blank" rel="noopener" class="_"} を参照してください。
@z

@x
### Limiting the level of vulnerabilities displayed
@y
{: #limiting-the-level-of-vulnerabilities-displayed }
### ぜい弱性レベルの表示制限
@z

@x
Docker scan allows you to choose the level of vulnerabilities displayed in your scan report using the `--severity` flag.
You can set the severity flag to `low`, `medium`, or` high` depending on the level of vulnerabilities you’d like to see in your report.  
For example, if you set the severity level as `medium`, the scan report displays all vulnerabilities that are classified as medium and high.
@y
Docker スキャンにおいては`--severity`フラグを利用することで、ぜい弱性レベルを選んで表示することができます。
この`--severity`フラグには、レポート内において確認したいぜい弱性レベルに応じて`low`、`medium`、`high`のいずれかを指定します。
たとえばこのレベルを`medium`に設定した場合、スキャンレポートにはぜい弱性レベルが medium（中程度）と high（重要）のものが表示されます。
@z

@x
 ```console
$ docker scan --severity=medium docker-scan:e2e 
./bin/docker-scan_darwin_amd64 scan --severity=medium docker-scan:e2e

Testing docker-scan:e2e...

✗ Medium severity vulnerability found in sqlite3/libsqlite3-0
  Description: Divide By Zero
  Info: https://snyk.io/vuln/SNYK-DEBIAN10-SQLITE3-466337
  Introduced through: gnupg2/gnupg@2.2.12-1+deb10u1, subversion@1.10.4-1+deb10u1, mercurial@4.8.2-1+deb10u1
  From: gnupg2/gnupg@2.2.12-1+deb10u1 > gnupg2/gpg@2.2.12-1+deb10u1 > sqlite3/libsqlite3-0@3.27.2-3
  From: subversion@1.10.4-1+deb10u1 > subversion/libsvn1@1.10.4-1+deb10u1 > sqlite3/libsqlite3-0@3.27.2-3
  From: mercurial@4.8.2-1+deb10u1 > python-defaults/python@2.7.16-1 > python2.7@2.7.16-2+deb10u1 > python2.7/libpython2.7-stdlib@2.7.16-2+deb10u1 > sqlite3/libsqlite3-0@3.27.2-3

✗ Medium severity vulnerability found in sqlite3/libsqlite3-0
  Description: Uncontrolled Recursion
...
✗ High severity vulnerability found in binutils/binutils-common
  Description: Missing Release of Resource after Effective Lifetime
  Info: https://snyk.io/vuln/SNYK-DEBIAN10-BINUTILS-403318
  Introduced through: gcc-defaults/g++@4:8.3.0-1
  From: gcc-defaults/g++@4:8.3.0-1 > gcc-defaults/gcc@4:8.3.0-1 > gcc-8@8.3.0-6 > binutils@2.31.1-16 > binutils/binutils-common@2.31.1-16
  From: gcc-defaults/g++@4:8.3.0-1 > gcc-defaults/gcc@4:8.3.0-1 > gcc-8@8.3.0-6 > binutils@2.31.1-16 > binutils/libbinutils@2.31.1-16 > binutils/binutils-common@2.31.1-16
  From: gcc-defaults/g++@4:8.3.0-1 > gcc-defaults/gcc@4:8.3.0-1 > gcc-8@8.3.0-6 > binutils@2.31.1-16 > binutils/binutils-x86-64-linux-gnu@2.31.1-16 > binutils/binutils-common@2.31.1-16
  and 4 more...

Organization:      docker-desktop-test
Package manager:   deb
Project name:      docker-image|docker-scan
Docker image:      docker-scan:e2e
Platform:          linux/amd64
Licenses:          enabled

Tested 200 dependencies for known issues, found 37 issues.
```
@y
 ```console
$ docker scan --severity=medium docker-scan:e2e 
./bin/docker-scan_darwin_amd64 scan --severity=medium docker-scan:e2e

Testing docker-scan:e2e...

✗ Medium severity vulnerability found in sqlite3/libsqlite3-0
  Description: Divide By Zero
  Info: https://snyk.io/vuln/SNYK-DEBIAN10-SQLITE3-466337
  Introduced through: gnupg2/gnupg@2.2.12-1+deb10u1, subversion@1.10.4-1+deb10u1, mercurial@4.8.2-1+deb10u1
  From: gnupg2/gnupg@2.2.12-1+deb10u1 > gnupg2/gpg@2.2.12-1+deb10u1 > sqlite3/libsqlite3-0@3.27.2-3
  From: subversion@1.10.4-1+deb10u1 > subversion/libsvn1@1.10.4-1+deb10u1 > sqlite3/libsqlite3-0@3.27.2-3
  From: mercurial@4.8.2-1+deb10u1 > python-defaults/python@2.7.16-1 > python2.7@2.7.16-2+deb10u1 > python2.7/libpython2.7-stdlib@2.7.16-2+deb10u1 > sqlite3/libsqlite3-0@3.27.2-3

✗ Medium severity vulnerability found in sqlite3/libsqlite3-0
  Description: Uncontrolled Recursion
...
✗ High severity vulnerability found in binutils/binutils-common
  Description: Missing Release of Resource after Effective Lifetime
  Info: https://snyk.io/vuln/SNYK-DEBIAN10-BINUTILS-403318
  Introduced through: gcc-defaults/g++@4:8.3.0-1
  From: gcc-defaults/g++@4:8.3.0-1 > gcc-defaults/gcc@4:8.3.0-1 > gcc-8@8.3.0-6 > binutils@2.31.1-16 > binutils/binutils-common@2.31.1-16
  From: gcc-defaults/g++@4:8.3.0-1 > gcc-defaults/gcc@4:8.3.0-1 > gcc-8@8.3.0-6 > binutils@2.31.1-16 > binutils/libbinutils@2.31.1-16 > binutils/binutils-common@2.31.1-16
  From: gcc-defaults/g++@4:8.3.0-1 > gcc-defaults/gcc@4:8.3.0-1 > gcc-8@8.3.0-6 > binutils@2.31.1-16 > binutils/binutils-x86-64-linux-gnu@2.31.1-16 > binutils/binutils-common@2.31.1-16
  and 4 more...

Organization:      docker-desktop-test
Package manager:   deb
Project name:      docker-image|docker-scan
Docker image:      docker-scan:e2e
Platform:          linux/amd64
Licenses:          enabled

Tested 200 dependencies for known issues, found 37 issues.
```
@z

@x
## Provider authentication
@y
{: #provider-authentication }
## プロバイダー認証
@z

@x
If you have an existing Snyk account, you can directly use your Snyk [API token](https://app.snyk.io/account){: target="_blank" rel="noopener" class="_"}:
@y
すでに Snyk アカウントを持っている場合は、Snyk の [API トークン](https://app.snyk.io/account){: target="_blank" rel="noopener" class="_"} を直接利用することができます。
@z

@x
```console
$ docker scan --login --token SNYK_AUTH_TOKEN

Your account has been authenticated. Snyk is now ready to be used.
```
@y
```console
$ docker scan --login --token <Synk認証トークン>

Your account has been authenticated. Snyk is now ready to be used.
```
@z

@x
If you use the `--login` flag without any token, you will be redirected to the Snyk website to login.
@y
トークンを指定せずに`--login`フラグを用いた場合、Snyk のウェブサイトにリダイレクトされてログインを行います。
@z

@x
## Prerequisites
@y
{: #prerequisites }
## 前提条件
@z

@x
To run vulnerability scanning on your Docker images, you must meet the following requirements:
@y
Docker イメージに対してぜい弱性スキャンを実行するには、以下を満たしていることが必要です。
@z

@x
1. Download and install the latest version of Docker Desktop.
@y
1. Docker Desktop の最新版をダウンロードしインストールしていること。
@z

@x
    - [Download for Mac with Intel chip](https://desktop.docker.com/mac/main/amd64/Docker.dmg?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-mac-amd64)
    - [Download for Mac with Apple chip](https://desktop.docker.com/mac/main/arm64/Docker.dmg?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-mac-arm64)
    - [Download for Windows](https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe)
@y
    - [Intel チップの Mac 向けダウンロード](https://desktop.docker.com/mac/main/amd64/Docker.dmg?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-mac-amd64)
    - [Apple チップの Mac 向けダウンロード](https://desktop.docker.com/mac/main/arm64/Docker.dmg?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-mac-arm64)
    - [Windows 向けダウンロード](https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe)
@z

@x
2. Sign into [Docker Hub](https://hub.docker.com){: target="_blank" rel="noopener" class="_"}.
@y
2. [Docker Hub](https://hub.docker.com){: target="_blank" rel="noopener" class="_"} にサインインしていること。
@z

@x
3. From the Docker Desktop menu, select **Sign in/ Create Docker ID**. Alternatively, open a terminal and run the command `docker login`.
@y
3. Docker Desktop メニューにおいて **Sign in/ Create Docker ID** を選択していること。
   あるいはターミナル画面を開いて`docker login`を実行していること。
@z

@x
4. (Optional) You can create a [Snyk account](https://dockr.ly/3ePqVcp){: target="_blank" rel="noopener" class="_"} for scans, or use the additional monthly free scans provided by Snyk with your Docker Hub account.
@y
4. （任意作業）スキャンを行うために [Snyk アカウント](https://dockr.ly/3ePqVcp){: target="_blank" rel="noopener" class="_"} を生成していること。
   または Docker Hub アカウントとともに利用できるものとして Snyk 社が提供する、月単位の追加無償スキャンを利用していること。
@z

@x
Check your installation by running `docker scan --version`, it should print the current version of docker scan and the Snyk engine version. For example:
@y
インストールができているかどうかを`docker scan --version`を実行して確認してください。
コマンド実行によって、docker scan の現行バージョン、および Snyk エンジンのバージョンを表示されます。
たとえば以下のとおりです。
@z

@x
```console
$ docker scan --version
Version:    v0.5.0
Git commit: 5a09266
Provider:   Snyk (1.432.0)
```
@y
```console
$ docker scan --version
Version:    v0.5.0
Git commit: 5a09266
Provider:   Snyk (1.432.0)
```
@z

@x
> **Note:**
>
> Docker Scan uses the Snyk binary installed in your environment by default. If 
this is not available, it uses the Snyk binary embedded in Docker Desktop.
> The minimum version required for Snyk is `1.385.0`.
@y
> **メモ**
>
> Docker Scan はデフォルトで、インストールされている Snyk バイナリを利用します。
> これが利用できなかった場合は、Docker Desktop に埋め込まれている Snyk バイナリが利用されます。
> 必要となる Snyk の最低バージョンは`1.385.0`です。
@z

@x
## Supported options
@y
{: #supported-options }
## サポートされているオプション
@z

@x
The high-level `docker scan` command scans local images using the image name or the image ID. It supports the following options:
@y
高度なコマンド`docker scan`では、イメージの名前または ID を使ってローカルイメージをスキャンします。
このコマンドは以下のオプションをサポートしています。
@z

@x
| Option                                                       | Description                                   |
|:------------------------------------------------------------------ :------------------------------------------------|
| `--accept-license` | Accept the license agreement of the third-party scanning provider    |
| `--dependency-tree` | Display the dependency tree of the image along with scan results |
| `--exclude-base` | Exclude the base image during scanning. This option requires the --file option to be set |
| `-f`, `--file string` | Specify the location of the Dockerfile associated with the image. This option displays a detailed scan result |
| `--json` | Display the result of the scan in JSON format|
| `--login` | Log into Snyk using an optional token (using the flag --token), or by using a web-based token |
| `--reject-license` | Reject the license agreement of the third-party scanning provider |
| `--severity string` | Only report vulnerabilities of provided level or higher (low, medium, high) |
| `--token string`  | Use the authentication token to log into the third-party scanning provider |
| `--version` | Display the Docker Scan plugin version |
@y
| オプション                                                   | 内容説明                                             |
|:------------------------------------------------------------ :------------------------------------------------|
| `--accept-license` | サードパーティー製プロバイダーのライセンスを承認します。|
| `--dependency-tree` | スキャン結果において依存パッケージのツリーを表示します。|
| `--exclude-base` | スキャンにあたってベースイメージは取り除きます。このオプションには --file オプションの設定が必要です。|
| `-f`, `--file string` | イメージに対応する Dockerfile を指定します。このオプションはスキャンの詳細結果を表示します。|
| `--json` | スキャン結果を JSON 書式により表示します。|
| `--login` | 任意に指定されたトークン（--token フラグ利用）を使って Snyk にログインします。あるいはウェブベースのトークンを利用します。|
| `--reject-license` | サードパーティー製プロバイダーのライセンスを否認します。|
| `--severity string` | 指定されたレベル以上のぜい弱性のみを表示します。(low、medium、high) |
| `--token string`  | 認証トークンを使ってサードパーティー製スキャンプロバイダーにログインします。|
| `--version` | Docker Scan プラグインのバージョンを表示します。|
@z

@x
## Known issues
@y
{: #known-issues }
## 既知の問題
@z

@x
**WSL 2**
@y
**WSL 2 の場合**
@z

@x
- The Vulnerability scanning feature doesn’t work with Alpine distributions.
- If you are using Debian and OpenSUSE distributions, the login process only works with the `--token` flag, you won’t be redirected to the Snyk website for authentication.
@y
- ぜい弱性スキャン機能は Alpine ディストリビューションにおいては動作しません。
- ディストリビューション Debian または OpenSUSE を利用している場合、ログイン処理は`--token`フラグを利用した場合にのみ動作します。その場合、Synk ウェブサイトへはリダイレクトされません。
@z

@x
## Feedback
@y
{: #feedback }
## フィードバック
@z

@x
Your feedback is very important to us. Let us know your feedback by creating an issue in the [scan-cli-plugin](https://github.com/docker/scan-cli-plugin/issues/new){: target="_blank" rel="noopener" class="_"} GitHub repository.
@y
Docker ローカルイメージに対するぜい弱性スキャン機能をご利用いただき、ありがとうございます。
みなさんからのフィードバックを頂くことが重要と考えています。
フィードバックは GitHub リポジトリ内の [scan-cli-plugin](https://github.com/docker/scan-cli-plugin/issues/new){: target="_blank" rel="noopener" class="_"} において issue を生成してお知らせください。
@z
