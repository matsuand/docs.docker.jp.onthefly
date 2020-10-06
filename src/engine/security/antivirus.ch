%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Antivirus software and Docker
description: General guidelines for using antivirus software with Docker
keywords: antivirus, security
---
@y
---
title: ウィルス対策ソフトウェアと Docker
description: Docker とともにウィルス対策ソフトウェアを利用する際の一般的なガイドライン。
keywords: antivirus, security
---
@z

@x
When antivirus software scans files used by Docker, these files may be locked
in a way that causes Docker commands to hang.
@y
{% comment %}
When antivirus software scans files used by Docker, these files may be locked
in a way that causes Docker commands to hang.
{% endcomment %}
Docker が利用するファイルがウィルス対策ソフトウェアによってスキャンされた際に、ファイルがロックされる場合があります。
これが原因となって Docker コマンドがハングすることがあります。
@z

@x
One way to reduce these problems is to add the Docker data directory
(`/var/lib/docker` on Linux, `%ProgramData%\docker` on Windows Server, or `$HOME/Library/Containers/com.docker.docker/` on Mac) to the
antivirus's exclusion list. However, this comes with the trade-off that viruses
or malware in Docker images, writable layers of containers, or volumes are not
detected. If you do choose to exclude Docker's data directory from background
virus scanning, you may want to schedule a recurring task that stops Docker,
scans the data directory, and restarts Docker.
@y
{% comment %}
One way to reduce these problems is to add the Docker data directory
(`/var/lib/docker` on Linux, `%ProgramData%\docker` on Windows Server, or `$HOME/Library/Containers/com.docker.docker/` on Mac) to the
antivirus's exclusion list. However, this comes with the trade-off that viruses
or malware in Docker images, writable layers of containers, or volumes are not
detected. If you do choose to exclude Docker's data directory from background
virus scanning, you may want to schedule a recurring task that stops Docker,
scans the data directory, and restarts Docker.
{% endcomment %}
この状況の発生を軽減するには、ウィルス対策ソフトウェアの除外リストに Docker データディレクトリ（Linux では `/var/lib/docker`、Windows Server では `%ProgramData%\docker`、Mac では `$HOME/Library/Containers/com.docker.docker/`）を加えるという方法があります。
ただしこれにはトレードオフがあり、Docker イメージ、コンテナーの書き込みレイヤー、ボリュームの各データ内にて、ウィルスやマルウェアが検出できなくなります。
このようにウィルススキャンのバックグランド実行から  Docker データディレクトリを除外する方法をとった場合は、Docker の停止、データディレクトリのスキャン、Docker の再起動といったタスクをスケジュールすることが必要になります。
@z
