%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
<!-- This section is included in topics that contain instructions on how to configure registry.json file to enforce users to sign into Docker Desktop-->
@y
<!-- This section is included in topics that contain instructions on how to configure registry.json file to enforce users to sign into Docker Desktop-->
@z

@x
## Create a registry.json file
@y
{: #create-a-registryjson-file }
## registry.json ファイルの生成
@z

@x
When creating a `registry.json` file, ensure that the developer is a member of
at least one organization in Docker Hub. If the `registry.json` file matches at
least one organization the developer is a member of, they can sign in to Docker
Desktop and access all their organizations.
@y
`registry.json`ファイルを生成する際に、開発担当者は Docker Hub 上の少なくとも 1 つの組織のメンバーであることを確認します。`registry.json`ファイルが、開発者の属する少なくとも 1 つの組織と一致した場合、Docker Desktop へのサインインが可能となり、その組織すべてにアクセスができます。
@z

@x
### Windows
@y
{: #windows }
### Windows の場合
@z

@x
On Windows, run the following command in a terminal to install Docker Desktop:
@y
Windows では、端末上から以下のコマンドを実行して Docker Desktop をインストールします。
@z

@x
```console
C:\Users\Admin> "Docker Desktop Installer.exe" install
```
@y
```console
C:\Users\Admin> "Docker Desktop Installer.exe" install
```
@z

@x
If you’re using PowerShell, you should run it as:
@y
PowerShell の利用時は以下を実行します。
@z

@x
```console
PS> Start-Process '.\win\build\Docker Desktop Installer.exe' -Wait install
```
@y
```console
PS> Start-Process '.\win\build\Docker Desktop Installer.exe' -Wait install
```
@z

@x
If using the Windows Command Prompt:
@y
Windows コマンドプロンプトの場合は以下とします。
@z

@x
```console
C:\Users\Admin> start /w "" "Docker Desktop Installer.exe" install
```
@y
```console
C:\Users\Admin> start /w "" "Docker Desktop Installer.exe" install
```
@z

@x
The `install` command accepts the following flag:
@y
`install`コマンドには以下のフラグ指定ができます。
@z

@x
`--allowed-org=<org name>`
@y
`--allowed-org=<org name>`
@z

@x
This requires the user to sign in and be part of the specified Docker Hub organization
when running the application. For example:
@y
This requires the user to sign in and be part of the specified Docker Hub organization
when running the application. For example:
@z

@x
```console
C:\Users\Admin> "Docker Desktop Installer.exe" install --allowed-org=acmeinc
```
@y
```console
C:\Users\Admin> "Docker Desktop Installer.exe" install --allowed-org=acmeinc
```
@z

@x
This creates the `registry.json` file at `C:\ProgramData\DockerDesktop\registry.json` 
and includes the organization information the user belongs to. Make sure this file
can't be edited by the individual developer, only by the administrator.
@y
This creates the `registry.json` file at `C:\ProgramData\DockerDesktop\registry.json` 
and includes the organization information the user belongs to. Make sure this file
can't be edited by the individual developer, only by the administrator.
@z

@x
### Mac
@y
{: #mac }
### Mac の場合
@z

@x
After downloading `Docker.dmg`, run the following commands in a terminal to install
Docker Desktop in the Applications folder:
@y
After downloading `Docker.dmg`, run the following commands in a terminal to install
Docker Desktop in the Applications folder:
@z

@x
```console
$ sudo hdiutil attach Docker.dmg
$ sudo /Volumes/Docker/Docker.app/Contents/MacOS/install
$ sudo hdiutil detach /Volumes/Docker
```
@y
```console
$ sudo hdiutil attach Docker.dmg
$ sudo /Volumes/Docker/Docker.app/Contents/MacOS/install
$ sudo hdiutil detach /Volumes/Docker
```
@z

@x
The `install` command accepts the following flags:
@y
The `install` command accepts the following flags:
@z

@x
`--allowed-org=<org name>`
@y
`--allowed-org=<org name>`
@z

@x
This requires the user to sign in and be part of the specified Docker Hub
organization when running the application. For example:
@y
This requires the user to sign in and be part of the specified Docker Hub
organization when running the application. For example:
@z

@x
```console
$ sudo hdiutil attach Docker.dmg --allowed-org=acmeinc
```
@y
```console
$ sudo hdiutil attach Docker.dmg --allowed-org=acmeinc
```
@z

@x
This creates the `registry.json` file at `/Library/Application Support/com.docker.docker/registry.json`
and includes the organization information the user belongs to. Make sure this file
can't be edited by the individual developer, only by the administrator.
@y
This creates the `registry.json` file at `/Library/Application Support/com.docker.docker/registry.json`
and includes the organization information the user belongs to. Make sure this file
can't be edited by the individual developer, only by the administrator.
@z
