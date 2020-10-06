%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Configuring the notary client, server and signer.
keywords: docker, notary, notary-client, notary-server, notary server, notary-signer, notary signer
title: Configure sections common to Notary server and signer
---
@y
---
description: Configuring the notary client, server and signer.
keywords: docker, notary, notary-client, notary-server, notary server, notary-signer, notary signer
title: Configure sections common to Notary server and signer
---
@z

@x
The logging and bug reporting configuration options for both Notary server and
Notary signer have the same keys and format. The following sections provide
further detail.
@y
The logging and bug reporting configuration options for both Notary server and
Notary signer have the same keys and format. The following sections provide
further detail.
@z

@x
For full specific configuration information, see the configuration files for the
Notary [server](server-config.md) or [signer](signer-config.md).
@y
For full specific configuration information, see the configuration files for the
Notary [server](server-config.md) or [signer](signer-config.md).
@z

@x
## logging section (optional)
@y
## logging section (optional)
@z

@x
The logging section sets the log level of the server.  If it is not provided,
the signer/server defaults to an ERROR logging level.  However if an explicit
value was provided, it must be a valid value.
@y
The logging section sets the log level of the server.  If it is not provided,
the signer/server defaults to an ERROR logging level.  However if an explicit
value was provided, it must be a valid value.
@z

@x
Example:
@y
Example:
@z

@x
```json
"logging": {
  "level": "debug"
}
```
@y
```json
"logging": {
  "level": "debug"
}
```
@z

@x
This entire section is optional.  However, if you would like to
specify a different log level, then you need the required parameters
below to configure it.
@y
This entire section is optional.  However, if you would like to
specify a different log level, then you need the required parameters
below to configure it.
@z

@x
<table>
	<tr>
		<th>Parameter</th>
		<th>Required</th>
		<th>Description</th>
	</tr>
	<tr>
		<td valign="top"><code>level</code></td>
		<td valign="top">yes</td>
		<td valign="top">One of <code>"debug"</code>, <code>"info"</code>,
			<code>"warning"</code>, <code>"error"</code>, <code>"fatal"</code>,
			or <code>"panic"</code></td>
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
		<td valign="top"><code>level</code></td>
		<td valign="top">yes</td>
		<td valign="top">One of <code>"debug"</code>, <code>"info"</code>,
			<code>"warning"</code>, <code>"error"</code>, <code>"fatal"</code>,
			or <code>"panic"</code></td>
	</tr>
</table>
@z

@x
## reporting section (optional)
@y
## reporting section (optional)
@z

@x
The reporting section contains any configuration for useful for running the
service, such as reporting errors. Currently, Notary only supports reporting errors
to <a href="https://bugsnag.com" target="_blank">Bugsnag</a>.
@y
The reporting section contains any configuration for useful for running the
service, such as reporting errors. Currently, Notary only supports reporting errors
to <a href="https://bugsnag.com" target="_blank">Bugsnag</a>.
@z

@x
See <a href="https://github.com/bugsnag/bugsnag-go/" target="_blank">bugsnag-go</a> for more information
about these configuration parameters.
@y
See <a href="https://github.com/bugsnag/bugsnag-go/" target="_blank">bugsnag-go</a> for more information
about these configuration parameters.
@z

@x
```json
"reporting": {
  "bugsnag": {
    "api_key": "c9d60ae4c7e70c4b6c4ebd3e8056d2b8",
    "release_stage": "production"
  }
}
```
@y
```json
"reporting": {
  "bugsnag": {
    "api_key": "c9d60ae4c7e70c4b6c4ebd3e8056d2b8",
    "release_stage": "production"
  }
}
```
@z

@x
This entire section is optional.  If you want to report errors to
Bugsnag, then you need to include a `bugsnag` subsection, along with the
required parameters below, to configure it.
@y
This entire section is optional.  If you want to report errors to
Bugsnag, then you need to include a `bugsnag` subsection, along with the
required parameters below, to configure it.
@z

@x
**Bugsnag reporting:**
@y
**Bugsnag reporting:**
@z

@x
<table>
	<tr>
		<th>Parameter</th>
		<th>Required</th>
		<th>Description</th>
	</tr>
	<tr>
		<td valign="top"><code>api_key</code></td>
		<td valign="top">yes</td>
		<td>The BugSnag API key to use to report errors.</td>
	</tr>
	<tr>
		<td valign="top"><code>release_stage</code></td>
		<td valign="top">yes</td>
		<td>The current release stage, such as <code>"production"</code>.  You can
			use this value to filter errors in the Bugsnag dashboard.</td>
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
		<td valign="top"><code>api_key</code></td>
		<td valign="top">yes</td>
		<td>The BugSnag API key to use to report errors.</td>
	</tr>
	<tr>
		<td valign="top"><code>release_stage</code></td>
		<td valign="top">yes</td>
		<td>The current release stage, such as <code>"production"</code>.  You can
			use this value to filter errors in the Bugsnag dashboard.</td>
	</tr>
</table>
@z

@x
## Related information
@y
## Related information
@z

@x
* [Notary Server Configuration File](server-config.md)
* [Notary Signer Configuration File](signer-config.md)
@y
* [Notary Server Configuration File](server-config.md)
* [Notary Signer Configuration File](signer-config.md)
@z
