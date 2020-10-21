%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Troubleshoot Docker Desktop Enterprise issues on Mac
description: Troubleshoot Mac issues
keywords: Troubleshoot, diagnose, Mac, issues, Docker Enterprise, Docker Desktop, Enterprise
redirect_from:
- /ee/desktop/troubleshoot/mac-issues/
---
@y
---
title: Troubleshoot Docker Desktop Enterprise issues on Mac
description: Troubleshoot Mac issues
keywords: Troubleshoot, diagnose, Mac, issues, Docker Enterprise, Docker Desktop, Enterprise
redirect_from:
- /ee/desktop/troubleshoot/mac-issues/
---
@z

@x
This page contains information on how to diagnose Docker Desktop Enterprise (DDE) issues on Mac.
@y
This page contains information on how to diagnose Docker Desktop Enterprise (DDE) issues on Mac.
@z

@x
## Creating a diagnostics file in Docker Desktop Enterprise
@y
## Creating a diagnostics file in Docker Desktop Enterprise
@z

@x
Select **Diagnose and Feedback** from the Docker menu in the menu bar.
@y
Select **Diagnose and Feedback** from the Docker menu in the menu bar.
@z

@x
![A diagnostics file is created.](../images/diagnose-mac.png)
@y
![A diagnostics file is created.](../images/diagnose-mac.png)
@z

@x
Once diagnostics are available, select the **Open** button to display the list of available diagnostics in Finder.
@y
Once diagnostics are available, select the **Open** button to display the list of available diagnostics in Finder.
@z

@x
Diagnostics are provided in .zip files identified by date and time. The uncompressed contents are also visible in the Finder window. Send your diagnostics file to your administrator for assistance.
@y
Diagnostics are provided in .zip files identified by date and time. The uncompressed contents are also visible in the Finder window. Send your diagnostics file to your administrator for assistance.
@z

@x
### Creating a diagnostics file from a terminal
@y
### Creating a diagnostics file from a terminal
@z

@x
In some cases, it is useful to run diagnostics yourself, for instance if Docker Desktop Enterprise cannot start.
@y
In some cases, it is useful to run diagnostics yourself, for instance if Docker Desktop Enterprise cannot start.
@z

@x
To run diagnostics from a terminal, enter the following command:
@y
To run diagnostics from a terminal, enter the following command:
@z

@x
```
/Applications/Docker.app/Contents/MacOS/com.docker.diagnose gather
```
@y
```
/Applications/Docker.app/Contents/MacOS/com.docker.diagnose gather
```
@z

@x
This command displays the information that it is gathering, and when it finishes, it displays information resembling the following example:
@y
This command displays the information that it is gathering, and when it finishes, it displays information resembling the following example:
@z

@x
```
Diagnostics Bundle: /tmp/2A989798-1658-4BF0-934D-AC4F148D0782/20190115142942.zip
Diagnostics ID:     2A989798-1658-4BF0-934D-AC4F148D0782/20190115142942
```
@y
```
Diagnostics Bundle: /tmp/2A989798-1658-4BF0-934D-AC4F148D0782/20190115142942.zip
Diagnostics ID:     2A989798-1658-4BF0-934D-AC4F148D0782/20190115142942
```
@z

@x
The name of the diagnostics file is displayed next to “Diagnostics Bundle” (`/tmp/2A989798-1658-4BF0-934D-AC4F148D0782/20190115142942.zip` in this example). This is the file that you attach to the support ticket.
@y
The name of the diagnostics file is displayed next to “Diagnostics Bundle” (`/tmp/2A989798-1658-4BF0-934D-AC4F148D0782/20190115142942.zip` in this example). This is the file that you attach to the support ticket.
@z

@x
You can view the content of your diagnostics file using the **open** command and specifying the name of your diagnostics file:
@y
You can view the content of your diagnostics file using the **open** command and specifying the name of your diagnostics file:
@z

@x
```sh
$ open /tmp/2A989798-1658-4BF0-934D-AC4F148D0782/20190115142942.zip
```
@y
```sh
$ open /tmp/2A989798-1658-4BF0-934D-AC4F148D0782/20190115142942.zip
```
@z

@x
### Viewing logs in a terminal
@y
### Viewing logs in a terminal
@z

@x
In addition to using the **Diagnose and Feedback** option to generate a diagnostics file, you can
browse Docker Desktop Enterprise logs in a terminal or with the Console app.
@y
In addition to using the **Diagnose and Feedback** option to generate a diagnostics file, you can
browse Docker Desktop Enterprise logs in a terminal or with the Console app.
@z

@x
To watch the live flow of Docker Desktop Enterprise logs at the command line, run the following command from
your favorite shell:
@y
To watch the live flow of Docker Desktop Enterprise logs at the command line, run the following command from
your favorite shell:
@z

@x
```bash
$ pred='process matches ".*(ocker|vpnkit).*"
  || (process in {"taskgated-helper", "launchservicesd", "kernel"} && eventMessage contains[c] "docker")'
$ /usr/bin/log stream --style syslog --level=debug --color=always --predicate "$pred"
```
@y
```bash
$ pred='process matches ".*(ocker|vpnkit).*"
  || (process in {"taskgated-helper", "launchservicesd", "kernel"} && eventMessage contains[c] "docker")'
$ /usr/bin/log stream --style syslog --level=debug --color=always --predicate "$pred"
```
@z

@x
Alternatively, to collect the last day of logs (`1d`) in a file, run:
@y
Alternatively, to collect the last day of logs (`1d`) in a file, run:
@z

@x
```
$ /usr/bin/log show --debug --info --style syslog --last 1d --predicate "$pred" >/tmp/logs.txt
```
@y
```
$ /usr/bin/log show --debug --info --style syslog --last 1d --predicate "$pred" >/tmp/logs.txt
```
@z

@x
### Viewing logs with the Console app
@y
### Viewing logs with the Console app
@z

@x
The Console log viewer is located in `/Applications/Utilities`; you can search for it with Spotlight Search.
@y
The Console log viewer is located in `/Applications/Utilities`; you can search for it with Spotlight Search.
@z

@x
In the Console window search bar, type
`docker` and press Enter. Then select **ANY** to expand the drop-down list next to your 'docker' search entry, and select **Process**.
@y
In the Console window search bar, type
`docker` and press Enter. Then select **ANY** to expand the drop-down list next to your 'docker' search entry, and select **Process**.
@z

@x
![Mac Console search for Docker app](../images/console.png)
@y
![Mac Console search for Docker app](../images/console.png)
@z

@x
You can use the Console app to search logs, filter the results in various
ways, and create reports.
@y
You can use the Console app to search logs, filter the results in various
ways, and create reports.
@z

@x
### Additional Docker Desktop Enterprise troubleshooting topics
@y
### Additional Docker Desktop Enterprise troubleshooting topics
@z

@x
You can also find additional information about various troubleshooting topics in the [Docker Desktop for Mac community](../../../docker-for-mac/troubleshoot.md) documentation.
@y
You can also find additional information about various troubleshooting topics in the [Docker Desktop for Mac community](../../../docker-for-mac/troubleshoot.md) documentation.
@z
