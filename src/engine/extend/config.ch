%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: "How develop and use a plugin with the managed plugin system"
keywords: "API, Usage, plugins, documentation, developer"
---
@y
---
description: "How develop and use a plugin with the managed plugin system"
keywords: "API, Usage, plugins, documentation, developer"
---
@z

@x
<!-- This file is maintained within the docker/cli GitHub
     repository at https://github.com/docker/cli/. Make all
     pull requests against that repo. If you see this file in
     another repository, consider it read-only there, as it will
     periodically be overwritten by the definitive file. Pull
     requests which include edits to this file in other repositories
     will be rejected.
-->
@y
<!-- This file is maintained within the docker/cli GitHub
     repository at https://github.com/docker/cli/. Make all
     pull requests against that repo. If you see this file in
     another repository, consider it read-only there, as it will
     periodically be overwritten by the definitive file. Pull
     requests which include edits to this file in other repositories
     will be rejected.
-->
@z

@x
# Plugin Config Version 1 of Plugin V2
@y
# Plugin Config Version 1 of Plugin V2
@z

@x
This document outlines the format of the V0 plugin configuration. The plugin
config described herein was introduced in the Docker daemon in the [v1.12.0
release](https://github.com/docker/docker/commit/f37117045c5398fd3dca8016ea8ca0cb47e7312b).
@y
This document outlines the format of the V0 plugin configuration. The plugin
config described herein was introduced in the Docker daemon in the [v1.12.0
release](https://github.com/docker/docker/commit/f37117045c5398fd3dca8016ea8ca0cb47e7312b).
@z

@x
Plugin configs describe the various constituents of a docker plugin. Plugin
configs can be serialized to JSON format with the following media types:
@y
Plugin configs describe the various constituents of a docker plugin. Plugin
configs can be serialized to JSON format with the following media types:
@z

@x
Config Type  | Media Type
------------- | -------------
config  | "application/vnd.docker.plugin.v1+json"
@y
Config Type  | Media Type
------------- | -------------
config  | "application/vnd.docker.plugin.v1+json"
@z

@x
## *Config* Field Descriptions
@y
## *Config* Field Descriptions
@z

@x
Config provides the base accessible fields for working with V0 plugin format
 in the registry.
@y
Config provides the base accessible fields for working with V0 plugin format
 in the registry.
@z

@x
- **`description`** *string*
@y
- **`description`** *string*
@z

@x
	description of the plugin
@y
	description of the plugin
@z

@x
- **`documentation`** *string*
@y
- **`documentation`** *string*
@z

@x
  	link to the documentation about the plugin
@y
  	link to the documentation about the plugin
@z

@x
- **`interface`** *PluginInterface*
@y
- **`interface`** *PluginInterface*
@z

@x
   interface implemented by the plugins, struct consisting of the following fields
@y
   interface implemented by the plugins, struct consisting of the following fields
@z

@x
    - **`types`** *string array*
@y
    - **`types`** *string array*
@z

@x
      types indicate what interface(s) the plugin currently implements.
@y
      types indicate what interface(s) the plugin currently implements.
@z

@x
      currently supported:
@y
      currently supported:
@z

@x
        - **docker.volumedriver/1.0**
@y
        - **docker.volumedriver/1.0**
@z

@x
        - **docker.networkdriver/1.0**
@y
        - **docker.networkdriver/1.0**
@z

@x
        - **docker.ipamdriver/1.0**
@y
        - **docker.ipamdriver/1.0**
@z

@x
        - **docker.authz/1.0**
@y
        - **docker.authz/1.0**
@z

@x
        - **docker.logdriver/1.0**
@y
        - **docker.logdriver/1.0**
@z

@x
        - **docker.metricscollector/1.0**
@y
        - **docker.metricscollector/1.0**
@z

@x
    - **`socket`** *string*
@y
    - **`socket`** *string*
@z

@x
      socket is the name of the socket the engine should use to communicate with the plugins.
      the socket will be created in `/run/docker/plugins`.
@y
      socket is the name of the socket the engine should use to communicate with the plugins.
      the socket will be created in `/run/docker/plugins`.
@z

@x
- **`entrypoint`** *string array*
@y
- **`entrypoint`** *string array*
@z

@x
   entrypoint of the plugin, see [`ENTRYPOINT`](../reference/builder.md#entrypoint)
@y
   entrypoint of the plugin, see [`ENTRYPOINT`](../reference/builder.md#entrypoint)
@z

@x
- **`workdir`** *string*
@y
- **`workdir`** *string*
@z

@x
   workdir of the plugin, see [`WORKDIR`](../reference/builder.md#workdir)
@y
   workdir of the plugin, see [`WORKDIR`](../reference/builder.md#workdir)
@z

@x
- **`network`** *PluginNetwork*
@y
- **`network`** *PluginNetwork*
@z

@x
   network of the plugin, struct consisting of the following fields
@y
   network of the plugin, struct consisting of the following fields
@z

@x
    - **`type`** *string*
@y
    - **`type`** *string*
@z

@x
      network type.
@y
      network type.
@z

@x
      currently supported:
@y
      currently supported:
@z

@x
      	- **bridge**
      	- **host**
      	- **none**
@y
      	- **bridge**
      	- **host**
      	- **none**
@z

@x
- **`mounts`** *PluginMount array*
@y
- **`mounts`** *PluginMount array*
@z

@x
   mount of the plugin, struct consisting of the following fields, see [`MOUNTS`](https://github.com/opencontainers/runtime-spec/blob/master/config.md#mounts)
@y
   mount of the plugin, struct consisting of the following fields, see [`MOUNTS`](https://github.com/opencontainers/runtime-spec/blob/master/config.md#mounts)
@z

@x
    - **`name`** *string*
@y
    - **`name`** *string*
@z

@x
	  name of the mount.
@y
	  name of the mount.
@z

@x
    - **`description`** *string*
@y
    - **`description`** *string*
@z

@x
      description of the mount.
@y
      description of the mount.
@z

@x
    - **`source`** *string*
@y
    - **`source`** *string*
@z

@x
	  source of the mount.
@y
	  source of the mount.
@z

@x
    - **`destination`** *string*
@y
    - **`destination`** *string*
@z

@x
	  destination of the mount.
@y
	  destination of the mount.
@z

@x
    - **`type`** *string*
@y
    - **`type`** *string*
@z

@x
      mount type.
@y
      mount type.
@z

@x
    - **`options`** *string array*
@y
    - **`options`** *string array*
@z

@x
	  options of the mount.
@y
	  options of the mount.
@z

@x
- **`ipchost`** *boolean*
   Access to host ipc namespace.
- **`pidhost`** *boolean*
   Access to host pid namespace.
@y
- **`ipchost`** *boolean*
   Access to host ipc namespace.
- **`pidhost`** *boolean*
   Access to host pid namespace.
@z

@x
- **`propagatedMount`** *string*
@y
- **`propagatedMount`** *string*
@z

@x
   path to be mounted as rshared, so that mounts under that path are visible to docker. This is useful for volume plugins.
   This path will be bind-mounted outside of the plugin rootfs so it's contents
   are preserved on upgrade.
@y
   path to be mounted as rshared, so that mounts under that path are visible to docker. This is useful for volume plugins.
   This path will be bind-mounted outside of the plugin rootfs so it's contents
   are preserved on upgrade.
@z

@x
- **`env`** *PluginEnv array*
@y
- **`env`** *PluginEnv array*
@z

@x
   env of the plugin, struct consisting of the following fields
@y
   env of the plugin, struct consisting of the following fields
@z

@x
    - **`name`** *string*
@y
    - **`name`** *string*
@z

@x
	  name of the env.
@y
	  name of the env.
@z

@x
    - **`description`** *string*
@y
    - **`description`** *string*
@z

@x
      description of the env.
@y
      description of the env.
@z

@x
    - **`value`** *string*
@y
    - **`value`** *string*
@z

@x
	  value of the env.
@y
	  value of the env.
@z

@x
- **`args`** *PluginArgs*
@y
- **`args`** *PluginArgs*
@z

@x
   args of the plugin, struct consisting of the following fields
@y
   args of the plugin, struct consisting of the following fields
@z

@x
    - **`name`** *string*
@y
    - **`name`** *string*
@z

@x
	  name of the args.
@y
	  name of the args.
@z

@x
    - **`description`** *string*
@y
    - **`description`** *string*
@z

@x
      description of the args.
@y
      description of the args.
@z

@x
    - **`value`** *string array*
@y
    - **`value`** *string array*
@z

@x
	  values of the args.
@y
	  values of the args.
@z

@x
- **`linux`** *PluginLinux*
@y
- **`linux`** *PluginLinux*
@z

@x
    - **`capabilities`** *string array*
@y
    - **`capabilities`** *string array*
@z

@x
       capabilities of the plugin (*Linux only*), see list [`here`](https://github.com/opencontainers/runc/blob/master/libcontainer/SPEC.md#security)
@y
       capabilities of the plugin (*Linux only*), see list [`here`](https://github.com/opencontainers/runc/blob/master/libcontainer/SPEC.md#security)
@z

@x
    - **`allowAllDevices`** *boolean*
@y
    - **`allowAllDevices`** *boolean*
@z

@x
	   If `/dev` is bind mounted from the host, and allowAllDevices is set to true, the plugin will have `rwm` access to all devices on the host.
@y
	   If `/dev` is bind mounted from the host, and allowAllDevices is set to true, the plugin will have `rwm` access to all devices on the host.
@z

@x
    - **`devices`** *PluginDevice array*
@y
    - **`devices`** *PluginDevice array*
@z

@x
       device of the plugin, (*Linux only*), struct consisting of the following fields, see [`DEVICES`](https://github.com/opencontainers/runtime-spec/blob/master/config-linux.md#devices)
@y
       device of the plugin, (*Linux only*), struct consisting of the following fields, see [`DEVICES`](https://github.com/opencontainers/runtime-spec/blob/master/config-linux.md#devices)
@z

@x
         - **`name`** *string*
@y
         - **`name`** *string*
@z

@x
	       name of the device.
@y
	       name of the device.
@z

@x
         - **`description`** *string*
@y
         - **`description`** *string*
@z

@x
           description of the device.
@y
           description of the device.
@z

@x
         - **`path`** *string*
@y
         - **`path`** *string*
@z

@x
           path of the device.
@y
           path of the device.
@z

@x
## Example Config
@y
## Example Config
@z

@x
*Example showing the 'tiborvass/sample-volume-plugin' plugin config.*
@y
*Example showing the 'tiborvass/sample-volume-plugin' plugin config.*
@z

@x
```json
{
            "Args": {
                "Description": "",
                "Name": "",
                "Settable": null,
                "Value": null
            },
            "Description": "A sample volume plugin for Docker",
            "Documentation": "https://docs.docker.com/engine/extend/plugins/",
            "Entrypoint": [
                "/usr/bin/sample-volume-plugin",
                "/data"
            ],
            "Env": [
                {
                    "Description": "",
                    "Name": "DEBUG",
                    "Settable": [
                        "value"
                    ],
                    "Value": "0"
                }
            ],
            "Interface": {
                "Socket": "plugin.sock",
                "Types": [
                    "docker.volumedriver/1.0"
                ]
            },
            "Linux": {
                "Capabilities": null,
                "AllowAllDevices": false,
                "Devices": null
            },
            "Mounts": null,
            "Network": {
                "Type": ""
            },
            "PropagatedMount": "/data",
            "User": {},
            "Workdir": ""
}
```
@y
```json
{
            "Args": {
                "Description": "",
                "Name": "",
                "Settable": null,
                "Value": null
            },
            "Description": "A sample volume plugin for Docker",
            "Documentation": "https://docs.docker.com/engine/extend/plugins/",
            "Entrypoint": [
                "/usr/bin/sample-volume-plugin",
                "/data"
            ],
            "Env": [
                {
                    "Description": "",
                    "Name": "DEBUG",
                    "Settable": [
                        "value"
                    ],
                    "Value": "0"
                }
            ],
            "Interface": {
                "Socket": "plugin.sock",
                "Types": [
                    "docker.volumedriver/1.0"
                ]
            },
            "Linux": {
                "Capabilities": null,
                "AllowAllDevices": false,
                "Devices": null
            },
            "Mounts": null,
            "Network": {
                "Type": ""
            },
            "PropagatedMount": "/data",
            "User": {},
            "Workdir": ""
}
```
@z
