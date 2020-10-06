%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: "Metrics plugins."
keywords: "Examples, Usage, plugins, docker, documentation, user guide, metrics"
---
@y
---
description: "Metrics plugins."
keywords: "Examples, Usage, plugins, docker, documentation, user guide, metrics"
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
# Docker metrics collector plugins
@y
# Docker metrics collector plugins
@z

@x
Docker exposes internal metrics based on the prometheus format. Metrics plugins
enable accessing these metrics in a consistent way by providing a Unix
socket at a predefined path where the plugin can scrape the metrics.
@y
Docker exposes internal metrics based on the prometheus format. Metrics plugins
enable accessing these metrics in a consistent way by providing a Unix
socket at a predefined path where the plugin can scrape the metrics.
@z

@x
> **Note**: that while the plugin interface for metrics is non-experimental, the naming
of the metrics and metric labels is still considered experimental and may change
in a future version.
@y
> **Note**: that while the plugin interface for metrics is non-experimental, the naming
of the metrics and metric labels is still considered experimental and may change
in a future version.
@z

@x
## Creating a metrics plugin
@y
## Creating a metrics plugin
@z

@x
You must currently set `PropagatedMount` in the plugin `config.json` to
`/run/docker`. This allows the plugin to receive updated mounts
(the bind-mounted socket) from Docker after the plugin is already configured.
@y
You must currently set `PropagatedMount` in the plugin `config.json` to
`/run/docker`. This allows the plugin to receive updated mounts
(the bind-mounted socket) from Docker after the plugin is already configured.
@z

@x
## MetricsCollector protocol
@y
## MetricsCollector protocol
@z

@x
Metrics plugins must register as implementing the`MetricsCollector` interface
in `config.json`.
@y
Metrics plugins must register as implementing the`MetricsCollector` interface
in `config.json`.
@z

@x
On Unix platforms, the socket is located at `/run/docker/metrics.sock` in the
plugin's rootfs.
@y
On Unix platforms, the socket is located at `/run/docker/metrics.sock` in the
plugin's rootfs.
@z

@x
`MetricsCollector` must implement two endpoints:
@y
`MetricsCollector` must implement two endpoints:
@z

@x
### `MetricsCollector.StartMetrics`
@y
### `MetricsCollector.StartMetrics`
@z

@x
Signals to the plugin that the metrics socket is now available for scraping
@y
Signals to the plugin that the metrics socket is now available for scraping
@z

@x
**Request**
```json
{}
```
@y
**Request**
```json
{}
```
@z

@x
The request has no playload.
@y
The request has no playload.
@z

@x
**Response**
```json
{
	"Err": ""
}
```
@y
**Response**
```json
{
	"Err": ""
}
```
@z

@x
If an error occurred during this request, add an error message to the `Err` field
in the response. If no error then you can either send an empty response (`{}`)
or an empty value for the `Err` field. Errors will only be logged.
@y
If an error occurred during this request, add an error message to the `Err` field
in the response. If no error then you can either send an empty response (`{}`)
or an empty value for the `Err` field. Errors will only be logged.
@z

@x
### `MetricsCollector.StopMetrics`
@y
### `MetricsCollector.StopMetrics`
@z

@x
Signals to the plugin that the metrics socket is no longer available.
This may happen when the daemon is shutting down.
@y
Signals to the plugin that the metrics socket is no longer available.
This may happen when the daemon is shutting down.
@z

@x
**Request**
```json
{}
```
@y
**Request**
```json
{}
```
@z

@x
The request has no playload.
@y
The request has no playload.
@z

@x
**Response**
```json
{
	"Err": ""
}
```
@y
**Response**
```json
{
	"Err": ""
}
```
@z

@x
If an error occurred during this request, add an error message to the `Err` field
in the response. If no error then you can either send an empty response (`{}`)
or an empty value for the `Err` field. Errors will only be logged.
@y
If an error occurred during this request, add an error message to the `Err` field
in the response. If no error then you can either send an empty response (`{}`)
or an empty value for the `Err` field. Errors will only be logged.
@z
