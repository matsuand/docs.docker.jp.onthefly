%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: machine
keywords: machine, orchestration, install, installation, docker, documentation
published: false
title: Machine driver specification v1
---
@y
---
description: machine
keywords: machine, orchestration, install, installation, docker, documentation
published: false
title: Machine driver specification v1
---
@z

@x
This is the standard configuration and specification for version 1 drivers.
@y
This is the standard configuration and specification for version 1 drivers.
@z

@x
Along with defining how a driver should provision instances, the standard
also discusses behavior and operations Machine expects.
@y
Along with defining how a driver should provision instances, the standard
also discusses behavior and operations Machine expects.
@z

@x
# Requirements
@y
# Requirements
@z

@x
The following are required for a driver to be included as a supported driver
for Docker Machine.
@y
The following are required for a driver to be included as a supported driver
for Docker Machine.
@z

@x
## Base Operating System
@y
## Base Operating System
@z

@x
The provider must offer a base operating system supported by the Docker Engine.
@y
The provider must offer a base operating system supported by the Docker Engine.
@z

@x
Currently Machine requires Ubuntu for non-Boot2Docker machines.
@y
Currently Machine requires Ubuntu for non-Boot2Docker machines.
@z

@x
## API Access
@y
## API Access
@z

@x
We prefer accessing the provider service via HTTP APIs and strongly recommend
using those over external executables.  For example, using the Amazon EC2 API
instead of the EC2 command line tools. If in doubt, contact a project
maintainer.
@y
We prefer accessing the provider service via HTTP APIs and strongly recommend
using those over external executables.  For example, using the Amazon EC2 API
instead of the EC2 command line tools. If in doubt, contact a project
maintainer.
@z

@x
## SSH
@y
## SSH
@z

@x
The provider must offer SSH access to control the instance. This does not
have to be public, but must offer it as Machine relies on SSH for system
level maintenance.
@y
The provider must offer SSH access to control the instance. This does not
have to be public, but must offer it as Machine relies on SSH for system
level maintenance.
@z

@x
# Provider Operations
@y
# Provider Operations
@z

@x
The following instance operations should be supported by the provider.
@y
The following instance operations should be supported by the provider.
@z

@x
## Create
@y
## Create
@z

@x
`Create` launches a new instance and make sure it is ready for provisioning.
This includes setting up the instance with the proper SSH keys and making
sure SSH is available including any access control (firewall). This should
return an error on failure.
@y
`Create` launches a new instance and make sure it is ready for provisioning.
This includes setting up the instance with the proper SSH keys and making
sure SSH is available including any access control (firewall). This should
return an error on failure.
@z

@x
## Remove
@y
## Remove
@z

@x
`Remove` removes the instance from the provider. This should remove the
instance and any associated services or artifacts that were created as part
of the instance including keys and access groups. This should return an
error on failure.
@y
`Remove` removes the instance from the provider. This should remove the
instance and any associated services or artifacts that were created as part
of the instance including keys and access groups. This should return an
error on failure.
@z

@x
## Start
@y
## Start
@z

@x
`Start` starts a stopped instance. This should ensure the instance is
ready for operations such as SSH and Docker. This should return an error on
failure.
@y
`Start` starts a stopped instance. This should ensure the instance is
ready for operations such as SSH and Docker. This should return an error on
failure.
@z

@x
## Stop
@y
## Stop
@z

@x
`Stop` stops a running instance. This should ensure the instance is
stopped and return an error on failure.
@y
`Stop` stops a running instance. This should ensure the instance is
stopped and return an error on failure.
@z

@x
## Kill
@y
## Kill
@z

@x
`Kill` forcibly stops a running instance. This should ensure the instance
is stopped and return an error on failure.
@y
`Kill` forcibly stops a running instance. This should ensure the instance
is stopped and return an error on failure.
@z

@x
## Restart
@y
## Restart
@z

@x
`Restart` restarts a running instance. This should ensure the instance
is ready for operations such as SSH and Docker. This should return an error
on failure.
@y
`Restart` restarts a running instance. This should ensure the instance
is ready for operations such as SSH and Docker. This should return an error
on failure.
@z

@x
## Status
@y
## Status
@z

@x
`Status` returns the state of the instance. This should return the
current state of the instance (running, stopped, error, etc). This should
return an error on failure.
@y
`Status` returns the state of the instance. This should return the
current state of the instance (running, stopped, error, etc). This should
return an error on failure.
@z

@x
# Testing
@y
# Testing
@z

@x
Testing is strongly recommended for drivers. Unit tests are preferred as well
as inclusion into the [integration tests](https://github.com/docker/machine#integration-tests).
@y
Testing is strongly recommended for drivers. Unit tests are preferred as well
as inclusion into the [integration tests](https://github.com/docker/machine#integration-tests).
@z

@x
# Maintaining
@y
# Maintaining
@z

@x
Driver plugin maintainers are encouraged to host their own repo and distribute
the driver plugins as executables.
@y
Driver plugin maintainers are encouraged to host their own repo and distribute
the driver plugins as executables.
@z

@x
# Implementation
@y
# Implementation
@z

@x
The following describes what is needed to create a Machine Driver. The driver
interface has methods that must be implemented for all drivers. These include
operations such as `Create`, `Remove`, `Start`, `Stop` etc.
@y
The following describes what is needed to create a Machine Driver. The driver
interface has methods that must be implemented for all drivers. These include
operations such as `Create`, `Remove`, `Start`, `Stop` etc.
@z

@x
For details see the [Driver Interface](https://github.com/docker/machine/blob/master/drivers/drivers.go#L24).
@y
For details see the [Driver Interface](https://github.com/docker/machine/blob/master/drivers/drivers.go#L24).
@z

@x
To provide this functionality, you should embed the `drivers.BaseDriver` struct, similar to the following:
@y
To provide this functionality, you should embed the `drivers.BaseDriver` struct, similar to the following:
@z

@x
    type Driver struct {
        *drivers.BaseDriver
        DriverSpecificField string
    }
@y
    type Driver struct {
        *drivers.BaseDriver
        DriverSpecificField string
    }
@z

@x
Each driver must then use an `init` func to "register" the driver:
@y
Each driver must then use an `init` func to "register" the driver:
@z

@x
    func init() {
        drivers.Register("drivername", &drivers.RegisteredDriver{
            New:            NewDriver,
            GetCreateFlags: GetCreateFlags,
        })
    }
@y
    func init() {
        drivers.Register("drivername", &drivers.RegisteredDriver{
            New:            NewDriver,
            GetCreateFlags: GetCreateFlags,
        })
    }
@z

@x
## Flags
@y
## Flags
@z

@x
Driver flags are used for provider specific customizations. To add flags, use
a `GetCreateFlags` func. For example:
@y
Driver flags are used for provider specific customizations. To add flags, use
a `GetCreateFlags` func. For example:
@z

@x
    func GetCreateFlags() []cli.Flag {
        return []cli.Flag{
            cli.StringFlag{
                EnvVar: "DRIVERNAME_TOKEN",
                Name:   "drivername-token",
                Usage:  "Provider access token",
@y
    func GetCreateFlags() []cli.Flag {
        return []cli.Flag{
            cli.StringFlag{
                EnvVar: "DRIVERNAME_TOKEN",
                Name:   "drivername-token",
                Usage:  "Provider access token",
@z

@x
            },
            cli.StringFlag{
                EnvVar: "DRIVERNAME_IMAGE",
                Name:   "drivername-image",
                Usage:  "Provider Image",
                Value:  "ubuntu-14-04-x64",
            },
        }
    }
@y
            },
            cli.StringFlag{
                EnvVar: "DRIVERNAME_IMAGE",
                Name:   "drivername-image",
                Usage:  "Provider Image",
                Value:  "ubuntu-14-04-x64",
            },
        }
    }
@z

@x
## Examples
@y
## Examples
@z

@x
You can reference the existing [Drivers](https://github.com/docker/machine/tree/master/drivers)
as well.
@y
You can reference the existing [Drivers](https://github.com/docker/machine/tree/master/drivers)
as well.
@z
