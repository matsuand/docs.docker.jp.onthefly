%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Docker Compose release notes
description: Release notes for Docker Compose
keywords: release notes, compose
toc_max: 2
redirect_from:
  - /release-notes/docker-compose/
---
@y
---
title: Docker Compose リリースノート
description: Docker Compose のリリースノート。
keywords: release notes, compose
toc_max: 2
redirect_from:
  - /release-notes/docker-compose/
---
@z

@x
## 1.28.0 
(2021-01-20)
@y
## 1.28.0 
(2021-01-20)
@z

@x
### Features
@y
### Features
@z

@x
- Added support for NVIDIA GPUs through device requests.

- Added support for service profiles.

- Changed the SSH connection approach to the Docker CLI by shelling out to the local SSH client. Set the `COMPOSE_PARAMIKO_SSH=1` environment variable to enable the old behavior.

- Added a flag to disable log prefix.

- Added a flag for ANSI output control.

- Docker Compose now uses the native Docker CLI's `build` command when building images. Set the `COMPOSE_DOCKER_CLI_BUILD=0` environment variable to disable this feature.
@y
- Added support for NVIDIA GPUs through device requests.

- Added support for service profiles.

- Changed the SSH connection approach to the Docker CLI by shelling out to the local SSH client. Set the `COMPOSE_PARAMIKO_SSH=1` environment variable to enable the old behavior.

- Added a flag to disable log prefix.

- Added a flag for ANSI output control.

- Docker Compose now uses the native Docker CLI's `build` command when building images. Set the `COMPOSE_DOCKER_CLI_BUILD=0` environment variable to disable this feature.
@z

@x
### Bugs
@y
### Bugs
@z

@x
- Made `parallel_pull=True` by default.

- Restored the warning for configs in non-swarm mode.

- Took `--file` into account when defining `project_dir`.

- Fixed a service attach bug on `compose up`.
@y
- Made `parallel_pull=True` by default.

- Restored the warning for configs in non-swarm mode.

- Took `--file` into account when defining `project_dir`.

- Fixed a service attach bug on `compose up`.
@z

@x
### Miscellaneous
@y
### Miscellaneous
@z

@x
- Added usage metrics.

- Synced schema with COMPOSE specification.

- Improved failure report for missing mandatory environment variables.

- Bumped `attrs` to 20.3.0.

- Bumped `more_itertools` to 8.6.0.

- Bumped `cryptograhy` to 3.2.1.

- Bumped `cffi` to 1.14.4.

- Bumped `virtualenv` to 20.2.2.

- Bumped `bcrypt` to 3.2.0.

- Bumped GitPython to 3.1.11.

- Bumped `docker-py` to 4.4.1.

- Bumped Python to 3.9.

- Linux: bumped Debian base image from stretch to buster (required for Python 3.9).

- macOS: Bumped OpenSSL 1.1.1g to 1.1.1h, and Python 3.7.7 to 3.9.0.

- Bumped PyInstaller to 4.1.

- Relaxed the restriction on base images to latest minor.

- Updated READMEs.
@y
- Added usage metrics.

- Synced schema with COMPOSE specification.

- Improved failure report for missing mandatory environment variables.

- Bumped `attrs` to 20.3.0.

- Bumped `more_itertools` to 8.6.0.

- Bumped `cryptograhy` to 3.2.1.

- Bumped `cffi` to 1.14.4.

- Bumped `virtualenv` to 20.2.2.

- Bumped `bcrypt` to 3.2.0.

- Bumped GitPython to 3.1.11.

- Bumped `docker-py` to 4.4.1.

- Bumped Python to 3.9.

- Linux: bumped Debian base image from stretch to buster (required for Python 3.9).

- macOS: Bumped OpenSSL 1.1.1g to 1.1.1h, and Python 3.7.7 to 3.9.0.

- Bumped PyInstaller to 4.1.

- Relaxed the restriction on base images to latest minor.

- README を更新しました。
@z

@x
## 1.27.4 
(2020-09-24)
@y
## 1.27.4 
(2020-09-24)
@z

@x
### Bugs
@y
{: #bugs }
### バグ
@z

@x
- Removed path checks for bind mounts.
@y
- バインドマウントにおけるパス確認を削除しました。
@z

@x
- Fixed port rendering to output long form syntax for non-v1.
@y
- v1 でない場合のポート出力を長い書式に修正しました。
@z

@x
- Added protocol to the Docker socket address.
@y
- Docker ソケットアドレスにプロトコルを追加しました。
@z

@x
## 1.27.3 
(2020-09-16)
@y
## 1.27.3 
(2020-09-16)
@z

@x
### Bugs
@y
{: #bugs }
### バグ
@z

@x
- Merged `max_replicas_per_node` on `docker-compose config`.
@y
- `docker-compose config` に `max_replicas_per_node` をマージしました。
@z

@x
- Fixed `depends_on` serialization on `docker-compose config`.
@y
- `docker-compose config` における `depends_on` のシリアライズ処理を修正しました。
@z

@x
- Fixed scaling when some containers are not running on `docker-compose up`.
@y
- `docker-compose up` において動作していないコンテナーがある際のスケール処理を修正しました。
@z

@x
- Enabled relative paths for `driver_opts.device` for `local` driver.
@y
- `local` ドライバー利用時の `driver_opts.device` において相対パスを可能にしました。
@z

@x
- Allowed strings for `cpus` fields.
@y
- `cpus` に対して文字列指定を可能にしました。
@z

@x
## 1.27.2
(2020-09-10)
@y
## 1.27.2
(2020-09-10)
@z

@x
### Bugs
@y
{: #bugs }
### バグ
@z

@x
- Fixed bug on `docker-compose run` container attach.
@y
- `docker-compose run` によるコンテナーアタッチのバグを修正しました。
@z

@x
## 1.27.1
(2020-09-10)
@y
## 1.27.1
(2020-09-10)
@z

@x
### Bugs
@y
{: #bugs }
### バグ
@z

@x
- Fixed `docker-compose run` when `service.scale` is specified.
@y
- `service.scale` 指定時の `docker-compose run` コマンドを修正しました。
@z

@x
- Allowed the `driver` property for external networks as a temporary workaround for the Swarm network propagation issue.
@y
- Swarm ネットワーク通信における障害への一時対応として、`driver` プロパティを外部ネットワークに対して機能させるようにしました。
@z

@x
- Pinned the new internal schema version to `3.9` as the default.
@y
- 内部スキーマバージョン `3.9` をデフォルトにしました。
@z

@x
- Preserved the version number configured in the Compose file.
@y
- Compose ファイル内に設定されたバージョン番号を保持するようにしました。
@z

@x
## 1.27.0 
(2020-09-07)
@y
## 1.27.0 
(2020-09-07)
@z

@x
### Features
@y
{: #features }
### 機能
@z

@x
- Merged 2.x and 3.x Compose formats and aligned with `COMPOSE_SPEC` schema.
@y
- Compose フォーマット 2.x と 3.x をマージし、`COMPOSE_SPEC` スキーマに合わせました。
@z

@x
- Implemented service mode for `ipc`.
@y
- `ipc` に対応するサービスモードを導入しました。
@z

@x
- Passed `COMPOSE_PROJECT_NAME` environment variable in container mode.
@y
- コンテナーモードにおいて環境変数 `COMPOSE_PROJECT_NAME` を設定しました。
@z

@x
- Made `run` behave in the same way as `up`.
@y
- `run` の動作を `up` と同様にしました。
@z

@x
- Used `docker build` on `docker-compose run` when `COMPOSE_DOCKER_CLI_BUILD` environment variable is set.
@y
- 環境変数 `COMPOSE_DOCKER_CLI_BUILD` の設定時には `docker-compose run` において `docker build` を利用するようにしました。
@z

@x
- Used the docker-py default API version for engine queries (`auto`).
@y
- Engine のクエリー（`auto`）に対して docker-py のデフォルト API バージョンを利用するようにしました。
@z

@x
- Parsed `network_mode` on build.
@y
- ビルド時に `network_mode` を取得するようにしました。
@z

@x
### Bugs
@y
{: #bugs }
### バグ
@z

@x
- Ignored build context path validation when building is not required.
@y
- ビルドが必要ではない場合には、ビルドコンテキストのパス確認を無視するようにしました。
@z

@x
- Fixed float to bytes conversion via docker-py bump to 4.3.1.
@y
- docker-py 4.3.1 へのアップグレードにともなって、float から byte への変換を修正しました。
@z

@x
- Fixed the scale bug when the deploy section is set.
@y
- デプロイの項が設定されているときのスケールに関するバグを修正しました。
@z

@x
- Fixed `docker-py` bump in `setup.py`.
@y
- `setup.py` において `docker-py` のバージョンアップに対応しました。
@z

@x
- Fixed experimental build failure detection.
@y
- 試験的ビルドに失敗検出を修正しました。
@z

@x
- Fixed context propagation to the Docker CLI.
@y
- Docker CLI へのコンテキスト送信を修正しました。
@z

@x
### Miscellaneous
@y
{: #miscellaneous }
### その他
@z

@x
- Bumped `docker-py` to 4.3.1.
@y
- `docker-py` 4.3.1 へのアップデート。
@z

@x
- Bumped `tox` to 3.19.0.
@y
- `tox` 3.19.0 へのアップデート。
@z

@x
- Bumped `virtualenv` to 20.0.30.
@y
- `virtualenv` 20.0.30 へのアップデート。
@z

@x
- Added script for Docs synchronization.
@y
- Docs 同期に対するスクリプトを追加しました。
@z

@x
## 1.26.2
(2020-07-02)
@y
## 1.26.2
(2020-07-02)
@z

@x
### Bug fixes
@y
{: #bug-fixes }
### バグフィックス
@z

@x
- Enforced `docker-py` 4.2.2 as minimum version when installing with pip.
@y
- Enforced `docker-py` 4.2.2 as minimum version when installing with pip.
@z

@x
## 1.26.1
(2020-06-30)
@y
## 1.26.1
(2020-06-30)
@z

@x
### Features
@y
{: #features-1 }
### 機能
@z

@x
- Bumped `docker-py` from 4.2.1 to 4.2.2.
@y
- Bumped `docker-py` from 4.2.1 to 4.2.2.
@z

@x
### Bug fixes
@y
{: #bug-fixes }
### バグフィックス
@z

@x
- Enforced `docker-py` 4.2.1 as minimum version when installing with pip.
@y
- Enforced `docker-py` 4.2.1 as minimum version when installing with pip.
@z

@x
- Fixed context load for non-docker endpoints.
@y
- Fixed context load for non-docker endpoints.
@z

@x
## 1.26.0
(2020-06-03)
@y
## 1.26.0
(2020-06-03)
@z

@x
### Features
@y
{: #features }
### 機能
@z

@x
- Added `docker context` support.
@y
- `docker context` サポートの追加。
@z

@x
- Added missing test dependency `ddt` to `setup.py`.
@y
- Added missing test dependency `ddt` to `setup.py`.
@z

@x
- Added `--attach-dependencies` to command `up` for attaching to dependencies.
@y
- Added `--attach-dependencies` to command `up` for attaching to dependencies.
@z

@x
- Allowed compatibility option with `COMPOSE_COMPATIBILITY` environment variable.
@y
- Allowed compatibility option with `COMPOSE_COMPATIBILITY` environment variable.
@z

@x
- Bumped `Pytest` to 5.3.4 and add refactor compatibility with the new version.
@y
- Bumped `Pytest` to 5.3.4 and add refactor compatibility with the new version.
@z

@x
- Bumped `OpenSSL` from 1.1.1f to 1.1.1g.
@y
- Bumped `OpenSSL` from 1.1.1f to 1.1.1g.
@z

@x
- Bumped `certifi` from 2019.11.28 to 2020.4.5.1.
@y
- Bumped `certifi` from 2019.11.28 to 2020.4.5.1.
@z

@x
- Bumped `docker-py` from 4.2.0 to 4.2.1.
@y
- Bumped `docker-py` from 4.2.0 to 4.2.1.
@z

@x
### Bug fixes
@y
{: #bug-fixes }
### バグフィックス
@z

@x
- Properly escaped values coming from `env_files`.
@y
- Properly escaped values coming from `env_files`.
@z

@x
- Synchronized compose-schemas with upstream (docker/cli).
@y
- Synchronized compose-schemas with upstream (docker/cli).
@z

@x
- Removed `None` entries on exec command.
@y
- Removed `None` entries on exec command.
@z

@x
- Added `distro` package to get distro information.
@y
- Added `distro` package to get distro information.
@z

@x
- Added `python-dotenv` to delegate `.env` file processing.
@y
- Added `python-dotenv` to delegate `.env` file processing.
@z

@x
- Stopped adjusting output on terminal width when piped into another command.
@y
- Stopped adjusting output on terminal width when piped into another command.
@z

@x
- Showed an error message when `version` attribute is malformed.
@y
- Showed an error message when `version` attribute is malformed.
@z

@x
- Fixed HTTPS connection when `DOCKER_HOST` is remote.
@y
- Fixed HTTPS connection when `DOCKER_HOST` is remote.
@z

@x
## 1.25.5
(2020-04-10)
@y
## 1.25.5
(2020-04-10)
@z

@x
### Features
@y
{: #features }
### 機能
@z

@x
- Bumped OpenSSL from 1.1.1d to 1.1.1f.
@y
- Bumped OpenSSL from 1.1.1d to 1.1.1f.
@z

@x
- Added Compose version 3.8.
@y
- Added Compose version 3.8.
@z

@x
  - Limited service scale to the size specified by the field `deploy.placement.max_replicas_per_node`.
@y
  - Limited service scale to the size specified by the field `deploy.placement.max_replicas_per_node`.
@z

@x
## 1.25.4
(2020-02-03)
@y
## 1.25.4
(2020-02-03)
@z

@x
### Bug fixes
@y
### Bug fixes
@z

@x
- Fixed the CI script to enforce the minimal MacOS version to 10.11.
@y
- Fixed the CI script to enforce the minimal MacOS version to 10.11.
@z

@x
- Fixed docker-compose exec for keys with no value on environment files.
@y
- Fixed docker-compose exec for keys with no value on environment files.
@z

@x
## 1.25.3
(2020-01-23)
@y
## 1.25.3
(2020-01-23)
@z

@x
### Bug fixes
@y
### Bug fixes
@z

@x
- Fixed the CI script to enforce the compilation with Python3.
@y
- Fixed the CI script to enforce the compilation with Python3.
@z

@x
- Updated the binary's sha256 on the release page.
@y
- Updated the binary's sha256 on the release page.
@z

@x
## 1.25.2
(2020-01-20)
@y
## 1.25.2
(2020-01-20)
@z

@x
### New features
@y
### New features
@z

@x
- Docker Compose now allows the compatibility option with `COMPOSE_COMPATIBILITY` environment variable.
@y
- Docker Compose now allows the compatibility option with `COMPOSE_COMPATIBILITY` environment variable.
@z

@x
### Bug fixes
@y
### Bug fixes
@z

@x
- Fixed an issue that caused Docker Compose to crash when the `version` field was set to an invalid value. Docker Compose now displays an error message when invalid values are used in the version field.
@y
- Fixed an issue that caused Docker Compose to crash when the `version` field was set to an invalid value. Docker Compose now displays an error message when invalid values are used in the version field.
@z

@x
- Fixed an issue that caused Docker Compose to render messages incorrectly when running commands outside a terminal.
@y
- Fixed an issue that caused Docker Compose to render messages incorrectly when running commands outside a terminal.
@z

@x
## 1.25.1
(2020-01-06)
@y
## 1.25.1
(2020-01-06)
@z

@x
### Bugfixes
@y
### Bugfixes
@z

@x
- Decoded the `APIError` explanation to Unicode before using it to create and start a container.
@y
- Decoded the `APIError` explanation to Unicode before using it to create and start a container.
@z

@x
- Docker Compose discards `com.docker.compose.filepaths` labels that have `None` as value. This usually occurs when labels originate from stdin.
@y
- Docker Compose discards `com.docker.compose.filepaths` labels that have `None` as value. This usually occurs when labels originate from stdin.
@z

@x
- Added OS X binary as a directory to solve slow start up time issues caused by macOS Catalina binary scan.
@y
- Added OS X binary as a directory to solve slow start up time issues caused by macOS Catalina binary scan.
@z

@x
- Passed the `HOME` environment variable in container mode when running with `script/run/run.sh`.
@y
- Passed the `HOME` environment variable in container mode when running with `script/run/run.sh`.
@z

@x
- Docker Compose now reports images that cannot be pulled, however, are required to be built.
@y
- Docker Compose now reports images that cannot be pulled, however, are required to be built.
@z

@x
## 1.25.0
(2019-11-18)
@y
## 1.25.0
(2019-11-18)
@z

@x
### New features
@y
### New features
@z

@x
- Set no-colors to true by changing `CLICOLOR` env variable to `0`.
@y
- Set no-colors to true by changing `CLICOLOR` env variable to `0`.
@z

@x
- Added working directory, config files, and env file to service labels.
@y
- Added working directory, config files, and env file to service labels.
@z

@x
- Added ARM build dependencies.
@y
- Added ARM build dependencies.
@z

@x
- Added BuildKit support (use `DOCKER_BUILDKIT=1` and `COMPOSE_DOCKER_CLI_BUILD=1`).
@y
- Added BuildKit support (use `DOCKER_BUILDKIT=1` and `COMPOSE_DOCKER_CLI_BUILD=1`).
@z

@x
- Raised Paramiko to version 2.6.0.
@y
- Raised Paramiko to version 2.6.0.
@z

@x
- Added the following tags: `docker-compose:latest`, `docker-compose:<version>-alpine`, and `docker-compose:<version>-debian`.
@y
- Added the following tags: `docker-compose:latest`, `docker-compose:<version>-alpine`, and `docker-compose:<version>-debian`.
@z

@x
- Raised `docker-py` to version 4.1.0.
@y
- Raised `docker-py` to version 4.1.0.
@z

@x
- Enhanced support for `requests`, up to version 2.22.0.
@y
- Enhanced support for `requests`, up to version 2.22.0.
@z

@x
- Removed empty tag on `build:cache_from`.
@y
- Removed empty tag on `build:cache_from`.
@z

@x
- `Dockerfile` enhancement that provides for the generation of `libmusl` binaries for Alpine Linux.
@y
- `Dockerfile` enhancement that provides for the generation of `libmusl` binaries for Alpine Linux.
@z

@x
- Pulling only of images that cannot be built.
@y
- Pulling only of images that cannot be built.
@z

@x
- The `scale` attribute now accepts `0` as a value.
@y
- The `scale` attribute now accepts `0` as a value.
@z

@x
- Added a `--quiet` option and a `--no-rm` option to the `docker-compose build` command.
@y
- Added a `--quiet` option and a `--no-rm` option to the `docker-compose build` command.
@z

@x
- Added a `--no-interpolate` option to the `docker-compose config` command.
@y
- Added a `--no-interpolate` option to the `docker-compose config` command.
@z

@x
- Raised OpenSSL for MacOS build from `1.1.0` to `1.1.1c`.
@y
- Raised OpenSSL for MacOS build from `1.1.0` to `1.1.1c`.
@z

@x
- Added support for the `docker-compose.yml` file's `credential_spec` configuration option.
@y
- Added support for the `docker-compose.yml` file's `credential_spec` configuration option.
@z

@x
- Resolution of digests without having to pull the image.
@y
- Resolution of digests without having to pull the image.
@z

@x
- Upgraded `pyyaml` to version `4.2b1`.
@y
- Upgraded `pyyaml` to version `4.2b1`.
@z

@x
- Lowered the severity to `warning` for instances in which `down` attempts to remove a non-existent image.
@y
- Lowered the severity to `warning` for instances in which `down` attempts to remove a non-existent image.
@z

@x
- Mandated the use of improved API fields for project events, when possible.
@y
- Mandated the use of improved API fields for project events, when possible.
@z

@x
- Updated `setup.py` for modern `pypi/setuptools`, and removed `pandoc` dependencies.
@y
- Updated `setup.py` for modern `pypi/setuptools`, and removed `pandoc` dependencies.
@z

@x
- Removed `Dockerfile.armhf`, which is no longer required.
@y
- Removed `Dockerfile.armhf`, which is no longer required.
@z

@x
### Bug fixes
@y
### Bug fixes
@z

@x
- Made container service color deterministic, including the removal of the color red.
@y
- Made container service color deterministic, including the removal of the color red.
@z

@x
- Fixed non-ASCII character errors (Python 2 only).
@y
- Fixed non-ASCII character errors (Python 2 only).
@z

@x
- Changed image sizing to decimal format, to align with Docker CLI.
@y
- Changed image sizing to decimal format, to align with Docker CLI.
@z

@x
- `tty` size acquired through Python POSIX support.
@y
- `tty` size acquired through Python POSIX support.
@z

@x
- Fixed same file `extends` optimization.
@y
- Fixed same file `extends` optimization.
@z

@x
- Fixed `stdin_open`.
@y
- Fixed `stdin_open`.
@z

@x
- Fixed the issue of `--remove-orphans` being ignored encountered during use with `up --no-start` option.
@y
- Fixed the issue of `--remove-orphans` being ignored encountered during use with `up --no-start` option.
@z

@x
- Fixed `docker-compose ps --all` command.
@y
- Fixed `docker-compose ps --all` command.
@z

@x
- Fixed the `depends_on` dependency recreation behavior.
@y
- Fixed the `depends_on` dependency recreation behavior.
@z

@x
- Fixed bash completion for the `docker-compose build --memory` command.
@y
- Fixed bash completion for the `docker-compose build --memory` command.
@z

@x
- Fixed the misleading environmental variables warning that occurs when the `docker-compose exec` command is performed.
@y
- Fixed the misleading environmental variables warning that occurs when the `docker-compose exec` command is performed.
@z

@x
- Fixed the failure check in the `parallel_execute_watch function`.
@y
- Fixed the failure check in the `parallel_execute_watch function`.
@z

@x
- Fixed the race condition that occurs following the pulling of an image.
@y
- Fixed the race condition that occurs following the pulling of an image.
@z

@x
- Fixed error on duplicate mount points (a configuration error message now displays).
@y
- Fixed error on duplicate mount points (a configuration error message now displays).
@z

@x
- Fixed the merge on `networks` section.
@y
- Fixed the merge on `networks` section.
@z

@x
- Compose container is always connected to `stdin` by default.
@y
- Compose container is always connected to `stdin` by default.
@z

@x
- Fixed the presentation of failed services on the `docker-compose start` command when containers are not available.
@y
- Fixed the presentation of failed services on the `docker-compose start` command when containers are not available.
@z

@x
## 1.24.1
(2019-06-24)
@y
## 1.24.1
(2019-06-24)
@z

@x
This release contains minor improvements and bug fixes.
@y
This release contains minor improvements and bug fixes.
@z

@x
## 1.24.0
(2019-03-28)
@y
## 1.24.0
(2019-03-28)
@z

@x
### Features
@y
{: #features }
### 機能
@z

@x
- Added support for connecting to the Docker Engine using the `ssh` protocol.
@y
- Added support for connecting to the Docker Engine using the `ssh` protocol.
@z

@x
- Added an `--all` flag to `docker-compose ps` to include stopped one-off containers
  in the command's output.
@y
- Added an `--all` flag to `docker-compose ps` to include stopped one-off containers
  in the command's output.
@z

@x
- Added bash completion for `ps --all|-a`.
@y
- Added bash completion for `ps --all|-a`.
@z

@x
- Added support for credential_spec.
@y
- Added support for credential_spec.
@z

@x
- Added `--parallel` to `docker build`'s options in `bash` and `zsh` completion.
@y
- Added `--parallel` to `docker build`'s options in `bash` and `zsh` completion.
@z

@x
### Bug Fixes
@y
### Bug Fixes
@z

@x
- Fixed a bug where some valid credential helpers weren't properly handled by Compose
  when attempting to pull images from private registries.
@y
- Fixed a bug where some valid credential helpers weren't properly handled by Compose
  when attempting to pull images from private registries.
@z

@x
- Fixed an issue where the output of `docker-compose start` before containers were created
  was misleading.
@y
- Fixed an issue where the output of `docker-compose start` before containers were created
  was misleading.
@z

@x
- Compose will no longer accept whitespace in variable names sourced from environment files.
  This matches the Docker CLI behavior.
@y
- Compose will no longer accept whitespace in variable names sourced from environment files.
  This matches the Docker CLI behavior.
@z

@x
- Compose will now report a configuration error if a service attempts to declare
  duplicate mount points in the volumes section.
@y
- Compose will now report a configuration error if a service attempts to declare
  duplicate mount points in the volumes section.
@z

@x
- Fixed an issue with the containerized version of Compose that prevented users from
  writing to stdin during interactive sessions started by `run` or `exec`.
@y
- Fixed an issue with the containerized version of Compose that prevented users from
  writing to stdin during interactive sessions started by `run` or `exec`.
@z

@x
- One-off containers started by `run` no longer adopt the restart policy of the service,
  and are instead set to never restart.
@y
- One-off containers started by `run` no longer adopt the restart policy of the service,
  and are instead set to never restart.
@z

@x
- Fixed an issue that caused some container events to not appear in the output of
  the `docker-compose events` command.
@y
- Fixed an issue that caused some container events to not appear in the output of
  the `docker-compose events` command.
@z

@x
- Missing images will no longer stop the execution of `docker-compose down` commands. A warning is
  now displayed instead.
@y
- Missing images will no longer stop the execution of `docker-compose down` commands. A warning is
  now displayed instead.
@z

@x
- Force `virtualenv` version for macOS CI.
@y
- Force `virtualenv` version for macOS CI.
@z

@x
- Fixed merging of Compose files when network has `None` config.
@y
- Fixed merging of Compose files when network has `None` config.
@z

@x
- Fixed `CTRL+C` issues by enabling `bootloader_ignore_signals` in `pyinstaller`.
@y
- Fixed `CTRL+C` issues by enabling `bootloader_ignore_signals` in `pyinstaller`.
@z

@x
- Bumped `docker-py` version to `3.7.2` to fix SSH and proxy configuration issues.
@y
- Bumped `docker-py` version to `3.7.2` to fix SSH and proxy configuration issues.
@z

@x
- Fixed release script and some typos on release documentation.
@y
- Fixed release script and some typos on release documentation.
@z

@x
## 1.23.2
(2018-11-28)
@y
## 1.23.2
(2018-11-28)
@z

@x
### Bug Fixes
@y
### Bug Fixes
@z

@x
- Reverted a 1.23.0 change that appended random strings to container names
  created by `docker-compose up`, causing addressability issues.
  > **Note**: Containers created by `docker-compose run` will continue to use
  randomly generated names to avoid collisions during parallel runs.
@y
- Reverted a 1.23.0 change that appended random strings to container names
  created by `docker-compose up`, causing addressability issues.
  > **Note**: Containers created by `docker-compose run` will continue to use
  randomly generated names to avoid collisions during parallel runs.
@z

@x
- Fixed an issue where some `dockerfile` paths would fail unexpectedly when
  attempting to build on Windows.
@y
- Fixed an issue where some `dockerfile` paths would fail unexpectedly when
  attempting to build on Windows.
@z

@x
- Fixed a bug where build context URLs would fail to build on Windows.
@y
- Fixed a bug where build context URLs would fail to build on Windows.
@z

@x
- Fixed a bug that caused `run` and `exec` commands to fail for some otherwise
  accepted values of the `--host` parameter.
@y
- Fixed a bug that caused `run` and `exec` commands to fail for some otherwise
  accepted values of the `--host` parameter.
@z

@x
- Fixed an issue where overrides for the `storage_opt` and `isolation` keys in
  service definitions weren't properly applied.
@y
- Fixed an issue where overrides for the `storage_opt` and `isolation` keys in
  service definitions weren't properly applied.
@z

@x
- Fixed a bug where some invalid Compose files would raise an uncaught
  exception during validation.
@y
- Fixed a bug where some invalid Compose files would raise an uncaught
  exception during validation.
@z

@x
## 1.23.1
(2018-11-01)
@y
## 1.23.1
(2018-11-01)
@z

@x
### Bug Fixes
@y
### Bug Fixes
@z

@x
- Fixed a bug where working with containers created with a version of Compose earlier than `1.23.0`
  would cause unexpected crashes.
@y
- Fixed a bug where working with containers created with a version of Compose earlier than `1.23.0`
  would cause unexpected crashes.
@z

@x
- Fixed an issue where the behavior of the `--project-directory` flag would
  vary depending on which subcommand was used.
@y
- Fixed an issue where the behavior of the `--project-directory` flag would
  vary depending on which subcommand was used.
@z

@x
## 1.23.0
(2018-10-30)
@y
## 1.23.0
(2018-10-30)
@z

@x
### Important note
@y
### Important note
@z

@x
The default naming scheme for containers created by Compose in this version
has changed from `<project>_<service>_<index>` to
`<project>_<service>_<index>_<slug>`, where `<slug>` is a randomly-generated
hexadecimal string. Please make sure to update scripts relying on the old
naming scheme accordingly before upgrading.
@y
The default naming scheme for containers created by Compose in this version
has changed from `<project>_<service>_<index>` to
`<project>_<service>_<index>_<slug>`, where `<slug>` is a randomly-generated
hexadecimal string. Please make sure to update scripts relying on the old
naming scheme accordingly before upgrading.
@z

@x
### Features
@y
{: #features }
### 機能
@z

@x
- Logs for containers restarting after a crash will now appear in the output
  of the `up` and `logs` commands.
@y
- Logs for containers restarting after a crash will now appear in the output
  of the `up` and `logs` commands.
@z

@x
- Added `--hash` option to the `docker-compose config` command, allowing users
  to print a hash string for each service's configuration to facilitate rolling
  updates.
@y
- Added `--hash` option to the `docker-compose config` command, allowing users
  to print a hash string for each service's configuration to facilitate rolling
  updates.
@z

@x
- Added `--parallel` flag to the `docker-compose build` command, allowing
  Compose to build up to 5 images simultaneously.
@y
- Added `--parallel` flag to the `docker-compose build` command, allowing
  Compose to build up to 5 images simultaneously.
@z

@x
- Output for the `pull` command now reports status / progress even when pulling
  multiple images in parallel.
@y
- Output for the `pull` command now reports status / progress even when pulling
  multiple images in parallel.
@z

@x
- For images with multiple names, Compose will now attempt to match the one
  present in the service configuration in the output of the `images` command.
@y
- For images with multiple names, Compose will now attempt to match the one
  present in the service configuration in the output of the `images` command.
@z

@x
### Bug Fixes
@y
### Bug Fixes
@z

@x
- Fixed an issue where parallel `run` commands for the same service would fail due to name
  collisions.
@y
- Fixed an issue where parallel `run` commands for the same service would fail due to name
  collisions.
@z

@x
- Fixed an issue where paths longer than 260 characters on Windows clients would
  cause `docker-compose build` to fail.
@y
- Fixed an issue where paths longer than 260 characters on Windows clients would
  cause `docker-compose build` to fail.
@z

@x
- Fixed a bug where attempting to mount `/var/run/docker.sock` with
  Docker Desktop for Windows would result in failure.
@y
- Fixed a bug where attempting to mount `/var/run/docker.sock` with
  Docker Desktop for Windows would result in failure.
@z

@x
- The `--project-directory` option is now used by Compose to determine where to
  look for the `.env` file.
@y
- The `--project-directory` option is now used by Compose to determine where to
  look for the `.env` file.
@z

@x
- `docker-compose build` no longer fails when attempting to pull an image with
  credentials provided by the ***gcloud credential helper***.
@y
- `docker-compose build` no longer fails when attempting to pull an image with
  credentials provided by the ***gcloud credential helper***.
@z

@x
- Fixed the `--exit-code-from` option in `docker-compose up` to always report
  the actual exit code even when the watched container is not the cause of the
  exit.
@y
- Fixed the `--exit-code-from` option in `docker-compose up` to always report
  the actual exit code even when the watched container is not the cause of the
  exit.
@z

@x
- Fixed an issue that would prevent recreating a service in some cases where
  a volume would be mapped to the same mountpoint as a volume declared within the Dockerfile for that image.
@y
- Fixed an issue that would prevent recreating a service in some cases where
  a volume would be mapped to the same mountpoint as a volume declared within the Dockerfile for that image.
@z

@x
- Fixed a bug that caused hash configuration with multiple networks to be
  inconsistent, causing some services to be unnecessarily restarted.
@y
- Fixed a bug that caused hash configuration with multiple networks to be
  inconsistent, causing some services to be unnecessarily restarted.
@z

@x
- Fixed a bug that would cause failures with variable substitution for services
  with a name containing one or more dot characters.
@y
- Fixed a bug that would cause failures with variable substitution for services
  with a name containing one or more dot characters.
@z

@x
- Fixed a pipe handling issue when using the containerized version of Compose.
@y
- Fixed a pipe handling issue when using the containerized version of Compose.
@z

@x
- Fixed a bug causing `external: false` entries in the Compose file to be
  printed as `external: true` in the output of `docker-compose config`.
@y
- Fixed a bug causing `external: false` entries in the Compose file to be
  printed as `external: true` in the output of `docker-compose config`.
@z

@x
- Fixed a bug where issuing a `docker-compose pull` command on services
  without a defined image key would cause Compose to crash.
@y
- Fixed a bug where issuing a `docker-compose pull` command on services
  without a defined image key would cause Compose to crash.
@z

@x
- Volumes and binds are now mounted in the order they are declared in the
  service definition.
@y
- Volumes and binds are now mounted in the order they are declared in the
  service definition.
@z

@x
### Miscellaneous
@y
### Miscellaneous
@z

@x
- The `zsh` completion script has been updated with new options, and no
  longer suggests container names where service names are expected.
@y
- The `zsh` completion script has been updated with new options, and no
  longer suggests container names where service names are expected.
@z

@x
## 1.22.0
(2018-07-17)
@y
## 1.22.0
(2018-07-17)
@z

@x
### New features
@y
### New features
@z

@x
#### Compose format version 3.7
@y
#### Compose format version 3.7
@z

@x
- Introduced version 3.7 of the `docker-compose.yml` specification.
  This version requires Docker Engine 18.06.0 or above.
@y
- Introduced version 3.7 of the `docker-compose.yml` specification.
  This version requires Docker Engine 18.06.0 or above.
@z

@x
- Added support for `rollback_config` in the deploy configuration
@y
- Added support for `rollback_config` in the deploy configuration
@z

@x
- Added support for the `init` parameter in service configurations
@y
- Added support for the `init` parameter in service configurations
@z

@x
- Added support for extension fields in service, network, volume, secret,
  and config configurations
@y
- Added support for extension fields in service, network, volume, secret,
  and config configurations
@z

@x
#### Compose format version 2.4
@y
#### Compose format version 2.4
@z

@x
- Added support for extension fields in service, network,
  and volume configurations
@y
- Added support for extension fields in service, network,
  and volume configurations
@z

@x
### Bug Fixes
@y
### Bug Fixes
@z

@x
- Fixed a bug that prevented deployment with some Compose files when
  `DOCKER_DEFAULT_PLATFORM` was set
@y
- Fixed a bug that prevented deployment with some Compose files when
  `DOCKER_DEFAULT_PLATFORM` was set
@z

@x
- Compose will no longer try to create containers or volumes with
  invalid starting characters
@y
- Compose will no longer try to create containers or volumes with
  invalid starting characters
@z

@x
- Fixed several bugs that prevented Compose commands from working properly
  with containers created with an older version of Compose
@y
- Fixed several bugs that prevented Compose commands from working properly
  with containers created with an older version of Compose
@z

@x
- Fixed an issue with the output of `docker-compose config` with the
  `--compatibility-mode` flag enabled when the source file contains
  attachable networks
@y
- Fixed an issue with the output of `docker-compose config` with the
  `--compatibility-mode` flag enabled when the source file contains
  attachable networks
@z

@x
- Fixed a bug that prevented the `gcloud` credential store from working
  properly when used with the Compose binary on UNIX
@y
- Fixed a bug that prevented the `gcloud` credential store from working
  properly when used with the Compose binary on UNIX
@z

@x
- Fixed a bug that caused connection errors when trying to operate
  over a non-HTTPS TCP connection on Windows
@y
- Fixed a bug that caused connection errors when trying to operate
  over a non-HTTPS TCP connection on Windows
@z

@x
- Fixed a bug that caused builds to fail on Windows if the Dockerfile
  was located in a subdirectory of the build context
@y
- Fixed a bug that caused builds to fail on Windows if the Dockerfile
  was located in a subdirectory of the build context
@z

@x
- Fixed an issue that prevented proper parsing of UTF-8 BOM encoded
  Compose files on Windows
@y
- Fixed an issue that prevented proper parsing of UTF-8 BOM encoded
  Compose files on Windows
@z

@x
- Fixed an issue with handling of the double-wildcard (`**`) pattern in `.dockerignore` files when using `docker-compose build`
@y
- Fixed an issue with handling of the double-wildcard (`**`) pattern in `.dockerignore` files when using `docker-compose build`
@z

@x
- Fixed a bug that caused auth values in legacy `.dockercfg` files to be ignored
- `docker-compose build` will no longer attempt to create image names starting with an invalid character
@y
- Fixed a bug that caused auth values in legacy `.dockercfg` files to be ignored
- `docker-compose build` will no longer attempt to create image names starting with an invalid character
@z

@x
## 1.21.2
(2018-05-03)
@y
## 1.21.2
(2018-05-03)
@z

@x
### Bug Fixes
@y
### Bug Fixes
@z

@x
- Fixed a bug where the ip_range attribute in IPAM configs was prevented
  from passing validation
@y
- Fixed a bug where the ip_range attribute in IPAM configs was prevented
  from passing validation
@z

@x
## 1.21.1
(2018-04-27)
@y
## 1.21.1
(2018-04-27)
@z

@x
### Bug Fixes
@y
### Bug Fixes
@z

@x
- In 1.21.0, we introduced a change to how project names are sanitized for
  internal use in resource names. This caused issues when manipulating an
  existing, deployed application whose name had changed as a result.
  This release properly detects resources using "legacy" naming conventions.
@y
- In 1.21.0, we introduced a change to how project names are sanitized for
  internal use in resource names. This caused issues when manipulating an
  existing, deployed application whose name had changed as a result.
  This release properly detects resources using "legacy" naming conventions.
@z

@x
- Fixed an issue where specifying an in-context Dockerfile using an absolute
  path would fail despite being valid.
@y
- Fixed an issue where specifying an in-context Dockerfile using an absolute
  path would fail despite being valid.
@z

@x
- Fixed a bug where IPAM option changes were incorrectly detected, preventing
  redeployments.
@y
- Fixed a bug where IPAM option changes were incorrectly detected, preventing
  redeployments.
@z

@x
- Validation of v2 files now properly checks the structure of IPAM configs.
@y
- Validation of v2 files now properly checks the structure of IPAM configs.
@z

@x
- Improved support for credentials stores on Windows to include binaries using
  extensions other than `.exe`. The list of valid extensions is determined by
  the contents of the `PATHEXT` environment variable.
@y
- Improved support for credentials stores on Windows to include binaries using
  extensions other than `.exe`. The list of valid extensions is determined by
  the contents of the `PATHEXT` environment variable.
@z

@x
- Fixed a bug where Compose would generate invalid binds containing duplicate
  elements with some v3.2 files, triggering errors at the Engine level during
  deployment.
@y
- Fixed a bug where Compose would generate invalid binds containing duplicate
  elements with some v3.2 files, triggering errors at the Engine level during
  deployment.
@z

@x
## 1.21.0
(2018-04-11)
@y
## 1.21.0
(2018-04-11)
@z

@x
### New features
@y
### New features
@z

@x
#### Compose file version 2.4
@y
#### Compose file version 2.4
@z

@x
- Introduced version 2.4 of the `docker-compose.yml` specification.
  This version requires Docker Engine 17.12.0 or above.
@y
- Introduced version 2.4 of the `docker-compose.yml` specification.
  This version requires Docker Engine 17.12.0 or above.
@z

@x
- Added support for the `platform` parameter in service definitions.
  If supplied, the parameter is also used when performing build for the
  service.
@y
- Added support for the `platform` parameter in service definitions.
  If supplied, the parameter is also used when performing build for the
  service.
@z

@x
#### Compose file version 2.2 and up
@y
#### Compose file version 2.2 and up
@z

@x
- Added support for the `cpu_rt_period` and `cpu_rt_runtime` parameters
  in service definitions (2.x only).
@y
- Added support for the `cpu_rt_period` and `cpu_rt_runtime` parameters
  in service definitions (2.x only).
@z

@x
#### Compose file version 2.1 and up
@y
#### Compose file version 2.1 and up
@z

@x
- Added support for the `cpu_period` parameter in service definitions
  (2.x only).
@y
- Added support for the `cpu_period` parameter in service definitions
  (2.x only).
@z

@x
- Added support for the `isolation` parameter in service build configurations.
  Additionally, the `isolation` parameter in service definitions is used for
  builds as well if no `build.isolation` parameter is defined. (2.x only)
@y
- Added support for the `isolation` parameter in service build configurations.
  Additionally, the `isolation` parameter in service definitions is used for
  builds as well if no `build.isolation` parameter is defined. (2.x only)
@z

@x
#### All formats
@y
#### All formats
@z

@x
- Added support for the `--workdir` flag in `docker-compose exec`.
@y
- Added support for the `--workdir` flag in `docker-compose exec`.
@z

@x
- Added support for the `--compress` flag in `docker-compose build`.
@y
- Added support for the `--compress` flag in `docker-compose build`.
@z

@x
- `docker-compose pull` is now performed in parallel by default. You can
  opt out using the `--no-parallel` flag. The `--parallel` flag is now
  deprecated and will be removed in a future version.
@y
- `docker-compose pull` is now performed in parallel by default. You can
  opt out using the `--no-parallel` flag. The `--parallel` flag is now
  deprecated and will be removed in a future version.
@z

@x
- Dashes and underscores in project names are no longer stripped out.
@y
- Dashes and underscores in project names are no longer stripped out.
@z

@x
- `docker-compose build` now supports the use of Dockerfile from outside
  the build context.
@y
- `docker-compose build` now supports the use of Dockerfile from outside
  the build context.
@z

@x
### Bug Fixes
@y
### Bug Fixes
@z

@x
- Compose now checks that the volume's configuration matches the remote
  volume, and errors out if a mismatch is detected.
@y
- Compose now checks that the volume's configuration matches the remote
  volume, and errors out if a mismatch is detected.
@z

@x
- Fixed a bug that caused Compose to raise unexpected errors when attempting
  to create several one-off containers in parallel.
@y
- Fixed a bug that caused Compose to raise unexpected errors when attempting
  to create several one-off containers in parallel.
@z

@x
- Fixed a bug with argument parsing when using `docker-machine config` to
  generate TLS flags for `exec` and `run` commands.
@y
- Fixed a bug with argument parsing when using `docker-machine config` to
  generate TLS flags for `exec` and `run` commands.
@z

@x
- Fixed a bug where variable substitution with an empty default value
  (e.g. `${VAR:-}`) would print an incorrect warning.
@y
- Fixed a bug where variable substitution with an empty default value
  (e.g. `${VAR:-}`) would print an incorrect warning.
@z

@x
- Improved resilience when encoding of the Compose file doesn't match the
  system's. Users are encouraged to use UTF-8 when possible.
@y
- Improved resilience when encoding of the Compose file doesn't match the
  system's. Users are encouraged to use UTF-8 when possible.
@z

@x
- Fixed a bug where external overlay networks in Swarm would be incorrectly
  recognized as inexistent by Compose, interrupting otherwise valid
  operations.
@y
- Fixed a bug where external overlay networks in Swarm would be incorrectly
  recognized as inexistent by Compose, interrupting otherwise valid
  operations.
@z

@x
## 1.20.0
(2018-03-20)
@y
## 1.20.0
(2018-03-20)
@z

@x
### New features
@y
### New features
@z

@x
#### Compose file version 3.6
@y
#### Compose file version 3.6
@z

@x
- Introduced version 3.6 of the `docker-compose.yml` specification.
  This version must be used with Docker Engine 18.02.0 or above.
@y
- Introduced version 3.6 of the `docker-compose.yml` specification.
  This version must be used with Docker Engine 18.02.0 or above.
@z

@x
- Added support for the `tmpfs.size` property in volume mappings
@y
- Added support for the `tmpfs.size` property in volume mappings
@z

@x
#### Compose file version 3.2 and up
@y
#### Compose file version 3.2 and up
@z

@x
- The `--build-arg` option can now be used without specifying a service
  in `docker-compose build`
@y
- The `--build-arg` option can now be used without specifying a service
  in `docker-compose build`
@z

@x
#### Compose file version 2.3
@y
#### Compose file version 2.3
@z

@x
- Added support for `device_cgroup_rules` in service definitions
@y
- Added support for `device_cgroup_rules` in service definitions
@z

@x
- Added support for the `tmpfs.size` property in long-form volume mappings
@y
- Added support for the `tmpfs.size` property in long-form volume mappings
@z

@x
- The `--build-arg` option can now be used without specifying a service
  in `docker-compose build`
@y
- The `--build-arg` option can now be used without specifying a service
  in `docker-compose build`
@z

@x
#### All formats
@y
#### All formats
@z

@x
- Added a `--log-level` option to the top-level `docker-compose` command.
  Accepted values are `debug`, `info`, `warning`, `error`, `critical`.
  Default log level is `info`
@y
- Added a `--log-level` option to the top-level `docker-compose` command.
  Accepted values are `debug`, `info`, `warning`, `error`, `critical`.
  Default log level is `info`
@z

@x
- `docker-compose run` now allows users to unset the container's entrypoint
@y
- `docker-compose run` now allows users to unset the container's entrypoint
@z

@x
- Proxy configuration found in the `~/.docker/config.json` file now populates
  environment and build args for containers created by Compose
@y
- Proxy configuration found in the `~/.docker/config.json` file now populates
  environment and build args for containers created by Compose
@z

@x
- Added the `--use-aliases` flag to `docker-compose run`, indicating that
  network aliases declared in the service's config should be used for the
  running container
@y
- Added the `--use-aliases` flag to `docker-compose run`, indicating that
  network aliases declared in the service's config should be used for the
  running container
@z

@x
- Added the `--include-deps` flag to `docker-compose pull`
@y
- Added the `--include-deps` flag to `docker-compose pull`
@z

@x
- `docker-compose run` now kills and removes the running container upon
  receiving `SIGHUP`
@y
- `docker-compose run` now kills and removes the running container upon
  receiving `SIGHUP`
@z

@x
- `docker-compose ps` now shows the containers' health status if available
@y
- `docker-compose ps` now shows the containers' health status if available
@z

@x
- Added the long-form `--detach` option to the `exec`, `run` and `up`
  commands
@y
- Added the long-form `--detach` option to the `exec`, `run` and `up`
  commands
@z

@x
### Bug Fixes
@y
### Bug Fixes
@z

@x
- Fixed `.dockerignore` handling, notably with regard to absolute paths
  and last-line precedence rules
@y
- Fixed `.dockerignore` handling, notably with regard to absolute paths
  and last-line precedence rules
@z

@x
- Fixed an issue where Compose would make costly DNS lookups when connecting
  to the Engine when using Docker For Mac
@y
- Fixed an issue where Compose would make costly DNS lookups when connecting
  to the Engine when using Docker For Mac
@z

@x
- Fixed a bug introduced in 1.19.0 which caused the default certificate path
  to not be honored by Compose
@y
- Fixed a bug introduced in 1.19.0 which caused the default certificate path
  to not be honored by Compose
@z

@x
- Fixed a bug where Compose would incorrectly check whether a symlink's
  destination was accessible when part of a build context
@y
- Fixed a bug where Compose would incorrectly check whether a symlink's
  destination was accessible when part of a build context
@z

@x
- Fixed a bug where `.dockerignore` files containing lines of whitespace
  caused Compose to error out on Windows
@y
- Fixed a bug where `.dockerignore` files containing lines of whitespace
  caused Compose to error out on Windows
@z

@x
- Fixed a bug where `--tls*` and `--host` options wouldn't be properly honored
  for interactive `run` and `exec` commands
@y
- Fixed a bug where `--tls*` and `--host` options wouldn't be properly honored
  for interactive `run` and `exec` commands
@z

@x
- A `seccomp:<filepath>` entry in the `security_opt` config now correctly
  sends the contents of the file to the engine
@y
- A `seccomp:<filepath>` entry in the `security_opt` config now correctly
  sends the contents of the file to the engine
@z

@x
- ANSI output for `up` and `down` operations should no longer affect the wrong
  lines
@y
- ANSI output for `up` and `down` operations should no longer affect the wrong
  lines
@z

@x
- Improved support for non-unicode locales
@y
- Improved support for non-unicode locales
@z

@x
- Fixed a crash occurring on Windows when the user's home directory name
  contained non-ASCII characters
@y
- Fixed a crash occurring on Windows when the user's home directory name
  contained non-ASCII characters
@z

@x
- Fixed a bug occurring during builds caused by files with a negative `mtime`
  values in the build context
@y
- Fixed a bug occurring during builds caused by files with a negative `mtime`
  values in the build context
@z

@x
- Fixed an encoding bug when streaming build progress
@y
- Fixed an encoding bug when streaming build progress
@z

@x
## 1.19.0
(2018-02-07)
@y
## 1.19.0
(2018-02-07)
@z

@x
### Breaking changes
@y
### Breaking changes
@z

@x
- On UNIX platforms, interactive `run` and `exec` commands now require
  the `docker` CLI to be installed on the client by default. To revert
  to the previous behavior, users may set the `COMPOSE_INTERACTIVE_NO_CLI`
  environment variable.
@y
- On UNIX platforms, interactive `run` and `exec` commands now require
  the `docker` CLI to be installed on the client by default. To revert
  to the previous behavior, users may set the `COMPOSE_INTERACTIVE_NO_CLI`
  environment variable.
@z

@x
### New features
@y
### New features
@z

@x
#### Compose file version 3.x
@y
#### Compose file version 3.x
@z

@x
- The output of the `config` command should now merge `deploy` options from
  several Compose files in a more accurate manner
@y
- The output of the `config` command should now merge `deploy` options from
  several Compose files in a more accurate manner
@z

@x
#### Compose file version 2.3
@y
#### Compose file version 2.3
@z

@x
- Added support for the `runtime` option in service definitions
@y
- Added support for the `runtime` option in service definitions
@z

@x
#### Compose file version 2.1 and up
@y
#### Compose file version 2.1 and up
@z

@x
- Added support for the `${VAR:?err}` and `${VAR?err}` variable interpolation
  syntax to indicate mandatory variables
@y
- Added support for the `${VAR:?err}` and `${VAR?err}` variable interpolation
  syntax to indicate mandatory variables
@z

@x
#### Compose file version 2.x
@y
#### Compose file version 2.x
@z

@x
- Added `priority` key to service network mappings, allowing the user to
  define in which order the specified service will connect to each network
@y
- Added `priority` key to service network mappings, allowing the user to
  define in which order the specified service will connect to each network
@z

@x
#### All formats
@y
#### All formats
@z

@x
- Added `--renew-anon-volumes` (shorthand `-V`) to the `up` command,
  preventing Compose from recovering volume data from previous containers for
  anonymous volumes
@y
- Added `--renew-anon-volumes` (shorthand `-V`) to the `up` command,
  preventing Compose from recovering volume data from previous containers for
  anonymous volumes
@z

@x
- Added limit for number of simultaneous parallel operations, which should
  prevent accidental resource exhaustion of the server. Default is 64 and
  can be configured using the `COMPOSE_PARALLEL_LIMIT` environment variable
@y
- Added limit for number of simultaneous parallel operations, which should
  prevent accidental resource exhaustion of the server. Default is 64 and
  can be configured using the `COMPOSE_PARALLEL_LIMIT` environment variable
@z

@x
- Added `--always-recreate-deps` flag to the `up` command to force recreating
  dependent services along with the dependency owner
@y
- Added `--always-recreate-deps` flag to the `up` command to force recreating
  dependent services along with the dependency owner
@z

@x
- Added `COMPOSE_IGNORE_ORPHANS` environment variable to forgo orphan
  container detection and suppress warnings
@y
- Added `COMPOSE_IGNORE_ORPHANS` environment variable to forgo orphan
  container detection and suppress warnings
@z

@x
- Added `COMPOSE_FORCE_WINDOWS_HOST` environment variable to force Compose
  to parse volume definitions as if the Docker host was a Windows system,
  even if Compose itself is currently running on UNIX
@y
- Added `COMPOSE_FORCE_WINDOWS_HOST` environment variable to force Compose
  to parse volume definitions as if the Docker host was a Windows system,
  even if Compose itself is currently running on UNIX
@z

@x
- Bash completion should now be able to better differentiate between running,
  stopped and paused services
@y
- Bash completion should now be able to better differentiate between running,
  stopped and paused services
@z

@x
### Bug Fixes
@y
### Bug Fixes
@z

@x
- Fixed a bug that would cause the `build` command to report a connection
  error when the build context contained unreadable files or FIFO objects.
  These file types will now be handled appropriately
@y
- Fixed a bug that would cause the `build` command to report a connection
  error when the build context contained unreadable files or FIFO objects.
  These file types will now be handled appropriately
@z

@x
- Fixed various issues around interactive `run`/`exec` sessions.
@y
- Fixed various issues around interactive `run`/`exec` sessions.
@z

@x
- Fixed a bug where setting TLS options with environment and CLI flags
  simultaneously would result in part of the configuration being ignored
@y
- Fixed a bug where setting TLS options with environment and CLI flags
  simultaneously would result in part of the configuration being ignored
@z

@x
- Fixed a bug where the DOCKER_TLS_VERIFY environment variable was being
  ignored by Compose
@y
- Fixed a bug where the DOCKER_TLS_VERIFY environment variable was being
  ignored by Compose
@z

@x
- Fixed a bug where the `-d` and `--timeout` flags in `up` were erroneously
  marked as incompatible
@y
- Fixed a bug where the `-d` and `--timeout` flags in `up` were erroneously
  marked as incompatible
@z

@x
- Fixed a bug where the recreation of a service would break if the image
  associated with the previous container had been removed
@y
- Fixed a bug where the recreation of a service would break if the image
  associated with the previous container had been removed
@z

@x
- Fixed a bug where updating a mount's target would break Compose when
  trying to recreate the associated service
@y
- Fixed a bug where updating a mount's target would break Compose when
  trying to recreate the associated service
@z

@x
- Fixed a bug where `tmpfs` volumes declared using the extended syntax in
  Compose files using version 3.2 would be erroneously created as anonymous
  volumes instead
@y
- Fixed a bug where `tmpfs` volumes declared using the extended syntax in
  Compose files using version 3.2 would be erroneously created as anonymous
  volumes instead
@z

@x
- Fixed a bug where type conversion errors would print a stacktrace instead
  of exiting gracefully
@y
- Fixed a bug where type conversion errors would print a stacktrace instead
  of exiting gracefully
@z

@x
- Fixed some errors related to unicode handling
@y
- Fixed some errors related to unicode handling
@z

@x
- Dependent services no longer get recreated along with the dependency owner
  if their configuration hasn't changed
@y
- Dependent services no longer get recreated along with the dependency owner
  if their configuration hasn't changed
@z

@x
- Added better validation of `labels` fields in Compose files. Label values
  containing scalar types (number, boolean) now get automatically converted
  to strings
@y
- Added better validation of `labels` fields in Compose files. Label values
  containing scalar types (number, boolean) now get automatically converted
  to strings
@z

@x
## 1.18.0
(2017-12-18)
@y
## 1.18.0
(2017-12-18)
@z

@x
### New features
@y
### New features
@z

@x
#### Compose file version 3.5
@y
#### Compose file version 3.5
@z

@x
- Introduced version 3.5 of the `docker-compose.yml` specification.
  This version requires Docker Engine 17.06.0 or above
@y
- Introduced version 3.5 of the `docker-compose.yml` specification.
  This version requires Docker Engine 17.06.0 or above
@z

@x
- Added support for the `shm_size` parameter in build configurations
@y
- Added support for the `shm_size` parameter in build configurations
@z

@x
- Added support for the `isolation` parameter in service definitions
@y
- Added support for the `isolation` parameter in service definitions
@z

@x
- Added support for custom names for network, secret and config definitions
@y
- Added support for custom names for network, secret and config definitions
@z

@x
#### Compose file version 2.3
@y
#### Compose file version 2.3
@z

@x
- Added support for `extra_hosts` in build configuration
@y
- Added support for `extra_hosts` in build configuration
@z

@x
- Added support for the [long syntax](compose-file/compose-file-v3.md#long-syntax-3) for volume entries, as previously introduced in the 3.2 format.
  Using this syntax will create [mounts](../storage/bind-mounts.md) instead of volumes.
@y
- Added support for the [long syntax](compose-file/compose-file-v3.md#long-syntax-3) for volume entries, as previously introduced in the 3.2 format.
  Using this syntax will create [mounts](../storage/bind-mounts.md) instead of volumes.
@z

@x
#### Compose file version 2.1 and up
@y
#### Compose file version 2.1 and up
@z

@x
- Added support for the `oom_kill_disable` parameter in service definitions
  (2.x only)
@y
- Added support for the `oom_kill_disable` parameter in service definitions
  (2.x only)
@z

@x
- Added support for custom names for network definitions (2.x only)
@y
- Added support for custom names for network definitions (2.x only)
@z

@x
#### All formats
@y
#### All formats
@z

@x
- Values interpolated from the environment will now be converted to the
  proper type when used in non-string fields.
@y
- Values interpolated from the environment will now be converted to the
  proper type when used in non-string fields.
@z

@x
- Added support for `--label` in `docker-compose run`
@y
- Added support for `--label` in `docker-compose run`
@z

@x
- Added support for `--timeout` in `docker-compose down`
@y
- Added support for `--timeout` in `docker-compose down`
@z

@x
- Added support for `--memory` in `docker-compose build`
@y
- Added support for `--memory` in `docker-compose build`
@z

@x
- Setting `stop_grace_period` in service definitions now also sets the
  container's `stop_timeout`
@y
- Setting `stop_grace_period` in service definitions now also sets the
  container's `stop_timeout`
@z

@x
### Bug Fixes
@y
### Bug Fixes
@z

@x
- Fixed an issue where Compose was still handling service hostname according
  to legacy engine behavior, causing hostnames containing dots to be cut up
@y
- Fixed an issue where Compose was still handling service hostname according
  to legacy engine behavior, causing hostnames containing dots to be cut up
@z

@x
- Fixed a bug where the `X-Y:Z` syntax for ports was considered invalid
  by Compose
@y
- Fixed a bug where the `X-Y:Z` syntax for ports was considered invalid
  by Compose
@z

@x
- Fixed an issue with CLI logging causing duplicate messages and inelegant
  output to occur
@y
- Fixed an issue with CLI logging causing duplicate messages and inelegant
  output to occur
@z

@x
- Fixed an issue that caused `stop_grace_period` to be ignored when using
  multiple Compose files
@y
- Fixed an issue that caused `stop_grace_period` to be ignored when using
  multiple Compose files
@z

@x
- Fixed a bug that caused `docker-compose images` to crash when using
  untagged images
@y
- Fixed a bug that caused `docker-compose images` to crash when using
  untagged images
@z

@x
- Fixed a bug where the valid `${VAR:-}` syntax would cause Compose to
  error out
@y
- Fixed a bug where the valid `${VAR:-}` syntax would cause Compose to
  error out
@z

@x
- Fixed a bug where `env_file` entries using an UTF-8 BOM were being read
  incorrectly
@y
- Fixed a bug where `env_file` entries using an UTF-8 BOM were being read
  incorrectly
@z

@x
- Fixed a bug where missing secret files would generate an empty directory
  in their place
@y
- Fixed a bug where missing secret files would generate an empty directory
  in their place
@z

@x
- Fixed character encoding issues in the CLI's error handlers
@y
- Fixed character encoding issues in the CLI's error handlers
@z

@x
- Added validation for the `test` field in healthchecks
@y
- Added validation for the `test` field in healthchecks
@z

@x
- Added validation for the `subnet` field in IPAM configurations
@y
- Added validation for the `subnet` field in IPAM configurations
@z

@x
- Added validation for `volumes` properties when using the long syntax in
  service definitions
@y
- Added validation for `volumes` properties when using the long syntax in
  service definitions
@z

@x
- The CLI now explicit prevents using `-d` and `--timeout` together
  in `docker-compose up`
@y
- The CLI now explicit prevents using `-d` and `--timeout` together
  in `docker-compose up`
@z

@x
## 1.17.0
(2017-11-01)
@y
## 1.17.0
(2017-11-01)
@z

@x
### New features
@y
### New features
@z

@x
#### Compose file version 3.4
@y
#### Compose file version 3.4
@z

@x
- Introduced version 3.4 of the `docker-compose.yml` specification.
  This version requires to be used with Docker Engine 17.06.0 or above.
@y
- Introduced version 3.4 of the `docker-compose.yml` specification.
  This version requires to be used with Docker Engine 17.06.0 or above.
@z

@x
- Added support for `cache_from`, `network` and `target` options in build
  configurations
@y
- Added support for `cache_from`, `network` and `target` options in build
  configurations
@z

@x
- Added support for the `order` parameter in the `update_config` section
@y
- Added support for the `order` parameter in the `update_config` section
@z

@x
- Added support for setting a custom name in volume definitions using
  the `name` parameter
@y
- Added support for setting a custom name in volume definitions using
  the `name` parameter
@z

@x
#### Compose file version 2.3
@y
#### Compose file version 2.3
@z

@x
- Added support for `shm_size` option in build configuration
@y
- Added support for `shm_size` option in build configuration
@z

@x
#### Compose file version 2.x
@y
#### Compose file version 2.x
@z

@x
- Added support for extension fields (`x-*`). Also available for v3.4 files
@y
- Added support for extension fields (`x-*`). Also available for v3.4 files
@z

@x
#### All formats
@y
#### All formats
@z

@x
- Added new `--no-start` to the `up` command, allowing users to create all
  resources (networks, volumes, containers) without starting services.
  The `create` command is deprecated in favor of this new option
@y
- Added new `--no-start` to the `up` command, allowing users to create all
  resources (networks, volumes, containers) without starting services.
  The `create` command is deprecated in favor of this new option
@z

@x
### Bug Fixes
@y
### Bug Fixes
@z

@x
- Fixed a bug where `extra_hosts` values would be overridden by extension
  files instead of merging together
@y
- Fixed a bug where `extra_hosts` values would be overridden by extension
  files instead of merging together
@z

@x
- Fixed a bug where the validation for v3.2 files would prevent using the
  `consistency` field in service volume definitions
@y
- Fixed a bug where the validation for v3.2 files would prevent using the
  `consistency` field in service volume definitions
@z

@x
- Fixed a bug that would cause a crash when configuration fields expecting
  unique items would contain duplicates
@y
- Fixed a bug that would cause a crash when configuration fields expecting
  unique items would contain duplicates
@z

@x
- Fixed a bug where mount overrides with a different mode would create a
  duplicate entry instead of overriding the original entry
@y
- Fixed a bug where mount overrides with a different mode would create a
  duplicate entry instead of overriding the original entry
@z

@x
- Fixed a bug where build labels declared as a list wouldn't be properly
  parsed
@y
- Fixed a bug where build labels declared as a list wouldn't be properly
  parsed
@z

@x
- Fixed a bug where the output of `docker-compose config` would be invalid
  for some versions if the file contained custom-named external volumes
@y
- Fixed a bug where the output of `docker-compose config` would be invalid
  for some versions if the file contained custom-named external volumes
@z

@x
- Improved error handling when issuing a build command on Windows using an
  unsupported file version
@y
- Improved error handling when issuing a build command on Windows using an
  unsupported file version
@z

@x
- Fixed an issue where networks with identical names would sometimes be
  created when running `up` commands concurrently.
@y
- Fixed an issue where networks with identical names would sometimes be
  created when running `up` commands concurrently.
@z

@x
## 1.16.0
(2017-08-31)
@y
## 1.16.0
(2017-08-31)
@z

@x
### New features
@y
### New features
@z

@x
#### Compose file version 2.3
@y
#### Compose file version 2.3
@z

@x
- Introduced version 2.3 of the `docker-compose.yml` specification.
  This version requires to be used with Docker Engine 17.06.0 or above.
@y
- Introduced version 2.3 of the `docker-compose.yml` specification.
  This version requires to be used with Docker Engine 17.06.0 or above.
@z

@x
- Added support for the `target` parameter in build configurations
@y
- Added support for the `target` parameter in build configurations
@z

@x
- Added support for the `start_period` parameter in healthcheck
  configurations
@y
- Added support for the `start_period` parameter in healthcheck
  configurations
@z

@x
#### Compose file version 2.x
@y
#### Compose file version 2.x
@z

@x
- Added support for the `blkio_config` parameter in service definitions
@y
- Added support for the `blkio_config` parameter in service definitions
@z

@x
- Added support for setting a custom name in volume definitions using
  the `name` parameter (not available for version 2.0)
@y
- Added support for setting a custom name in volume definitions using
  the `name` parameter (not available for version 2.0)
@z

@x
#### All formats
@y
#### All formats
@z

@x
- Added new CLI flag `--no-ansi` to suppress ANSI control characters in
  output
@y
- Added new CLI flag `--no-ansi` to suppress ANSI control characters in
  output
@z

@x
### Bug Fixes
@y
### Bug Fixes
@z

@x
- Fixed a bug where nested `extends` instructions weren't resolved
  properly, causing "file not found" errors
@y
- Fixed a bug where nested `extends` instructions weren't resolved
  properly, causing "file not found" errors
@z

@x
- Fixed several issues with `.dockerignore` parsing
@y
- Fixed several issues with `.dockerignore` parsing
@z

@x
- Fixed issues where logs of TTY-enabled services were being printed
  incorrectly and causing `MemoryError` exceptions
@y
- Fixed issues where logs of TTY-enabled services were being printed
  incorrectly and causing `MemoryError` exceptions
@z

@x
- Fixed a bug where printing application logs would sometimes be interrupted
  by a `UnicodeEncodeError` exception on Python 3
@y
- Fixed a bug where printing application logs would sometimes be interrupted
  by a `UnicodeEncodeError` exception on Python 3
@z

@x
- The `$` character in the output of `docker-compose config` is now
  properly escaped
@y
- The `$` character in the output of `docker-compose config` is now
  properly escaped
@z

@x
- Fixed a bug where running `docker-compose top` would sometimes fail
  with an uncaught exception
@y
- Fixed a bug where running `docker-compose top` would sometimes fail
  with an uncaught exception
@z

@x
- Fixed a bug where `docker-compose pull` with the `--parallel` flag
  would return a `0` exit code when failing
@y
- Fixed a bug where `docker-compose pull` with the `--parallel` flag
  would return a `0` exit code when failing
@z

@x
- Fixed an issue where keys in `deploy.resources` were not being validated
@y
- Fixed an issue where keys in `deploy.resources` were not being validated
@z

@x
- Fixed an issue where the `logging` options in the output of
  `docker-compose config` would be set to `null`, an invalid value
@y
- Fixed an issue where the `logging` options in the output of
  `docker-compose config` would be set to `null`, an invalid value
@z

@x
- Fixed the output of the `docker-compose images` command when an image
  would come from a private repository using an explicit port number
@y
- Fixed the output of the `docker-compose images` command when an image
  would come from a private repository using an explicit port number
@z

@x
- Fixed the output of `docker-compose config` when a port definition used
  `0` as the value for the published port
@y
- Fixed the output of `docker-compose config` when a port definition used
  `0` as the value for the published port
@z

@x
## 1.15.0
(2017-07-26)
@y
## 1.15.0
(2017-07-26)
@z

@x
### New features
@y
### New features
@z

@x
#### Compose file version 2.2
@y
#### Compose file version 2.2
@z

@x
- Added support for the `network` parameter in build configurations.
@y
- Added support for the `network` parameter in build configurations.
@z

@x
#### Compose file version 2.1 and up
@y
#### Compose file version 2.1 and up
@z

@x
- The `pid` option in a service's definition now supports a `service:<name>`
  value.
@y
- The `pid` option in a service's definition now supports a `service:<name>`
  value.
@z

@x
- Added support for the `storage_opt` parameter in in service definitions.
  This option is not available for the v3 format
@y
- Added support for the `storage_opt` parameter in in service definitions.
  This option is not available for the v3 format
@z

@x
#### All formats
@y
#### All formats
@z

@x
- Added `--quiet` flag to `docker-compose pull`, suppressing progress output
@y
- Added `--quiet` flag to `docker-compose pull`, suppressing progress output
@z

@x
- Some improvements to CLI output
@y
- Some improvements to CLI output
@z

@x
### Bug Fixes
@y
### Bug Fixes
@z

@x
- Volumes specified through the `--volume` flag of `docker-compose run` now
  complement volumes declared in the service's definition instead of replacing
  them
@y
- Volumes specified through the `--volume` flag of `docker-compose run` now
  complement volumes declared in the service's definition instead of replacing
  them
@z

@x
- Fixed a bug where using multiple Compose files would unset the scale value
  defined inside the Compose file.
@y
- Fixed a bug where using multiple Compose files would unset the scale value
  defined inside the Compose file.
@z

@x
- Fixed an issue where the `credHelpers` entries in the `config.json` file
  were not being honored by Compose
@y
- Fixed an issue where the `credHelpers` entries in the `config.json` file
  were not being honored by Compose
@z

@x
- Fixed a bug where using multiple Compose files with port declarations
  would cause failures in Python 3 environments
@y
- Fixed a bug where using multiple Compose files with port declarations
  would cause failures in Python 3 environments
@z

@x
- Fixed a bug where some proxy-related options present in the user's
  environment would prevent Compose from running
@y
- Fixed a bug where some proxy-related options present in the user's
  environment would prevent Compose from running
@z

@x
- Fixed an issue where the output of `docker-compose config` would be invalid
  if the original file used `Y` or `N` values
@y
- Fixed an issue where the output of `docker-compose config` would be invalid
  if the original file used `Y` or `N` values
@z

@x
- Fixed an issue preventing `up` operations on a previously created stack on
  Windows Engine.
@y
- Fixed an issue preventing `up` operations on a previously created stack on
  Windows Engine.
@z

@x
## 1.14.0
(2017-06-19)
@y
## 1.14.0
(2017-06-19)
@z

@x
### New features
@y
### New features
@z

@x
#### Compose file version 3.3
@y
#### Compose file version 3.3
@z

@x
- Introduced version 3.3 of the `docker-compose.yml` specification.
  This version requires to be used with Docker Engine 17.06.0 or above.
  Note: the `credential_spec` and `configs` keys only apply to Swarm services
  and will be ignored by Compose
@y
- Introduced version 3.3 of the `docker-compose.yml` specification.
  This version requires to be used with Docker Engine 17.06.0 or above.
  Note: the `credential_spec` and `configs` keys only apply to Swarm services
  and will be ignored by Compose
@z

@x
#### Compose file version 2.2
@y
#### Compose file version 2.2
@z

@x
- Added the following parameters in service definitions: `cpu_count`,
  `cpu_percent`, `cpus`
@y
- Added the following parameters in service definitions: `cpu_count`,
  `cpu_percent`, `cpus`
@z

@x
#### Compose file version 2.1
@y
#### Compose file version 2.1
@z

@x
- Added support for build labels. This feature is also available in the
  2.2 and 3.3 formats.
@y
- Added support for build labels. This feature is also available in the
  2.2 and 3.3 formats.
@z

@x
#### All formats
@y
#### All formats
@z

@x
- Added shorthand `-u` for `--user` flag in `docker-compose exec`
@y
- Added shorthand `-u` for `--user` flag in `docker-compose exec`
@z

@x
- Differences in labels between the Compose file and remote network
  will now print a warning instead of preventing redeployment.
@y
- Differences in labels between the Compose file and remote network
  will now print a warning instead of preventing redeployment.
@z

@x
### Bug Fixes
@y
### Bug Fixes
@z

@x
- Fixed a bug where service's dependencies were being rescaled to their
  default scale when running a `docker-compose run` command
@y
- Fixed a bug where service's dependencies were being rescaled to their
  default scale when running a `docker-compose run` command
@z

@x
- Fixed a bug where `docker-compose rm` with the `--stop` flag was not
  behaving properly when provided with a list of services to remove
@y
- Fixed a bug where `docker-compose rm` with the `--stop` flag was not
  behaving properly when provided with a list of services to remove
@z

@x
- Fixed a bug where `cache_from` in the build section would be ignored when
  using more than one Compose file.
@y
- Fixed a bug where `cache_from` in the build section would be ignored when
  using more than one Compose file.
@z

@x
- Fixed a bug that prevented binding the same port to different IPs when
  using more than one Compose file.
@y
- Fixed a bug that prevented binding the same port to different IPs when
  using more than one Compose file.
@z

@x
- Fixed a bug where override files would not be picked up by Compose if they
  had the `.yaml` extension
@y
- Fixed a bug where override files would not be picked up by Compose if they
  had the `.yaml` extension
@z

@x
- Fixed a bug on Windows Engine where networks would be incorrectly flagged
  for recreation
@y
- Fixed a bug on Windows Engine where networks would be incorrectly flagged
  for recreation
@z

@x
- Fixed a bug where services declaring ports would cause crashes on some
  versions of Python 3
@y
- Fixed a bug where services declaring ports would cause crashes on some
  versions of Python 3
@z

@x
- Fixed a bug where the output of `docker-compose config` would sometimes
  contain invalid port definitions
@y
- Fixed a bug where the output of `docker-compose config` would sometimes
  contain invalid port definitions
@z

@x
## 1.13.0
(2017-05-02)
@y
## 1.13.0
(2017-05-02)
@z

@x
### Breaking changes
@y
### Breaking changes
@z

@x
- `docker-compose up` now resets a service's scaling to its default value.
  You can use the newly introduced `--scale` option to specify a custom
  scale value
@y
- `docker-compose up` now resets a service's scaling to its default value.
  You can use the newly introduced `--scale` option to specify a custom
  scale value
@z

@x
### New features
@y
### New features
@z

@x
#### Compose file version 2.2
@y
#### Compose file version 2.2
@z

@x
- Introduced version 2.2 of the `docker-compose.yml` specification. This
  version requires to be used with Docker Engine 1.13.0 or above
@y
- Introduced version 2.2 of the `docker-compose.yml` specification. This
  version requires to be used with Docker Engine 1.13.0 or above
@z

@x
- Added support for `init` in service definitions.
@y
- Added support for `init` in service definitions.
@z

@x
- Added support for `scale` in service definitions. The configuration's value
  can be overridden using the `--scale` flag in `docker-compose up`.
  The `scale` command is disabled for this file format
@y
- Added support for `scale` in service definitions. The configuration's value
  can be overridden using the `--scale` flag in `docker-compose up`.
  The `scale` command is disabled for this file format
@z

@x
#### Compose file version 2.x
@y
#### Compose file version 2.x
@z

@x
- Added support for `options` in the `ipam` section of network definitions
@y
- Added support for `options` in the `ipam` section of network definitions
@z

@x
### Bug Fixes
@y
### Bug Fixes
@z

@x
- Fixed a bug where paths provided to compose via the `-f` option were not
  being resolved properly
@y
- Fixed a bug where paths provided to compose via the `-f` option were not
  being resolved properly
@z

@x
- Fixed a bug where the `ext_ip::target_port` notation in the ports section
  was incorrectly marked as invalid
@y
- Fixed a bug where the `ext_ip::target_port` notation in the ports section
  was incorrectly marked as invalid
@z

@x
- Fixed an issue where the `exec` command would sometimes not return control
  to the terminal when using the `-d` flag
@y
- Fixed an issue where the `exec` command would sometimes not return control
  to the terminal when using the `-d` flag
@z

@x
- Fixed a bug where secrets were missing from the output of the `config`
  command for v3.2 files
@y
- Fixed a bug where secrets were missing from the output of the `config`
  command for v3.2 files
@z

@x
- Fixed an issue where `docker-compose` would hang if no internet connection
  was available
@y
- Fixed an issue where `docker-compose` would hang if no internet connection
  was available
@z

@x
- Fixed an issue where paths containing unicode characters passed via the `-f`
  flag were causing Compose to crash
@y
- Fixed an issue where paths containing unicode characters passed via the `-f`
  flag were causing Compose to crash
@z

@x
- Fixed an issue where the output of `docker-compose config` would be invalid
  if the Compose file contained external secrets
@y
- Fixed an issue where the output of `docker-compose config` would be invalid
  if the Compose file contained external secrets
@z

@x
- Fixed a bug where using `--exit-code-from` with `up` would fail if Compose
  was installed in a Python 3 environment
@y
- Fixed a bug where using `--exit-code-from` with `up` would fail if Compose
  was installed in a Python 3 environment
@z

@x
- Fixed a bug where recreating containers using a combination of `tmpfs` and
  `volumes` would result in an invalid config state
@y
- Fixed a bug where recreating containers using a combination of `tmpfs` and
  `volumes` would result in an invalid config state
@z

@x
## 1.12.0
(2017-04-04)
@y
## 1.12.0
(2017-04-04)
@z

@x
### New features
@y
### New features
@z

@x
#### Compose file version 3.2
@y
#### Compose file version 3.2
@z

@x
- Introduced version 3.2 of the `docker-compose.yml` specification
@y
- Introduced version 3.2 of the `docker-compose.yml` specification
@z

@x
- Added support for `cache_from` in the `build` section of services
@y
- Added support for `cache_from` in the `build` section of services
@z

@x
- Added support for the new expanded ports syntax in service definitions
@y
- Added support for the new expanded ports syntax in service definitions
@z

@x
- Added support for the new expanded volumes syntax in service definitions
@y
- Added support for the new expanded volumes syntax in service definitions
@z

@x
#### Compose file version 2.1
@y
#### Compose file version 2.1
@z

@x
- Added support for `pids_limit` in service definitions
@y
- Added support for `pids_limit` in service definitions
@z

@x
#### Compose file version 2.0 and up
@y
#### Compose file version 2.0 and up
@z

@x
- Added `--volumes` option to `docker-compose config` that lists named
  volumes declared for that project
@y
- Added `--volumes` option to `docker-compose config` that lists named
  volumes declared for that project
@z

@x
- Added support for `mem_reservation` in service definitions (2.x only)
@y
- Added support for `mem_reservation` in service definitions (2.x only)
@z

@x
- Added support for `dns_opt` in service definitions (2.x only)
@y
- Added support for `dns_opt` in service definitions (2.x only)
@z

@x
#### All formats
@y
#### All formats
@z

@x
- Added a new `docker-compose images` command that lists images used by
  the current project's containers
@y
- Added a new `docker-compose images` command that lists images used by
  the current project's containers
@z

@x
- Added a `--stop` (shorthand `-s`) option to `docker-compose rm` that stops
  the running containers before removing them
@y
- Added a `--stop` (shorthand `-s`) option to `docker-compose rm` that stops
  the running containers before removing them
@z

@x
- Added a `--resolve-image-digests` option to `docker-compose config` that
  pins the image version for each service to a permanent digest
@y
- Added a `--resolve-image-digests` option to `docker-compose config` that
  pins the image version for each service to a permanent digest
@z

@x
- Added a `--exit-code-from SERVICE` option to `docker-compose up`. When
  used, `docker-compose` will exit on any container's exit with the code
  corresponding to the specified service's exit code
@y
- Added a `--exit-code-from SERVICE` option to `docker-compose up`. When
  used, `docker-compose` will exit on any container's exit with the code
  corresponding to the specified service's exit code
@z

@x
- Added a `--parallel` option to `docker-compose pull` that enables images
  for multiple services to be pulled simultaneously
@y
- Added a `--parallel` option to `docker-compose pull` that enables images
  for multiple services to be pulled simultaneously
@z

@x
- Added a `--build-arg` option to `docker-compose build`
@y
- Added a `--build-arg` option to `docker-compose build`
@z

@x
- Added a `--volume <volume_mapping>` (shorthand `-v`) option to
  `docker-compose run` to declare runtime volumes to be mounted
@y
- Added a `--volume <volume_mapping>` (shorthand `-v`) option to
  `docker-compose run` to declare runtime volumes to be mounted
@z

@x
- Added a `--project-directory PATH` option to `docker-compose` that will
  affect path resolution for the project
@y
- Added a `--project-directory PATH` option to `docker-compose` that will
  affect path resolution for the project
@z

@x
- When using `--abort-on-container-exit` in `docker-compose up`, the exit
  code for the container that caused the abort will be the exit code of
  the `docker-compose up` command
@y
- When using `--abort-on-container-exit` in `docker-compose up`, the exit
  code for the container that caused the abort will be the exit code of
  the `docker-compose up` command
@z

@x
- Users can now configure which path separator character they want to use
  to separate the `COMPOSE_FILE` environment value using the
  `COMPOSE_PATH_SEPARATOR` environment variable
@y
- Users can now configure which path separator character they want to use
  to separate the `COMPOSE_FILE` environment value using the
  `COMPOSE_PATH_SEPARATOR` environment variable
@z

@x
- Added support for port range to a single port in port mappings, such as
  `8000-8010:80`.
@y
- Added support for port range to a single port in port mappings, such as
  `8000-8010:80`.
@z

@x
### Bug Fixes
@y
### Bug Fixes
@z

@x
- `docker-compose run --rm` now removes anonymous volumes after execution,
  matching the behavior of `docker run --rm`.
@y
- `docker-compose run --rm` now removes anonymous volumes after execution,
  matching the behavior of `docker run --rm`.
@z

@x
- Fixed a bug where override files containing port lists would cause a
  TypeError to be raised
@y
- Fixed a bug where override files containing port lists would cause a
  TypeError to be raised
@z

@x
- Fixed a bug where the `deploy` key would be missing from the output of
  `docker-compose config`
@y
- Fixed a bug where the `deploy` key would be missing from the output of
  `docker-compose config`
@z

@x
- Fixed a bug where scaling services up or down would sometimes re-use
  obsolete containers
@y
- Fixed a bug where scaling services up or down would sometimes re-use
  obsolete containers
@z

@x
- Fixed a bug where the output of `docker-compose config` would be invalid
  if the project declared anonymous volumes
@y
- Fixed a bug where the output of `docker-compose config` would be invalid
  if the project declared anonymous volumes
@z

@x
- Variable interpolation now properly occurs in the `secrets` section of
  the Compose file
@y
- Variable interpolation now properly occurs in the `secrets` section of
  the Compose file
@z

@x
- The `secrets` section now properly appears in the output of
  `docker-compose config`
@y
- The `secrets` section now properly appears in the output of
  `docker-compose config`
@z

@x
- Fixed a bug where changes to some networks properties would not be
  detected against previously created networks
@y
- Fixed a bug where changes to some networks properties would not be
  detected against previously created networks
@z

@x
- Fixed a bug where `docker-compose` would crash when trying to write into
  a closed pipe
@y
- Fixed a bug where `docker-compose` would crash when trying to write into
  a closed pipe
@z

@x
- Fixed an issue where Compose would not pick up on the value of
  COMPOSE_TLS_VERSION when used in combination with command-line TLS flags
@y
- Fixed an issue where Compose would not pick up on the value of
  COMPOSE_TLS_VERSION when used in combination with command-line TLS flags
@z

@x
## 1.11.2
(2017-02-17)
@y
## 1.11.2
(2017-02-17)
@z

@x
### Bug Fixes
@y
### Bug Fixes
@z

@x
- Fixed a bug that was preventing secrets configuration from being
  loaded properly
@y
- Fixed a bug that was preventing secrets configuration from being
  loaded properly
@z

@x
- Fixed a bug where the `docker-compose config` command would fail
  if the config file contained secrets definitions
@y
- Fixed a bug where the `docker-compose config` command would fail
  if the config file contained secrets definitions
@z

@x
- Fixed an issue where Compose on some linux distributions would
  pick up and load an outdated version of the requests library
@y
- Fixed an issue where Compose on some linux distributions would
  pick up and load an outdated version of the requests library
@z

@x
- Fixed an issue where socket-type files inside a build folder
  would cause `docker-compose` to crash when trying to build that
  service
@y
- Fixed an issue where socket-type files inside a build folder
  would cause `docker-compose` to crash when trying to build that
  service
@z

@x
- Fixed an issue where recursive wildcard patterns `**` were not being
  recognized in `.dockerignore` files.
@y
- Fixed an issue where recursive wildcard patterns `**` were not being
  recognized in `.dockerignore` files.
@z

@x
## 1.11.1
(2017-02-09)
@y
## 1.11.1
(2017-02-09)
@z

@x
### Bug Fixes
@y
### Bug Fixes
@z

@x
- Fixed a bug where the 3.1 file format was not being recognized as valid
  by the Compose parser
@y
- Fixed a bug where the 3.1 file format was not being recognized as valid
  by the Compose parser
@z

@x
## 1.11.0
(2017-02-08)
@y
## 1.11.0
(2017-02-08)
@z

@x
### New Features
@y
### New Features
@z

@x
#### Compose file version 3.1
@y
#### Compose file version 3.1
@z

@x
- Introduced version 3.1 of the `docker-compose.yml` specification. This
  version requires Docker Engine 1.13.0 or above. It introduces support
  for secrets. See the documentation for more information
@y
- Introduced version 3.1 of the `docker-compose.yml` specification. This
  version requires Docker Engine 1.13.0 or above. It introduces support
  for secrets. See the documentation for more information
@z

@x
#### Compose file version 2.0 and up
@y
#### Compose file version 2.0 and up
@z

@x
- Introduced the `docker-compose top` command that displays processes running
  for the different services managed by Compose.
@y
- Introduced the `docker-compose top` command that displays processes running
  for the different services managed by Compose.
@z

@x
### Bug Fixes
@y
### Bug Fixes
@z

@x
- Fixed a bug where extending a service defining a healthcheck dictionary
  would cause `docker-compose` to error out.
@y
- Fixed a bug where extending a service defining a healthcheck dictionary
  would cause `docker-compose` to error out.
@z

@x
- Fixed an issue where the `pid` entry in a service definition was being
  ignored when using multiple Compose files.
@y
- Fixed an issue where the `pid` entry in a service definition was being
  ignored when using multiple Compose files.
@z

@x
## 1.10.1
(2017-02-01)
@y
## 1.10.1
(2017-02-01)
@z

@x
### Bug Fixes
@y
### Bug Fixes
@z

@x
- Fixed an issue where the presence of older versions of the docker-py
  package would cause unexpected crashes while running Compose
@y
- Fixed an issue where the presence of older versions of the docker-py
  package would cause unexpected crashes while running Compose
@z

@x
- Fixed an issue where healthcheck dependencies would be lost when
  using multiple compose files for a project
@y
- Fixed an issue where healthcheck dependencies would be lost when
  using multiple compose files for a project
@z

@x
- Fixed a few issues that made the output of the `config` command
  invalid
@y
- Fixed a few issues that made the output of the `config` command
  invalid
@z

@x
- Fixed an issue where adding volume labels to v3 Compose files would
  result in an error
@y
- Fixed an issue where adding volume labels to v3 Compose files would
  result in an error
@z

@x
- Fixed an issue on Windows where build context paths containing unicode
  characters were being improperly encoded
@y
- Fixed an issue on Windows where build context paths containing unicode
  characters were being improperly encoded
@z

@x
- Fixed a bug where Compose would occasionally crash while streaming logs
  when containers would stop or restart
@y
- Fixed a bug where Compose would occasionally crash while streaming logs
  when containers would stop or restart
@z

@x
## 1.10.0
(2017-01-18)
@y
## 1.10.0
(2017-01-18)
@z

@x
### New Features
@y
### New Features
@z

@x
#### Compose file version 3.0
@y
#### Compose file version 3.0
@z

@x
- Introduced version 3.0 of the `docker-compose.yml` specification. This
  version requires to be used with Docker Engine 1.13 or above and is
  specifically designed to work with the `docker stack` commands.
@y
- Introduced version 3.0 of the `docker-compose.yml` specification. This
  version requires to be used with Docker Engine 1.13 or above and is
  specifically designed to work with the `docker stack` commands.
@z

@x
#### Compose file version 2.1 and up
@y
#### Compose file version 2.1 and up
@z

@x
- Healthcheck configuration can now be done in the service definition using
  the `healthcheck` parameter
@y
- Healthcheck configuration can now be done in the service definition using
  the `healthcheck` parameter
@z

@x
- Containers dependencies can now be set up to wait on positive healthchecks
  when declared using `depends_on`. See the documentation for the updated
  syntax.
  **Note**: This feature will not be ported to version 3 Compose files.
@y
- Containers dependencies can now be set up to wait on positive healthchecks
  when declared using `depends_on`. See the documentation for the updated
  syntax.
  **Note**: This feature will not be ported to version 3 Compose files.
@z

@x
- Added support for the `sysctls` parameter in service definitions
@y
- Added support for the `sysctls` parameter in service definitions
@z

@x
- Added support for the `userns_mode` parameter in service definitions
@y
- Added support for the `userns_mode` parameter in service definitions
@z

@x
- Compose now adds identifying labels to networks and volumes it creates
@y
- Compose now adds identifying labels to networks and volumes it creates
@z

@x
#### Compose file version 2.0 and up
@y
#### Compose file version 2.0 and up
@z

@x
- Added support for the `stop_grace_period` option in service definitions.
@y
- Added support for the `stop_grace_period` option in service definitions.
@z

@x
### Bug Fixes
@y
### Bug Fixes
@z

@x
- Colored output now works properly on Windows.
@y
- Colored output now works properly on Windows.
@z

@x
- Fixed a bug where docker-compose run would fail to set up link aliases
  in interactive mode on Windows.
@y
- Fixed a bug where docker-compose run would fail to set up link aliases
  in interactive mode on Windows.
@z

@x
- Networks created by Compose are now always made attachable
  (Compose files v2.1 and up).
@y
- Networks created by Compose are now always made attachable
  (Compose files v2.1 and up).
@z

@x
- Fixed a bug where falsy values of `COMPOSE_CONVERT_WINDOWS_PATHS`
  (`0`, `false`, empty value) were being interpreted as true.
@y
- Fixed a bug where falsy values of `COMPOSE_CONVERT_WINDOWS_PATHS`
  (`0`, `false`, empty value) were being interpreted as true.
@z

@x
- Fixed a bug where forward slashes in some .dockerignore patterns weren't
  being parsed correctly on Windows
@y
- Fixed a bug where forward slashes in some .dockerignore patterns weren't
  being parsed correctly on Windows
@z

@x
## 1.9.0
(2016-11-16)
@y
## 1.9.0
(2016-11-16)
@z

@x
**Breaking changes**
@y
**Breaking changes**
@z

@x
- When using Compose with Docker Toolbox/Machine on Windows, volume paths are
  no longer converted from `C:\Users` to `/c/Users`-style by default. To
  re-enable this conversion so that your volumes keep working, set the
  environment variable `COMPOSE_CONVERT_WINDOWS_PATHS=1`. Users of
  Docker for Windows are not affected and do not need to set the variable.
@y
- When using Compose with Docker Toolbox/Machine on Windows, volume paths are
  no longer converted from `C:\Users` to `/c/Users`-style by default. To
  re-enable this conversion so that your volumes keep working, set the
  environment variable `COMPOSE_CONVERT_WINDOWS_PATHS=1`. Users of
  Docker for Windows are not affected and do not need to set the variable.
@z

@x
### New Features
@y
### New Features
@z

@x
- Interactive mode for `docker-compose run` and `docker-compose exec` is
  now supported on Windows platforms. The `docker` binary
  is required to be present on the system for this feature to work.
@y
- Interactive mode for `docker-compose run` and `docker-compose exec` is
  now supported on Windows platforms. The `docker` binary
  is required to be present on the system for this feature to work.
@z

@x
- Introduced version 2.1 of the `docker-compose.yml` specification. This
  version requires to be used with Docker Engine 1.12 or above.
    - Added support for setting volume labels and network labels in
  `docker-compose.yml`.
    - Added support for the `isolation` parameter in service definitions.
    - Added support for link-local IPs in the service networks definitions.
    - Added support for shell-style inline defaults in variable interpolation.
      The supported forms are `${FOO-default}` (fall back if FOO is unset) and
      `${FOO:-default}` (fall back if FOO is unset or empty).
@y
- Introduced version 2.1 of the `docker-compose.yml` specification. This
  version requires to be used with Docker Engine 1.12 or above.
    - Added support for setting volume labels and network labels in
  `docker-compose.yml`.
    - Added support for the `isolation` parameter in service definitions.
    - Added support for link-local IPs in the service networks definitions.
    - Added support for shell-style inline defaults in variable interpolation.
      The supported forms are `${FOO-default}` (fall back if FOO is unset) and
      `${FOO:-default}` (fall back if FOO is unset or empty).
@z

@x
- Added support for the `group_add` and `oom_score_adj` parameters in
  service definitions.
@y
- Added support for the `group_add` and `oom_score_adj` parameters in
  service definitions.
@z

@x
- Added support for the `internal` and `enable_ipv6` parameters in network
  definitions.
@y
- Added support for the `internal` and `enable_ipv6` parameters in network
  definitions.
@z

@x
- Compose now defaults to using the `npipe` protocol on Windows.
@y
- Compose now defaults to using the `npipe` protocol on Windows.
@z

@x
- Overriding a `logging` configuration will now properly merge the `options`
  mappings if the `driver` values do not conflict.
@y
- Overriding a `logging` configuration will now properly merge the `options`
  mappings if the `driver` values do not conflict.
@z

@x
### Bug Fixes
@y
### Bug Fixes
@z

@x
- Fixed several bugs related to `npipe` protocol support on Windows.
@y
- Fixed several bugs related to `npipe` protocol support on Windows.
@z

@x
- Fixed an issue with Windows paths being incorrectly converted when
  using Docker on Windows Server.
@y
- Fixed an issue with Windows paths being incorrectly converted when
  using Docker on Windows Server.
@z

@x
- Fixed a bug where an empty `restart` value would sometimes result in an
  exception being raised.
@y
- Fixed a bug where an empty `restart` value would sometimes result in an
  exception being raised.
@z

@x
- Fixed an issue where service logs containing unicode characters would
  sometimes cause an error to occur.
@y
- Fixed an issue where service logs containing unicode characters would
  sometimes cause an error to occur.
@z

@x
- Fixed a bug where unicode values in environment variables would sometimes
  raise a unicode exception when retrieved.
@y
- Fixed a bug where unicode values in environment variables would sometimes
  raise a unicode exception when retrieved.
@z

@x
- Fixed an issue where Compose would incorrectly detect a configuration
  mismatch for overlay networks.
@y
- Fixed an issue where Compose would incorrectly detect a configuration
  mismatch for overlay networks.
@z

@x
## 1.8.1
(2016-09-22)
@y
## 1.8.1
(2016-09-22)
@z

@x
### Bug Fixes
@y
### Bug Fixes
@z

@x
- Fixed a bug where users using a credentials store were not able
  to access their private images.
@y
- Fixed a bug where users using a credentials store were not able
  to access their private images.
@z

@x
- Fixed a bug where users using identity tokens to authenticate
  were not able to access their private images.
@y
- Fixed a bug where users using identity tokens to authenticate
  were not able to access their private images.
@z

@x
- Fixed a bug where an `HttpHeaders` entry in the docker configuration
  file would cause Compose to crash when trying to build an image.
@y
- Fixed a bug where an `HttpHeaders` entry in the docker configuration
  file would cause Compose to crash when trying to build an image.
@z

@x
- Fixed a few bugs related to the handling of Windows paths in volume
  binding declarations.
@y
- Fixed a few bugs related to the handling of Windows paths in volume
  binding declarations.
@z

@x
- Fixed a bug where Compose would sometimes crash while trying to
  read a streaming response from the engine.
@y
- Fixed a bug where Compose would sometimes crash while trying to
  read a streaming response from the engine.
@z

@x
- Fixed an issue where Compose would crash when encountering an API error
  while streaming container logs.
@y
- Fixed an issue where Compose would crash when encountering an API error
  while streaming container logs.
@z

@x
- Fixed an issue where Compose would erroneously try to output logs from
  drivers not handled by the Engine's API.
@y
- Fixed an issue where Compose would erroneously try to output logs from
  drivers not handled by the Engine's API.
@z

@x
- Fixed a bug where options from the `docker-machine config` command would
  not be properly interpreted by Compose.
@y
- Fixed a bug where options from the `docker-machine config` command would
  not be properly interpreted by Compose.
@z

@x
- Fixed a bug where the connection to the Docker Engine would
  sometimes fail when running a large number of services simultaneously.
@y
- Fixed a bug where the connection to the Docker Engine would
  sometimes fail when running a large number of services simultaneously.
@z

@x
- Fixed an issue where Compose would sometimes print a misleading
  suggestion message when running the `bundle` command.
@y
- Fixed an issue where Compose would sometimes print a misleading
  suggestion message when running the `bundle` command.
@z

@x
- Fixed a bug where connection errors would not be handled properly by
  Compose during the project initialization phase.
@y
- Fixed a bug where connection errors would not be handled properly by
  Compose during the project initialization phase.
@z

@x
- Fixed a bug where a misleading error would appear when encountering
  a connection timeout.
@y
- Fixed a bug where a misleading error would appear when encountering
  a connection timeout.
@z

@x
## 1.8.0
(2016-06-14)
@y
## 1.8.0
(2016-06-14)
@z

@x
### Breaking Changes
@y
### Breaking Changes
@z

@x
- As announced in 1.7.0, `docker-compose rm` now removes containers
  created by `docker-compose run` by default.
@y
- As announced in 1.7.0, `docker-compose rm` now removes containers
  created by `docker-compose run` by default.
@z

@x
- Setting `entrypoint` on a service now empties out any default
  command that was set on the image (i.e. any `CMD` instruction in the
  Dockerfile used to build it). This makes it consistent with
  the `--entrypoint` flag to `docker run`.
@y
- Setting `entrypoint` on a service now empties out any default
  command that was set on the image (i.e. any `CMD` instruction in the
  Dockerfile used to build it). This makes it consistent with
  the `--entrypoint` flag to `docker run`.
@z

@x
### New Features
@y
### New Features
@z

@x
- Added `docker-compose bundle`, a command that builds a bundle file
  to be consumed by the new *Docker Stack* commands in Docker 1.12.
@y
- Added `docker-compose bundle`, a command that builds a bundle file
  to be consumed by the new *Docker Stack* commands in Docker 1.12.
@z

@x
- Added `docker-compose push`, a command that pushes service images
  to a registry.
@y
- Added `docker-compose push`, a command that pushes service images
  to a registry.
@z

@x
- Compose now supports specifying a custom TLS version for
  interaction with the Docker Engine using the `COMPOSE_TLS_VERSION`
  environment variable.
@y
- Compose now supports specifying a custom TLS version for
  interaction with the Docker Engine using the `COMPOSE_TLS_VERSION`
  environment variable.
@z

@x
### Bug Fixes
@y
### Bug Fixes
@z

@x
- Fixed a bug where Compose would erroneously try to read `.env`
  at the project's root when it is a directory.
@y
- Fixed a bug where Compose would erroneously try to read `.env`
  at the project's root when it is a directory.
@z

@x
- `docker-compose run -e VAR` now passes `VAR` through from the shell
  to the container, as with `docker run -e VAR`.
@y
- `docker-compose run -e VAR` now passes `VAR` through from the shell
  to the container, as with `docker run -e VAR`.
@z

@x
- Improved config merging when multiple compose files are involved
  for several service sub-keys.
@y
- Improved config merging when multiple compose files are involved
  for several service sub-keys.
@z

@x
- Fixed a bug where volume mappings containing Windows drives would
  sometimes be parsed incorrectly.
@y
- Fixed a bug where volume mappings containing Windows drives would
  sometimes be parsed incorrectly.
@z

@x
- Fixed a bug in Windows environment where volume mappings of the
  host's root directory would be parsed incorrectly.
@y
- Fixed a bug in Windows environment where volume mappings of the
  host's root directory would be parsed incorrectly.
@z

@x
- Fixed a bug where `docker-compose config` would output an invalid
  Compose file if external networks were specified.
@y
- Fixed a bug where `docker-compose config` would output an invalid
  Compose file if external networks were specified.
@z

@x
- Fixed an issue where unset buildargs would be assigned a string
  containing `'None'` instead of the expected empty value.
@y
- Fixed an issue where unset buildargs would be assigned a string
  containing `'None'` instead of the expected empty value.
@z

@x
- Fixed a bug where yes/no prompts on Windows would not show before
  receiving input.
@y
- Fixed a bug where yes/no prompts on Windows would not show before
  receiving input.
@z

@x
- Fixed a bug where trying to `docker-compose exec` on Windows
  without the `-d` option would exit with a stacktrace. This will
  still fail for the time being, but should do so gracefully.
@y
- Fixed a bug where trying to `docker-compose exec` on Windows
  without the `-d` option would exit with a stacktrace. This will
  still fail for the time being, but should do so gracefully.
@z

@x
- Fixed a bug where errors during `docker-compose up` would show
  an unrelated stacktrace at the end of the process.
@y
- Fixed a bug where errors during `docker-compose up` would show
  an unrelated stacktrace at the end of the process.
@z

@x
- `docker-compose create` and `docker-compose start` show more
  descriptive error messages when something goes wrong.
@y
- `docker-compose create` and `docker-compose start` show more
  descriptive error messages when something goes wrong.
@z

@x
## 1.7.1
(2016-05-04)
@y
## 1.7.1
(2016-05-04)
@z

@x
### Bug Fixes
@y
### Bug Fixes
@z

@x
- Fixed a bug where the output of `docker-compose config` for v1 files
  would be an invalid configuration file.
@y
- Fixed a bug where the output of `docker-compose config` for v1 files
  would be an invalid configuration file.
@z

@x
- Fixed a bug where `docker-compose config` would not check the validity
  of links.
@y
- Fixed a bug where `docker-compose config` would not check the validity
  of links.
@z

@x
- Fixed an issue where `docker-compose help` would not output a list of
  available commands and generic options as expected.
@y
- Fixed an issue where `docker-compose help` would not output a list of
  available commands and generic options as expected.
@z

@x
- Fixed an issue where filtering by service when using `docker-compose logs`
  would not apply for newly created services.
@y
- Fixed an issue where filtering by service when using `docker-compose logs`
  would not apply for newly created services.
@z

@x
- Fixed a bug where unchanged services would sometimes be recreated in
  in the up phase when using Compose with Python 3.
@y
- Fixed a bug where unchanged services would sometimes be recreated in
  in the up phase when using Compose with Python 3.
@z

@x
- Fixed an issue where API errors encountered during the up phase would
  not be recognized as a failure state by Compose.
@y
- Fixed an issue where API errors encountered during the up phase would
  not be recognized as a failure state by Compose.
@z

@x
- Fixed a bug where Compose would raise a NameError because of an undefined
  exception name on non-Windows platforms.
@y
- Fixed a bug where Compose would raise a NameError because of an undefined
  exception name on non-Windows platforms.
@z

@x
- Fixed a bug where the wrong version of `docker-py` would sometimes be
  installed alongside Compose.
@y
- Fixed a bug where the wrong version of `docker-py` would sometimes be
  installed alongside Compose.
@z

@x
- Fixed a bug where the host value output by `docker-machine config default`
  would not be recognized as valid options by the `docker-compose`
  command line.
@y
- Fixed a bug where the host value output by `docker-machine config default`
  would not be recognized as valid options by the `docker-compose`
  command line.
@z

@x
- Fixed an issue where Compose would sometimes exit unexpectedly  while
  reading events broadcasted by a Swarm cluster.
@y
- Fixed an issue where Compose would sometimes exit unexpectedly  while
  reading events broadcasted by a Swarm cluster.
@z

@x
- Corrected a statement in the docs about the location of the `.env` file,
  which is indeed read from the current directory, instead of in the same
  location as the Compose file.
@y
- Corrected a statement in the docs about the location of the `.env` file,
  which is indeed read from the current directory, instead of in the same
  location as the Compose file.
@z

@x
## 1.7.0
(2016-04-13)
@y
## 1.7.0
(2016-04-13)
@z

@x
### Breaking Changes
@y
### Breaking Changes
@z

@x
-   `docker-compose logs` no longer follows log output by default. It now
    matches the behavior of `docker logs` and exits after the current logs
    are printed. Use `-f` to get the old default behavior.
@y
-   `docker-compose logs` no longer follows log output by default. It now
    matches the behavior of `docker logs` and exits after the current logs
    are printed. Use `-f` to get the old default behavior.
@z

@x
-   Booleans are no longer allows as values for mappings in the Compose file
    (for keys `environment`, `labels` and `extra_hosts`). Previously this
    was a warning. Boolean values should be quoted so they become string values.
@y
-   Booleans are no longer allows as values for mappings in the Compose file
    (for keys `environment`, `labels` and `extra_hosts`). Previously this
    was a warning. Boolean values should be quoted so they become string values.
@z

@x
### New Features
@y
### New Features
@z

@x
-   Compose now looks for a `.env` file in the directory where it's run and
    reads any environment variables defined inside, if they're not already
    set in the shell environment. This lets you easily set defaults for
    variables used in the Compose file, or for any of the `COMPOSE_*` or
    `DOCKER_*` variables.
@y
-   Compose now looks for a `.env` file in the directory where it's run and
    reads any environment variables defined inside, if they're not already
    set in the shell environment. This lets you easily set defaults for
    variables used in the Compose file, or for any of the `COMPOSE_*` or
    `DOCKER_*` variables.
@z

@x
-   Added a `--remove-orphans` flag to both `docker-compose up` and
    `docker-compose down` to remove containers for services that were removed
    from the Compose file.
@y
-   Added a `--remove-orphans` flag to both `docker-compose up` and
    `docker-compose down` to remove containers for services that were removed
    from the Compose file.
@z

@x
-   Added a `--all` flag to `docker-compose rm` to include containers created
    by `docker-compose run`. This will become the default behavior in the next
    version of Compose.
@y
-   Added a `--all` flag to `docker-compose rm` to include containers created
    by `docker-compose run`. This will become the default behavior in the next
    version of Compose.
@z

@x
-   Added support for all the same TLS configuration flags used by the `docker`
    client: `--tls`, `--tlscert`, `--tlskey`, etc.
@y
-   Added support for all the same TLS configuration flags used by the `docker`
    client: `--tls`, `--tlscert`, `--tlskey`, etc.
@z

@x
-   Compose files now support the `tmpfs` and `shm_size` options.
@y
-   Compose files now support the `tmpfs` and `shm_size` options.
@z

@x
-   Added the `--workdir` flag to `docker-compose run`
@y
-   Added the `--workdir` flag to `docker-compose run`
@z

@x
-   `docker-compose logs` now shows logs for new containers that are created
    after it starts.
@y
-   `docker-compose logs` now shows logs for new containers that are created
    after it starts.
@z

@x
-   The `COMPOSE_FILE` environment variable can now contain multiple files,
    separated by the host system's standard path separator (`:` on Mac/Linux,
    `;` on Windows).
@y
-   The `COMPOSE_FILE` environment variable can now contain multiple files,
    separated by the host system's standard path separator (`:` on Mac/Linux,
    `;` on Windows).
@z

@x
-   You can now specify a static IP address when connecting a service to a
    network with the `ipv4_address` and `ipv6_address` options.
@y
-   You can now specify a static IP address when connecting a service to a
    network with the `ipv4_address` and `ipv6_address` options.
@z

@x
-   Added `--follow`, `--timestamp`, and `--tail` flags to the
    `docker-compose logs` command.
@y
-   Added `--follow`, `--timestamp`, and `--tail` flags to the
    `docker-compose logs` command.
@z

@x
-   `docker-compose up`, and `docker-compose start` will now start containers
    in parallel where possible.
@y
-   `docker-compose up`, and `docker-compose start` will now start containers
    in parallel where possible.
@z

@x
-   `docker-compose stop` now stops containers in reverse dependency order
    instead of all at once.
@y
-   `docker-compose stop` now stops containers in reverse dependency order
    instead of all at once.
@z

@x
-   Added the `--build` flag to `docker-compose up` to force it to build a new
    image. It now shows a warning if an image is automatically built when the
    flag is not used.
@y
-   Added the `--build` flag to `docker-compose up` to force it to build a new
    image. It now shows a warning if an image is automatically built when the
    flag is not used.
@z

@x
-   Added the `docker-compose exec` command for executing a process in a running
    container.
@y
-   Added the `docker-compose exec` command for executing a process in a running
    container.
@z

@x
### Bug Fixes
@y
### Bug Fixes
@z

@x
-   `docker-compose down` now removes containers created by
    `docker-compose run`.
@y
-   `docker-compose down` now removes containers created by
    `docker-compose run`.
@z

@x
-   A more appropriate error is shown when a timeout is hit during `up` when
    using a tty.
@y
-   A more appropriate error is shown when a timeout is hit during `up` when
    using a tty.
@z

@x
-   Fixed a bug in `docker-compose down` where it would abort if some resources
    had already been removed.
@y
-   Fixed a bug in `docker-compose down` where it would abort if some resources
    had already been removed.
@z

@x
-   Fixed a bug where changes to network aliases would not trigger a service
    to be recreated.
@y
-   Fixed a bug where changes to network aliases would not trigger a service
    to be recreated.
@z

@x
-   Fix a bug where a log message was printed about creating a new volume
    when it already existed.
@y
-   Fix a bug where a log message was printed about creating a new volume
    when it already existed.
@z

@x
-   Fixed a bug where interrupting `up` would not always shut down containers.
@y
-   Fixed a bug where interrupting `up` would not always shut down containers.
@z

@x
-   Fixed a bug where `log_opt` and `log_driver` were not properly carried over
    when extending services in the v1 Compose file format.
@y
-   Fixed a bug where `log_opt` and `log_driver` were not properly carried over
    when extending services in the v1 Compose file format.
@z

@x
-   Fixed a bug where empty values for build args would cause file validation
    to fail.
@y
-   Fixed a bug where empty values for build args would cause file validation
    to fail.
@z

@x
## 1.6.2
(2016-02-23)
@y
## 1.6.2
(2016-02-23)
@z

@x
-   Fixed a bug where connecting to a TLS-enabled Docker Engine would fail with
    a certificate verification error.
@y
-   Fixed a bug where connecting to a TLS-enabled Docker Engine would fail with
    a certificate verification error.
@z

@x
## 1.6.1
(2016-02-23)
@y
## 1.6.1
(2016-02-23)
@z

@x
### Bug Fixes
@y
### Bug Fixes
@z

@x
-   Fixed a bug where recreating a container multiple times would cause the
    new container to be started without the previous volumes.
@y
-   Fixed a bug where recreating a container multiple times would cause the
    new container to be started without the previous volumes.
@z

@x
-   Fixed a bug where Compose would set the value of unset environment variables
    to an empty string, instead of a key without a value.
@y
-   Fixed a bug where Compose would set the value of unset environment variables
    to an empty string, instead of a key without a value.
@z

@x
-   Provide a better error message when Compose requires a more recent version
    of the Docker API.
@y
-   Provide a better error message when Compose requires a more recent version
    of the Docker API.
@z

@x
-   Add a missing config field `network.aliases` which allows setting a network
    scoped alias for a service.
@y
-   Add a missing config field `network.aliases` which allows setting a network
    scoped alias for a service.
@z

@x
-   Fixed a bug where `run` would not start services listed in `depends_on`.
@y
-   Fixed a bug where `run` would not start services listed in `depends_on`.
@z

@x
-   Fixed a bug where `networks` and `network_mode` where not merged when using
    extends or multiple Compose files.
@y
-   Fixed a bug where `networks` and `network_mode` where not merged when using
    extends or multiple Compose files.
@z

@x
-   Fixed a bug with service aliases where the short container id alias was
    only contained 10 characters, instead of the 12 characters used in previous
    versions.
@y
-   Fixed a bug with service aliases where the short container id alias was
    only contained 10 characters, instead of the 12 characters used in previous
    versions.
@z

@x
-   Added a missing log message when creating a new named volume.
@y
-   Added a missing log message when creating a new named volume.
@z

@x
-   Fixed a bug where `build.args` was not merged when using `extends` or
    multiple Compose files.
@y
-   Fixed a bug where `build.args` was not merged when using `extends` or
    multiple Compose files.
@z

@x
-   Fixed some bugs with config validation when null values or incorrect types
    were used instead of a mapping.
@y
-   Fixed some bugs with config validation when null values or incorrect types
    were used instead of a mapping.
@z

@x
-   Fixed a bug where a `build` section without a `context` would show a stack
    trace instead of a helpful validation message.
@y
-   Fixed a bug where a `build` section without a `context` would show a stack
    trace instead of a helpful validation message.
@z

@x
-   Improved compatibility with swarm by only setting a container affinity to
    the previous instance of a services' container when the service uses an
    anonymous container volume. Previously the affinity was always set on all
    containers.
@y
-   Improved compatibility with swarm by only setting a container affinity to
    the previous instance of a services' container when the service uses an
    anonymous container volume. Previously the affinity was always set on all
    containers.
@z

@x
-   Fixed the validation of some `driver_opts` would cause an error if a number
    was used instead of a string.
@y
-   Fixed the validation of some `driver_opts` would cause an error if a number
    was used instead of a string.
@z

@x
-   Some improvements to the `run.sh` script used by the Compose container install
    option.
@y
-   Some improvements to the `run.sh` script used by the Compose container install
    option.
@z

@x
-   Fixed a bug with `up --abort-on-container-exit` where Compose would exit,
    but would not stop other containers.
@y
-   Fixed a bug with `up --abort-on-container-exit` where Compose would exit,
    but would not stop other containers.
@z

@x
-   Corrected the warning message that is printed when a boolean value is used
    as a value in a mapping.
@y
-   Corrected the warning message that is printed when a boolean value is used
    as a value in a mapping.
@z

@x
## 1.6.0
(2016-01-15)
@y
## 1.6.0
(2016-01-15)
@z

@x
### Major Features:
@y
### Major Features:
@z

@x
-   Compose 1.6 introduces a new format for `docker-compose.yml` which lets
    you define networks and volumes in the Compose file as well as services. It
    also makes a few changes to the structure of some configuration options.
@y
-   Compose 1.6 introduces a new format for `docker-compose.yml` which lets
    you define networks and volumes in the Compose file as well as services. It
    also makes a few changes to the structure of some configuration options.
@z

@x
    You don't have to use it - your existing Compose files will run on Compose
    1.6 exactly as they do today.
@y
    You don't have to use it - your existing Compose files will run on Compose
    1.6 exactly as they do today.
@z

@x
    Check the upgrade guide for full details:
    https://docs.docker.com/compose/compose-file#upgrading
@y
    Check the upgrade guide for full details:
    https://docs.docker.com/compose/compose-file#upgrading
@z

@x
-   Support for networking has exited experimental status and is the recommended
    way to enable communication between containers.
@y
-   Support for networking has exited experimental status and is the recommended
    way to enable communication between containers.
@z

@x
    If you use the new file format, your app will use networking. If you aren't
    ready yet, just leave your Compose file as it is and it'll continue to work
    just the same.
@y
    If you use the new file format, your app will use networking. If you aren't
    ready yet, just leave your Compose file as it is and it'll continue to work
    just the same.
@z

@x
    By default, you don't have to configure any networks. In fact, using
    networking with Compose involves even less configuration than using links.
    Consult the networking guide for how to use it:
    https://docs.docker.com/compose/networking
@y
    By default, you don't have to configure any networks. In fact, using
    networking with Compose involves even less configuration than using links.
    Consult the networking guide for how to use it:
    https://docs.docker.com/compose/networking
@z

@x
    The experimental flags `--x-networking` and `--x-network-driver`, introduced
    in Compose 1.5, have been removed.
@y
    The experimental flags `--x-networking` and `--x-network-driver`, introduced
    in Compose 1.5, have been removed.
@z

@x
-   You can now pass arguments to a build if you're using the new file format:
@y
-   You can now pass arguments to a build if you're using the new file format:
@z

@x
        build:
          context: .
          args:
            buildno: 1
@y
        build:
          context: .
          args:
            buildno: 1
@z

@x
-   You can now specify both a `build` and an `image` key if you're using the
    new file format. `docker-compose build` will build the image and tag it with
    the name you've specified, while `docker-compose pull` will attempt to pull
    it.
@y
-   You can now specify both a `build` and an `image` key if you're using the
    new file format. `docker-compose build` will build the image and tag it with
    the name you've specified, while `docker-compose pull` will attempt to pull
    it.
@z

@x
-   There's a new `events` command for monitoring container events from
    the application, much like `docker events`. This is a good primitive for
    building tools on top of Compose for performing actions when particular
    things happen, such as containers starting and stopping.
@y
-   There's a new `events` command for monitoring container events from
    the application, much like `docker events`. This is a good primitive for
    building tools on top of Compose for performing actions when particular
    things happen, such as containers starting and stopping.
@z

@x
-   There's a new `depends_on` option for specifying dependencies between
    services. This enforces the order of startup, and ensures that when you run
    `docker-compose up SERVICE` on a service with dependencies, those are started
    as well.
@y
-   There's a new `depends_on` option for specifying dependencies between
    services. This enforces the order of startup, and ensures that when you run
    `docker-compose up SERVICE` on a service with dependencies, those are started
    as well.
@z

@x
### New Features:
@y
### New Features:
@z

@x
-   Added a new command `config` which validates and prints the Compose
    configuration after interpolating variables, resolving relative paths, and
    merging multiple files and `extends`.
@y
-   Added a new command `config` which validates and prints the Compose
    configuration after interpolating variables, resolving relative paths, and
    merging multiple files and `extends`.
@z

@x
-   Added a new command `create` for creating containers without starting them.
@y
-   Added a new command `create` for creating containers without starting them.
@z

@x
-   Added a new command `down` to stop and remove all the resources created by
    `up` in a single command.
@y
-   Added a new command `down` to stop and remove all the resources created by
    `up` in a single command.
@z

@x
-   Added support for the `cpu_quota` configuration option.
@y
-   Added support for the `cpu_quota` configuration option.
@z

@x
-   Added support for the `stop_signal` configuration option.
@y
-   Added support for the `stop_signal` configuration option.
@z

@x
-   Commands `start`, `restart`, `pause`, and `unpause` now exit with an
    error status code if no containers were modified.
@y
-   Commands `start`, `restart`, `pause`, and `unpause` now exit with an
    error status code if no containers were modified.
@z

@x
-   Added a new `--abort-on-container-exit` flag to `up` which causes `up` to
    stop all container and exit once the first container exits.
@y
-   Added a new `--abort-on-container-exit` flag to `up` which causes `up` to
    stop all container and exit once the first container exits.
@z

@x
-   Removed support for `FIG_FILE`, `FIG_PROJECT_NAME`, and no longer reads
    `fig.yml` as a default Compose file location.
@y
-   Removed support for `FIG_FILE`, `FIG_PROJECT_NAME`, and no longer reads
    `fig.yml` as a default Compose file location.
@z

@x
-   Removed the `migrate-to-labels` command.
@y
-   Removed the `migrate-to-labels` command.
@z

@x
-   Removed the `--allow-insecure-ssl` flag.
@y
-   Removed the `--allow-insecure-ssl` flag.
@z

@x
### Bug Fixes:
@y
### Bug Fixes:
@z

@x
-   Fixed a validation bug that prevented the use of a range of ports in
    the `expose` field.
@y
-   Fixed a validation bug that prevented the use of a range of ports in
    the `expose` field.
@z

@x
-   Fixed a validation bug that prevented the use of arrays in the `entrypoint`
    field if they contained duplicate entries.
@y
-   Fixed a validation bug that prevented the use of arrays in the `entrypoint`
    field if they contained duplicate entries.
@z

@x
-   Fixed a bug that caused `ulimits` to be ignored when used with `extends`.
@y
-   Fixed a bug that caused `ulimits` to be ignored when used with `extends`.
@z

@x
-   Fixed a bug that prevented ipv6 addresses in `extra_hosts`.
@y
-   Fixed a bug that prevented ipv6 addresses in `extra_hosts`.
@z

@x
-   Fixed a bug that caused `extends` to be ignored when included from
    multiple Compose files.
@y
-   Fixed a bug that caused `extends` to be ignored when included from
    multiple Compose files.
@z

@x
-   Fixed an incorrect warning when a container volume was defined in
    the Compose file.
@y
-   Fixed an incorrect warning when a container volume was defined in
    the Compose file.
@z

@x
-   Fixed a bug that prevented the force shutdown behavior of `up` and
    `logs`.
@y
-   Fixed a bug that prevented the force shutdown behavior of `up` and
    `logs`.
@z

@x
-   Fixed a bug that caused `None` to be printed as the network driver name
    when the default network driver was used.
@y
-   Fixed a bug that caused `None` to be printed as the network driver name
    when the default network driver was used.
@z

@x
-   Fixed a bug where using the string form of `dns` or `dns_search` would
    cause an error.
@y
-   Fixed a bug where using the string form of `dns` or `dns_search` would
    cause an error.
@z

@x
-   Fixed a bug where a container would be reported as "Up" when it was
    in the restarting state.
@y
-   Fixed a bug where a container would be reported as "Up" when it was
    in the restarting state.
@z

@x
-   Fixed a confusing error message when DOCKER_CERT_PATH was not set properly.
@y
-   Fixed a confusing error message when DOCKER_CERT_PATH was not set properly.
@z

@x
-   Fixed a bug where attaching to a container would fail if it was using a
    non-standard logging driver (or none at all).
@y
-   Fixed a bug where attaching to a container would fail if it was using a
    non-standard logging driver (or none at all).
@z

@x
## 1.5.2
(2015-12-03)
@y
## 1.5.2
(2015-12-03)
@z

@x
-   Fixed a bug which broke the use of `environment` and `env_file` with
    `extends`, and caused environment keys without values to have a `None`
    value, instead of a value from the host environment.
@y
-   Fixed a bug which broke the use of `environment` and `env_file` with
    `extends`, and caused environment keys without values to have a `None`
    value, instead of a value from the host environment.
@z

@x
-   Fixed a regression in 1.5.1 that caused a warning about volumes to be
    raised incorrectly when containers were recreated.
@y
-   Fixed a regression in 1.5.1 that caused a warning about volumes to be
    raised incorrectly when containers were recreated.
@z

@x
-   Fixed a bug which prevented building a `Dockerfile` that used `ADD <url>`
@y
-   Fixed a bug which prevented building a `Dockerfile` that used `ADD <url>`
@z

@x
-   Fixed a bug with `docker-compose restart` which prevented it from
    starting stopped containers.
@y
-   Fixed a bug with `docker-compose restart` which prevented it from
    starting stopped containers.
@z

@x
-   Fixed handling of SIGTERM and SIGINT to properly stop containers
@y
-   Fixed handling of SIGTERM and SIGINT to properly stop containers
@z

@x
-   Add support for using a url as the value of `build`
@y
-   Add support for using a url as the value of `build`
@z

@x
-   Improved the validation of the `expose` option
@y
-   Improved the validation of the `expose` option
@z

@x
## 1.5.1
(2015-11-12)
@y
## 1.5.1
(2015-11-12)
@z

@x
-   Add the `--force-rm` option to `build`.
@y
-   Add the `--force-rm` option to `build`.
@z

@x
-   Add the `ulimit` option for services in the Compose file.
@y
-   Add the `ulimit` option for services in the Compose file.
@z

@x
-   Fixed a bug where `up` would error with "service needs to be built" if
    a service changed from using `image` to using `build`.
@y
-   Fixed a bug where `up` would error with "service needs to be built" if
    a service changed from using `image` to using `build`.
@z

@x
-   Fixed a bug that would cause incorrect output of parallel operations
    on some terminals.
@y
-   Fixed a bug that would cause incorrect output of parallel operations
    on some terminals.
@z

@x
-   Fixed a bug that prevented a container from being recreated when the
    mode of a `volumes_from` was changed.
@y
-   Fixed a bug that prevented a container from being recreated when the
    mode of a `volumes_from` was changed.
@z

@x
-   Fixed a regression in 1.5.0 where non-utf-8 unicode characters would cause
    `up` or `logs` to crash.
@y
-   Fixed a regression in 1.5.0 where non-utf-8 unicode characters would cause
    `up` or `logs` to crash.
@z

@x
-   Fixed a regression in 1.5.0 where Compose would use a success exit status
    code when a command fails due to an HTTP timeout communicating with the
    docker daemon.
@y
-   Fixed a regression in 1.5.0 where Compose would use a success exit status
    code when a command fails due to an HTTP timeout communicating with the
    docker daemon.
@z

@x
-   Fixed a regression in 1.5.0 where `name` was being accepted as a valid
    service option which would override the actual name of the service.
@y
-   Fixed a regression in 1.5.0 where `name` was being accepted as a valid
    service option which would override the actual name of the service.
@z

@x
-   When using `--x-networking` Compose no longer sets the hostname to the
    container name.
@y
-   When using `--x-networking` Compose no longer sets the hostname to the
    container name.
@z

@x
-   When using `--x-networking` Compose will only create the default network
    if at least one container is using the network.
@y
-   When using `--x-networking` Compose will only create the default network
    if at least one container is using the network.
@z

@x
-   When printings logs during `up` or `logs`, flush the output buffer after
    each line to prevent buffering issues from hiding logs.
@y
-   When printings logs during `up` or `logs`, flush the output buffer after
    each line to prevent buffering issues from hiding logs.
@z

@x
-   Recreate a container if one of its dependencies is being created.
    Previously a container was only recreated if it's dependencies already
    existed, but were being recreated as well.
@y
-   Recreate a container if one of its dependencies is being created.
    Previously a container was only recreated if it's dependencies already
    existed, but were being recreated as well.
@z

@x
-   Add a warning when a `volume` in the Compose file is being ignored
    and masked by a container volume from a previous container.
@y
-   Add a warning when a `volume` in the Compose file is being ignored
    and masked by a container volume from a previous container.
@z

@x
-   Improve the output of `pull` when run without a tty.
@y
-   Improve the output of `pull` when run without a tty.
@z

@x
-   When using multiple Compose files, validate each before attempting to merge
    them together. Previously invalid files would result in not helpful errors.
@y
-   When using multiple Compose files, validate each before attempting to merge
    them together. Previously invalid files would result in not helpful errors.
@z

@x
-   Allow dashes in keys in the `environment` service option.
@y
-   Allow dashes in keys in the `environment` service option.
@z

@x
-   Improve validation error messages by including the filename as part of the
    error message.
@y
-   Improve validation error messages by including the filename as part of the
    error message.
@z

@x
## 1.5.0
(2015-11-03)
@y
## 1.5.0
(2015-11-03)
@z

@x
### Breaking changes
@y
### Breaking changes
@z

@x
With the introduction of variable substitution support in the Compose file, any
Compose file that uses an environment variable (`$VAR` or `${VAR}`) in the `command:`
or `entrypoint:` field will break.
@y
With the introduction of variable substitution support in the Compose file, any
Compose file that uses an environment variable (`$VAR` or `${VAR}`) in the `command:`
or `entrypoint:` field will break.
@z

@x
Previously these values were interpolated inside the container, with a value
from the container environment.  In Compose 1.5.0, the values will be
interpolated on the host, with a value from the host environment.
@y
Previously these values were interpolated inside the container, with a value
from the container environment.  In Compose 1.5.0, the values will be
interpolated on the host, with a value from the host environment.
@z

@x
To migrate a Compose file to 1.5.0, escape the variables with an extra `$`
(ex: `$$VAR` or `$${VAR}`).  See
https://github.com/docker/compose/blob/8cc8e61/docs/compose-file.md#variable-substitution
@y
To migrate a Compose file to 1.5.0, escape the variables with an extra `$`
(ex: `$$VAR` or `$${VAR}`).  See
https://github.com/docker/compose/blob/8cc8e61/docs/compose-file.md#variable-substitution
@z

@x
### Major features
@y
### Major features
@z

@x
-   Compose is now available for Windows.
@y
-   Compose is now available for Windows.
@z

@x
-   Environment variables can be used in the Compose file. See
    https://github.com/docker/compose/blob/8cc8e61/docs/compose-file.md#variable-substitution
@y
-   Environment variables can be used in the Compose file. See
    https://github.com/docker/compose/blob/8cc8e61/docs/compose-file.md#variable-substitution
@z

@x
-   Multiple compose files can be specified, allowing you to override
    settings in the default Compose file. See
    https://github.com/docker/compose/blob/8cc8e61/docs/reference/docker-compose.md
    for more details.
@y
-   Multiple compose files can be specified, allowing you to override
    settings in the default Compose file. See
    https://github.com/docker/compose/blob/8cc8e61/docs/reference/docker-compose.md
    for more details.
@z

@x
-   Compose now produces better error messages when a file contains
    invalid configuration.
@y
-   Compose now produces better error messages when a file contains
    invalid configuration.
@z

@x
-   `up` now waits for all services to exit before shutting down,
    rather than shutting down as soon as one container exits.
@y
-   `up` now waits for all services to exit before shutting down,
    rather than shutting down as soon as one container exits.
@z

@x
-   Experimental support for the new docker networking system can be
    enabled with the `--x-networking` flag. Read more here:
    https://github.com/docker/docker/blob/8fee1c20/docs/userguide/dockernetworks.md
@y
-   Experimental support for the new docker networking system can be
    enabled with the `--x-networking` flag. Read more here:
    https://github.com/docker/docker/blob/8fee1c20/docs/userguide/dockernetworks.md
@z

@x
### New features
@y
### New features
@z

@x
-   You can now optionally pass a mode to `volumes_from`. For example,
    `volumes_from: ["servicename:ro"]`.
@y
-   You can now optionally pass a mode to `volumes_from`. For example,
    `volumes_from: ["servicename:ro"]`.
@z

@x
-   Since Docker now lets you create volumes with names, you can refer to those
    volumes by name in `docker-compose.yml`. For example,
    `volumes: ["mydatavolume:/data"]` will mount the volume named
    `mydatavolume` at the path `/data` inside the container.
@y
-   Since Docker now lets you create volumes with names, you can refer to those
    volumes by name in `docker-compose.yml`. For example,
    `volumes: ["mydatavolume:/data"]` will mount the volume named
    `mydatavolume` at the path `/data` inside the container.
@z

@x
    If the first component of an entry in `volumes` starts with a `.`, `/` or `~`,
    it is treated as a path and expansion of relative paths is performed as
    necessary. Otherwise, it is treated as a volume name and passed straight
    through to Docker.
@y
    If the first component of an entry in `volumes` starts with a `.`, `/` or `~`,
    it is treated as a path and expansion of relative paths is performed as
    necessary. Otherwise, it is treated as a volume name and passed straight
    through to Docker.
@z

@x
    Read more on named volumes and volume drivers here:
    https://github.com/docker/docker/blob/244d9c33/docs/userguide/dockervolumes.md
@y
    Read more on named volumes and volume drivers here:
    https://github.com/docker/docker/blob/244d9c33/docs/userguide/dockervolumes.md
@z

@x
-   `docker-compose build --pull` instructs Compose to pull the base image for
    each Dockerfile before building.
@y
-   `docker-compose build --pull` instructs Compose to pull the base image for
    each Dockerfile before building.
@z

@x
-   `docker-compose pull --ignore-pull-failures` instructs Compose to continue
    if it fails to pull a single service's image, rather than aborting.
@y
-   `docker-compose pull --ignore-pull-failures` instructs Compose to continue
    if it fails to pull a single service's image, rather than aborting.
@z

@x
-   You can now specify an IPC namespace in `docker-compose.yml` with the `ipc`
    option.
@y
-   You can now specify an IPC namespace in `docker-compose.yml` with the `ipc`
    option.
@z

@x
-   Containers created by `docker-compose run` can now be named with the
    `--name` flag.
@y
-   Containers created by `docker-compose run` can now be named with the
    `--name` flag.
@z

@x
-   If you install Compose with pip or use it as a library, it now works with
    Python 3.
@y
-   If you install Compose with pip or use it as a library, it now works with
    Python 3.
@z

@x
-   `image` now supports image digests (in addition to ids and tags). For example,
    `image: "busybox@sha256:38a203e1986cf79639cfb9b2e1d6e773de84002feea2d4eb006b52004ee8502d"`
@y
-   `image` now supports image digests (in addition to ids and tags). For example,
    `image: "busybox@sha256:38a203e1986cf79639cfb9b2e1d6e773de84002feea2d4eb006b52004ee8502d"`
@z

@x
-   `ports` now supports ranges of ports. For example,
@y
-   `ports` now supports ranges of ports. For example,
@z

@x
        ports:
          - "3000-3005"
          - "9000-9001:8000-8001"
@y
        ports:
          - "3000-3005"
          - "9000-9001:8000-8001"
@z

@x
-   `docker-compose run` now supports a `-p|--publish` parameter, much like
    `docker run -p`, for publishing specific ports to the host.
@y
-   `docker-compose run` now supports a `-p|--publish` parameter, much like
    `docker run -p`, for publishing specific ports to the host.
@z

@x
-   `docker-compose pause` and `docker-compose unpause` have been implemented,
    analogous to `docker pause` and `docker unpause`.
@y
-   `docker-compose pause` and `docker-compose unpause` have been implemented,
    analogous to `docker pause` and `docker unpause`.
@z

@x
-   When using `extends` to copy configuration from another service in the same
    Compose file, you can omit the `file` option.
@y
-   When using `extends` to copy configuration from another service in the same
    Compose file, you can omit the `file` option.
@z

@x
-   Compose can be installed and run as a Docker image. This is an experimental
    feature.
@y
-   Compose can be installed and run as a Docker image. This is an experimental
    feature.
@z

@x
### Bug fixes
@y
### Bug fixes
@z

@x
-   All values for the `log_driver` option which are supported by the Docker
    daemon are now supported by Compose.
@y
-   All values for the `log_driver` option which are supported by the Docker
    daemon are now supported by Compose.
@z

@x
-   `docker-compose build` can now be run successfully against a Swarm cluster.
@y
-   `docker-compose build` can now be run successfully against a Swarm cluster.
@z

@x
## 1.4.2
(2015-09-22)
@y
## 1.4.2
(2015-09-22)
@z

@x
-  Fixed a regression in the 1.4.1 release that would cause `docker-compose up`
   without the `-d` option to exit immediately.
@y
-  Fixed a regression in the 1.4.1 release that would cause `docker-compose up`
   without the `-d` option to exit immediately.
@z

@x
## 1.4.1
(2015-09-10)
@y
## 1.4.1
(2015-09-10)
@z

@x
### Bug fixes
@y
### Bug fixes
@z

@x
-   Some configuration changes (notably changes to `links`, `volumes_from`, and
    `net`) were not properly triggering a container recreate as part of
    `docker-compose up`.
-   `docker-compose up <service>` was showing logs for all services instead of
    just the specified services.
-   Containers with custom container names were showing up in logs as
    `service_number` instead of their custom container name.
-   When scaling a service sometimes containers would be recreated even when
    the configuration had not changed.
@y
-   Some configuration changes (notably changes to `links`, `volumes_from`, and
    `net`) were not properly triggering a container recreate as part of
    `docker-compose up`.
-   `docker-compose up <service>` was showing logs for all services instead of
    just the specified services.
-   Containers with custom container names were showing up in logs as
    `service_number` instead of their custom container name.
-   When scaling a service sometimes containers would be recreated even when
    the configuration had not changed.
@z

@x
## 1.4.0
(2015-08-04)
@y
## 1.4.0
(2015-08-04)
@z

@x
-   By default, `docker-compose up` now only recreates containers for services whose configuration has changed since they were created. This should result in a dramatic speed-up for many applications.
@y
-   By default, `docker-compose up` now only recreates containers for services whose configuration has changed since they were created. This should result in a dramatic speed-up for many applications.
@z

@x
    The experimental `--x-smart-recreate` flag which introduced this feature in Compose 1.3.0 has been removed, and a `--force-recreate` flag has been added for when you want to recreate everything.
@y
    The experimental `--x-smart-recreate` flag which introduced this feature in Compose 1.3.0 has been removed, and a `--force-recreate` flag has been added for when you want to recreate everything.
@z

@x
-   Several of Compose's commands - `scale`, `stop`, `kill` and `rm` - now perform actions on multiple containers in parallel, rather than in sequence, which will run much faster on larger applications.
@y
-   Several of Compose's commands - `scale`, `stop`, `kill` and `rm` - now perform actions on multiple containers in parallel, rather than in sequence, which will run much faster on larger applications.
@z

@x
-   You can now specify a custom name for a service's container with `container_name`. Because Docker container names must be unique, this means you can't scale the service beyond one container.
@y
-   You can now specify a custom name for a service's container with `container_name`. Because Docker container names must be unique, this means you can't scale the service beyond one container.
@z

@x
-   You no longer have to specify a `file` option when using `extends` - it will default to the current file.
@y
-   You no longer have to specify a `file` option when using `extends` - it will default to the current file.
@z

@x
-   Service names can now contain dots, dashes and underscores.
@y
-   Service names can now contain dots, dashes and underscores.
@z

@x
-   Compose can now read YAML configuration from standard input, rather than from a file, by specifying `-` as the filename. This makes it easier to generate configuration dynamically:
@y
-   Compose can now read YAML configuration from standard input, rather than from a file, by specifying `-` as the filename. This makes it easier to generate configuration dynamically:
@z

@x
        $ echo 'redis: {"image": "redis"}' | docker-compose --file - up
@y
        $ echo 'redis: {"image": "redis"}' | docker-compose --file - up
@z

@x
-   There's a new `docker-compose version` command which prints extended information about Compose's bundled dependencies.
@y
-   There's a new `docker-compose version` command which prints extended information about Compose's bundled dependencies.
@z

@x
-   `docker-compose.yml` now supports `log_opt` as well as `log_driver`, allowing you to pass extra configuration to a service's logging driver.
@y
-   `docker-compose.yml` now supports `log_opt` as well as `log_driver`, allowing you to pass extra configuration to a service's logging driver.
@z

@x
-   `docker-compose.yml` now supports `memswap_limit`, similar to `docker run --memory-swap`.
@y
-   `docker-compose.yml` now supports `memswap_limit`, similar to `docker run --memory-swap`.
@z

@x
-   When mounting volumes with the `volumes` option, you can now pass in any mode supported by the daemon, not just `:ro` or `:rw`. For example, SELinux users can pass `:z` or `:Z`.
@y
-   When mounting volumes with the `volumes` option, you can now pass in any mode supported by the daemon, not just `:ro` or `:rw`. For example, SELinux users can pass `:z` or `:Z`.
@z

@x
-   You can now specify a custom volume driver with the `volume_driver` option in `docker-compose.yml`, much like `docker run --volume-driver`.
@y
-   You can now specify a custom volume driver with the `volume_driver` option in `docker-compose.yml`, much like `docker run --volume-driver`.
@z

@x
-   A bug has been fixed where Compose would fail to pull images from private registries serving plain (unsecured) HTTP. The `--allow-insecure-ssl` flag, which was previously used to work around this issue, has been deprecated and now has no effect.
@y
-   A bug has been fixed where Compose would fail to pull images from private registries serving plain (unsecured) HTTP. The `--allow-insecure-ssl` flag, which was previously used to work around this issue, has been deprecated and now has no effect.
@z

@x
-   A bug has been fixed where `docker-compose build` would fail if the build depended on a private Hub image or an image from a private registry.
@y
-   A bug has been fixed where `docker-compose build` would fail if the build depended on a private Hub image or an image from a private registry.
@z

@x
-   A bug has been fixed where Compose would crash if there were containers which the Docker daemon had not finished removing.
@y
-   A bug has been fixed where Compose would crash if there were containers which the Docker daemon had not finished removing.
@z

@x
-   Two bugs have been fixed where Compose would sometimes fail with a "Duplicate bind mount" error, or fail to attach volumes to a container, if there was a volume path specified in `docker-compose.yml` with a trailing slash.
@y
-   Two bugs have been fixed where Compose would sometimes fail with a "Duplicate bind mount" error, or fail to attach volumes to a container, if there was a volume path specified in `docker-compose.yml` with a trailing slash.
@z

@x
Thanks @mnowster, @dnephin, @ekristen, @funkyfuture, @jeffk and @lukemarsden!
@y
Thanks @mnowster, @dnephin, @ekristen, @funkyfuture, @jeffk and @lukemarsden!
@z

@x
## 1.3.3
(2015-07-15)
@y
## 1.3.3
(2015-07-15)
@z

@x
### Regression fixes
@y
### Regression fixes
@z

@x
- When stopping containers gracefully, Compose was setting the timeout to 0, effectively forcing a SIGKILL every time.
- Compose would sometimes crash depending on the formatting of container data returned from the Docker API.
@y
- When stopping containers gracefully, Compose was setting the timeout to 0, effectively forcing a SIGKILL every time.
- Compose would sometimes crash depending on the formatting of container data returned from the Docker API.
@z

@x
## 1.3.2
(2015-07-14)
@y
## 1.3.2
(2015-07-14)
@z

@x
### Bug fixes
@y
### Bug fixes
@z

@x
- When there were one-off containers created by running `docker-compose run` on an older version of Compose, `docker-compose run` would fail with a name collision. Compose now shows an error if you have leftover containers of this type lying around, and tells you how to remove them.
- Compose was not reading Docker authentication config files created in the new location, `~/docker/config.json`, and authentication against private registries would therefore fail.
- When a container had a pseudo-TTY attached, its output in `docker-compose up` would be truncated.
- `docker-compose up --x-smart-recreate` would sometimes fail when an image tag was updated.
- `docker-compose up` would sometimes create two containers with the same numeric suffix.
- `docker-compose rm` and `docker-compose ps` would sometimes list services that aren't part of the current project (though no containers were erroneously removed).
- Some `docker-compose` commands would not show an error if invalid service names were passed in.
@y
- When there were one-off containers created by running `docker-compose run` on an older version of Compose, `docker-compose run` would fail with a name collision. Compose now shows an error if you have leftover containers of this type lying around, and tells you how to remove them.
- Compose was not reading Docker authentication config files created in the new location, `~/docker/config.json`, and authentication against private registries would therefore fail.
- When a container had a pseudo-TTY attached, its output in `docker-compose up` would be truncated.
- `docker-compose up --x-smart-recreate` would sometimes fail when an image tag was updated.
- `docker-compose up` would sometimes create two containers with the same numeric suffix.
- `docker-compose rm` and `docker-compose ps` would sometimes list services that aren't part of the current project (though no containers were erroneously removed).
- Some `docker-compose` commands would not show an error if invalid service names were passed in.
@z

@x
Thanks @dano, @josephpage, @kevinsimper, @lieryan, @phemmer, @soulrebel and @sschepens!
@y
Thanks @dano, @josephpage, @kevinsimper, @lieryan, @phemmer, @soulrebel and @sschepens!
@z

@x
## 1.3.1
(2015-06-21)
@y
## 1.3.1
(2015-06-21)
@z

@x
### Bug fixes
@y
### Bug fixes
@z

@x
- `docker-compose build` would always attempt to pull the base image before building.
- `docker-compose help migrate-to-labels` failed with an error.
- If no network mode was specified, Compose would set it to "bridge", rather than allowing the Docker daemon to use its configured default network mode.
@y
- `docker-compose build` would always attempt to pull the base image before building.
- `docker-compose help migrate-to-labels` failed with an error.
- If no network mode was specified, Compose would set it to "bridge", rather than allowing the Docker daemon to use its configured default network mode.
@z

@x
## 1.3.0
(2015-06-18)
@y
## 1.3.0
(2015-06-18)
@z

@x
### Important notes
@y
### Important notes
@z

@x
- **This release contains breaking changes, and you will need to either remove or migrate your existing containers before running your app** - see the [upgrading section of the install docs](https://github.com/docker/compose/blob/1.3.0rc1/docs/install.md#upgrading) for details.
@y
- **This release contains breaking changes, and you will need to either remove or migrate your existing containers before running your app** - see the [upgrading section of the install docs](https://github.com/docker/compose/blob/1.3.0rc1/docs/install.md#upgrading) for details.
@z

@x
- Compose now requires Docker 1.6.0 or later.
@y
- Compose now requires Docker 1.6.0 or later.
@z

@x
### Improvements
@y
### Improvements
@z

@x
- Compose now uses container labels, rather than names, to keep track of containers. This makes Compose both faster and easier to integrate with your own tools.
@y
- Compose now uses container labels, rather than names, to keep track of containers. This makes Compose both faster and easier to integrate with your own tools.
@z

@x
- Compose no longer uses "intermediate containers" when recreating containers for a service. This makes `docker-compose up` less complex and more resilient to failure.
@y
- Compose no longer uses "intermediate containers" when recreating containers for a service. This makes `docker-compose up` less complex and more resilient to failure.
@z

@x
### New features
@y
### New features
@z

@x
- `docker-compose up` has an **experimental** new behavior: it will only recreate containers for services whose configuration has changed in `docker-compose.yml`. This will eventually become the default, but for now you can take it for a spin:
@y
- `docker-compose up` has an **experimental** new behavior: it will only recreate containers for services whose configuration has changed in `docker-compose.yml`. This will eventually become the default, but for now you can take it for a spin:
@z

@x
        $ docker-compose up --x-smart-recreate
@y
        $ docker-compose up --x-smart-recreate
@z

@x
- When invoked in a subdirectory of a project, `docker-compose` will now climb up through parent directories until it finds a `docker-compose.yml`.
@y
- When invoked in a subdirectory of a project, `docker-compose` will now climb up through parent directories until it finds a `docker-compose.yml`.
@z

@x
Several new configuration keys have been added to `docker-compose.yml`:
@y
Several new configuration keys have been added to `docker-compose.yml`:
@z

@x
- `dockerfile`, like `docker build --file`, lets you specify an alternate Dockerfile to use with `build`.
- `labels`, like `docker run --labels`, lets you add custom metadata to containers.
- `extra_hosts`, like `docker run --add-host`, lets you add entries to a container's `/etc/hosts` file.
- `pid: host`, like `docker run --pid=host`, lets you reuse the same PID namespace as the host machine.
- `cpuset`, like `docker run --cpuset-cpus`, lets you specify which CPUs to allow execution in.
- `read_only`, like `docker run --read-only`, lets you mount a container's filesystem as read-only.
- `security_opt`, like `docker run --security-opt`, lets you specify [security options](/engine/reference/run/#security-configuration).
- `log_driver`, like `docker run --log-driver`, lets you specify a [log driver](/engine/reference/run/#logging-drivers-log-driver).
@y
- `dockerfile`, like `docker build --file`, lets you specify an alternate Dockerfile to use with `build`.
- `labels`, like `docker run --labels`, lets you add custom metadata to containers.
- `extra_hosts`, like `docker run --add-host`, lets you add entries to a container's `/etc/hosts` file.
- `pid: host`, like `docker run --pid=host`, lets you reuse the same PID namespace as the host machine.
- `cpuset`, like `docker run --cpuset-cpus`, lets you specify which CPUs to allow execution in.
- `read_only`, like `docker run --read-only`, lets you mount a container's filesystem as read-only.
- `security_opt`, like `docker run --security-opt`, lets you specify [security options](/engine/reference/run/#security-configuration).
- `log_driver`, like `docker run --log-driver`, lets you specify a [log driver](/engine/reference/run/#logging-drivers-log-driver).
@z

@x
### Bug Fixes
@y
### Bug Fixes
@z

@x
- The output of `docker-compose run` was sometimes truncated, especially when running under Jenkins.
- A service's volumes would sometimes not update after volume configuration was changed in `docker-compose.yml`.
- Authenticating against third-party registries would sometimes fail.
- `docker-compose run --rm` would fail to remove the container if the service had a `restart` policy in place.
- `docker-compose scale` would refuse to scale a service beyond 1 container if it exposed a specific port number on the host.
- Compose would refuse to create multiple volume entries with the same host path.
@y
- The output of `docker-compose run` was sometimes truncated, especially when running under Jenkins.
- A service's volumes would sometimes not update after volume configuration was changed in `docker-compose.yml`.
- Authenticating against third-party registries would sometimes fail.
- `docker-compose run --rm` would fail to remove the container if the service had a `restart` policy in place.
- `docker-compose scale` would refuse to scale a service beyond 1 container if it exposed a specific port number on the host.
- Compose would refuse to create multiple volume entries with the same host path.
@z

@x
Thanks @ahromis, @albers, @aleksandr-vin, @antoineco, @ccverak, @chernjie, @dnephin, @edmorley, @fordhurley, @josephpage, @KyleJamesWalker, @lsowen, @mchasal, @noironetworks, @sdake, @sdurrheimer, @sherter, @stephenlawrence, @thaJeztah, @thieman, @turtlemonvh, @twhiteman, @vdemeester, @xuxinkun and @zwily!
@y
Thanks @ahromis, @albers, @aleksandr-vin, @antoineco, @ccverak, @chernjie, @dnephin, @edmorley, @fordhurley, @josephpage, @KyleJamesWalker, @lsowen, @mchasal, @noironetworks, @sdake, @sdurrheimer, @sherter, @stephenlawrence, @thaJeztah, @thieman, @turtlemonvh, @twhiteman, @vdemeester, @xuxinkun and @zwily!
@z

@x
## 1.2.0
(2015-04-16)
@y
## 1.2.0
(2015-04-16)
@z

@x
- `docker-compose.yml` now supports an `extends` option, which enables a service to inherit configuration from another service in another configuration file. This is really good for sharing common configuration between apps, or for configuring the same app for different environments. Here's the [documentation](https://github.com/docker/compose/blob/master/docs/yml.md#extends).
@y
- `docker-compose.yml` now supports an `extends` option, which enables a service to inherit configuration from another service in another configuration file. This is really good for sharing common configuration between apps, or for configuring the same app for different environments. Here's the [documentation](https://github.com/docker/compose/blob/master/docs/yml.md#extends).
@z

@x
- When using Compose with a Swarm cluster, containers that depend on one another will be co-scheduled on the same node. This means that most Compose apps will now work out of the box, as long as they don't use `build`.
@y
- When using Compose with a Swarm cluster, containers that depend on one another will be co-scheduled on the same node. This means that most Compose apps will now work out of the box, as long as they don't use `build`.
@z

@x
- Repeated invocations of `docker-compose up` when using Compose with a Swarm cluster now work reliably.
@y
- Repeated invocations of `docker-compose up` when using Compose with a Swarm cluster now work reliably.
@z

@x
- Directories passed to `build`, filenames passed to `env_file` and volume host paths passed to `volumes` are now treated as relative to the *directory of the configuration file*, not the directory that `docker-compose` is being run in. In the majority of cases, those are the same, but if you use the `-f|--file` argument to specify a configuration file in another directory, **this is a breaking change**.
@y
- Directories passed to `build`, filenames passed to `env_file` and volume host paths passed to `volumes` are now treated as relative to the *directory of the configuration file*, not the directory that `docker-compose` is being run in. In the majority of cases, those are the same, but if you use the `-f|--file` argument to specify a configuration file in another directory, **this is a breaking change**.
@z

@x
- A service can now share another service's network namespace with `net: container:<service>`.
@y
- A service can now share another service's network namespace with `net: container:<service>`.
@z

@x
- `volumes_from` and `net: container:<service>` entries are taken into account when resolving dependencies, so `docker-compose up <service>` will correctly start all dependencies of `<service>`.
@y
- `volumes_from` and `net: container:<service>` entries are taken into account when resolving dependencies, so `docker-compose up <service>` will correctly start all dependencies of `<service>`.
@z

@x
- `docker-compose run` now accepts a `--user` argument to specify a user to run the command as, just like `docker run`.
@y
- `docker-compose run` now accepts a `--user` argument to specify a user to run the command as, just like `docker run`.
@z

@x
- The `up`, `stop` and `restart` commands now accept a `--timeout` (or `-t`) argument to specify how long to wait when attempting to gracefully stop containers, just like `docker stop`.
@y
- The `up`, `stop` and `restart` commands now accept a `--timeout` (or `-t`) argument to specify how long to wait when attempting to gracefully stop containers, just like `docker stop`.
@z

@x
- `docker-compose rm` now accepts `-f` as a shorthand for `--force`, just like `docker rm`.
@y
- `docker-compose rm` now accepts `-f` as a shorthand for `--force`, just like `docker rm`.
@z

@x
Thanks, @abesto, @albers, @alunduil, @dnephin, @funkyfuture, @gilclark, @IanVS, @KingsleyKelly, @knutwalker, @thaJeztah and @vmalloc!
@y
Thanks, @abesto, @albers, @alunduil, @dnephin, @funkyfuture, @gilclark, @IanVS, @KingsleyKelly, @knutwalker, @thaJeztah and @vmalloc!
@z

@x
## 1.1.0
(2015-02-25)
@y
## 1.1.0
(2015-02-25)
@z

@x
Fig has been renamed to Docker Compose, or just Compose for short. This has several implications for you:
@y
Fig has been renamed to Docker Compose, or just Compose for short. This has several implications for you:
@z

@x
- The command you type is now `docker-compose`, not `fig`.
- You should rename your fig.yml to docker-compose.yml.
- If you’re installing via PyPI, the package is now `docker-compose`, so install it with `pip install docker-compose`.
@y
- The command you type is now `docker-compose`, not `fig`.
- You should rename your fig.yml to docker-compose.yml.
- If you’re installing via PyPI, the package is now `docker-compose`, so install it with `pip install docker-compose`.
@z

@x
Besides that, there’s a lot of new stuff in this release:
@y
Besides that, there’s a lot of new stuff in this release:
@z

@x
- We’ve made a few small changes to ensure that Compose will work with Swarm, Docker’s new clustering tool (https://github.com/docker/swarm). Eventually you'll be able to point Compose at a Swarm cluster instead of a standalone Docker host and it’ll run your containers on the cluster with no extra work from you. As Swarm is still developing, integration is rough and lots of Compose features don't work yet.
@y
- We’ve made a few small changes to ensure that Compose will work with Swarm, Docker’s new clustering tool (https://github.com/docker/swarm). Eventually you'll be able to point Compose at a Swarm cluster instead of a standalone Docker host and it’ll run your containers on the cluster with no extra work from you. As Swarm is still developing, integration is rough and lots of Compose features don't work yet.
@z

@x
- `docker-compose run` now has a `--service-ports` flag for exposing ports on the given service. This is useful for running your webapp with an interactive debugger, for example.
@y
- `docker-compose run` now has a `--service-ports` flag for exposing ports on the given service. This is useful for running your webapp with an interactive debugger, for example.
@z

@x
- You can now link to containers outside your app with the `external_links` option in docker-compose.yml.
@y
- You can now link to containers outside your app with the `external_links` option in docker-compose.yml.
@z

@x
- You can now prevent `docker-compose up` from automatically building images with the `--no-build` option. This will make fewer API calls and run faster.
@y
- You can now prevent `docker-compose up` from automatically building images with the `--no-build` option. This will make fewer API calls and run faster.
@z

@x
- If you don’t specify a tag when using the `image` key, Compose will default to the `latest` tag, rather than pulling all tags.
@y
- If you don’t specify a tag when using the `image` key, Compose will default to the `latest` tag, rather than pulling all tags.
@z

@x
- `docker-compose kill` now supports the `-s` flag, allowing you to specify the exact signal you want to send to a service’s containers.
@y
- `docker-compose kill` now supports the `-s` flag, allowing you to specify the exact signal you want to send to a service’s containers.
@z

@x
- docker-compose.yml now has an `env_file` key, analogous to `docker run --env-file`, letting you specify multiple environment variables in a separate file. This is great if you have a lot of them, or if you want to keep sensitive information out of version control.
@y
- docker-compose.yml now has an `env_file` key, analogous to `docker run --env-file`, letting you specify multiple environment variables in a separate file. This is great if you have a lot of them, or if you want to keep sensitive information out of version control.
@z

@x
- docker-compose.yml now supports the `dns_search`, `cap_add`, `cap_drop`, `cpu_shares` and `restart` options, analogous to `docker run`’s `--dns-search`, `--cap-add`, `--cap-drop`, `--cpu-shares` and `--restart` options.
@y
- docker-compose.yml now supports the `dns_search`, `cap_add`, `cap_drop`, `cpu_shares` and `restart` options, analogous to `docker run`’s `--dns-search`, `--cap-add`, `--cap-drop`, `--cpu-shares` and `--restart` options.
@z

@x
- Compose now ships with Bash tab completion - see the installation and usage docs at https://github.com/docker/compose/blob/1.1.0/docs/completion.md
@y
- Compose now ships with Bash tab completion - see the installation and usage docs at https://github.com/docker/compose/blob/1.1.0/docs/completion.md
@z

@x
- A number of bugs have been fixed - see the milestone for details: https://github.com/docker/compose/issues?q=milestone%3A1.1.0+
@y
- A number of bugs have been fixed - see the milestone for details: https://github.com/docker/compose/issues?q=milestone%3A1.1.0+
@z

@x
Thanks @dnephin, @squebe, @jbalonso, @raulcd, @benlangfield, @albers, @ggtools, @bersace, @dtenenba, @petercv, @drewkett, @TFenby, @paulRbr, @Aigeruth and @salehe!
@y
Thanks @dnephin, @squebe, @jbalonso, @raulcd, @benlangfield, @albers, @ggtools, @bersace, @dtenenba, @petercv, @drewkett, @TFenby, @paulRbr, @Aigeruth and @salehe!
@z

@x
## 1.0.1
(2014-11-04)
@y
## 1.0.1
(2014-11-04)
@z

@x
 - Added an `--allow-insecure-ssl` option to allow `fig up`, `fig run` and `fig pull` to pull from insecure registries.
 - Fixed `fig run` not showing output in Jenkins.
 - Fixed a bug where Fig couldn't build Dockerfiles with ADD statements pointing at URLs.
@y
 - Added an `--allow-insecure-ssl` option to allow `fig up`, `fig run` and `fig pull` to pull from insecure registries.
 - Fixed `fig run` not showing output in Jenkins.
 - Fixed a bug where Fig couldn't build Dockerfiles with ADD statements pointing at URLs.
@z

@x
## 1.0.0
(2014-10-16)
@y
## 1.0.0
(2014-10-16)
@z

@x
The highlights:
@y
The highlights:
@z

@x
 - [Fig has joined Docker.](https://www.orchardup.com/blog/orchard-is-joining-docker) Fig will continue to be maintained, but we'll also be incorporating the best bits of Fig into Docker itself.
@y
 - [Fig has joined Docker.](https://www.orchardup.com/blog/orchard-is-joining-docker) Fig will continue to be maintained, but we'll also be incorporating the best bits of Fig into Docker itself.
@z

@x
   This means the GitHub repository has moved to [https://github.com/docker/fig](https://github.com/docker/fig) and our IRC channel is now #docker-fig on Freenode.
@y
   This means the GitHub repository has moved to [https://github.com/docker/fig](https://github.com/docker/fig) and our IRC channel is now #docker-fig on Freenode.
@z

@x
 - Fig can be used with the [official Docker OS X installer](../docker-for-mac/install.md). Boot2Docker will mount the home directory from your host machine so volumes work as expected.
@y
 - Fig can be used with the [official Docker OS X installer](../docker-for-mac/install.md). Boot2Docker will mount the home directory from your host machine so volumes work as expected.
@z

@x
 - Fig supports Docker 1.3.
@y
 - Fig supports Docker 1.3.
@z

@x
 - It is now possible to connect to the Docker daemon using TLS by using the `DOCKER_CERT_PATH` and `DOCKER_TLS_VERIFY` environment variables.
@y
 - It is now possible to connect to the Docker daemon using TLS by using the `DOCKER_CERT_PATH` and `DOCKER_TLS_VERIFY` environment variables.
@z

@x
 - There is a new `fig port` command which outputs the host port binding of a service, in a similar way to `docker port`.
@y
 - There is a new `fig port` command which outputs the host port binding of a service, in a similar way to `docker port`.
@z

@x
 - There is a new `fig pull` command which pulls the latest images for a service.
@y
 - There is a new `fig pull` command which pulls the latest images for a service.
@z

@x
 - There is a new `fig restart` command which restarts a service's containers.
@y
 - There is a new `fig restart` command which restarts a service's containers.
@z

@x
 - Fig creates multiple containers in service by appending a number to the service name. For example,  `db_1`, `db_2`. As a convenience, Fig will now give the first container an alias of the service name. For example, `db`.
@y
 - Fig creates multiple containers in service by appending a number to the service name. For example,  `db_1`, `db_2`. As a convenience, Fig will now give the first container an alias of the service name. For example, `db`.
@z

@x
   This link alias is also a valid hostname and added to `/etc/hosts` so you can connect to linked services using their hostname. For example, instead of resolving the environment variables `DB_PORT_5432_TCP_ADDR` and `DB_PORT_5432_TCP_PORT`, you could just use the hostname `db` and port `5432` directly.
@y
   This link alias is also a valid hostname and added to `/etc/hosts` so you can connect to linked services using their hostname. For example, instead of resolving the environment variables `DB_PORT_5432_TCP_ADDR` and `DB_PORT_5432_TCP_PORT`, you could just use the hostname `db` and port `5432` directly.
@z

@x
 - Volume definitions now support `ro` mode, expanding `~` and expanding environment variables.
@y
 - Volume definitions now support `ro` mode, expanding `~` and expanding environment variables.
@z

@x
 - `.dockerignore` is supported when building.
@y
 - `.dockerignore` is supported when building.
@z

@x
 - The project name can be set with the `FIG_PROJECT_NAME` environment variable.
@y
 - The project name can be set with the `FIG_PROJECT_NAME` environment variable.
@z

@x
 - The `--env` and `--entrypoint` options have been added to `fig run`.
@y
 - The `--env` and `--entrypoint` options have been added to `fig run`.
@z

@x
 - The Fig binary for Linux is now linked against an older version of glibc so it works on CentOS 6 and Debian Wheezy.
@y
 - The Fig binary for Linux is now linked against an older version of glibc so it works on CentOS 6 and Debian Wheezy.
@z

@x
Other things:
@y
Other things:
@z

@x
 - `fig ps` now works on Jenkins and makes fewer API calls to the Docker daemon.
 - `--verbose` displays more useful debugging output.
 - When starting a service where `volumes_from` points to a service without any containers running, that service will now be started.
 - Lots of docs improvements. Notably, environment variables are documented and official repositories are used throughout.
@y
 - `fig ps` now works on Jenkins and makes fewer API calls to the Docker daemon.
 - `--verbose` displays more useful debugging output.
 - When starting a service where `volumes_from` points to a service without any containers running, that service will now be started.
 - Lots of docs improvements. Notably, environment variables are documented and official repositories are used throughout.
@z

@x
Thanks @dnephin, @d11wtq, @marksteve, @rubbish, @jbalonso, @timfreund, @alunduil, @mieciu, @shuron, @moss, @suzaku and @chmouel! Whew.
@y
Thanks @dnephin, @d11wtq, @marksteve, @rubbish, @jbalonso, @timfreund, @alunduil, @mieciu, @shuron, @moss, @suzaku and @chmouel! Whew.
@z

@x
## 0.5.2
(2014-07-28)
@y
## 0.5.2
(2014-07-28)
@z

@x
 - Added a `--no-cache` option to `fig build`, which bypasses the cache just like `docker build --no-cache`.
 - Fixed the `dns:` fig.yml option, which was causing fig to error out.
 - Fixed a bug where fig couldn't start under Python 2.6.
 - Fixed a log-streaming bug that occasionally caused fig to exit.
@y
 - Added a `--no-cache` option to `fig build`, which bypasses the cache just like `docker build --no-cache`.
 - Fixed the `dns:` fig.yml option, which was causing fig to error out.
 - Fixed a bug where fig couldn't start under Python 2.6.
 - Fixed a log-streaming bug that occasionally caused fig to exit.
@z

@x
Thanks @dnephin and @marksteve!
@y
Thanks @dnephin and @marksteve!
@z

@x
## 0.5.1
(2014-07-11)
@y
## 0.5.1
(2014-07-11)
@z

@x
 - If a service has a command defined, `fig run [service]` with no further arguments will run it.
 - The project name now defaults to the directory containing fig.yml, not the current working directory (if they're different)
 - `volumes_from` now works properly with containers as well as services
 - Fixed a race condition when recreating containers in `fig up`
@y
 - If a service has a command defined, `fig run [service]` with no further arguments will run it.
 - The project name now defaults to the directory containing fig.yml, not the current working directory (if they're different)
 - `volumes_from` now works properly with containers as well as services
 - Fixed a race condition when recreating containers in `fig up`
@z

@x
Thanks @ryanbrainard and @d11wtq!
@y
Thanks @ryanbrainard and @d11wtq!
@z

@x
## 0.5.0
(2014-07-11)
@y
## 0.5.0
(2014-07-11)
@z

@x
 - Fig now starts links when you run `fig run` or `fig up`.
@y
 - Fig now starts links when you run `fig run` or `fig up`.
@z

@x
   For example, if you have a `web` service which depends on a `db` service, `fig run web ...` will start the `db` service.
@y
   For example, if you have a `web` service which depends on a `db` service, `fig run web ...` will start the `db` service.
@z

@x
 - Environment variables can now be resolved from the environment that Fig is running in. Just specify it as a blank variable in your `fig.yml` and, if set, it'll be resolved:
   ```
   environment:
     RACK_ENV: development
     SESSION_SECRET:
   ```
@y
 - Environment variables can now be resolved from the environment that Fig is running in. Just specify it as a blank variable in your `fig.yml` and, if set, it'll be resolved:
   ```
   environment:
     RACK_ENV: development
     SESSION_SECRET:
   ```
@z

@x
 - `volumes_from` is now supported in `fig.yml`. All of the volumes from the specified services and containers will be mounted:
@y
 - `volumes_from` is now supported in `fig.yml`. All of the volumes from the specified services and containers will be mounted:
@z

@x
   ```
   volumes_from:
    - service_name
    - container_name
   ```
@y
   ```
   volumes_from:
    - service_name
    - container_name
   ```
@z

@x
 - A host address can now be specified in `ports`:
@y
 - A host address can now be specified in `ports`:
@z

@x
   ```
   ports:
    - "0.0.0.0:8000:8000"
    - "127.0.0.1:8001:8001"
   ```
@y
   ```
   ports:
    - "0.0.0.0:8000:8000"
    - "127.0.0.1:8001:8001"
   ```
@z

@x
 - The `net` and `workdir` options are now supported in `fig.yml`.
 - The `hostname` option now works in the same way as the Docker CLI, splitting out into a `domainname` option.
 - TTY behavior is far more robust, and resizes are supported correctly.
 - Load YAML files safely.
@y
 - The `net` and `workdir` options are now supported in `fig.yml`.
 - The `hostname` option now works in the same way as the Docker CLI, splitting out into a `domainname` option.
 - TTY behavior is far more robust, and resizes are supported correctly.
 - Load YAML files safely.
@z

@x
Thanks to @d11wtq, @ryanbrainard, @rail44, @j0hnsmith, @binarin, @Elemecca, @mozz100 and @marksteve for their help with this release!
@y
Thanks to @d11wtq, @ryanbrainard, @rail44, @j0hnsmith, @binarin, @Elemecca, @mozz100 and @marksteve for their help with this release!
@z

@x
## 0.4.2
(2014-06-18)
@y
## 0.4.2
(2014-06-18)
@z

@x
 - Fix various encoding errors when using `fig run`, `fig up` and `fig build`.
@y
 - Fix various encoding errors when using `fig run`, `fig up` and `fig build`.
@z

@x
## 0.4.1
(2014-05-08)
@y
## 0.4.1
(2014-05-08)
@z

@x
 - Add support for Docker 0.11.0. (Thanks @marksteve!)
 - Make project name configurable. (Thanks @jefmathiot!)
 - Return correct exit code from `fig run`.
@y
 - Add support for Docker 0.11.0. (Thanks @marksteve!)
 - Make project name configurable. (Thanks @jefmathiot!)
 - Return correct exit code from `fig run`.
@z

@x
## 0.4.0
(2014-04-29)
@y
## 0.4.0
(2014-04-29)
@z

@x
 - Support Docker 0.9 and 0.10
 - Display progress bars correctly when pulling images (no more ski slopes)
 - `fig up` now stops all services when any container exits
 - Added support for the `privileged` config option in fig.yml (thanks @kvz!)
 - Shortened and aligned log prefixes in `fig up` output
 - Only containers started with `fig run` link back to their own service
 - Handle UTF-8 correctly when streaming `fig build/run/up` output (thanks @mauvm and @shanejonas!)
 - Error message improvements
@y
 - Support Docker 0.9 and 0.10
 - Display progress bars correctly when pulling images (no more ski slopes)
 - `fig up` now stops all services when any container exits
 - Added support for the `privileged` config option in fig.yml (thanks @kvz!)
 - Shortened and aligned log prefixes in `fig up` output
 - Only containers started with `fig run` link back to their own service
 - Handle UTF-8 correctly when streaming `fig build/run/up` output (thanks @mauvm and @shanejonas!)
 - Error message improvements
@z

@x
## 0.3.2
(2014-03-05)
@y
## 0.3.2
(2014-03-05)
@z

@x
 - Added an `--rm` option to `fig run`. (Thanks @marksteve!)
 - Added an `expose` option to `fig.yml`.
@y
 - Added an `--rm` option to `fig run`. (Thanks @marksteve!)
 - Added an `expose` option to `fig.yml`.
@z

@x
## 0.3.1
(2014-03-04)
@y
## 0.3.1
(2014-03-04)
@z

@x
 - Added contribution instructions. (Thanks @kvz!)
 - Fixed `fig rm` throwing an error.
 - Fixed a bug in `fig ps` on Docker 0.8.1 when there is a container with no command.
@y
 - Added contribution instructions. (Thanks @kvz!)
 - Fixed `fig rm` throwing an error.
 - Fixed a bug in `fig ps` on Docker 0.8.1 when there is a container with no command.
@z

@x
## 0.3.0
(2014-03-03)
@y
## 0.3.0
(2014-03-03)
@z

@x
 - We now ship binaries for OS X and Linux. No more having to install with Pip!
 - Add `-f` flag to specify alternate `fig.yml` files
 - Add support for custom link names
 - Fix a bug where recreating would sometimes hang
 - Update docker-py to support Docker 0.8.0.
 - Various documentation improvements
 - Various error message improvements
@y
 - We now ship binaries for OS X and Linux. No more having to install with Pip!
 - Add `-f` flag to specify alternate `fig.yml` files
 - Add support for custom link names
 - Fix a bug where recreating would sometimes hang
 - Update docker-py to support Docker 0.8.0.
 - Various documentation improvements
 - Various error message improvements
@z

@x
Thanks @marksteve, @Gazler and @teozkr!
@y
Thanks @marksteve, @Gazler and @teozkr!
@z

@x
## 0.2.2
(2014-02-17)
@y
## 0.2.2
(2014-02-17)
@z

@x
 - Resolve dependencies using Cormen/Tarjan topological sort
 - Fix `fig up` not printing log output
 - Stop containers in reverse order to starting
 - Fix scale command not binding ports
@y
 - Resolve dependencies using Cormen/Tarjan topological sort
 - Fix `fig up` not printing log output
 - Stop containers in reverse order to starting
 - Fix scale command not binding ports
@z

@x
Thanks to @barnybug and @dustinlacewell for their work on this release.
@y
Thanks to @barnybug and @dustinlacewell for their work on this release.
@z

@x
## 0.2.1
(2014-02-04)
@y
## 0.2.1
(2014-02-04)
@z

@x
 - General improvements to error reporting (#77, #79)
@y
 - General improvements to error reporting (#77, #79)
@z

@x
## 0.2.0
(2014-01-31)
@y
## 0.2.0
(2014-01-31)
@z

@x
 - Link services to themselves so run commands can access the running service. (#67)
 - Much better documentation.
 - Make service dependency resolution more reliable. (#48)
 - Load Fig configurations with a `.yaml` extension. (#58)
@y
 - Link services to themselves so run commands can access the running service. (#67)
 - Much better documentation.
 - Make service dependency resolution more reliable. (#48)
 - Load Fig configurations with a `.yaml` extension. (#58)
@z

@x
Big thanks to @cameronmaske, @mrchrisadams and @damianmoore for their help with this release.
@y
Big thanks to @cameronmaske, @mrchrisadams and @damianmoore for their help with this release.
@z

@x
## 0.1.4
(2014-01-27)
@y
## 0.1.4
(2014-01-27)
@z

@x
 - Add a link alias without the project name. This makes the environment variables a little shorter: `REDIS_1_PORT_6379_TCP_ADDR`. (#54)
@y
 - Add a link alias without the project name. This makes the environment variables a little shorter: `REDIS_1_PORT_6379_TCP_ADDR`. (#54)
@z

@x
## 0.1.3
(2014-01-23)
@y
## 0.1.3
(2014-01-23)
@z

@x
 - Fix ports sometimes being configured incorrectly. (#46)
 - Fix log output sometimes not displaying. (#47)
@y
 - Fix ports sometimes being configured incorrectly. (#46)
 - Fix log output sometimes not displaying. (#47)
@z

@x
## 0.1.2
(2014-01-22)
@y
## 0.1.2
(2014-01-22)
@z

@x
 - Add `-T` option to `fig run` to disable pseudo-TTY. (#34)
 - Fix `fig up` requiring the ubuntu image to be pulled to recreate containers. (#33) Thanks @cameronmaske!
 - Improve reliability, fix arrow keys and fix a race condition in `fig run`. (#34, #39, #40)
@y
 - Add `-T` option to `fig run` to disable pseudo-TTY. (#34)
 - Fix `fig up` requiring the ubuntu image to be pulled to recreate containers. (#33) Thanks @cameronmaske!
 - Improve reliability, fix arrow keys and fix a race condition in `fig run`. (#34, #39, #40)
@z

@x
## 0.1.1
(2014-01-17)
@y
## 0.1.1
(2014-01-17)
@z

@x
 - Fix bug where ports were not exposed correctly (#29). Thanks @dustinlacewell!
@y
 - Fix bug where ports were not exposed correctly (#29). Thanks @dustinlacewell!
@z

@x
## 0.1.0
(2014-01-16)
@y
## 0.1.0
(2014-01-16)
@z

@x
 - Containers are recreated on each `fig up`, ensuring config is up-to-date with `fig.yml` (#2)
 - Add `fig scale` command (#9)
 - Use `DOCKER_HOST` environment variable to find Docker daemon, for consistency with the official Docker client (was previously `DOCKER_URL`) (#19)
 - Truncate long commands in `fig ps` (#18)
 - Fill out CLI help banners for commands (#15, #16)
 - Show a friendlier error when `fig.yml` is missing (#4)
 - Fix bug with `fig build` logging (#3)
 - Fix bug where builds would time out if a step took a long time without generating output (#6)
 - Fix bug where streaming container output over the Unix socket raised an error (#7)
@y
 - Containers are recreated on each `fig up`, ensuring config is up-to-date with `fig.yml` (#2)
 - Add `fig scale` command (#9)
 - Use `DOCKER_HOST` environment variable to find Docker daemon, for consistency with the official Docker client (was previously `DOCKER_URL`) (#19)
 - Truncate long commands in `fig ps` (#18)
 - Fill out CLI help banners for commands (#15, #16)
 - Show a friendlier error when `fig.yml` is missing (#4)
 - Fix bug with `fig build` logging (#3)
 - Fix bug where builds would time out if a step took a long time without generating output (#6)
 - Fix bug where streaming container output over the Unix socket raised an error (#7)
@z

@x
Big thanks to @tomstuart, @EnTeQuAk, @schickling, @aronasorman and @GeoffreyPlitt.
@y
Big thanks to @tomstuart, @EnTeQuAk, @schickling, @aronasorman and @GeoffreyPlitt.
@z

@x
## 0.0.2
(2014-01-02)
@y
## 0.0.2
(2014-01-02)
@z

@x
 - Improve documentation
 - Try to connect to Docker on `tcp://localdocker:4243` and a UNIX socket in addition to `localhost`.
 - Improve `fig up` behavior
 - Add confirmation prompt to `fig rm`
 - Add `fig build` command
@y
 - Improve documentation
 - Try to connect to Docker on `tcp://localdocker:4243` and a UNIX socket in addition to `localhost`.
 - Improve `fig up` behavior
 - Add confirmation prompt to `fig rm`
 - Add `fig build` command
@z

@x
## 0.0.1
(2013-12-20)
@y
## 0.0.1
(2013-12-20)
@z

@x
Initial release.
@y
Initial release.
@z
