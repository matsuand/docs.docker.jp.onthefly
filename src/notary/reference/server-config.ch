%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Configuring the notary client, server and signer.
keywords: docker, notary, notary-client, notary-server, notary server, notary-signer, notary signer
title: Notary server configuration file
---
@y
---
description: Configuring the notary client, server and signer.
keywords: docker, notary, notary-client, notary-server, notary server, notary-signer, notary signer
title: Notary server configuration file
---
@z

@x
This document is for those who are [running their own Notary service](../running_a_service.md)
and want to specify custom options.
@y
This document is for those who are [running their own Notary service](../running_a_service.md)
and want to specify custom options.
@z

@x
## Overview
@y
## Overview
@z

@x
A configuration file is required by Notary server, and the path to the
configuration file must be specified using the `-config` option on the command
line.
@y
A configuration file is required by Notary server, and the path to the
configuration file must be specified using the `-config` option on the command
line.
@z

@x
Notary server also allows you to [increase/decrease](server-config.md#hot-logging-level-reload) the logging level without having to restart.
@y
Notary server also allows you to [increase/decrease](server-config.md#hot-logging-level-reload) the logging level without having to restart.
@z

@x
Here is a full server configuration file example:
@y
Here is a full server configuration file example:
@z

@x
```json
{
  "server": {
    "http_addr": ":4443",
    "tls_key_file": "./fixtures/notary-server.key",
    "tls_cert_file": "./fixtures/notary-server.crt"
  },
  "trust-service": {
    "type": "remote",
    "hostname": "notarysigner",
    "port": "7899",
    "key_algorithm": "ecdsa",
    "tls_ca_file": "./fixtures/root-ca.crt",
    "tls_client_cert": "./fixtures/notary-server.crt",
    "tls_client_key": "./fixtures/notary-server.key"
  },
  "storage": {
    "backend": "mysql",
    "db_url": "user:pass@tcp(notarymysql:3306)/databasename?parseTime=true"
  },
  "auth": {
    "type": "token",
    "options": {
      "realm": "https://auth.docker.io/token",
      "service": "notary-server",
      "issuer": "auth.docker.io",
      "rootcertbundle": "/path/to/auth.docker.io/cert"
    }
  },
  "logging": {
    "level": "debug"
  },
  "reporting": {
    "bugsnag": {
      "api_key": "c9d60ae4c7e70c4b6c4ebd3e8056d2b8",
      "release_stage": "production"
    }
  },
  "caching": {
    "max_age": {
      "current_metadata": 300,
      "consistent_metadata": 31536000,
    }
  },
  "repositories": {
    "gun_prefixes": ["docker.io/", "my-own-registry.com/"]
  }
}
```
@y
```json
{
  "server": {
    "http_addr": ":4443",
    "tls_key_file": "./fixtures/notary-server.key",
    "tls_cert_file": "./fixtures/notary-server.crt"
  },
  "trust-service": {
    "type": "remote",
    "hostname": "notarysigner",
    "port": "7899",
    "key_algorithm": "ecdsa",
    "tls_ca_file": "./fixtures/root-ca.crt",
    "tls_client_cert": "./fixtures/notary-server.crt",
    "tls_client_key": "./fixtures/notary-server.key"
  },
  "storage": {
    "backend": "mysql",
    "db_url": "user:pass@tcp(notarymysql:3306)/databasename?parseTime=true"
  },
  "auth": {
    "type": "token",
    "options": {
      "realm": "https://auth.docker.io/token",
      "service": "notary-server",
      "issuer": "auth.docker.io",
      "rootcertbundle": "/path/to/auth.docker.io/cert"
    }
  },
  "logging": {
    "level": "debug"
  },
  "reporting": {
    "bugsnag": {
      "api_key": "c9d60ae4c7e70c4b6c4ebd3e8056d2b8",
      "release_stage": "production"
    }
  },
  "caching": {
    "max_age": {
      "current_metadata": 300,
      "consistent_metadata": 31536000,
    }
  },
  "repositories": {
    "gun_prefixes": ["docker.io/", "my-own-registry.com/"]
  }
}
```
@z

@x
For details on the `reporting` and `logging` sections, see the documentation on
[common Notary configuration sections](/notary/reference/common-configs/).
@y
For details on the `reporting` and `logging` sections, see the documentation on
[common Notary configuration sections](/notary/reference/common-configs/).
@z

@x
## server section (required)
@y
## server section (required)
@z

@x
Example:
@y
Example:
@z

@x
```json
"server": {
  "http_addr": ":4443",
  "tls_key_file": "./fixtures/notary-server.key",
  "tls_cert_file": "./fixtures/notary-server.crt"
}
```
@y
```json
"server": {
  "http_addr": ":4443",
  "tls_key_file": "./fixtures/notary-server.key",
  "tls_cert_file": "./fixtures/notary-server.crt"
}
```
@z

@x
<table>
	<tr>
		<th>Parameter</th>
		<th>Required</th>
		<th>Description</th>
	</tr>
	<tr>
		<td valign="top"><code>http_addr</code></td>
		<td valign="top">yes</td>
		<td valign="top">The TCP address (IP and port) to listen on.  Examples:
			<ul>
			<li><code>":4443"</code> means listen on port 4443 on all IPs (and
				hence all interfaces, such as those listed when you run
				<code>ifconfig</code>)</li>
			<li><code>"127.0.0.1:4443"</code> means listen on port 4443 on
				localhost only.  That means that the server is not
				accessible except locally (via SSH tunnel, or just on a local
				terminal)</li>
			</ul>
		</td>
	</tr>
	<tr>
		<td valign="top"><code>tls_key_file</code></td>
		<td valign="top">no</td>
		<td valign="top">The path to the private key to use for
			HTTPS.  Must be provided together with <code>tls_cert_file</code>,
			or not at all. If neither are provided, the server uses HTTP
			instead of HTTPS. The path is relative to the directory of the
			configuration file.</td>
	</tr>
	<tr>
		<td valign="top"><code>tls_cert_file</code></td>
		<td valign="top">no</td>
		<td valign="top">The path to the certificate to use for HTTPS.
			Must be provided together with <code>tls_key_file</code>, or not
			at all. If neither are provided, the server uses HTTP instead
			of HTTPS. The path is relative to the directory of the
			configuration file.</td>
	</tr>
</table>
@y
<table>
	<tr>
		<th>Parameter</th>
		<th>Required</th>
		<th>Description</th>
	</tr>
	<tr>
		<td valign="top"><code>http_addr</code></td>
		<td valign="top">yes</td>
		<td valign="top">The TCP address (IP and port) to listen on.  Examples:
			<ul>
			<li><code>":4443"</code> means listen on port 4443 on all IPs (and
				hence all interfaces, such as those listed when you run
				<code>ifconfig</code>)</li>
			<li><code>"127.0.0.1:4443"</code> means listen on port 4443 on
				localhost only.  That means that the server is not
				accessible except locally (via SSH tunnel, or just on a local
				terminal)</li>
			</ul>
		</td>
	</tr>
	<tr>
		<td valign="top"><code>tls_key_file</code></td>
		<td valign="top">no</td>
		<td valign="top">The path to the private key to use for
			HTTPS.  Must be provided together with <code>tls_cert_file</code>,
			or not at all. If neither are provided, the server uses HTTP
			instead of HTTPS. The path is relative to the directory of the
			configuration file.</td>
	</tr>
	<tr>
		<td valign="top"><code>tls_cert_file</code></td>
		<td valign="top">no</td>
		<td valign="top">The path to the certificate to use for HTTPS.
			Must be provided together with <code>tls_key_file</code>, or not
			at all. If neither are provided, the server uses HTTP instead
			of HTTPS. The path is relative to the directory of the
			configuration file.</td>
	</tr>
</table>
@z

@x
## trust_service section (required)
@y
## trust_service section (required)
@z

@x
This section configures either a remote trust service, such as
[Notary signer](signer-config.md) or a local in-memory
ED25519 trust service.
@y
This section configures either a remote trust service, such as
[Notary signer](signer-config.md) or a local in-memory
ED25519 trust service.
@z

@x
Remote trust service example:
@y
Remote trust service example:
@z

@x
```json
"trust_service": {
  "type": "remote",
  "hostname": "notarysigner",
  "port": "7899",
  "key_algorithm": "ecdsa",
  "tls_ca_file": "./fixtures/root-ca.crt",
  "tls_client_cert": "./fixtures/notary-server.crt",
  "tls_client_key": "./fixtures/notary-server.key"
}
```
@y
```json
"trust_service": {
  "type": "remote",
  "hostname": "notarysigner",
  "port": "7899",
  "key_algorithm": "ecdsa",
  "tls_ca_file": "./fixtures/root-ca.crt",
  "tls_client_cert": "./fixtures/notary-server.crt",
  "tls_client_key": "./fixtures/notary-server.key"
}
```
@z

@x
Local trust service example:
@y
Local trust service example:
@z

@x
```json
"trust_service": {
  "type": "local"
}
```
@y
```json
"trust_service": {
  "type": "local"
}
```
@z

@x
<table>
	<tr>
		<th>Parameter</th>
		<th>Required</th>
		<th>Description</th>
	</tr>
	<tr>
		<td valign="top"><code>type</code></td>
		<td valign="top">yes</td>
		<td valign="top">Must be <code>"remote"</code> or <code>"local"</code></td>
	</tr>
	<tr>
		<td valign="top"><code>hostname</code></td>
		<td valign="top">yes if remote</td>
		<td valign="top">The hostname of the remote trust service</td>
	</tr>
	<tr>
		<td valign="top"><code>port</code></td>
		<td valign="top">yes if remote</td>
		<td valign="top">The GRPC port of the remote trust service</td>
	</tr>
	<tr>
		<td valign="top"><code>key_algorithm</code></td>
		<td valign="top">yes if remote</td>
		<td valign="top">Algorithm to use to generate keys stored on the
			signing service.  Valid values are <code>"ecdsa"</code>,
			<code>"rsa"</code>, and <code>"ed25519"</code>.</td>
	</tr>
	<tr>
		<td valign="top"><code>tls_ca_file</code></td>
		<td valign="top">no</td>
		<td valign="top">The path to the root CA that signed the TLS
			certificate of the remote service. This parameter must be
			provided if said root CA is not in the system's default trust
			roots. The path is relative to the directory of the configuration file.</td>
	</tr>
	<tr>
		<td valign="top"><code>tls_client_key</code></td>
		<td valign="top">no</td>
		<td valign="top">The path to the private key to use for TLS mutual
			authentication. This must be provided together with
			<code>tls_client_cert</code> or not at all. The path is relative
			to the directory of the configuration file.</td>
	</tr>
	<tr>
		<td valign="top"><code>tls_client_cert</code></td>
		<td valign="top">no</td>
		<td valign="top">The path to the certificate to use for TLS mutual
			authentication. This must be provided together with
			<code>tls_client_key</code> or not at all. The path is relative
			to the directory of the configuration file.</td>
	</tr>
</table>
@y
<table>
	<tr>
		<th>Parameter</th>
		<th>Required</th>
		<th>Description</th>
	</tr>
	<tr>
		<td valign="top"><code>type</code></td>
		<td valign="top">yes</td>
		<td valign="top">Must be <code>"remote"</code> or <code>"local"</code></td>
	</tr>
	<tr>
		<td valign="top"><code>hostname</code></td>
		<td valign="top">yes if remote</td>
		<td valign="top">The hostname of the remote trust service</td>
	</tr>
	<tr>
		<td valign="top"><code>port</code></td>
		<td valign="top">yes if remote</td>
		<td valign="top">The GRPC port of the remote trust service</td>
	</tr>
	<tr>
		<td valign="top"><code>key_algorithm</code></td>
		<td valign="top">yes if remote</td>
		<td valign="top">Algorithm to use to generate keys stored on the
			signing service.  Valid values are <code>"ecdsa"</code>,
			<code>"rsa"</code>, and <code>"ed25519"</code>.</td>
	</tr>
	<tr>
		<td valign="top"><code>tls_ca_file</code></td>
		<td valign="top">no</td>
		<td valign="top">The path to the root CA that signed the TLS
			certificate of the remote service. This parameter must be
			provided if said root CA is not in the system's default trust
			roots. The path is relative to the directory of the configuration file.</td>
	</tr>
	<tr>
		<td valign="top"><code>tls_client_key</code></td>
		<td valign="top">no</td>
		<td valign="top">The path to the private key to use for TLS mutual
			authentication. This must be provided together with
			<code>tls_client_cert</code> or not at all. The path is relative
			to the directory of the configuration file.</td>
	</tr>
	<tr>
		<td valign="top"><code>tls_client_cert</code></td>
		<td valign="top">no</td>
		<td valign="top">The path to the certificate to use for TLS mutual
			authentication. This must be provided together with
			<code>tls_client_key</code> or not at all. The path is relative
			to the directory of the configuration file.</td>
	</tr>
</table>
@z

@x
## storage section (required)
@y
## storage section (required)
@z

@x
The storage section specifies which storage backend the server should use to
store TUF metadata.  Only MySQL or an in-memory store is supported.
@y
The storage section specifies which storage backend the server should use to
store TUF metadata.  Only MySQL or an in-memory store is supported.
@z

@x
DB storage example:
@y
DB storage example:
@z

@x
```json
"storage": {
  "backend": "mysql",
  "db_url": "user:pass@tcp(notarymysql:3306)/databasename?parseTime=true"
}
```
@y
```json
"storage": {
  "backend": "mysql",
  "db_url": "user:pass@tcp(notarymysql:3306)/databasename?parseTime=true"
}
```
@z

@x
<table>
	<tr>
		<th>Parameter</th>
		<th>Required</th>
		<th>Description</th>
	</tr>
	<tr>
		<td valign="top"><code>backend</code></td>
		<td valign="top">yes</td>
		<td valign="top">Must be <code>"mysql"</code> or <code>"memory"</code>.
			If <code>"memory"</code> is selected, the <code>db_url</code>
			is ignored.</td>
	</tr>
	<tr>
		<td valign="top"><code>db_url</code></td>
		<td valign="top">yes if not <code>memory</code></td>
		<td valign="top">The <a href="https://github.com/go-sql-driver/mysql">
			the Data Source Name used to access the DB.</a>
			( include <code>parseTime=true</code> as part of the DSN)</td>
	</tr>
</table>
@y
<table>
	<tr>
		<th>Parameter</th>
		<th>Required</th>
		<th>Description</th>
	</tr>
	<tr>
		<td valign="top"><code>backend</code></td>
		<td valign="top">yes</td>
		<td valign="top">Must be <code>"mysql"</code> or <code>"memory"</code>.
			If <code>"memory"</code> is selected, the <code>db_url</code>
			is ignored.</td>
	</tr>
	<tr>
		<td valign="top"><code>db_url</code></td>
		<td valign="top">yes if not <code>memory</code></td>
		<td valign="top">The <a href="https://github.com/go-sql-driver/mysql">
			the Data Source Name used to access the DB.</a>
			( include <code>parseTime=true</code> as part of the DSN)</td>
	</tr>
</table>
@z

@x
## auth section (optional)
@y
## auth section (optional)
@z

@x
This sections specifies the authentication options for the server.
Currently, we only support token authentication.
@y
This sections specifies the authentication options for the server.
Currently, we only support token authentication.
@z

@x
Example:
@y
Example:
@z

@x
```json
"auth": {
  "type": "token",
  "options": {
    "realm": "https://auth.docker.io",
    "service": "notary-server",
    "issuer": "auth.docker.io",
    "rootcertbundle": "/path/to/auth.docker.io/cert"
  }
}
```
@y
```json
"auth": {
  "type": "token",
  "options": {
    "realm": "https://auth.docker.io",
    "service": "notary-server",
    "issuer": "auth.docker.io",
    "rootcertbundle": "/path/to/auth.docker.io/cert"
  }
}
```
@z

@x
This entire section is optional.  However, if you would like
authentication for your server, then you need the required parameters below to
configure it.
@y
This entire section is optional.  However, if you would like
authentication for your server, then you need the required parameters below to
configure it.
@z

@x
**Token authentication:**
@y
**Token authentication:**
@z

@x
This is an implementation of the same authentication used by version 2 of the
[Docker Registry](https://github.com/docker/distribution).
@y
This is an implementation of the same authentication used by version 2 of the
[Docker Registry](https://github.com/docker/distribution).
@z

@x
<table>
	<tr>
		<th>Parameter</th>
		<th>Required</th>
		<th>Description</th>
	</tr>
	<tr>
		<td valign="top"><code>type</code></td>
		<td valign="top">yes</td>
		<td valign="top">Must be <code>"token"</code>; all other values result in no
			authentication (and the rest of the parameters are ignored)</td>
	</tr>
	<tr>
		<td valign="top"><code>options</code></td>
		<td valign="top">yes</td>
		<td valign="top">The options for token auth. See
			<a href="https://github.com/docker/distribution/blob/master/docs/configuration.md#token">
			the registry token configuration documentation</a>
			for the parameter details.</td>
	</tr>
</table>
@y
<table>
	<tr>
		<th>Parameter</th>
		<th>Required</th>
		<th>Description</th>
	</tr>
	<tr>
		<td valign="top"><code>type</code></td>
		<td valign="top">yes</td>
		<td valign="top">Must be <code>"token"</code>; all other values result in no
			authentication (and the rest of the parameters are ignored)</td>
	</tr>
	<tr>
		<td valign="top"><code>options</code></td>
		<td valign="top">yes</td>
		<td valign="top">The options for token auth. See
			<a href="https://github.com/docker/distribution/blob/master/docs/configuration.md#token">
			the registry token configuration documentation</a>
			for the parameter details.</td>
	</tr>
</table>
@z

@x
## caching section (optional)
@y
## caching section (optional)
@z

@x
Example:
@y
Example:
@z

@x
```json
"caching": {
  "max_age": {
    "current_metadata": 300,
    "consistent_metadata": 31536000,
  }
}
```
@y
```json
"caching": {
  "max_age": {
    "current_metadata": 300,
    "consistent_metadata": 31536000,
  }
}
```
@z

@x
<table>
	<tr>
		<th>Parameter</th>
		<th>Required</th>
		<th>Description</th>
	</tr>
	<tr>
		<td valign="top"><code>max_age</code></td>
		<td valign="top">no</td>
		<td valign="top">The max age, in seconds, for caching services to cache
			the latest metadata for a role and the metadata by checksum for a
			role.  This value is set on the cache control headers for
			GET-ting metadata.
@y
<table>
	<tr>
		<th>Parameter</th>
		<th>Required</th>
		<th>Description</th>
	</tr>
	<tr>
		<td valign="top"><code>max_age</code></td>
		<td valign="top">no</td>
		<td valign="top">The max age, in seconds, for caching services to cache
			the latest metadata for a role and the metadata by checksum for a
			role.  This value is set on the cache control headers for
			GET-ting metadata.
@z

@x
			`must-revalidate` is also set on the cache control headers
			for current metadata, as current metadata may change whenever new
			metadata is signed into a repo.
@y
			`must-revalidate` is also set on the cache control headers
			for current metadata, as current metadata may change whenever new
			metadata is signed into a repo.
@z

@x
			Consistent metadata should never change, although it may be deleted,
			so the max age can be a higher value.
		</td>
	</tr>
</table>
@y
			Consistent metadata should never change, although it may be deleted,
			so the max age can be a higher value.
		</td>
	</tr>
</table>
@z

@x
## repositories section (optional)
@y
## repositories section (optional)
@z

@x
Example:
@y
Example:
@z

@x
```json
"repositories": {
  "gun_prefixes": ["docker.io/", "my-own-registry.com/"]
}
```
@y
```json
"repositories": {
  "gun_prefixes": ["docker.io/", "my-own-registry.com/"]
}
```
@z

@x
<table>
	<tr>
		<th>Parameter</th>
		<th>Required</th>
		<th>Description</th>
	</tr>
	<tr>
		<td valign="top"><code>gun_prefixes</code></td>
		<td valign="top">no</td>
		<td valign="top">A list of GUN prefixes accepted by this
			server.  POST operations on an image beginning with any other prefix
			are rejected with a 400, and GET/DELETE operations are rejected
			with a 404.
		</td>
	</tr>
</table>
@y
<table>
	<tr>
		<th>Parameter</th>
		<th>Required</th>
		<th>Description</th>
	</tr>
	<tr>
		<td valign="top"><code>gun_prefixes</code></td>
		<td valign="top">no</td>
		<td valign="top">A list of GUN prefixes accepted by this
			server.  POST operations on an image beginning with any other prefix
			are rejected with a 400, and GET/DELETE operations are rejected
			with a 404.
		</td>
	</tr>
</table>
@z

@x
## Hot logging level reload
@y
## Hot logging level reload
@z

@x
We don't support completely reloading notary configuration files yet at present. What we support for now is:
- increase logging level by signaling `SIGUSR1`
- decrease logging level by signaling `SIGUSR2`
@y
We don't support completely reloading notary configuration files yet at present. What we support for now is:
- increase logging level by signaling `SIGUSR1`
- decrease logging level by signaling `SIGUSR2`
@z

@x
Example:
@y
Example:
@z

@x
To increase logging level
@y
To increase logging level
@z

@x
```bash
$ kill -s SIGUSR1 PID
```
@y
```bash
$ kill -s SIGUSR1 PID
```
@z

@x
or
@y
or
@z

@x
```bash
$ docker container exec -i CONTAINER_ID kill -s SIGUSR1 PID
```
@y
```bash
$ docker container exec -i CONTAINER_ID kill -s SIGUSR1 PID
```
@z

@x
To decrease logging level
@y
To decrease logging level
@z

@x
```bash
$ kill -s SIGUSR2 PID
```
@y
```bash
$ kill -s SIGUSR2 PID
```
@z

@x
or
@y
or
@z

@x
```bash
$ docker container exec -i CONTAINER_ID kill -s SIGUSR2 PID
```
@y
```bash
$ docker container exec -i CONTAINER_ID kill -s SIGUSR2 PID
```
@z

@x
PID is the process id of `notary-server` and it may not the PID 1 process if you are running
the container with some kind of wrapper startup script or something.
@y
PID is the process id of `notary-server` and it may not the PID 1 process if you are running
the container with some kind of wrapper startup script or something.
@z

@x
You can get the PID of `notary-server` through
@y
You can get the PID of `notary-server` through
@z

@x
```bash
$ docker container exec CONTAINER_ID ps aux
```
@y
```bash
$ docker container exec CONTAINER_ID ps aux
```
@z

@x
or
@y
or
@z

@x
```bash
$ ps aux | grep "notary-server -config" | grep -v "grep"
```
@y
```bash
$ ps aux | grep "notary-server -config" | grep -v "grep"
```
@z

@x
## Related information
@y
## Related information
@z

@x
* [Notary Signer Configuration File](signer-config.md)
* [Configuration sections common to the Notary Server and Signer](common-configs.md)
@y
* [Notary Signer Configuration File](signer-config.md)
* [Configuration sections common to the Notary Server and Signer](common-configs.md)
@z
