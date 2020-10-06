%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: "Log driver plugins."
keywords: "Examples, Usage, plugins, docker, documentation, user guide, logging"
---
@y
---
description: "Log driver plugins."
keywords: "Examples, Usage, plugins, docker, documentation, user guide, logging"
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
# Docker log driver plugins
@y
# Docker log driver plugins
@z

@x
This document describes logging driver plugins for Docker.
@y
This document describes logging driver plugins for Docker.
@z

@x
Logging drivers enables users to forward container logs to another service for
processing. Docker includes several logging drivers as built-ins, however can
never hope to support all use-cases with built-in drivers. Plugins allow Docker
to support a wide range of logging services without requiring to embed client
libraries for these services in the main Docker codebase. See the
[plugin documentation](legacy_plugins.md) for more information.
@y
Logging drivers enables users to forward container logs to another service for
processing. Docker includes several logging drivers as built-ins, however can
never hope to support all use-cases with built-in drivers. Plugins allow Docker
to support a wide range of logging services without requiring to embed client
libraries for these services in the main Docker codebase. See the
[plugin documentation](legacy_plugins.md) for more information.
@z

@x
## Create a logging plugin
@y
## Create a logging plugin
@z

@x
The main interface for logging plugins uses the same JSON+HTTP RPC protocol used
by other plugin types. See the
[example](https://github.com/cpuguy83/docker-log-driver-test) plugin for a
reference implementation of a logging plugin. The example wraps the built-in
`jsonfilelog` log driver.
@y
The main interface for logging plugins uses the same JSON+HTTP RPC protocol used
by other plugin types. See the
[example](https://github.com/cpuguy83/docker-log-driver-test) plugin for a
reference implementation of a logging plugin. The example wraps the built-in
`jsonfilelog` log driver.
@z

@x
## LogDriver protocol
@y
## LogDriver protocol
@z

@x
Logging plugins must register as a `LogDriver` during plugin activation. Once
activated users can specify the plugin as a log driver.
@y
Logging plugins must register as a `LogDriver` during plugin activation. Once
activated users can specify the plugin as a log driver.
@z

@x
There are two HTTP endpoints that logging plugins must implement:
@y
There are two HTTP endpoints that logging plugins must implement:
@z

@x
### `/LogDriver.StartLogging`
@y
### `/LogDriver.StartLogging`
@z

@x
Signals to the plugin that a container is starting that the plugin should start
receiving logs for.
@y
Signals to the plugin that a container is starting that the plugin should start
receiving logs for.
@z

@x
Logs will be streamed over the defined file in the request. On Linux this file
is a FIFO. Logging plugins are not currently supported on Windows.
@y
Logs will be streamed over the defined file in the request. On Linux this file
is a FIFO. Logging plugins are not currently supported on Windows.
@z

@x
**Request**:
```json
{
		"File": "/path/to/file/stream",
		"Info": {
			"ContainerID": "123456"
		}
}
```
@y
**Request**:
```json
{
		"File": "/path/to/file/stream",
		"Info": {
			"ContainerID": "123456"
		}
}
```
@z

@x
`File` is the path to the log stream that needs to be consumed. Each call to
`StartLogging` should provide a different file path, even if it's a container
that the plugin has already received logs for prior. The file is created by
docker with a randomly generated name.
@y
`File` is the path to the log stream that needs to be consumed. Each call to
`StartLogging` should provide a different file path, even if it's a container
that the plugin has already received logs for prior. The file is created by
docker with a randomly generated name.
@z

@x
`Info` is details about the container that's being logged. This is fairly
free-form, but is defined by the following struct definition:
@y
`Info` is details about the container that's being logged. This is fairly
free-form, but is defined by the following struct definition:
@z

@x
```go
type Info struct {
	Config              map[string]string
	ContainerID         string
	ContainerName       string
	ContainerEntrypoint string
	ContainerArgs       []string
	ContainerImageID    string
	ContainerImageName  string
	ContainerCreated    time.Time
	ContainerEnv        []string
	ContainerLabels     map[string]string
	LogPath             string
	DaemonName          string
}
```
@y
```go
type Info struct {
	Config              map[string]string
	ContainerID         string
	ContainerName       string
	ContainerEntrypoint string
	ContainerArgs       []string
	ContainerImageID    string
	ContainerImageName  string
	ContainerCreated    time.Time
	ContainerEnv        []string
	ContainerLabels     map[string]string
	LogPath             string
	DaemonName          string
}
```
@z

@x
`ContainerID` will always be supplied with this struct, but other fields may be
empty or missing.
@y
`ContainerID` will always be supplied with this struct, but other fields may be
empty or missing.
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
or an empty value for the `Err` field.
@y
If an error occurred during this request, add an error message to the `Err` field
in the response. If no error then you can either send an empty response (`{}`)
or an empty value for the `Err` field.
@z

@x
The driver should at this point be consuming log messages from the passed in file.
If messages are unconsumed, it may cause the container to block while trying to
write to its stdio streams.
@y
The driver should at this point be consuming log messages from the passed in file.
If messages are unconsumed, it may cause the container to block while trying to
write to its stdio streams.
@z

@x
Log stream messages are encoded as protocol buffers. The protobuf definitions are
in the
[docker repository](https://github.com/docker/docker/blob/master/api/types/plugins/logdriver/entry.proto).
@y
Log stream messages are encoded as protocol buffers. The protobuf definitions are
in the
[docker repository](https://github.com/docker/docker/blob/master/api/types/plugins/logdriver/entry.proto).
@z

@x
Since protocol buffers are not self-delimited you must decode them from the stream
using the following stream format:
@y
Since protocol buffers are not self-delimited you must decode them from the stream
using the following stream format:
@z

@x
```
[size][message]
```
@y
```
[size][message]
```
@z

@x
Where `size` is a 4-byte big endian binary encoded uint32. `size` in this case
defines the size of the next message. `message` is the actual log entry.
@y
Where `size` is a 4-byte big endian binary encoded uint32. `size` in this case
defines the size of the next message. `message` is the actual log entry.
@z

@x
A reference golang implementation of a stream encoder/decoder can be found
[here](https://github.com/docker/docker/blob/master/api/types/plugins/logdriver/io.go)
@y
A reference golang implementation of a stream encoder/decoder can be found
[here](https://github.com/docker/docker/blob/master/api/types/plugins/logdriver/io.go)
@z

@x
### `/LogDriver.StopLogging`
@y
### `/LogDriver.StopLogging`
@z

@x
Signals to the plugin to stop collecting logs from the defined file.
Once a response is received, the file will be removed by Docker. You must make
sure to collect all logs on the stream before responding to this request or risk
losing log data.
@y
Signals to the plugin to stop collecting logs from the defined file.
Once a response is received, the file will be removed by Docker. You must make
sure to collect all logs on the stream before responding to this request or risk
losing log data.
@z

@x
Requests on this endpoint does not mean that the container has been removed
only that it has stopped.
@y
Requests on this endpoint does not mean that the container has been removed
only that it has stopped.
@z

@x
**Request**:
```json
{
		"File": "/path/to/file/stream"
}
```
@y
**Request**:
```json
{
		"File": "/path/to/file/stream"
}
```
@z

@x
**Response**:
```json
{
	"Err": ""
}
```
@y
**Response**:
```json
{
	"Err": ""
}
```
@z

@x
If an error occurred during this request, add an error message to the `Err` field
in the response. If no error then you can either send an empty response (`{}`)
or an empty value for the `Err` field.
@y
If an error occurred during this request, add an error message to the `Err` field
in the response. If no error then you can either send an empty response (`{}`)
or an empty value for the `Err` field.
@z

@x
## Optional endpoints
@y
## Optional endpoints
@z

@x
Logging plugins can implement two extra logging endpoints:
@y
Logging plugins can implement two extra logging endpoints:
@z

@x
### `/LogDriver.Capabilities`
@y
### `/LogDriver.Capabilities`
@z

@x
Defines the capabilities of the log driver. You must implement this endpoint for
Docker to be able to take advantage of any of the defined capabilities.
@y
Defines the capabilities of the log driver. You must implement this endpoint for
Docker to be able to take advantage of any of the defined capabilities.
@z

@x
**Request**:
```json
{}
```
@y
**Request**:
```json
{}
```
@z

@x
**Response**:
```json
{
	"ReadLogs": true
}
```
@y
**Response**:
```json
{
	"ReadLogs": true
}
```
@z

@x
Supported capabilities:
@y
Supported capabilities:
@z

@x
- `ReadLogs` - this tells Docker that the plugin is capable of reading back logs
to clients. Plugins that report that they support `ReadLogs` must implement the
`/LogDriver.ReadLogs` endpoint
@y
- `ReadLogs` - this tells Docker that the plugin is capable of reading back logs
to clients. Plugins that report that they support `ReadLogs` must implement the
`/LogDriver.ReadLogs` endpoint
@z

@x
### `/LogDriver.ReadLogs`
@y
### `/LogDriver.ReadLogs`
@z

@x
Reads back logs to the client. This is used when `docker logs <container>` is
called.
@y
Reads back logs to the client. This is used when `docker logs <container>` is
called.
@z

@x
In order for Docker to use this endpoint, the plugin must specify as much when
`/LogDriver.Capabilities` is called.
@y
In order for Docker to use this endpoint, the plugin must specify as much when
`/LogDriver.Capabilities` is called.
@z

@x
**Request**:
```json
{
	"ReadConfig": {},
	"Info": {
		"ContainerID": "123456"
	}
}
```
@y
**Request**:
```json
{
	"ReadConfig": {},
	"Info": {
		"ContainerID": "123456"
	}
}
```
@z

@x
`ReadConfig` is the list of options for reading, it is defined with the following
golang struct:
@y
`ReadConfig` is the list of options for reading, it is defined with the following
golang struct:
@z

@x
```go
type ReadConfig struct {
	Since  time.Time
	Tail   int
	Follow bool
}
```
@y
```go
type ReadConfig struct {
	Since  time.Time
	Tail   int
	Follow bool
}
```
@z

@x
- `Since` defines the oldest log that should be sent.
- `Tail` defines the number of lines to read (e.g. like the command `tail -n 10`)
- `Follow` signals that the client wants to stay attached to receive new log messages
as they come in once the existing logs have been read.
@y
- `Since` defines the oldest log that should be sent.
- `Tail` defines the number of lines to read (e.g. like the command `tail -n 10`)
- `Follow` signals that the client wants to stay attached to receive new log messages
as they come in once the existing logs have been read.
@z

@x
`Info` is the same type defined in `/LogDriver.StartLogging`. It should be used
to determine what set of logs to read.
@y
`Info` is the same type defined in `/LogDriver.StartLogging`. It should be used
to determine what set of logs to read.
@z

@x
**Response**:
```
{% raw %}{{ log stream }}{% endraw %}
```
@y
**Response**:
```
{% raw %}{{ log stream }}{% endraw %}
```
@z

@x
The response should be the encoded log message using the same format as the
messages that the plugin consumed from Docker.
@y
The response should be the encoded log message using the same format as the
messages that the plugin consumed from Docker.
@z
