%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Troubleshoot Docker Desktop Enterprise issues on Windows
description: Learn about Docker Desktop Enterprise
keywords: Docker EE, Windows, Docker Desktop, Enterprise, troubleshoot
redirect_from:
- /ee/desktop/troubleshoot/windows-issues/
---
@y
---
title: Troubleshoot Docker Desktop Enterprise issues on Windows
description: Learn about Docker Desktop Enterprise
keywords: Docker EE, Windows, Docker Desktop, Enterprise, troubleshoot
redirect_from:
- /ee/desktop/troubleshoot/windows-issues/
---
@z

@x
This page contains information on how to diagnose Docker Desktop Enterprise (DDE) issues on Windows.
@y
This page contains information on how to diagnose Docker Desktop Enterprise (DDE) issues on Windows.
@z

@x
## Creating a diagnostics file in Docker Desktop Enterprise
@y
## Creating a diagnostics file in Docker Desktop Enterprise
@z

@x
Right-click the Docker icon in the system tray and select **Diagnose and Feedback** from the menu. When the **Diagnose & Feedback** window opens, it starts collecting diagnostics.
@y
Right-click the Docker icon in the system tray and select **Diagnose and Feedback** from the menu. When the **Diagnose & Feedback** window opens, it starts collecting diagnostics.
@z

@x
![A diagnostics file is created.](../images/diagnose-windows.png)
@y
![A diagnostics file is created.](../images/diagnose-windows.png)
@z

@x
When the log capture is complete, select **You can find diagnostics here**. The file explorer window displays the path to the diagnostics .zip file and allows you to view the contents. Diagnostics are provided in .zip files identified by date and time.
@y
When the log capture is complete, select **You can find diagnostics here**. The file explorer window displays the path to the diagnostics .zip file and allows you to view the contents. Diagnostics are provided in .zip files identified by date and time.
@z

@x
Send your diagnostics file to your administrator for assistance.
@y
Send your diagnostics file to your administrator for assistance.
@z

@x
### Creating a diagnostics file from a terminal
@y
### Creating a diagnostics file from a terminal
@z

@x
In some cases, it is useful to run diagnostics yourself, for instance if
Docker Desktop Enterprise cannot start.
@y
In some cases, it is useful to run diagnostics yourself, for instance if
Docker Desktop Enterprise cannot start.
@z

@x
To run diagnostics from a terminal, enter the following command from a powershell window:
@y
To run diagnostics from a terminal, enter the following command from a powershell window:
@z

@x
```powershell
'C:\Program Files\Docker\Docker\resources\com.docker.diagnose.exe' gather
```
@y
```powershell
'C:\Program Files\Docker\Docker\resources\com.docker.diagnose.exe' gather
```
@z

@x
This command displays the information that it is gathering, and when it finishes, it displays information resembling the following example:
@y
This command displays the information that it is gathering, and when it finishes, it displays information resembling the following example:
@z

@x
```powershell
Diagnostics Bundle: C:\Users\djs\AppData\Local\Temp\6CE654F6-7B17-4FC7-AAE0-CC53B73B76A2\20190115163621.zip
Diagnostics ID: 6CE654F6-7B17-4FC7-AAE0-CC53B73B76A2/20190115163621
```
@y
```powershell
Diagnostics Bundle: C:\Users\djs\AppData\Local\Temp\6CE654F6-7B17-4FC7-AAE0-CC53B73B76A2\20190115163621.zip
Diagnostics ID: 6CE654F6-7B17-4FC7-AAE0-CC53B73B76A2/20190115163621
```
@z

@x
The name of the diagnostics file is displayed next to “Diagnostics Bundle”  (`\Temp\6CE654F6-7B17-4FC7-AAE0-CC53B73B76A2\20190115163621.zip` in this example). This is the file that you attach to the support ticket.
@y
The name of the diagnostics file is displayed next to “Diagnostics Bundle”  (`\Temp\6CE654F6-7B17-4FC7-AAE0-CC53B73B76A2\20190115163621.zip` in this example). This is the file that you attach to the support ticket.
@z

@x
### Additional Docker Desktop Enterprise troubleshooting topics
@y
### Additional Docker Desktop Enterprise troubleshooting topics
@z

@x
You can also find additional information about various troubleshooting topics in the [Docker Desktop for Windows community](../../../docker-for-windows/troubleshoot.md) documentation.
@y
You can also find additional information about various troubleshooting topics in the [Docker Desktop for Windows community](../../../docker-for-windows/troubleshoot.md) documentation.
@z
