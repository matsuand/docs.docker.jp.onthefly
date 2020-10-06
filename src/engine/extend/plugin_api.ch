%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: "How to write Docker plugins extensions "
keywords: "API, Usage, plugins, documentation, developer"
---
@y
---
description: "Docker プラグインをどのように構築するかを説明します。"
keywords: "API, Usage, plugins, documentation, developer"
---
@z

@x
# Docker Plugin API
@y
{% comment %}
# Docker Plugin API
{% endcomment %}
{: #docker-plugin-api }
# Docker プラグイン API
@z

@x
Docker plugins are out-of-process extensions which add capabilities to the
Docker Engine.
@y
{% comment %}
Docker plugins are out-of-process extensions which add capabilities to the
Docker Engine.
{% endcomment %}
Docker plugins are out-of-process extensions which add capabilities to the
Docker Engine.
@z

@x
This document describes the Docker Engine plugin API. To view information on
plugins managed by Docker Engine, refer to [Docker Engine plugin system](index.md).
@y
{% comment %}
This document describes the Docker Engine plugin API. To view information on
plugins managed by Docker Engine, refer to [Docker Engine plugin system](index.md).
{% endcomment %}
This document describes the Docker Engine plugin API. To view information on
plugins managed by Docker Engine, refer to [Docker Engine plugin system](index.md).
@z

@x
This page is intended for people who want to develop their own Docker plugin.
If you just want to learn about or use Docker plugins, look
[here](legacy_plugins.md).
@y
{% comment %}
This page is intended for people who want to develop their own Docker plugin.
If you just want to learn about or use Docker plugins, look
[here](legacy_plugins.md).
{% endcomment %}
This page is intended for people who want to develop their own Docker plugin.
If you just want to learn about or use Docker plugins, look
[here](legacy_plugins.md).
@z

@x
## What plugins are
@y
{% comment %}
## What plugins are
{% endcomment %}
## What plugins are
@z

@x
A plugin is a process running on the same or a different host as the docker daemon,
which registers itself by placing a file on the same docker host in one of the plugin
directories described in [Plugin discovery](#plugin-discovery).
@y
{% comment %}
{% endcomment %}
A plugin is a process running on the same or a different host as the docker daemon,
which registers itself by placing a file on the same docker host in one of the plugin
directories described in [Plugin discovery](#plugin-discovery).
@z

@x
Plugins have human-readable names, which are short, lowercase strings. For
example, `flocker` or `weave`.
@y
{% comment %}
{% endcomment %}
Plugins have human-readable names, which are short, lowercase strings. For
example, `flocker` or `weave`.
@z

@x
Plugins can run inside or outside containers. Currently running them outside
containers is recommended.
@y
{% comment %}
{% endcomment %}
Plugins can run inside or outside containers. Currently running them outside
containers is recommended.
@z

@x
## Plugin discovery
@y
{% comment %}
{% endcomment %}
## Plugin discovery
@z

@x
Docker discovers plugins by looking for them in the plugin directory whenever a
user or container tries to use one by name.
@y
{% comment %}
{% endcomment %}
Docker discovers plugins by looking for them in the plugin directory whenever a
user or container tries to use one by name.
@z

@x
There are three types of files which can be put in the plugin directory.
@y
{% comment %}
{% endcomment %}
There are three types of files which can be put in the plugin directory.
@z

@x
* `.sock` files are UNIX domain sockets.
* `.spec` files are text files containing a URL, such as `unix:///other.sock` or `tcp://localhost:8080`.
* `.json` files are text files containing a full json specification for the plugin.
@y
{% comment %}
{% endcomment %}
* `.sock` files are UNIX domain sockets.
* `.spec` files are text files containing a URL, such as `unix:///other.sock` or `tcp://localhost:8080`.
* `.json` files are text files containing a full json specification for the plugin.
@z

@x
Plugins with UNIX domain socket files must run on the same docker host, whereas
plugins with spec or json files can run on a different host if a remote URL is specified.
@y
{% comment %}
{% endcomment %}
Plugins with UNIX domain socket files must run on the same docker host, whereas
plugins with spec or json files can run on a different host if a remote URL is specified.
@z

@x
UNIX domain socket files must be located under `/run/docker/plugins`, whereas
spec files can be located either under `/etc/docker/plugins` or `/usr/lib/docker/plugins`.
@y
{% comment %}
{% endcomment %}
UNIX domain socket files must be located under `/run/docker/plugins`, whereas
spec files can be located either under `/etc/docker/plugins` or `/usr/lib/docker/plugins`.
@z

@x
The name of the file (excluding the extension) determines the plugin name.
@y
{% comment %}
{% endcomment %}
The name of the file (excluding the extension) determines the plugin name.
@z

@x
For example, the `flocker` plugin might create a UNIX socket at
`/run/docker/plugins/flocker.sock`.
@y
{% comment %}
{% endcomment %}
For example, the `flocker` plugin might create a UNIX socket at
`/run/docker/plugins/flocker.sock`.
@z

@x
You can define each plugin into a separated subdirectory if you want to isolate definitions from each other.
For example, you can create the `flocker` socket under `/run/docker/plugins/flocker/flocker.sock` and only
mount `/run/docker/plugins/flocker` inside the `flocker` container.
@y
{% comment %}
{% endcomment %}
You can define each plugin into a separated subdirectory if you want to isolate definitions from each other.
For example, you can create the `flocker` socket under `/run/docker/plugins/flocker/flocker.sock` and only
mount `/run/docker/plugins/flocker` inside the `flocker` container.
@z

@x
Docker always searches for unix sockets in `/run/docker/plugins` first. It checks for spec or json files under
`/etc/docker/plugins` and `/usr/lib/docker/plugins` if the socket doesn't exist. The directory scan stops as
soon as it finds the first plugin definition with the given name.
@y
{% comment %}
{% endcomment %}
Docker always searches for unix sockets in `/run/docker/plugins` first. It checks for spec or json files under
`/etc/docker/plugins` and `/usr/lib/docker/plugins` if the socket doesn't exist. The directory scan stops as
soon as it finds the first plugin definition with the given name.
@z

@x
### JSON specification
@y
{% comment %}
{% endcomment %}
### JSON specification
@z

@x
This is the JSON format for a plugin:
@y
{% comment %}
{% endcomment %}
This is the JSON format for a plugin:
@z

@x
```json
{
  "Name": "plugin-example",
  "Addr": "https://example.com/docker/plugin",
  "TLSConfig": {
    "InsecureSkipVerify": false,
    "CAFile": "/usr/shared/docker/certs/example-ca.pem",
    "CertFile": "/usr/shared/docker/certs/example-cert.pem",
    "KeyFile": "/usr/shared/docker/certs/example-key.pem"
  }
}
```
@y
```json
{
  "Name": "plugin-example",
  "Addr": "https://example.com/docker/plugin",
  "TLSConfig": {
    "InsecureSkipVerify": false,
    "CAFile": "/usr/shared/docker/certs/example-ca.pem",
    "CertFile": "/usr/shared/docker/certs/example-cert.pem",
    "KeyFile": "/usr/shared/docker/certs/example-key.pem"
  }
}
```
@z

@x
The `TLSConfig` field is optional and TLS will only be verified if this configuration is present.
@y
{% comment %}
{% endcomment %}
The `TLSConfig` field is optional and TLS will only be verified if this configuration is present.
@z

@x
## Plugin lifecycle
@y
{% comment %}
{% endcomment %}
## Plugin lifecycle
@z

@x
Plugins should be started before Docker, and stopped after Docker.  For
example, when packaging a plugin for a platform which supports `systemd`, you
might use [`systemd` dependencies](
http://www.freedesktop.org/software/systemd/man/systemd.unit.html#Before=) to
manage startup and shutdown order.
@y
{% comment %}
{% endcomment %}
Plugins should be started before Docker, and stopped after Docker.  For
example, when packaging a plugin for a platform which supports `systemd`, you
might use [`systemd` dependencies](
http://www.freedesktop.org/software/systemd/man/systemd.unit.html#Before=) to
manage startup and shutdown order.
@z

@x
When upgrading a plugin, you should first stop the Docker daemon, upgrade the
plugin, then start Docker again.
@y
{% comment %}
{% endcomment %}
When upgrading a plugin, you should first stop the Docker daemon, upgrade the
plugin, then start Docker again.
@z

@x
## Plugin activation
@y
{% comment %}
{% endcomment %}
## Plugin activation
@z

@x
When a plugin is first referred to -- either by a user referring to it by name
(e.g.  `docker run --volume-driver=foo`) or a container already configured to
use a plugin being started -- Docker looks for the named plugin in the plugin
directory and activates it with a handshake. See Handshake API below.
@y
{% comment %}
{% endcomment %}
When a plugin is first referred to -- either by a user referring to it by name
(e.g.  `docker run --volume-driver=foo`) or a container already configured to
use a plugin being started -- Docker looks for the named plugin in the plugin
directory and activates it with a handshake. See Handshake API below.
@z

@x
Plugins are *not* activated automatically at Docker daemon startup. Rather,
they are activated only lazily, or on-demand, when they are needed.
@y
{% comment %}
{% endcomment %}
Plugins are *not* activated automatically at Docker daemon startup. Rather,
they are activated only lazily, or on-demand, when they are needed.
@z

@x
## Systemd socket activation
@y
{% comment %}
{% endcomment %}
## Systemd socket activation
@z

@x
Plugins may also be socket activated by `systemd`. The official [Plugins helpers](https://github.com/docker/go-plugins-helpers)
natively supports socket activation. In order for a plugin to be socket activated it needs
a `service` file and a `socket` file.
@y
{% comment %}
{% endcomment %}
Plugins may also be socket activated by `systemd`. The official [Plugins helpers](https://github.com/docker/go-plugins-helpers)
natively supports socket activation. In order for a plugin to be socket activated it needs
a `service` file and a `socket` file.
@z

@x
The `service` file (for example `/lib/systemd/system/your-plugin.service`):
@y
{% comment %}
{% endcomment %}
The `service` file (for example `/lib/systemd/system/your-plugin.service`):
@z

@x
```
[Unit]
Description=Your plugin
Before=docker.service
After=network.target your-plugin.socket
Requires=your-plugin.socket docker.service
@y
```
[Unit]
Description=Your plugin
Before=docker.service
After=network.target your-plugin.socket
Requires=your-plugin.socket docker.service
@z

@x
[Service]
ExecStart=/usr/lib/docker/your-plugin
@y
[Service]
ExecStart=/usr/lib/docker/your-plugin
@z

@x
[Install]
WantedBy=multi-user.target
```
The `socket` file (for example `/lib/systemd/system/your-plugin.socket`):
@y
[Install]
WantedBy=multi-user.target
```
The `socket` file (for example `/lib/systemd/system/your-plugin.socket`):
@z

@x
```
[Unit]
Description=Your plugin
@y
```
[Unit]
Description=Your plugin
@z

@x
[Socket]
ListenStream=/run/docker/plugins/your-plugin.sock
@y
[Socket]
ListenStream=/run/docker/plugins/your-plugin.sock
@z

@x
[Install]
WantedBy=sockets.target
```
@y
[Install]
WantedBy=sockets.target
```
@z

@x
This will allow plugins to be actually started when the Docker daemon connects to
the sockets they're listening on (for instance the first time the daemon uses them
or if one of the plugin goes down accidentally).
@y
{% comment %}
{% endcomment %}
This will allow plugins to be actually started when the Docker daemon connects to
the sockets they're listening on (for instance the first time the daemon uses them
or if one of the plugin goes down accidentally).
@z

@x
## API design
@y
{% comment %}
{% endcomment %}
## API design
@z

@x
The Plugin API is RPC-style JSON over HTTP, much like webhooks.
@y
{% comment %}
{% endcomment %}
The Plugin API is RPC-style JSON over HTTP, much like webhooks.
@z

@x
Requests flow *from* the Docker daemon *to* the plugin.  So the plugin needs to
implement an HTTP server and bind this to the UNIX socket mentioned in the
"plugin discovery" section.
@y
{% comment %}
{% endcomment %}
Requests flow *from* the Docker daemon *to* the plugin.  So the plugin needs to
implement an HTTP server and bind this to the UNIX socket mentioned in the
"plugin discovery" section.
@z

@x
All requests are HTTP `POST` requests.
@y
{% comment %}
{% endcomment %}
All requests are HTTP `POST` requests.
@z

@x
The API is versioned via an Accept header, which currently is always set to
`application/vnd.docker.plugins.v1+json`.
@y
{% comment %}
{% endcomment %}
The API is versioned via an Accept header, which currently is always set to
`application/vnd.docker.plugins.v1+json`.
@z

@x
## Handshake API
@y
{% comment %}
{% endcomment %}
## Handshake API
@z

@x
Plugins are activated via the following "handshake" API call.
@y
{% comment %}
{% endcomment %}
Plugins are activated via the following "handshake" API call.
@z

@x
### /Plugin.Activate
@y
{% comment %}
{% endcomment %}
### /Plugin.Activate
@z

@x
**Request:** empty body
@y
{% comment %}
{% endcomment %}
**Request:** empty body
@z

@x
**Response:**
@y
{% comment %}
**Response:**
{% endcomment %}
**Response:**
@z

@x
```
{
    "Implements": ["VolumeDriver"]
}
```
@y
```
{
    "Implements": ["VolumeDriver"]
}
```
@z

@x
Responds with a list of Docker subsystems which this plugin implements.
After activation, the plugin will then be sent events from this subsystem.
@y
{% comment %}
{% endcomment %}
Responds with a list of Docker subsystems which this plugin implements.
After activation, the plugin will then be sent events from this subsystem.
@z

@x
Possible values are:
@y
{% comment %}
{% endcomment %}
Possible values are:
@z

@x
* [`authz`](plugins_authorization.md)
* [`NetworkDriver`](plugins_network.md)
* [`VolumeDriver`](plugins_volume.md)
@y
{% comment %}
{% endcomment %}
* [`authz`](plugins_authorization.md)
* [`NetworkDriver`](plugins_network.md)
* [`VolumeDriver`](plugins_volume.md)
@z

@x
## Plugin retries
@y
{% comment %}
{% endcomment %}
## Plugin retries
@z

@x
Attempts to call a method on a plugin are retried with an exponential backoff
for up to 30 seconds. This may help when packaging plugins as containers, since
it gives plugin containers a chance to start up before failing any user
containers which depend on them.
@y
{% comment %}
{% endcomment %}
Attempts to call a method on a plugin are retried with an exponential backoff
for up to 30 seconds. This may help when packaging plugins as containers, since
it gives plugin containers a chance to start up before failing any user
containers which depend on them.
@z

@x
## Plugins helpers
@y
{% comment %}
{% endcomment %}
## Plugins helpers
@z

@x
To ease plugins development, we're providing an `sdk` for each kind of plugins
currently supported by Docker at [docker/go-plugins-helpers](https://github.com/docker/go-plugins-helpers).
@y
{% comment %}
{% endcomment %}
To ease plugins development, we're providing an `sdk` for each kind of plugins
currently supported by Docker at [docker/go-plugins-helpers](https://github.com/docker/go-plugins-helpers).
@z
