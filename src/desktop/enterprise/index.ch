%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Docker Desktop Enterprise overview
description: Learn about Docker Desktop Enterprise
keywords: Docker EE, Windows, Mac, Docker Desktop, Enterprise
redirect_from:
- /ee/desktop/
---
@y
---
title: Docker Desktop Enterprise overview
description: Learn about Docker Desktop Enterprise
keywords: Docker EE, Windows, Mac, Docker Desktop, Enterprise
redirect_from:
- /ee/desktop/
---
@z

@x
Welcome to Docker Desktop Enterprise. This page contains information about the Docker Desktop Enterprise (DDE) release. For information about Docker Desktop Community, see:
@y
Welcome to Docker Desktop Enterprise. This page contains information about the Docker Desktop Enterprise (DDE) release. For information about Docker Desktop Community, see:
@z

@x
- [Docker Desktop for Mac (Community)](/docker-for-mac/){: target="_blank" rel="noopener" class="_"}
@y
- [Docker Desktop for Mac (Community)](/docker-for-mac/){: target="_blank" rel="noopener" class="_"}
@z

@x
- [Docker Desktop for Windows (Community)](/docker-for-windows/){: target="_blank" rel="noopener" class="_"}
@y
- [Docker Desktop for Windows (Community)](/docker-for-windows/){: target="_blank" rel="noopener" class="_"}
@z

@x
Docker Desktop Enterprise provides local development, testing, and building of Docker applications on Mac and Windows. With work performed locally, developers can leverage a rapid feedback loop before pushing code or Docker images to shared servers / continuous integration infrastructure.
@y
Docker Desktop Enterprise provides local development, testing, and building of Docker applications on Mac and Windows. With work performed locally, developers can leverage a rapid feedback loop before pushing code or Docker images to shared servers / continuous integration infrastructure.
@z

@x
Docker Desktop Enterprise takes Docker Desktop Community, formerly known as Docker for Windows and Docker for Mac, a step further with simplified enterprise application development and maintenance. With DDE, IT organizations can ensure developers are working with the same version of Docker Desktop and can easily distribute Docker Desktop to large teams using third-party endpoint management applications. With the Docker Desktop graphical user interface (GUI), developers do not have to work with lower-level Docker commands and can auto-generate Docker artifacts.
@y
Docker Desktop Enterprise takes Docker Desktop Community, formerly known as Docker for Windows and Docker for Mac, a step further with simplified enterprise application development and maintenance. With DDE, IT organizations can ensure developers are working with the same version of Docker Desktop and can easily distribute Docker Desktop to large teams using third-party endpoint management applications. With the Docker Desktop graphical user interface (GUI), developers do not have to work with lower-level Docker commands and can auto-generate Docker artifacts.
@z

@x
Installed with a single click or command line command, Docker Desktop Enterprise is integrated with the host OS framework, networking, and filesystem. DDE is also designed to integrate with existing development environments (IDEs) such as Visual Studio and IntelliJ. With support for defined application templates, Docker Desktop Enterprise allows organizations to specify the look and feel of their applications.
@y
Installed with a single click or command line command, Docker Desktop Enterprise is integrated with the host OS framework, networking, and filesystem. DDE is also designed to integrate with existing development environments (IDEs) such as Visual Studio and IntelliJ. With support for defined application templates, Docker Desktop Enterprise allows organizations to specify the look and feel of their applications.
@z

@x
Feature comparison of Docker Desktop Community versus Docker Desktop Enterprise:
@y
Feature comparison of Docker Desktop Community versus Docker Desktop Enterprise:
@z

@x
  | Feature                     | Docker Desktop (Community) | Docker Desktop Enterprise |
  | :-------------------------  |:--------------------------:|:-------------------------:|
  | Docker Engine               | X                          |  X                        |
  | Certified Kubernetes        | X                          |  X                        |
  | Docker Compose              | X                          |  X                        |
  | CLI                         | X                          |  X                        |
  | Windows and Mac support     | X                          |  X                        |
  | Version Selection           |                            |  X                        |
  | Application Designer        |                            |  X                        |
  | Custom application templates|                            |  X                        |
  | Docker Assemble             |                            |  X                        |
  | Device management           |                            |  X                        |
  | Administrative control      |                            |  X                        |
@y
  | Feature                     | Docker Desktop (Community) | Docker Desktop Enterprise |
  | :-------------------------  |:--------------------------:|:-------------------------:|
  | Docker Engine               | X                          |  X                        |
  | Certified Kubernetes        | X                          |  X                        |
  | Docker Compose              | X                          |  X                        |
  | CLI                         | X                          |  X                        |
  | Windows and Mac support     | X                          |  X                        |
  | Version Selection           |                            |  X                        |
  | Application Designer        |                            |  X                        |
  | Custom application templates|                            |  X                        |
  | Docker Assemble             |                            |  X                        |
  | Device management           |                            |  X                        |
  | Administrative control      |                            |  X                        |
@z

@x
## Docker Desktop Enterprise features
@y
## Docker Desktop Enterprise features
@z

@x
The following section lists features that are exclusive to Docker Desktop Enterprise:
@y
The following section lists features that are exclusive to Docker Desktop Enterprise:
@z

@x
### Version Selection
@y
### Version Selection
@z

@x
Configurable version packs ensure the local instance of Docker Desktop Enterprise is a precise copy of the production environment where applications are deployed.
@y
Configurable version packs ensure the local instance of Docker Desktop Enterprise is a precise copy of the production environment where applications are deployed.
@z

@x
System administrators can install version packs using a built-in command line tool. Once installed, developers can switch between versions of Docker and Kubernetes with a single click and ensure Docker and Kubernetes versions match UCP cluster versions.
@y
System administrators can install version packs using a built-in command line tool. Once installed, developers can switch between versions of Docker and Kubernetes with a single click and ensure Docker and Kubernetes versions match UCP cluster versions.
@z

@x
### Application Designer
@y
### Application Designer
@z

@x
 Application Designer provides a library of application and service templates to help developers quickly create new Docker applications.
@y
 Application Designer provides a library of application and service templates to help developers quickly create new Docker applications.
@z

@x
### Application templates
@y
### Application templates
@z

@x
Application templates allow you to choose a technology stack and focus on business logic and code, and require only minimal Docker syntax knowledge. Template support includes .NET, Spring, and more.
@y
Application templates allow you to choose a technology stack and focus on business logic and code, and require only minimal Docker syntax knowledge. Template support includes .NET, Spring, and more.
@z

@x
### Device management
@y
### Device management
@z

@x
The Docker Desktop Enterprise installer is available as standard MSI (Windows) and PKG (Mac) downloads, which allows administrators to script an installation across many developer workstations.
@y
The Docker Desktop Enterprise installer is available as standard MSI (Windows) and PKG (Mac) downloads, which allows administrators to script an installation across many developer workstations.
@z

@x
### Administrative control
@y
### Administrative control
@z

@x
IT organizations can specify and lock configuration parameters for the creation of  standardized development environments, including disabling drive sharing.
@y
IT organizations can specify and lock configuration parameters for the creation of  standardized development environments, including disabling drive sharing.
@z

@x
Developers can then run commands using the command line without worrying about configuration settings.
@y
Developers can then run commands using the command line without worrying about configuration settings.
@z
