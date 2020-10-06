%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: "Identification and authentication"
description: "Identification and authentication reference"
keywords: "standards, compliance, security, 800-53, Identification and authentication"
---
@y
---
title: "Identification and authentication"
description: "Identification and authentication reference"
keywords: "standards, compliance, security, 800-53, Identification and authentication"
---
@z

@x
## IA-1 Identification And Authentication Policy And Procedures
@y
## IA-1 Identification And Authentication Policy And Procedures
@z

@x
#### Description
@y
#### Description
@z

@x
The organization:
<ol type="a">
<li>Develops, documents, and disseminates to [Assignment: organization-defined personnel or roles]:</li>
@y
The organization:
<ol type="a">
<li>Develops, documents, and disseminates to [Assignment: organization-defined personnel or roles]:</li>
@z

@x
<ol type="1">
<li>An identification and authentication policy that addresses purpose, scope, roles, responsibilities, management commitment, coordination among organizational entities, and compliance; and</li>
<li>Procedures to facilitate the implementation of the identification and authentication policy and associated identification and authentication controls; and</li>
</ol>
<li>Reviews and updates the current:</li>
@y
<ol type="1">
<li>An identification and authentication policy that addresses purpose, scope, roles, responsibilities, management commitment, coordination among organizational entities, and compliance; and</li>
<li>Procedures to facilitate the implementation of the identification and authentication policy and associated identification and authentication controls; and</li>
</ol>
<li>Reviews and updates the current:</li>
@z

@x
<ol type="1">
<li>Identification and authentication policy [Assignment: organization-defined frequency]; and</li>
<li>Identification and authentication procedures [Assignment: organization-defined frequency].</li>
</ol>
</ol>
@y
<ol type="1">
<li>Identification and authentication policy [Assignment: organization-defined frequency]; and</li>
<li>Identification and authentication procedures [Assignment: organization-defined frequency].</li>
</ol>
</ol>
@z

@x
#### Control Information
@y
#### Control Information
@z

@x
Responsible role(s) - Organization
@y
Responsible role(s) - Organization
@z

@x
## IA-2 Identification And Authentication (Organizational Users)
@y
## IA-2 Identification And Authentication (Organizational Users)
@z

@x
#### Description
@y
#### Description
@z

@x
The information system uniquely identifies and authenticates organizational users (or processes acting on behalf of organizational users).
@y
The information system uniquely identifies and authenticates organizational users (or processes acting on behalf of organizational users).
@z

@x
#### Control Information
@y
#### Control Information
@z

@x
Responsible role(s) - Docker system
@y
Responsible role(s) - Docker system
@z

@x
<table>
<tr>
<th>Component</th>
<th>Implementation Status(es)</th>
<th>Control Origin(s)</th>
</tr>
<tr>
<td>Authentication and Authorization Service (eNZi)</td>
<td>none<br/></td>
<td>Docker EE system<br/>shared<br/></td>
</tr>
</table>
@y
<table>
<tr>
<th>Component</th>
<th>Implementation Status(es)</th>
<th>Control Origin(s)</th>
</tr>
<tr>
<td>Authentication and Authorization Service (eNZi)</td>
<td>none<br/></td>
<td>Docker EE system<br/>shared<br/></td>
</tr>
</table>
@z

@x
#### Implementation Details
@y
#### Implementation Details
@z

@x
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0d9ludq000caek2g">eNZi</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0d9ludq000caek2g">eNZi</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0d9ludq000caek2g" class="tab-pane fade in active">
Docker Enterprise Edition can be configured to identify and
authenticate users via it&#39;s integrated support for LDAP. Users and
groups managed within the organization&#39;s LDAP directory service (e.g.
Active Directory) can be synchronized to UCP and DTR on a regular
interval. When a user is removed from the LDAP-backed directory, that
user becomes inactive within UCP and DTR. In addition, UCP and DTR
teams can be mapped to groups synchronized via LDAP. When a user is
added/removed to/from the LDAP group, that same user is automatically
added/removed to/from the UCP and DTR team. Additional information can
be found at the following resources:
@y
<div class="tab-content">
<div id="bb2j0d9ludq000caek2g" class="tab-pane fade in active">
Docker Enterprise Edition can be configured to identify and
authenticate users via it&#39;s integrated support for LDAP. Users and
groups managed within the organization&#39;s LDAP directory service (e.g.
Active Directory) can be synchronized to UCP and DTR on a regular
interval. When a user is removed from the LDAP-backed directory, that
user becomes inactive within UCP and DTR. In addition, UCP and DTR
teams can be mapped to groups synchronized via LDAP. When a user is
added/removed to/from the LDAP group, that same user is automatically
added/removed to/from the UCP and DTR team. Additional information can
be found at the following resources:
@z

@x
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/external-auth/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/external-auth/</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/external-auth/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/external-auth/</a></li>
</ul>
@z

@x
</div>
</div>
@y
</div>
</div>
@z

@x
### IA-2 (1) Network Access To Privileged Accounts
@y
### IA-2 (1) Network Access To Privileged Accounts
@z

@x
#### Description
@y
#### Description
@z

@x
The information system implements multifactor authentication for network access to privileged accounts.
@y
The information system implements multifactor authentication for network access to privileged accounts.
@z

@x
#### Control Information
@y
#### Control Information
@z

@x
Responsible role(s) - Organization
@y
Responsible role(s) - Organization
@z

@x
### IA-2 (2) Network Access To Non-Privileged Accounts
@y
### IA-2 (2) Network Access To Non-Privileged Accounts
@z

@x
#### Description
@y
#### Description
@z

@x
The information system implements multifactor authentication for network access to non-privileged accounts.
@y
The information system implements multifactor authentication for network access to non-privileged accounts.
@z

@x
#### Control Information
@y
#### Control Information
@z

@x
Responsible role(s) - Organization
@y
Responsible role(s) - Organization
@z

@x
### IA-2 (3) Local Access To Privileged Accounts
@y
### IA-2 (3) Local Access To Privileged Accounts
@z

@x
#### Description
@y
#### Description
@z

@x
The information system implements multifactor authentication for local access to privileged accounts.
@y
The information system implements multifactor authentication for local access to privileged accounts.
@z

@x
#### Control Information
@y
#### Control Information
@z

@x
Responsible role(s) - Organization
@y
Responsible role(s) - Organization
@z

@x
### IA-2 (4) Local Access To Non-Privileged Accounts
@y
### IA-2 (4) Local Access To Non-Privileged Accounts
@z

@x
#### Description
@y
#### Description
@z

@x
The information system implements multifactor authentication for local access to non-privileged accounts.
@y
The information system implements multifactor authentication for local access to non-privileged accounts.
@z

@x
#### Control Information
@y
#### Control Information
@z

@x
Responsible role(s) - Organization
@y
Responsible role(s) - Organization
@z

@x
### IA-2 (5) Group Authentication
@y
### IA-2 (5) Group Authentication
@z

@x
#### Description
@y
#### Description
@z

@x
The organization requires individuals to be authenticated with an individual authenticator when a group authenticator is employed.
@y
The organization requires individuals to be authenticated with an individual authenticator when a group authenticator is employed.
@z

@x
#### Control Information
@y
#### Control Information
@z

@x
Responsible role(s) - Docker system
@y
Responsible role(s) - Docker system
@z

@x
<table>
<tr>
<th>Component</th>
<th>Implementation Status(es)</th>
<th>Control Origin(s)</th>
</tr>
<tr>
<td>Docker Trusted Registry (DTR)</td>
<td>none<br/></td>
<td>service provider hybrid<br/></td>
</tr>
<tr>
<td>Universal Control Plane (UCP)</td>
<td>none<br/></td>
<td>service provider hybrid<br/></td>
</tr>
<tr>
<td>Authentication and Authorization Service (eNZi)</td>
<td>none<br/></td>
<td>service provider hybrid<br/></td>
</tr>
</table>
@y
<table>
<tr>
<th>Component</th>
<th>Implementation Status(es)</th>
<th>Control Origin(s)</th>
</tr>
<tr>
<td>Docker Trusted Registry (DTR)</td>
<td>none<br/></td>
<td>service provider hybrid<br/></td>
</tr>
<tr>
<td>Universal Control Plane (UCP)</td>
<td>none<br/></td>
<td>service provider hybrid<br/></td>
</tr>
<tr>
<td>Authentication and Authorization Service (eNZi)</td>
<td>none<br/></td>
<td>service provider hybrid<br/></td>
</tr>
</table>
@z

@x
#### Implementation Details
@y
#### Implementation Details
@z

@x
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0d9ludq000caek30">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d9ludq000caek3g">UCP</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d9ludq000caek40">eNZi</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0d9ludq000caek30">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d9ludq000caek3g">UCP</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d9ludq000caek40">eNZi</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0d9ludq000caek30" class="tab-pane fade in active">
The organization is responsible for meeting the requirements of this
control. To assist with meeting these requirements, Docker Trusted
Registry requires individual users to be authenticated in order to
gain access to the system. Any permissions granted to the team(s) that
which the user is a member are subsequently applied.
</div>
<div id="bb2j0d9ludq000caek3g" class="tab-pane fade">
The organization is responsible for meeting the requirements of this
control. To assist with meeting these requirements, Universal Control
Plane requires individual users to be authenticated in order to gain
access to the system. Any permissions granted to the team(s) that
which the user is a member are subsequently applied.
</div>
<div id="bb2j0d9ludq000caek40" class="tab-pane fade">
The organization is responsible for meeting the requirements of this
control. To assist with meeting these requirements, Docker Enterprise
Edition requires individual users to be authenticated in order to gain
access to the system. Any permissions granted to the team(s) that
which the user is a member are subsequently applied.
</div>
</div>
@y
<div class="tab-content">
<div id="bb2j0d9ludq000caek30" class="tab-pane fade in active">
The organization is responsible for meeting the requirements of this
control. To assist with meeting these requirements, Docker Trusted
Registry requires individual users to be authenticated in order to
gain access to the system. Any permissions granted to the team(s) that
which the user is a member are subsequently applied.
</div>
<div id="bb2j0d9ludq000caek3g" class="tab-pane fade">
The organization is responsible for meeting the requirements of this
control. To assist with meeting these requirements, Universal Control
Plane requires individual users to be authenticated in order to gain
access to the system. Any permissions granted to the team(s) that
which the user is a member are subsequently applied.
</div>
<div id="bb2j0d9ludq000caek40" class="tab-pane fade">
The organization is responsible for meeting the requirements of this
control. To assist with meeting these requirements, Docker Enterprise
Edition requires individual users to be authenticated in order to gain
access to the system. Any permissions granted to the team(s) that
which the user is a member are subsequently applied.
</div>
</div>
@z

@x
### IA-2 (6) Network Access To Privileged Accounts - Separate Device
@y
### IA-2 (6) Network Access To Privileged Accounts - Separate Device
@z

@x
#### Description
@y
#### Description
@z

@x
The information system implements multifactor authentication for network access to privileged accounts such that one of the factors is provided by a device separate from the system gaining access and the device meets [Assignment: organization-defined strength of mechanism requirements].
@y
The information system implements multifactor authentication for network access to privileged accounts such that one of the factors is provided by a device separate from the system gaining access and the device meets [Assignment: organization-defined strength of mechanism requirements].
@z

@x
#### Control Information
@y
#### Control Information
@z

@x
Responsible role(s) - Organization
@y
Responsible role(s) - Organization
@z

@x
### IA-2 (7) Network Access To Non-Privileged Accounts - Separate Device
@y
### IA-2 (7) Network Access To Non-Privileged Accounts - Separate Device
@z

@x
#### Description
@y
#### Description
@z

@x
The information system implements multifactor authentication for network access to non-privileged accounts such that one of the factors is provided by a device separate from the system gaining access and the device meets [Assignment: organization-defined strength of mechanism requirements].
@y
The information system implements multifactor authentication for network access to non-privileged accounts such that one of the factors is provided by a device separate from the system gaining access and the device meets [Assignment: organization-defined strength of mechanism requirements].
@z

@x
#### Control Information
@y
#### Control Information
@z

@x
Responsible role(s) - Organization
@y
Responsible role(s) - Organization
@z

@x
### IA-2 (8) Network Access To Privileged Accounts - Replay Resistant
@y
### IA-2 (8) Network Access To Privileged Accounts - Replay Resistant
@z

@x
#### Description
@y
#### Description
@z

@x
The information system implements replay-resistant authentication mechanisms for network access to privileged accounts.
@y
The information system implements replay-resistant authentication mechanisms for network access to privileged accounts.
@z

@x
#### Control Information
@y
#### Control Information
@z

@x
Responsible role(s) - Docker system
@y
Responsible role(s) - Docker system
@z

@x
<table>
<tr>
<th>Component</th>
<th>Implementation Status(es)</th>
<th>Control Origin(s)</th>
</tr>
<tr>
<td>Authentication and Authorization Service (eNZi)</td>
<td>none<br/></td>
<td>Docker EE system<br/></td>
</tr>
</table>
@y
<table>
<tr>
<th>Component</th>
<th>Implementation Status(es)</th>
<th>Control Origin(s)</th>
</tr>
<tr>
<td>Authentication and Authorization Service (eNZi)</td>
<td>none<br/></td>
<td>Docker EE system<br/></td>
</tr>
</table>
@z

@x
#### Implementation Details
@y
#### Implementation Details
@z

@x
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0d9ludq000caek4g">eNZi</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0d9ludq000caek4g">eNZi</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0d9ludq000caek4g" class="tab-pane fade in active">
Docker Enterprise Edition integrates with LDAP for authenticating
users to an external directory service. You should configure your
external directory service for ensuring that you are protected against
replay attacks.
</div>
</div>
@y
<div class="tab-content">
<div id="bb2j0d9ludq000caek4g" class="tab-pane fade in active">
Docker Enterprise Edition integrates with LDAP for authenticating
users to an external directory service. You should configure your
external directory service for ensuring that you are protected against
replay attacks.
</div>
</div>
@z

@x
### IA-2 (9) Network Access To Non-Privileged Accounts - Replay Resistant
@y
### IA-2 (9) Network Access To Non-Privileged Accounts - Replay Resistant
@z

@x
#### Description
@y
#### Description
@z

@x
The information system implements replay-resistant authentication mechanisms for network access to non-privileged accounts.
@y
The information system implements replay-resistant authentication mechanisms for network access to non-privileged accounts.
@z

@x
#### Control Information
@y
#### Control Information
@z

@x
Responsible role(s) - Docker system
@y
Responsible role(s) - Docker system
@z

@x
<table>
<tr>
<th>Component</th>
<th>Implementation Status(es)</th>
<th>Control Origin(s)</th>
</tr>
<tr>
<td>Authentication and Authorization Service (eNZi)</td>
<td>none<br/></td>
<td>Docker EE system<br/></td>
</tr>
</table>
@y
<table>
<tr>
<th>Component</th>
<th>Implementation Status(es)</th>
<th>Control Origin(s)</th>
</tr>
<tr>
<td>Authentication and Authorization Service (eNZi)</td>
<td>none<br/></td>
<td>Docker EE system<br/></td>
</tr>
</table>
@z

@x
#### Implementation Details
@y
#### Implementation Details
@z

@x
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0d9ludq000caek50">eNZi</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0d9ludq000caek50">eNZi</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0d9ludq000caek50" class="tab-pane fade in active">
Docker Enterprise Edition integrates with LDAP for authenticating
users to an external directory service. You should configure your
external directory service for ensuring that you are protected against
replay attacks.
</div>
</div>
@y
<div class="tab-content">
<div id="bb2j0d9ludq000caek50" class="tab-pane fade in active">
Docker Enterprise Edition integrates with LDAP for authenticating
users to an external directory service. You should configure your
external directory service for ensuring that you are protected against
replay attacks.
</div>
</div>
@z

@x
### IA-2 (10) Single Sign-On
@y
### IA-2 (10) Single Sign-On
@z

@x
#### Description
@y
#### Description
@z

@x
The information system provides a single sign-on capability for [Assignment: organization-defined information system accounts and services].
@y
The information system provides a single sign-on capability for [Assignment: organization-defined information system accounts and services].
@z

@x
#### Control Information
@y
#### Control Information
@z

@x
Responsible role(s) - Organization
@y
Responsible role(s) - Organization
@z

@x
### IA-2 (11) Remote Access  - Separate Device
@y
### IA-2 (11) Remote Access  - Separate Device
@z

@x
#### Description
@y
#### Description
@z

@x
The information system implements multifactor authentication for remote access to privileged and non-privileged accounts such that one of the factors is provided by a device separate from the system gaining access and the device meets [Assignment: organization-defined strength of mechanism requirements].
@y
The information system implements multifactor authentication for remote access to privileged and non-privileged accounts such that one of the factors is provided by a device separate from the system gaining access and the device meets [Assignment: organization-defined strength of mechanism requirements].
@z

@x
#### Control Information
@y
#### Control Information
@z

@x
Responsible role(s) - Organization
@y
Responsible role(s) - Organization
@z

@x
### IA-2 (12) Acceptance Of Piv Credentials
@y
### IA-2 (12) Acceptance Of Piv Credentials
@z

@x
#### Description
@y
#### Description
@z

@x
The information system accepts and electronically verifies Personal Identity Verification (PIV) credentials.
@y
The information system accepts and electronically verifies Personal Identity Verification (PIV) credentials.
@z

@x
#### Control Information
@y
#### Control Information
@z

@x
Responsible role(s) - Organization
@y
Responsible role(s) - Organization
@z

@x
### IA-2 (13) Out-Of-Band Authentication
@y
### IA-2 (13) Out-Of-Band Authentication
@z

@x
#### Description
@y
#### Description
@z

@x
The information system implements [Assignment: organization-defined out-of-band authentication] under [Assignment: organization-defined conditions].
@y
The information system implements [Assignment: organization-defined out-of-band authentication] under [Assignment: organization-defined conditions].
@z

@x
#### Control Information
@y
#### Control Information
@z

@x
Responsible role(s) - Organization
@y
Responsible role(s) - Organization
@z

@x
## IA-3 Device Identification And Authentication
@y
## IA-3 Device Identification And Authentication
@z

@x
#### Description
@y
#### Description
@z

@x
The information system uniquely identifies and authenticates [Assignment: organization-defined specific and/or types of devices] before establishing a [Selection (one or more): local; remote; network] connection.
@y
The information system uniquely identifies and authenticates [Assignment: organization-defined specific and/or types of devices] before establishing a [Selection (one or more): local; remote; network] connection.
@z

@x
#### Control Information
@y
#### Control Information
@z

@x
Responsible role(s) - Docker system
@y
Responsible role(s) - Docker system
@z

@x
<table>
<tr>
<th>Component</th>
<th>Implementation Status(es)</th>
<th>Control Origin(s)</th>
</tr>
<tr>
<td>Docker Trusted Registry (DTR)</td>
<td>none<br/></td>
<td>Docker EE system<br/></td>
</tr>
<tr>
<td>Docker Enterprise Edition Engine</td>
<td>none<br/></td>
<td>Docker EE system<br/></td>
</tr>
<tr>
<td>Universal Control Plane (UCP)</td>
<td>none<br/></td>
<td>Docker EE system<br/></td>
</tr>
</table>
@y
<table>
<tr>
<th>Component</th>
<th>Implementation Status(es)</th>
<th>Control Origin(s)</th>
</tr>
<tr>
<td>Docker Trusted Registry (DTR)</td>
<td>none<br/></td>
<td>Docker EE system<br/></td>
</tr>
<tr>
<td>Docker Enterprise Edition Engine</td>
<td>none<br/></td>
<td>Docker EE system<br/></td>
</tr>
<tr>
<td>Universal Control Plane (UCP)</td>
<td>none<br/></td>
<td>Docker EE system<br/></td>
</tr>
</table>
@z

@x
#### Implementation Details
@y
#### Implementation Details
@z

@x
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0d9ludq000caek5g">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d9ludq000caek60">Engine</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d9ludq000caek6g">UCP</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0d9ludq000caek5g">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d9ludq000caek60">Engine</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d9ludq000caek6g">UCP</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0d9ludq000caek5g" class="tab-pane fade in active">
Docker Trusted Registry replicas reside on Universal Control Plane
worker nodes. In order for UCP worker nodes to join a Universal
Control Plane cluster, they must be identified and authenticated via a
worker token. Additional Docker Trusted Registry replicas can only be
added after a UCP administrator user has authenticated in to the UCP
cluster and when mutual TLS authentication between the UCP worker and
manager nodes has been established. Additional information can be found at the following resources:
@y
<div class="tab-content">
<div id="bb2j0d9ludq000caek5g" class="tab-pane fade in active">
Docker Trusted Registry replicas reside on Universal Control Plane
worker nodes. In order for UCP worker nodes to join a Universal
Control Plane cluster, they must be identified and authenticated via a
worker token. Additional Docker Trusted Registry replicas can only be
added after a UCP administrator user has authenticated in to the UCP
cluster and when mutual TLS authentication between the UCP worker and
manager nodes has been established. Additional information can be found at the following resources:
@z

@x
<ul>
<li><a href="https://docs.docker.com/datacenter/dtr/2.3/guides/admin/install/#step-7-join-replicas-to-the-cluster">https://docs.docker.com/datacenter/dtr/2.3/guides/admin/install/#step-7-join-replicas-to-the-cluster</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/datacenter/dtr/2.3/guides/admin/install/#step-7-join-replicas-to-the-cluster">https://docs.docker.com/datacenter/dtr/2.3/guides/admin/install/#step-7-join-replicas-to-the-cluster</a></li>
</ul>
@z

@x
</div>
<div id="bb2j0d9ludq000caek60" class="tab-pane fade">
In order for other Docker EE engine nodes to be able to join a
cluster managed by Universal Control Plane, they must be identified
and authenticated via either a manager or worker token. Use of the
token includes trust on first use mutual TLS.
</div>
<div id="bb2j0d9ludq000caek6g" class="tab-pane fade">
In order for nodes to join a Universal Control Plane cluster, they
must be identified and authenticated via either a manager or worker
token. Additional information can be found at the following resources:
@y
</div>
<div id="bb2j0d9ludq000caek60" class="tab-pane fade">
In order for other Docker EE engine nodes to be able to join a
cluster managed by Universal Control Plane, they must be identified
and authenticated via either a manager or worker token. Use of the
token includes trust on first use mutual TLS.
</div>
<div id="bb2j0d9ludq000caek6g" class="tab-pane fade">
In order for nodes to join a Universal Control Plane cluster, they
must be identified and authenticated via either a manager or worker
token. Additional information can be found at the following resources:
@z

@x
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/scale-your-cluster/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/scale-your-cluster/</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/scale-your-cluster/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/scale-your-cluster/</a></li>
</ul>
@z

@x
</div>
</div>
@y
</div>
</div>
@z

@x
### IA-3 (1) Cryptographic Bidirectional Authentication
@y
### IA-3 (1) Cryptographic Bidirectional Authentication
@z

@x
#### Description
@y
#### Description
@z

@x
The information system authenticates [Assignment: organization-defined specific devices and/or types of devices] before establishing [Selection (one or more): local; remote; network] connection using bidirectional authentication that is cryptographically based.
@y
The information system authenticates [Assignment: organization-defined specific devices and/or types of devices] before establishing [Selection (one or more): local; remote; network] connection using bidirectional authentication that is cryptographically based.
@z

@x
#### Control Information
@y
#### Control Information
@z

@x
Responsible role(s) - Organization
@y
Responsible role(s) - Organization
@z

@x
### IA-3 (3) Dynamic Address Allocation
@y
### IA-3 (3) Dynamic Address Allocation
@z

@x
#### Description
@y
#### Description
@z

@x
The organization:
<ol type="a">
<li>Standardizes dynamic address allocation lease information and the lease duration assigned to devices in accordance with [Assignment: organization-defined lease information and lease duration]; and</li>
<li>Audits lease information when assigned to a device.</li>
</ol>
@y
The organization:
<ol type="a">
<li>Standardizes dynamic address allocation lease information and the lease duration assigned to devices in accordance with [Assignment: organization-defined lease information and lease duration]; and</li>
<li>Audits lease information when assigned to a device.</li>
</ol>
@z

@x
#### Control Information
@y
#### Control Information
@z

@x
Responsible role(s) - Organization
@y
Responsible role(s) - Organization
@z

@x
### IA-3 (4) Device Attestation
@y
### IA-3 (4) Device Attestation
@z

@x
#### Description
@y
#### Description
@z

@x
The organization ensures that device identification and authentication based on attestation is handled by [Assignment: organization-defined configuration management process].
@y
The organization ensures that device identification and authentication based on attestation is handled by [Assignment: organization-defined configuration management process].
@z

@x
#### Control Information
@y
#### Control Information
@z

@x
Responsible role(s) - Organization
@y
Responsible role(s) - Organization
@z

@x
## IA-4 Identifier Management
@y
## IA-4 Identifier Management
@z

@x
#### Description
@y
#### Description
@z

@x
The organization manages information system identifiers by:
<ol type="a">
<li>Receiving authorization from [Assignment: organization-defined personnel or roles] to assign an individual, group, role, or device identifier;</li>
<li>Selecting an identifier that identifies an individual, group, role, or device;</li>
<li>Assigning the identifier to the intended individual, group, role, or device;</li>
<li>Preventing reuse of identifiers for [Assignment: organization-defined time period]; and</li>
<li>Disabling the identifier after [Assignment: organization-defined time period of inactivity].</li>
</ol>
@y
The organization manages information system identifiers by:
<ol type="a">
<li>Receiving authorization from [Assignment: organization-defined personnel or roles] to assign an individual, group, role, or device identifier;</li>
<li>Selecting an identifier that identifies an individual, group, role, or device;</li>
<li>Assigning the identifier to the intended individual, group, role, or device;</li>
<li>Preventing reuse of identifiers for [Assignment: organization-defined time period]; and</li>
<li>Disabling the identifier after [Assignment: organization-defined time period of inactivity].</li>
</ol>
@z

@x
#### Control Information
@y
#### Control Information
@z

@x
Responsible role(s) - Docker system
@y
Responsible role(s) - Docker system
@z

@x
<table>
<tr>
<th>Component</th>
<th>Implementation Status(es)</th>
<th>Control Origin(s)</th>
</tr>
<tr>
<td>Authentication and Authorization Service (eNZi)</td>
<td>none<br/></td>
<td>service provider hybrid<br/></td>
</tr>
</table>
@y
<table>
<tr>
<th>Component</th>
<th>Implementation Status(es)</th>
<th>Control Origin(s)</th>
</tr>
<tr>
<td>Authentication and Authorization Service (eNZi)</td>
<td>none<br/></td>
<td>service provider hybrid<br/></td>
</tr>
</table>
@z

@x
#### Implementation Details
@y
#### Implementation Details
@z

@x
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0d9ludq000caek70">eNZi</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0d9ludq000caek70">eNZi</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0d9ludq000caek70" class="tab-pane fade in active">
The organization is responsible for meeting the requirements of this
control. To assist with meeting these requirements, an external
directory service integrated with Docker Enterprise Edition via LDAP
can be configured to prevent the reuse of user identifiers for a
specified period of time. Refer to your directory service&#39;s
documentation for configuring this.The organization is responsible for meeting the requirements of this
control. To assist with meeting these requirements, an external
directory service integrated with Docker Enterprise Edition via LDAP
can be configured to prevent the reuse of user identifiers for a
specified period of time. Refer to your directory service&#39;s
documentation for configuring this.The organization is responsible for meeting the requirements of this
control. To assist with meeting these requirements, an external
directory service integrated with Docker Enterprise Edition via LDAP
can be configured to prevent the reuse of user identifiers for a
specified period of time. Refer to your directory service&#39;s
documentation for configuring this.
</div>
</div>
@y
<div class="tab-content">
<div id="bb2j0d9ludq000caek70" class="tab-pane fade in active">
The organization is responsible for meeting the requirements of this
control. To assist with meeting these requirements, an external
directory service integrated with Docker Enterprise Edition via LDAP
can be configured to prevent the reuse of user identifiers for a
specified period of time. Refer to your directory service&#39;s
documentation for configuring this.The organization is responsible for meeting the requirements of this
control. To assist with meeting these requirements, an external
directory service integrated with Docker Enterprise Edition via LDAP
can be configured to prevent the reuse of user identifiers for a
specified period of time. Refer to your directory service&#39;s
documentation for configuring this.The organization is responsible for meeting the requirements of this
control. To assist with meeting these requirements, an external
directory service integrated with Docker Enterprise Edition via LDAP
can be configured to prevent the reuse of user identifiers for a
specified period of time. Refer to your directory service&#39;s
documentation for configuring this.
</div>
</div>
@z

@x
### IA-4 (1) Prohibit Account Identifiers As Public Identifiers
@y
### IA-4 (1) Prohibit Account Identifiers As Public Identifiers
@z

@x
#### Description
@y
#### Description
@z

@x
The organization prohibits the use of information system account identifiers that are the same as public identifiers for individual electronic mail accounts.
@y
The organization prohibits the use of information system account identifiers that are the same as public identifiers for individual electronic mail accounts.
@z

@x
#### Control Information
@y
#### Control Information
@z

@x
Responsible role(s) - Organization
@y
Responsible role(s) - Organization
@z

@x
### IA-4 (2) Supervisor Authorization
@y
### IA-4 (2) Supervisor Authorization
@z

@x
#### Description
@y
#### Description
@z

@x
The organization requires that the registration process to receive an individual identifier includes supervisor authorization.
@y
The organization requires that the registration process to receive an individual identifier includes supervisor authorization.
@z

@x
#### Control Information
@y
#### Control Information
@z

@x
Responsible role(s) - Organization
@y
Responsible role(s) - Organization
@z

@x
### IA-4 (3) Multiple Forms Of Certification
@y
### IA-4 (3) Multiple Forms Of Certification
@z

@x
#### Description
@y
#### Description
@z

@x
The organization requires multiple forms of certification of individual identification be presented to the registration authority.
@y
The organization requires multiple forms of certification of individual identification be presented to the registration authority.
@z

@x
#### Control Information
@y
#### Control Information
@z

@x
Responsible role(s) - Organization
@y
Responsible role(s) - Organization
@z

@x
### IA-4 (4) Identify User Status
@y
### IA-4 (4) Identify User Status
@z

@x
#### Description
@y
#### Description
@z

@x
The organization manages individual identifiers by uniquely identifying each individual as [Assignment: organization-defined characteristic identifying individual status].
@y
The organization manages individual identifiers by uniquely identifying each individual as [Assignment: organization-defined characteristic identifying individual status].
@z

@x
#### Control Information
@y
#### Control Information
@z

@x
Responsible role(s) - Docker system
@y
Responsible role(s) - Docker system
@z

@x
<table>
<tr>
<th>Component</th>
<th>Implementation Status(es)</th>
<th>Control Origin(s)</th>
</tr>
<tr>
<td>Authentication and Authorization Service (eNZi)</td>
<td>none<br/></td>
<td>service provider hybrid<br/></td>
</tr>
</table>
@y
<table>
<tr>
<th>Component</th>
<th>Implementation Status(es)</th>
<th>Control Origin(s)</th>
</tr>
<tr>
<td>Authentication and Authorization Service (eNZi)</td>
<td>none<br/></td>
<td>service provider hybrid<br/></td>
</tr>
</table>
@z

@x
#### Implementation Details
@y
#### Implementation Details
@z

@x
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0d9ludq000caek7g">eNZi</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0d9ludq000caek7g">eNZi</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0d9ludq000caek7g" class="tab-pane fade in active">
The organization is responsible for meeting the requirements of this
control. To assist with meeting these requirements, an external
directory service integrated with Docker Enterprise Edition via LDAP
can be configured to uniquely identify each individual according to
the requirements of this control. Refer to your directory service&#39;s
documentation for configuring this.
</div>
</div>
@y
<div class="tab-content">
<div id="bb2j0d9ludq000caek7g" class="tab-pane fade in active">
The organization is responsible for meeting the requirements of this
control. To assist with meeting these requirements, an external
directory service integrated with Docker Enterprise Edition via LDAP
can be configured to uniquely identify each individual according to
the requirements of this control. Refer to your directory service&#39;s
documentation for configuring this.
</div>
</div>
@z

@x
### IA-4 (5) Dynamic Management
@y
### IA-4 (5) Dynamic Management
@z

@x
#### Description
@y
#### Description
@z

@x
The information system dynamically manages identifiers.
@y
The information system dynamically manages identifiers.
@z

@x
#### Control Information
@y
#### Control Information
@z

@x
Responsible role(s) - Organization
@y
Responsible role(s) - Organization
@z

@x
### IA-4 (6) Cross-Organization Management
@y
### IA-4 (6) Cross-Organization Management
@z

@x
#### Description
@y
#### Description
@z

@x
The organization coordinates with [Assignment: organization-defined external organizations] for cross-organization management of identifiers.
@y
The organization coordinates with [Assignment: organization-defined external organizations] for cross-organization management of identifiers.
@z

@x
#### Control Information
@y
#### Control Information
@z

@x
Responsible role(s) - Organization
@y
Responsible role(s) - Organization
@z

@x
### IA-4 (7) In-Person Registration
@y
### IA-4 (7) In-Person Registration
@z

@x
#### Description
@y
#### Description
@z

@x
The organization requires that the registration process to receive an individual identifier be conducted in person before a designated registration authority.
@y
The organization requires that the registration process to receive an individual identifier be conducted in person before a designated registration authority.
@z

@x
#### Control Information
@y
#### Control Information
@z

@x
Responsible role(s) - Organization
@y
Responsible role(s) - Organization
@z

@x
## IA-5 Authenticator Management
@y
## IA-5 Authenticator Management
@z

@x
#### Description
@y
#### Description
@z

@x
The organization manages information system authenticators by:
<ol type="a">
<li>Verifying, as part of the initial authenticator distribution, the identity of the individual, group, role, or device receiving the authenticator;</li>
<li>Establishing initial authenticator content for authenticators defined by the organization;</li>
<li>Ensuring that authenticators have sufficient strength of mechanism for their intended use;</li>
<li>Establishing and implementing administrative procedures for initial authenticator distribution, for lost/compromised or damaged authenticators, and for revoking authenticators;</li>
<li>Changing default content of authenticators prior to information system installation;</li>
<li>Establishing minimum and maximum lifetime restrictions and reuse conditions for authenticators;</li>
<li>Changing/refreshing authenticators [Assignment: organization-defined time period by authenticator type];</li>
<li>Protecting authenticator content from unauthorized disclosure and modification;</li>
<li>Requiring individuals to take, and having devices implement, specific security safeguards to protect authenticators; and</li>
<li>Changing authenticators for group/role accounts when membership to those accounts changes.</li>
</ol>
@y
The organization manages information system authenticators by:
<ol type="a">
<li>Verifying, as part of the initial authenticator distribution, the identity of the individual, group, role, or device receiving the authenticator;</li>
<li>Establishing initial authenticator content for authenticators defined by the organization;</li>
<li>Ensuring that authenticators have sufficient strength of mechanism for their intended use;</li>
<li>Establishing and implementing administrative procedures for initial authenticator distribution, for lost/compromised or damaged authenticators, and for revoking authenticators;</li>
<li>Changing default content of authenticators prior to information system installation;</li>
<li>Establishing minimum and maximum lifetime restrictions and reuse conditions for authenticators;</li>
<li>Changing/refreshing authenticators [Assignment: organization-defined time period by authenticator type];</li>
<li>Protecting authenticator content from unauthorized disclosure and modification;</li>
<li>Requiring individuals to take, and having devices implement, specific security safeguards to protect authenticators; and</li>
<li>Changing authenticators for group/role accounts when membership to those accounts changes.</li>
</ol>
@z

@x
#### Control Information
@y
#### Control Information
@z

@x
Responsible role(s) - Docker system
@y
Responsible role(s) - Docker system
@z

@x
<table>
<tr>
<th>Component</th>
<th>Implementation Status(es)</th>
<th>Control Origin(s)</th>
</tr>
<tr>
<td>Authentication and Authorization Service (eNZi)</td>
<td>none<br/></td>
<td>service provider hybrid<br/></td>
</tr>
</table>
@y
<table>
<tr>
<th>Component</th>
<th>Implementation Status(es)</th>
<th>Control Origin(s)</th>
</tr>
<tr>
<td>Authentication and Authorization Service (eNZi)</td>
<td>none<br/></td>
<td>service provider hybrid<br/></td>
</tr>
</table>
@z

@x
#### Implementation Details
@y
#### Implementation Details
@z

@x
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0d9ludq000caek80">eNZi</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0d9ludq000caek80">eNZi</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0d9ludq000caek80" class="tab-pane fade in active">
The organization is responsible for meeting the requirements of this
control. To assist with meeting these requirements, an external
directory service integrated with Docker Enterprise Edition via LDAP
can be configured to establish initial authenticator content according
to the requirements of this control. Refer to your directory service&#39;s
documentation for configuring this.The organization is responsible for meeting the requirements of this
control. To assist with meeting these requirements, an external
directory service integrated with Docker Enterprise Edition via LDAP
can be configured to enforce strength requirements for authenticators
according to the requirements of this control. Refer to your directory
service&#39;s documentation for configuring this.The organization is responsible for meeting the requirements of this
control. To assist with meeting these requirements, an external
directory service integrated with Docker Enterprise Edition via LDAP
can be configured to distribute, redistribute, and revoke
authenticators according to the requirements of this control. Refer to
your directory service&#39;s documentation for configuring this.The organization is responsible for meeting the requirements of this
control. To assist with meeting these requirements, an external
directory service integrated with Docker Enterprise Edition via LDAP
can be configured to change default authenticator content according to
the requirements of this control. Refer to your directory service&#39;s
documentation for configuring this.The organization is responsible for meeting the requirements of this
control. To assist with meeting these requirements, an external
directory service integrated with Docker Enterprise Edition via LDAP
can be configured to set minimum and maximum lifetime restrictions and
reuse conditions for authenticators according to the requirements of
this control. Refer to your directory service&#39;s documentation for
configuring this.The organization is responsible for meeting the requirements of this
control. To assist with meeting these requirements, an external
directory service integrated with Docker Enterprise Edition via LDAP
can be configured to refresh authenticators at a regular cadence
according to the requirements of this control. Refer to your directory
service&#39;s documentation for configuring this.The organization is responsible for meeting the requirements of this
control. To assist with meeting these requirements, an external
directory service integrated with Docker Enterprise Edition via LDAP
can be configured to protect authenticator content from unauthorized
disclosure or modification according to the requirements of this
control. Refer to your directory service&#39;s documentation for
configuring this.The organization is responsible for meeting the requirements of this
control. To assist with meeting these requirements, an external
directory service integrated with Docker Enterprise Edition via LDAP
can be configured to implement specific security safeguards to protect
authentications according to the requirements of this control. Refer
to your directory service&#39;s documentation for configuring this.The organization is responsible for meeting the requirements of this
control. To assist with meeting these requirements, an external
directory service integrated with Docker Enterprise Edition via LDAP
can be configured to change authenticators for group or role accounts
when membership to those groups or roles changes  according to the
requirements of this control. Refer to your directory service&#39;s
documentation for configuring this.
</div>
</div>
@y
<div class="tab-content">
<div id="bb2j0d9ludq000caek80" class="tab-pane fade in active">
The organization is responsible for meeting the requirements of this
control. To assist with meeting these requirements, an external
directory service integrated with Docker Enterprise Edition via LDAP
can be configured to establish initial authenticator content according
to the requirements of this control. Refer to your directory service&#39;s
documentation for configuring this.The organization is responsible for meeting the requirements of this
control. To assist with meeting these requirements, an external
directory service integrated with Docker Enterprise Edition via LDAP
can be configured to enforce strength requirements for authenticators
according to the requirements of this control. Refer to your directory
service&#39;s documentation for configuring this.The organization is responsible for meeting the requirements of this
control. To assist with meeting these requirements, an external
directory service integrated with Docker Enterprise Edition via LDAP
can be configured to distribute, redistribute, and revoke
authenticators according to the requirements of this control. Refer to
your directory service&#39;s documentation for configuring this.The organization is responsible for meeting the requirements of this
control. To assist with meeting these requirements, an external
directory service integrated with Docker Enterprise Edition via LDAP
can be configured to change default authenticator content according to
the requirements of this control. Refer to your directory service&#39;s
documentation for configuring this.The organization is responsible for meeting the requirements of this
control. To assist with meeting these requirements, an external
directory service integrated with Docker Enterprise Edition via LDAP
can be configured to set minimum and maximum lifetime restrictions and
reuse conditions for authenticators according to the requirements of
this control. Refer to your directory service&#39;s documentation for
configuring this.The organization is responsible for meeting the requirements of this
control. To assist with meeting these requirements, an external
directory service integrated with Docker Enterprise Edition via LDAP
can be configured to refresh authenticators at a regular cadence
according to the requirements of this control. Refer to your directory
service&#39;s documentation for configuring this.The organization is responsible for meeting the requirements of this
control. To assist with meeting these requirements, an external
directory service integrated with Docker Enterprise Edition via LDAP
can be configured to protect authenticator content from unauthorized
disclosure or modification according to the requirements of this
control. Refer to your directory service&#39;s documentation for
configuring this.The organization is responsible for meeting the requirements of this
control. To assist with meeting these requirements, an external
directory service integrated with Docker Enterprise Edition via LDAP
can be configured to implement specific security safeguards to protect
authentications according to the requirements of this control. Refer
to your directory service&#39;s documentation for configuring this.The organization is responsible for meeting the requirements of this
control. To assist with meeting these requirements, an external
directory service integrated with Docker Enterprise Edition via LDAP
can be configured to change authenticators for group or role accounts
when membership to those groups or roles changes  according to the
requirements of this control. Refer to your directory service&#39;s
documentation for configuring this.
</div>
</div>
@z

@x
### IA-5 (1) Password-Based Authentication
@y
### IA-5 (1) Password-Based Authentication
@z

@x
#### Description
@y
#### Description
@z

@x
The information system, for password-based authentication:
<ol type="a">
<li>Enforces minimum password complexity of [Assignment: organization-defined requirements for case sensitivity, number of characters, mix of upper-case letters, lower-case letters, numbers, and special characters, including minimum requirements for each type];</li>
<li>Enforces at least the following number of changed characters when new passwords are created: [Assignment: organization-defined number];</li>
<li>Stores and transmits only cryptographically-protected passwords;</li>
<li>Enforces password minimum and maximum lifetime restrictions of [Assignment: organization-defined numbers for lifetime minimum, lifetime maximum];</li>
<li>Prohibits password reuse for [Assignment: organization-defined number] generations; and</li>
<li>Allows the use of a temporary password for system logons with an immediate change to a permanent password.</li>
</ol>
@y
The information system, for password-based authentication:
<ol type="a">
<li>Enforces minimum password complexity of [Assignment: organization-defined requirements for case sensitivity, number of characters, mix of upper-case letters, lower-case letters, numbers, and special characters, including minimum requirements for each type];</li>
<li>Enforces at least the following number of changed characters when new passwords are created: [Assignment: organization-defined number];</li>
<li>Stores and transmits only cryptographically-protected passwords;</li>
<li>Enforces password minimum and maximum lifetime restrictions of [Assignment: organization-defined numbers for lifetime minimum, lifetime maximum];</li>
<li>Prohibits password reuse for [Assignment: organization-defined number] generations; and</li>
<li>Allows the use of a temporary password for system logons with an immediate change to a permanent password.</li>
</ol>
@z

@x
#### Control Information
@y
#### Control Information
@z

@x
Responsible role(s) - Docker system
@y
Responsible role(s) - Docker system
@z

@x
<table>
<tr>
<th>Component</th>
<th>Implementation Status(es)</th>
<th>Control Origin(s)</th>
</tr>
<tr>
<td>Authentication and Authorization Service (eNZi)</td>
<td>none<br/></td>
<td>service provider hybrid<br/></td>
</tr>
</table>
@y
<table>
<tr>
<th>Component</th>
<th>Implementation Status(es)</th>
<th>Control Origin(s)</th>
</tr>
<tr>
<td>Authentication and Authorization Service (eNZi)</td>
<td>none<br/></td>
<td>service provider hybrid<br/></td>
</tr>
</table>
@z

@x
#### Implementation Details
@y
#### Implementation Details
@z

@x
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0d9ludq000caek8g">eNZi</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0d9ludq000caek8g">eNZi</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0d9ludq000caek8g" class="tab-pane fade in active">
An external directory service integrated with Docker Enterprise
Edition via LDAP can be configured to enforce minimum password
complexity requirements. Refer to your directory service&#39;s
documentation for configuring this.An external directory service integrated with Docker Enterprise
Edition via LDAP can be configured to enforce the requirement to
change at least one character when changing passwords according to the
requirements of this control. Refer to your directory service&#39;s
documentation for configuring this.An external directory service integrated with Docker Enterprise
Edition via LDAP can be configured to store and transmit
cryptographically protected passwords according to the requirements of
this control. Refer to your directory service&#39;s documentation for
configuring this.An external directory service integrated with Docker Enterprise
Edition via LDAP can be configured to enforce the required minimum and
maximum lifetime restrictions according to the requirements of this
control. Refer to your directory service&#39;s documentation for
configuring this.An external directory service integrated with Docker Enterprise
Edition via LDAP can be configured to enforce the required number of
generations before password reuse according to the requirements of
this control. Refer to your directory service&#39;s documentation for
configuring this.An external directory service integrated with Docker Enterprise
Edition via LDAP can be configured to enforce the requirement to
change initial/temporary passwords upon first login according to the
requirements of this control. Refer to your directory service&#39;s
documentation for configuring this.
</div>
</div>
@y
<div class="tab-content">
<div id="bb2j0d9ludq000caek8g" class="tab-pane fade in active">
An external directory service integrated with Docker Enterprise
Edition via LDAP can be configured to enforce minimum password
complexity requirements. Refer to your directory service&#39;s
documentation for configuring this.An external directory service integrated with Docker Enterprise
Edition via LDAP can be configured to enforce the requirement to
change at least one character when changing passwords according to the
requirements of this control. Refer to your directory service&#39;s
documentation for configuring this.An external directory service integrated with Docker Enterprise
Edition via LDAP can be configured to store and transmit
cryptographically protected passwords according to the requirements of
this control. Refer to your directory service&#39;s documentation for
configuring this.An external directory service integrated with Docker Enterprise
Edition via LDAP can be configured to enforce the required minimum and
maximum lifetime restrictions according to the requirements of this
control. Refer to your directory service&#39;s documentation for
configuring this.An external directory service integrated with Docker Enterprise
Edition via LDAP can be configured to enforce the required number of
generations before password reuse according to the requirements of
this control. Refer to your directory service&#39;s documentation for
configuring this.An external directory service integrated with Docker Enterprise
Edition via LDAP can be configured to enforce the requirement to
change initial/temporary passwords upon first login according to the
requirements of this control. Refer to your directory service&#39;s
documentation for configuring this.
</div>
</div>
@z

@x
### IA-5 (2) Pki-Based Authentication
@y
### IA-5 (2) Pki-Based Authentication
@z

@x
#### Description
@y
#### Description
@z

@x
The information system, for PKI-based authentication:
<ol type="a">
<li>Validates certifications by constructing and verifying a certification path to an accepted trust anchor including checking certificate status information;</li>
<li>Enforces authorized access to the corresponding private key;</li>
<li>Maps the authenticated identity to the account of the individual or group; and</li>
<li>Implements a local cache of revocation data to support path discovery and validation in case of inability to access revocation information via the network.</li>
</ol>
@y
The information system, for PKI-based authentication:
<ol type="a">
<li>Validates certifications by constructing and verifying a certification path to an accepted trust anchor including checking certificate status information;</li>
<li>Enforces authorized access to the corresponding private key;</li>
<li>Maps the authenticated identity to the account of the individual or group; and</li>
<li>Implements a local cache of revocation data to support path discovery and validation in case of inability to access revocation information via the network.</li>
</ol>
@z

@x
#### Control Information
@y
#### Control Information
@z

@x
Responsible role(s) - Docker system
@y
Responsible role(s) - Docker system
@z

@x
<table>
<tr>
<th>Component</th>
<th>Implementation Status(es)</th>
<th>Control Origin(s)</th>
</tr>
<tr>
<td>Docker Trusted Registry (DTR)</td>
<td>none<br/></td>
<td>Docker EE system<br/></td>
</tr>
<tr>
<td>Universal Control Plane (UCP)</td>
<td>none<br/></td>
<td>Docker EE system<br/></td>
</tr>
<tr>
<td>Authentication and Authorization Service (eNZi)</td>
<td>none<br/></td>
<td>Docker EE system<br/></td>
</tr>
</table>
@y
<table>
<tr>
<th>Component</th>
<th>Implementation Status(es)</th>
<th>Control Origin(s)</th>
</tr>
<tr>
<td>Docker Trusted Registry (DTR)</td>
<td>none<br/></td>
<td>Docker EE system<br/></td>
</tr>
<tr>
<td>Universal Control Plane (UCP)</td>
<td>none<br/></td>
<td>Docker EE system<br/></td>
</tr>
<tr>
<td>Authentication and Authorization Service (eNZi)</td>
<td>none<br/></td>
<td>Docker EE system<br/></td>
</tr>
</table>
@z

@x
#### Implementation Details
@y
#### Implementation Details
@z

@x
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0d9ludq000caek90">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d9ludq000caek9g">UCP</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d9ludq000caeka0">eNZi</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0d9ludq000caek90">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d9ludq000caek9g">UCP</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d9ludq000caeka0">eNZi</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0d9ludq000caek90" class="tab-pane fade in active">
Docker Trusted Registry includes a Docker volume which holds the root
key material for the DTR root CA that issues certificats. In addition
Universal Control Plane contains two, built-in root certificate
authorities. One CA is used for signing client bundles generated by
users. The other CA is used for TLS communication between UCP cluster
nodes. Should you choose to use certificates signed by an external CA,
in order to successfully authenticate in to the system, those
certificates must include a root CA public certificate, a service
certificate and any intermediate CA public certificates (in addition
to SANs for all addresses used to reach the UCP controller), and a
private key for the server. When adding DTR replicas, the UCP nodes on
which they&#39;re installed are authenticated to the cluster via the
appropriate built-in CA.Access to Docker Trusted Registry is only granted when a user has a
valid certificate bundle. This is enforced with the public/private key
pair included with the user&#39;s certificate bundle in Universal Control
Plane.Only after a client bundle has been generated or an existing public
key has been added for a particular user is that user able to execute
commands against Docker Trusted Registry. This bundle maps the
authenticated identity to that of the user&#39;s profile in Universal
Control Plane.When a client bundle has been generated or an existing public key has
been added for a particular Universal Control Plane user which
subsequently grants that user access to Docker Trusted Registry, it is
attached to that user&#39;s Universal Control Plane profile. Bundles/keys
can be revoked by an Administrator or the user themselves. The
cluster&#39;s internal certificates can also be revoked and updated.
Additional information can be found at the following resources:
@y
<div class="tab-content">
<div id="bb2j0d9ludq000caek90" class="tab-pane fade in active">
Docker Trusted Registry includes a Docker volume which holds the root
key material for the DTR root CA that issues certificats. In addition
Universal Control Plane contains two, built-in root certificate
authorities. One CA is used for signing client bundles generated by
users. The other CA is used for TLS communication between UCP cluster
nodes. Should you choose to use certificates signed by an external CA,
in order to successfully authenticate in to the system, those
certificates must include a root CA public certificate, a service
certificate and any intermediate CA public certificates (in addition
to SANs for all addresses used to reach the UCP controller), and a
private key for the server. When adding DTR replicas, the UCP nodes on
which they&#39;re installed are authenticated to the cluster via the
appropriate built-in CA.Access to Docker Trusted Registry is only granted when a user has a
valid certificate bundle. This is enforced with the public/private key
pair included with the user&#39;s certificate bundle in Universal Control
Plane.Only after a client bundle has been generated or an existing public
key has been added for a particular user is that user able to execute
commands against Docker Trusted Registry. This bundle maps the
authenticated identity to that of the user&#39;s profile in Universal
Control Plane.When a client bundle has been generated or an existing public key has
been added for a particular Universal Control Plane user which
subsequently grants that user access to Docker Trusted Registry, it is
attached to that user&#39;s Universal Control Plane profile. Bundles/keys
can be revoked by an Administrator or the user themselves. The
cluster&#39;s internal certificates can also be revoked and updated.
Additional information can be found at the following resources:
@z

@x
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/use-your-own-tls-certificates/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/use-your-own-tls-certificates/</a></li>
<li><a href="https://docs.docker.com/datacenter/dtr/2.3/guides/admin/configure/use-your-own-tls-certificates/">https://docs.docker.com/datacenter/dtr/2.3/guides/admin/configure/use-your-own-tls-certificates/</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/use-your-own-tls-certificates/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/use-your-own-tls-certificates/</a></li>
<li><a href="https://docs.docker.com/datacenter/dtr/2.3/guides/admin/configure/use-your-own-tls-certificates/">https://docs.docker.com/datacenter/dtr/2.3/guides/admin/configure/use-your-own-tls-certificates/</a></li>
</ul>
@z

@x
</div>
<div id="bb2j0d9ludq000caek9g" class="tab-pane fade">
Universal Control Plane contains two, built-in root certificate
authorities. One CA is used for signing client bundles generated by
users. The other CA is used for TLS communication between UCP cluster
nodes. Should you choose to use certificates signed by an external CA,
in order to successfully authenticate in to the system, those
certificates must include a root CA public certificate, a service
certificate and any intermediate CA public certificates (in addition
to SANs for all addresses used to reach the UCP controller), and a
private key for the server.Access to a Universal Control Plane cluster is only granted when a
user has a valid certificate bundle. This is enforced with the
public/private key pair included with the user&#39;s certificate bundle.Only after a client bundle has been generated or an existing public
key has been added for a particular user is that user able to execute
commands against the Universal Control Plane cluster. This bundle maps
the authenticated identity to that of the user.When a client bundle has been generated or an existing public key has
been added for a particular Universal Control Plane user, it is
attached to that user&#39;s profile. Bundles/keys can be revoked by an
Administrator or the user themselves. The cluster&#39;s internal
certificates can also be revoked and updated. Additional information
can be found at the following resources:
@y
</div>
<div id="bb2j0d9ludq000caek9g" class="tab-pane fade">
Universal Control Plane contains two, built-in root certificate
authorities. One CA is used for signing client bundles generated by
users. The other CA is used for TLS communication between UCP cluster
nodes. Should you choose to use certificates signed by an external CA,
in order to successfully authenticate in to the system, those
certificates must include a root CA public certificate, a service
certificate and any intermediate CA public certificates (in addition
to SANs for all addresses used to reach the UCP controller), and a
private key for the server.Access to a Universal Control Plane cluster is only granted when a
user has a valid certificate bundle. This is enforced with the
public/private key pair included with the user&#39;s certificate bundle.Only after a client bundle has been generated or an existing public
key has been added for a particular user is that user able to execute
commands against the Universal Control Plane cluster. This bundle maps
the authenticated identity to that of the user.When a client bundle has been generated or an existing public key has
been added for a particular Universal Control Plane user, it is
attached to that user&#39;s profile. Bundles/keys can be revoked by an
Administrator or the user themselves. The cluster&#39;s internal
certificates can also be revoked and updated. Additional information
can be found at the following resources:
@z

@x
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/use-your-own-tls-certificates/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/use-your-own-tls-certificates/</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/use-your-own-tls-certificates/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/use-your-own-tls-certificates/</a></li>
</ul>
@z

@x
</div>
<div id="bb2j0d9ludq000caeka0" class="tab-pane fade">
All users within a Docker Enterprise Edition cluster can create a
client certificate bundle for authenticating in to the cluster from
the Docker client tooling. When a user attempts to authenticate in to
the Docker cluster, the system validates the certificates per the
requirements of this control.All users within a Docker Enterprise Edition cluster can create a
client certificate bundle for authenticating in to the cluster from
the Docker client tooling. When a user attempts to authenticate in to
the Docker cluster, the system enforces authorized access to the
corresponding private key per the requirements of this control.All users within a Docker Enterprise Edition cluster can create a
client certificate bundle for authenticating in to the cluster from
the Docker client tooling. When a user attempts to authenticate in to
the Docker cluster, the system maps the authenticated identity to the
account of the individual or group per the requirements of this
control.All users within a Docker Enterprise Edition cluster can create a
client certificate bundle for authenticating in to the cluster from
the Docker client tooling. When a user attempts to authenticate in to
the Docker cluster, it is up to the underlying operating system
hosting Docker Enterprise Edition to ensure that it implements a local
cache of revocation data per the requirements of this control.
</div>
</div>
@y
</div>
<div id="bb2j0d9ludq000caeka0" class="tab-pane fade">
All users within a Docker Enterprise Edition cluster can create a
client certificate bundle for authenticating in to the cluster from
the Docker client tooling. When a user attempts to authenticate in to
the Docker cluster, the system validates the certificates per the
requirements of this control.All users within a Docker Enterprise Edition cluster can create a
client certificate bundle for authenticating in to the cluster from
the Docker client tooling. When a user attempts to authenticate in to
the Docker cluster, the system enforces authorized access to the
corresponding private key per the requirements of this control.All users within a Docker Enterprise Edition cluster can create a
client certificate bundle for authenticating in to the cluster from
the Docker client tooling. When a user attempts to authenticate in to
the Docker cluster, the system maps the authenticated identity to the
account of the individual or group per the requirements of this
control.All users within a Docker Enterprise Edition cluster can create a
client certificate bundle for authenticating in to the cluster from
the Docker client tooling. When a user attempts to authenticate in to
the Docker cluster, it is up to the underlying operating system
hosting Docker Enterprise Edition to ensure that it implements a local
cache of revocation data per the requirements of this control.
</div>
</div>
@z

@x
### IA-5 (3) In-Person Or Trusted Third-Party Registration
@y
### IA-5 (3) In-Person Or Trusted Third-Party Registration
@z

@x
#### Description
@y
#### Description
@z

@x
The organization requires that the registration process to receive [Assignment: organization-defined types of and/or specific authenticators] be conducted [Selection: in person; by a trusted third party] before [Assignment: organization-defined registration authority] with authorization by [Assignment: organization-defined personnel or roles].
@y
The organization requires that the registration process to receive [Assignment: organization-defined types of and/or specific authenticators] be conducted [Selection: in person; by a trusted third party] before [Assignment: organization-defined registration authority] with authorization by [Assignment: organization-defined personnel or roles].
@z

@x
#### Control Information
@y
#### Control Information
@z

@x
Responsible role(s) - Organization
@y
Responsible role(s) - Organization
@z

@x
### IA-5 (4) Automated Support  For Password Strength Determination
@y
### IA-5 (4) Automated Support  For Password Strength Determination
@z

@x
#### Description
@y
#### Description
@z

@x
The organization employs automated tools to determine if password authenticators are sufficiently strong to satisfy [Assignment: organization-defined requirements].
@y
The organization employs automated tools to determine if password authenticators are sufficiently strong to satisfy [Assignment: organization-defined requirements].
@z

@x
#### Control Information
@y
#### Control Information
@z

@x
Responsible role(s) - Docker system
@y
Responsible role(s) - Docker system
@z

@x
<table>
<tr>
<th>Component</th>
<th>Implementation Status(es)</th>
<th>Control Origin(s)</th>
</tr>
<tr>
<td>Authentication and Authorization Service (eNZi)</td>
<td>none<br/></td>
<td>service provider hybrid<br/></td>
</tr>
</table>
@y
<table>
<tr>
<th>Component</th>
<th>Implementation Status(es)</th>
<th>Control Origin(s)</th>
</tr>
<tr>
<td>Authentication and Authorization Service (eNZi)</td>
<td>none<br/></td>
<td>service provider hybrid<br/></td>
</tr>
</table>
@z

@x
#### Implementation Details
@y
#### Implementation Details
@z

@x
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0d9ludq000caekag">eNZi</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0d9ludq000caekag">eNZi</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0d9ludq000caekag" class="tab-pane fade in active">
The organization is responsible for meeting the requirements of this
control. To assist with meeting these requirements, an external
directory service integrated with Docker Enterprise Edition via LDAP can be
configured with automation to ensure that password authenticators meet
strength requirements as defined by this control. Refer to your
directory service&#39;s documentation for configuring this.
</div>
</div>
@y
<div class="tab-content">
<div id="bb2j0d9ludq000caekag" class="tab-pane fade in active">
The organization is responsible for meeting the requirements of this
control. To assist with meeting these requirements, an external
directory service integrated with Docker Enterprise Edition via LDAP can be
configured with automation to ensure that password authenticators meet
strength requirements as defined by this control. Refer to your
directory service&#39;s documentation for configuring this.
</div>
</div>
@z

@x
### IA-5 (5) Change Authenticators Prior To Delivery
@y
### IA-5 (5) Change Authenticators Prior To Delivery
@z

@x
#### Description
@y
#### Description
@z

@x
The organization requires developers/installers of information system components to provide unique authenticators or change default authenticators prior to delivery/installation.
@y
The organization requires developers/installers of information system components to provide unique authenticators or change default authenticators prior to delivery/installation.
@z

@x
#### Control Information
@y
#### Control Information
@z

@x
Responsible role(s) - Organization
@y
Responsible role(s) - Organization
@z

@x
### IA-5 (6) Protection Of Authenticators
@y
### IA-5 (6) Protection Of Authenticators
@z

@x
#### Description
@y
#### Description
@z

@x
The organization protects authenticators commensurate with the security category of the information to which use of the authenticator permits access.
@y
The organization protects authenticators commensurate with the security category of the information to which use of the authenticator permits access.
@z

@x
#### Control Information
@y
#### Control Information
@z

@x
Responsible role(s) - Docker system
@y
Responsible role(s) - Docker system
@z

@x
<table>
<tr>
<th>Component</th>
<th>Implementation Status(es)</th>
<th>Control Origin(s)</th>
</tr>
<tr>
<td>Authentication and Authorization Service (eNZi)</td>
<td>none<br/></td>
<td>service provider hybrid<br/></td>
</tr>
</table>
@y
<table>
<tr>
<th>Component</th>
<th>Implementation Status(es)</th>
<th>Control Origin(s)</th>
</tr>
<tr>
<td>Authentication and Authorization Service (eNZi)</td>
<td>none<br/></td>
<td>service provider hybrid<br/></td>
</tr>
</table>
@z

@x
#### Implementation Details
@y
#### Implementation Details
@z

@x
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0d9ludq000caekb0">eNZi</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0d9ludq000caekb0">eNZi</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0d9ludq000caekb0" class="tab-pane fade in active">
The organization is responsible for meeting the requirements of this
control. To assist with meeting these requirements, an external
directory service integrated with Docker Enterprise Edition via LDAP
can be configured to protect authenticators as required by this
control. Refer to your directory service&#39;s documentation for
configuring this.
</div>
</div>
@y
<div class="tab-content">
<div id="bb2j0d9ludq000caekb0" class="tab-pane fade in active">
The organization is responsible for meeting the requirements of this
control. To assist with meeting these requirements, an external
directory service integrated with Docker Enterprise Edition via LDAP
can be configured to protect authenticators as required by this
control. Refer to your directory service&#39;s documentation for
configuring this.
</div>
</div>
@z

@x
### IA-5 (7) No Embedded Unencrypted Static Authenticators
@y
### IA-5 (7) No Embedded Unencrypted Static Authenticators
@z

@x
#### Description
@y
#### Description
@z

@x
The organization ensures that unencrypted static authenticators are not embedded in applications or access scripts or stored on function keys.
@y
The organization ensures that unencrypted static authenticators are not embedded in applications or access scripts or stored on function keys.
@z

@x
#### Control Information
@y
#### Control Information
@z

@x
Responsible role(s) - Organization
@y
Responsible role(s) - Organization
@z

@x
### IA-5 (8) Multiple Information System Accounts
@y
### IA-5 (8) Multiple Information System Accounts
@z

@x
#### Description
@y
#### Description
@z

@x
The organization implements [Assignment: organization-defined security safeguards] to manage the risk of compromise due to individuals having accounts on multiple information systems.
@y
The organization implements [Assignment: organization-defined security safeguards] to manage the risk of compromise due to individuals having accounts on multiple information systems.
@z

@x
#### Control Information
@y
#### Control Information
@z

@x
Responsible role(s) - Organization
@y
Responsible role(s) - Organization
@z

@x
### IA-5 (9) Cross-Organization Credential Management
@y
### IA-5 (9) Cross-Organization Credential Management
@z

@x
#### Description
@y
#### Description
@z

@x
The organization coordinates with [Assignment: organization-defined external organizations] for cross-organization management of credentials.
@y
The organization coordinates with [Assignment: organization-defined external organizations] for cross-organization management of credentials.
@z

@x
#### Control Information
@y
#### Control Information
@z

@x
Responsible role(s) - Organization
@y
Responsible role(s) - Organization
@z

@x
### IA-5 (10) Dynamic Credential Association
@y
### IA-5 (10) Dynamic Credential Association
@z

@x
#### Description
@y
#### Description
@z

@x
The information system dynamically provisions identities.
@y
The information system dynamically provisions identities.
@z

@x
#### Control Information
@y
#### Control Information
@z

@x
Responsible role(s) - Organization
@y
Responsible role(s) - Organization
@z

@x
### IA-5 (11) Hardware Token-Based Authentication
@y
### IA-5 (11) Hardware Token-Based Authentication
@z

@x
#### Description
@y
#### Description
@z

@x
The information system, for hardware token-based authentication, employs mechanisms that satisfy [Assignment: organization-defined token quality requirements].
@y
The information system, for hardware token-based authentication, employs mechanisms that satisfy [Assignment: organization-defined token quality requirements].
@z

@x
#### Control Information
@y
#### Control Information
@z

@x
Responsible role(s) - Organization
@y
Responsible role(s) - Organization
@z

@x
### IA-5 (12) Biometric-Based Authentication
@y
### IA-5 (12) Biometric-Based Authentication
@z

@x
#### Description
@y
#### Description
@z

@x
The information system, for biometric-based authentication, employs mechanisms that satisfy [Assignment: organization-defined biometric quality requirements].
@y
The information system, for biometric-based authentication, employs mechanisms that satisfy [Assignment: organization-defined biometric quality requirements].
@z

@x
#### Control Information
@y
#### Control Information
@z

@x
Responsible role(s) - Organization
@y
Responsible role(s) - Organization
@z

@x
### IA-5 (13) Expiration Of Cached Authenticators
@y
### IA-5 (13) Expiration Of Cached Authenticators
@z

@x
#### Description
@y
#### Description
@z

@x
The information system prohibits the use of cached authenticators after [Assignment: organization-defined time period].
@y
The information system prohibits the use of cached authenticators after [Assignment: organization-defined time period].
@z

@x
#### Control Information
@y
#### Control Information
@z

@x
Responsible role(s) - Organization
@y
Responsible role(s) - Organization
@z

@x
### IA-5 (14) Managing Content Of Pki Trust Stores
@y
### IA-5 (14) Managing Content Of Pki Trust Stores
@z

@x
#### Description
@y
#### Description
@z

@x
The organization, for PKI-based authentication, employs a deliberate organization-wide methodology for managing the content of PKI trust stores installed across all platforms including networks, operating systems, browsers, and applications.
@y
The organization, for PKI-based authentication, employs a deliberate organization-wide methodology for managing the content of PKI trust stores installed across all platforms including networks, operating systems, browsers, and applications.
@z

@x
#### Control Information
@y
#### Control Information
@z

@x
Responsible role(s) - Organization
@y
Responsible role(s) - Organization
@z

@x
### IA-5 (15) Ficam-Approved Products And Services
@y
### IA-5 (15) Ficam-Approved Products And Services
@z

@x
#### Description
@y
#### Description
@z

@x
The organization uses only FICAM-approved path discovery and validation products and services.
@y
The organization uses only FICAM-approved path discovery and validation products and services.
@z

@x
#### Control Information
@y
#### Control Information
@z

@x
Responsible role(s) - Organization
@y
Responsible role(s) - Organization
@z

@x
## IA-6 Authenticator Feedback
@y
## IA-6 Authenticator Feedback
@z

@x
#### Description
@y
#### Description
@z

@x
The information system obscures feedback of authentication information during the authentication process to protect the information from possible exploitation/use by unauthorized individuals.
@y
The information system obscures feedback of authentication information during the authentication process to protect the information from possible exploitation/use by unauthorized individuals.
@z

@x
#### Control Information
@y
#### Control Information
@z

@x
Responsible role(s) - Docker system
@y
Responsible role(s) - Docker system
@z

@x
<table>
<tr>
<th>Component</th>
<th>Implementation Status(es)</th>
<th>Control Origin(s)</th>
</tr>
<tr>
<td>Docker Trusted Registry (DTR)</td>
<td>none<br/></td>
<td>Docker EE system<br/></td>
</tr>
<tr>
<td>Universal Control Plane (UCP)</td>
<td>none<br/></td>
<td>Docker EE system<br/></td>
</tr>
</table>
@y
<table>
<tr>
<th>Component</th>
<th>Implementation Status(es)</th>
<th>Control Origin(s)</th>
</tr>
<tr>
<td>Docker Trusted Registry (DTR)</td>
<td>none<br/></td>
<td>Docker EE system<br/></td>
</tr>
<tr>
<td>Universal Control Plane (UCP)</td>
<td>none<br/></td>
<td>Docker EE system<br/></td>
</tr>
</table>
@z

@x
#### Implementation Details
@y
#### Implementation Details
@z

@x
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0d9ludq000caekbg">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d9ludq000caekc0">UCP</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0d9ludq000caekbg">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d9ludq000caekc0">UCP</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0d9ludq000caekbg" class="tab-pane fade in active">
Docker Trusted Registry obscures all feedback of authentication
information during the authentication process. This includes both
authentication via the web UI and the CLI.
</div>
<div id="bb2j0d9ludq000caekc0" class="tab-pane fade">
Universal Control Plane obscures all feedback of authentication
information during the authentication process. This includes both
authentication via the web UI and the CLI.
</div>
</div>
@y
<div class="tab-content">
<div id="bb2j0d9ludq000caekbg" class="tab-pane fade in active">
Docker Trusted Registry obscures all feedback of authentication
information during the authentication process. This includes both
authentication via the web UI and the CLI.
</div>
<div id="bb2j0d9ludq000caekc0" class="tab-pane fade">
Universal Control Plane obscures all feedback of authentication
information during the authentication process. This includes both
authentication via the web UI and the CLI.
</div>
</div>
@z

@x
## IA-7 Cryptographic Module Authentication
@y
## IA-7 Cryptographic Module Authentication
@z

@x
#### Description
@y
#### Description
@z

@x
The information system implements mechanisms for authentication to a cryptographic module that meet the requirements of applicable federal laws, Executive Orders, directives, policies, regulations, standards, and guidance for such authentication.
@y
The information system implements mechanisms for authentication to a cryptographic module that meet the requirements of applicable federal laws, Executive Orders, directives, policies, regulations, standards, and guidance for such authentication.
@z

@x
#### Control Information
@y
#### Control Information
@z

@x
Responsible role(s) - Docker system
@y
Responsible role(s) - Docker system
@z

@x
<table>
<tr>
<th>Component</th>
<th>Implementation Status(es)</th>
<th>Control Origin(s)</th>
</tr>
<tr>
<td>Docker Trusted Registry (DTR)</td>
<td>none<br/></td>
<td>Docker EE system<br/></td>
</tr>
<tr>
<td>Universal Control Plane (UCP)</td>
<td>none<br/></td>
<td>Docker EE system<br/></td>
</tr>
</table>
@y
<table>
<tr>
<th>Component</th>
<th>Implementation Status(es)</th>
<th>Control Origin(s)</th>
</tr>
<tr>
<td>Docker Trusted Registry (DTR)</td>
<td>none<br/></td>
<td>Docker EE system<br/></td>
</tr>
<tr>
<td>Universal Control Plane (UCP)</td>
<td>none<br/></td>
<td>Docker EE system<br/></td>
</tr>
</table>
@z

@x
#### Implementation Details
@y
#### Implementation Details
@z

@x
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0d9ludq000caekcg">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d9ludq000caekd0">UCP</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0d9ludq000caekcg">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d9ludq000caekd0">UCP</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0d9ludq000caekcg" class="tab-pane fade in active">
All access to Docker Trusted Registry is protected with Transport
Layer Security (TLS) 1.2 with the AES-GCM cipher. This includes both
SSH access to the individual UCP nodes and CLI-/web-based access to
the UCP management functions with mutual TLS and HTTPS respectively.
</div>
<div id="bb2j0d9ludq000caekd0" class="tab-pane fade">
All access to Universal Control Plane is protected with Transport
Layer Security (TLS) 1.2 with the AES GCM cipher. This includes both
SSH access to the individual UCP nodes and CLI-/web-based access to
the UCP management functions with mutual TLS and HTTPS respectively.
</div>
</div>
@y
<div class="tab-content">
<div id="bb2j0d9ludq000caekcg" class="tab-pane fade in active">
All access to Docker Trusted Registry is protected with Transport
Layer Security (TLS) 1.2 with the AES-GCM cipher. This includes both
SSH access to the individual UCP nodes and CLI-/web-based access to
the UCP management functions with mutual TLS and HTTPS respectively.
</div>
<div id="bb2j0d9ludq000caekd0" class="tab-pane fade">
All access to Universal Control Plane is protected with Transport
Layer Security (TLS) 1.2 with the AES GCM cipher. This includes both
SSH access to the individual UCP nodes and CLI-/web-based access to
the UCP management functions with mutual TLS and HTTPS respectively.
</div>
</div>
@z

@x
## IA-8 Identification And Authentication (Non-Organizational Users)
@y
## IA-8 Identification And Authentication (Non-Organizational Users)
@z

@x
#### Description
@y
#### Description
@z

@x
The information system uniquely identifies and authenticates non-organizational users (or processes acting on behalf of non-organizational users).
@y
The information system uniquely identifies and authenticates non-organizational users (or processes acting on behalf of non-organizational users).
@z

@x
#### Control Information
@y
#### Control Information
@z

@x
Responsible role(s) - Docker system
@y
Responsible role(s) - Docker system
@z

@x
<table>
<tr>
<th>Component</th>
<th>Implementation Status(es)</th>
<th>Control Origin(s)</th>
</tr>
<tr>
<td>Docker Trusted Registry (DTR)</td>
<td>none<br/></td>
<td>Docker EE system<br/></td>
</tr>
<tr>
<td>Universal Control Plane (UCP)</td>
<td>none<br/></td>
<td>Docker EE system<br/></td>
</tr>
</table>
@y
<table>
<tr>
<th>Component</th>
<th>Implementation Status(es)</th>
<th>Control Origin(s)</th>
</tr>
<tr>
<td>Docker Trusted Registry (DTR)</td>
<td>none<br/></td>
<td>Docker EE system<br/></td>
</tr>
<tr>
<td>Universal Control Plane (UCP)</td>
<td>none<br/></td>
<td>Docker EE system<br/></td>
</tr>
</table>
@z

@x
#### Implementation Details
@y
#### Implementation Details
@z

@x
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0d9ludq000caekdg">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d9ludq000caeke0">UCP</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0d9ludq000caekdg">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d9ludq000caeke0">UCP</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0d9ludq000caekdg" class="tab-pane fade in active">
Users managed by Docker Trusted Registry can be grouped per the
requirements of the organization and as defined by this control. This
can include groupings for non-organizational users.
</div>
<div id="bb2j0d9ludq000caeke0" class="tab-pane fade">
Users managed by Universal Control Plane can be grouped per the
requirements of the organization and as defined by this control. This
can include groupings for non-organizational users.
</div>
</div>
@y
<div class="tab-content">
<div id="bb2j0d9ludq000caekdg" class="tab-pane fade in active">
Users managed by Docker Trusted Registry can be grouped per the
requirements of the organization and as defined by this control. This
can include groupings for non-organizational users.
</div>
<div id="bb2j0d9ludq000caeke0" class="tab-pane fade">
Users managed by Universal Control Plane can be grouped per the
requirements of the organization and as defined by this control. This
can include groupings for non-organizational users.
</div>
</div>
@z

@x
### IA-8 (1) Acceptance Of Piv Credentials From Other Agencies
@y
### IA-8 (1) Acceptance Of Piv Credentials From Other Agencies
@z

@x
#### Description
@y
#### Description
@z

@x
The information system accepts and electronically verifies Personal Identity Verification (PIV) credentials from other federal agencies.
@y
The information system accepts and electronically verifies Personal Identity Verification (PIV) credentials from other federal agencies.
@z

@x
#### Control Information
@y
#### Control Information
@z

@x
Responsible role(s) - Organization
@y
Responsible role(s) - Organization
@z

@x
### IA-8 (2) Acceptance Of Third-Party Credentials
@y
### IA-8 (2) Acceptance Of Third-Party Credentials
@z

@x
#### Description
@y
#### Description
@z

@x
The information system accepts only FICAM-approved third-party credentials.
@y
The information system accepts only FICAM-approved third-party credentials.
@z

@x
#### Control Information
@y
#### Control Information
@z

@x
Responsible role(s) - Docker system
@y
Responsible role(s) - Docker system
@z

@x
<table>
<tr>
<th>Component</th>
<th>Implementation Status(es)</th>
<th>Control Origin(s)</th>
</tr>
<tr>
<td>Authentication and Authorization Service (eNZi)</td>
<td>none<br/></td>
<td>service provider hybrid<br/></td>
</tr>
</table>
@y
<table>
<tr>
<th>Component</th>
<th>Implementation Status(es)</th>
<th>Control Origin(s)</th>
</tr>
<tr>
<td>Authentication and Authorization Service (eNZi)</td>
<td>none<br/></td>
<td>service provider hybrid<br/></td>
</tr>
</table>
@z

@x
#### Implementation Details
@y
#### Implementation Details
@z

@x
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0d9ludq000caekeg">eNZi</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0d9ludq000caekeg">eNZi</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0d9ludq000caekeg" class="tab-pane fade in active">
An external directory service integrated with Docker Enterprise
Edition via LDAP can be configured to meet the FICAM requirements as
indicated by this control. Refer to your directory service&#39;s
documentation for configuring this.
</div>
</div>
@y
<div class="tab-content">
<div id="bb2j0d9ludq000caekeg" class="tab-pane fade in active">
An external directory service integrated with Docker Enterprise
Edition via LDAP can be configured to meet the FICAM requirements as
indicated by this control. Refer to your directory service&#39;s
documentation for configuring this.
</div>
</div>
@z

@x
### IA-8 (3) Use Of Ficam-Approved Products
@y
### IA-8 (3) Use Of Ficam-Approved Products
@z

@x
#### Description
@y
#### Description
@z

@x
The organization employs only FICAM-approved information system components in [Assignment: organization-defined information systems] to accept third-party credentials.
@y
The organization employs only FICAM-approved information system components in [Assignment: organization-defined information systems] to accept third-party credentials.
@z

@x
#### Control Information
@y
#### Control Information
@z

@x
Responsible role(s) - Docker system
@y
Responsible role(s) - Docker system
@z

@x
<table>
<tr>
<th>Component</th>
<th>Implementation Status(es)</th>
<th>Control Origin(s)</th>
</tr>
<tr>
<td>Authentication and Authorization Service (eNZi)</td>
<td>none<br/></td>
<td>service provider hybrid<br/></td>
</tr>
</table>
@y
<table>
<tr>
<th>Component</th>
<th>Implementation Status(es)</th>
<th>Control Origin(s)</th>
</tr>
<tr>
<td>Authentication and Authorization Service (eNZi)</td>
<td>none<br/></td>
<td>service provider hybrid<br/></td>
</tr>
</table>
@z

@x
#### Implementation Details
@y
#### Implementation Details
@z

@x
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0d9ludq000caekf0">eNZi</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0d9ludq000caekf0">eNZi</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0d9ludq000caekf0" class="tab-pane fade in active">
The organization is responsible for meeting the requirements of this
control. To assist with meeting these requirements, an external
directory service integrated with Docker Enterprise Edition via LDAP
can be configured to meet the FICAM requirements as indicated by this
control. Refer to your directory service&#39;s documentation for
configuring this.
</div>
</div>
@y
<div class="tab-content">
<div id="bb2j0d9ludq000caekf0" class="tab-pane fade in active">
The organization is responsible for meeting the requirements of this
control. To assist with meeting these requirements, an external
directory service integrated with Docker Enterprise Edition via LDAP
can be configured to meet the FICAM requirements as indicated by this
control. Refer to your directory service&#39;s documentation for
configuring this.
</div>
</div>
@z

@x
### IA-8 (4) Use Of Ficam-Issued Profiles
@y
### IA-8 (4) Use Of Ficam-Issued Profiles
@z

@x
#### Description
@y
#### Description
@z

@x
The information system conforms to FICAM-issued profiles.
@y
The information system conforms to FICAM-issued profiles.
@z

@x
#### Control Information
@y
#### Control Information
@z

@x
Responsible role(s) - Docker system
@y
Responsible role(s) - Docker system
@z

@x
<table>
<tr>
<th>Component</th>
<th>Implementation Status(es)</th>
<th>Control Origin(s)</th>
</tr>
<tr>
<td>Authentication and Authorization Service (eNZi)</td>
<td>none<br/></td>
<td>service provider hybrid<br/></td>
</tr>
</table>
@y
<table>
<tr>
<th>Component</th>
<th>Implementation Status(es)</th>
<th>Control Origin(s)</th>
</tr>
<tr>
<td>Authentication and Authorization Service (eNZi)</td>
<td>none<br/></td>
<td>service provider hybrid<br/></td>
</tr>
</table>
@z

@x
#### Implementation Details
@y
#### Implementation Details
@z

@x
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0d9ludq000caekfg">eNZi</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0d9ludq000caekfg">eNZi</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0d9ludq000caekfg" class="tab-pane fade in active">
The organization is responsible for meeting the requirements of this
control. To assist with meeting these requirements, an external
directory service integrated with Docker Enterprise Edition via LDAP
can be configured to meet the FICAM requirements as indicated by this
control. Refer to your directory service&#39;s documentation for
configuring this.
</div>
</div>
@y
<div class="tab-content">
<div id="bb2j0d9ludq000caekfg" class="tab-pane fade in active">
The organization is responsible for meeting the requirements of this
control. To assist with meeting these requirements, an external
directory service integrated with Docker Enterprise Edition via LDAP
can be configured to meet the FICAM requirements as indicated by this
control. Refer to your directory service&#39;s documentation for
configuring this.
</div>
</div>
@z

@x
### IA-8 (5) Acceptance Of Piv-I Credentials
@y
### IA-8 (5) Acceptance Of Piv-I Credentials
@z

@x
#### Description
@y
#### Description
@z

@x
The information system accepts and electronically verifies Personal Identity Verification-I (PIV-I) credentials.
@y
The information system accepts and electronically verifies Personal Identity Verification-I (PIV-I) credentials.
@z

@x
#### Control Information
@y
#### Control Information
@z

@x
Responsible role(s) - Organization
@y
Responsible role(s) - Organization
@z

@x
## IA-9 Service Identification And Authentication
@y
## IA-9 Service Identification And Authentication
@z

@x
#### Description
@y
#### Description
@z

@x
The organization identifies and authenticates [Assignment: organization-defined information system services] using [Assignment: organization-defined security safeguards].
@y
The organization identifies and authenticates [Assignment: organization-defined information system services] using [Assignment: organization-defined security safeguards].
@z

@x
#### Control Information
@y
#### Control Information
@z

@x
Responsible role(s) - Organization
@y
Responsible role(s) - Organization
@z

@x
### IA-9 (1) Information Exchange
@y
### IA-9 (1) Information Exchange
@z

@x
#### Description
@y
#### Description
@z

@x
The organization ensures that service providers receive, validate, and transmit identification and authentication information.
@y
The organization ensures that service providers receive, validate, and transmit identification and authentication information.
@z

@x
#### Control Information
@y
#### Control Information
@z

@x
Responsible role(s) - Organization
@y
Responsible role(s) - Organization
@z

@x
### IA-9 (2) Transmission Of Decisions
@y
### IA-9 (2) Transmission Of Decisions
@z

@x
#### Description
@y
#### Description
@z

@x
The organization ensures that identification and authentication decisions are transmitted between [Assignment: organization-defined services] consistent with organizational policies.
@y
The organization ensures that identification and authentication decisions are transmitted between [Assignment: organization-defined services] consistent with organizational policies.
@z

@x
#### Control Information
@y
#### Control Information
@z

@x
Responsible role(s) - Organization
@y
Responsible role(s) - Organization
@z

@x
## IA-10 Adaptive Identification And Authentication
@y
## IA-10 Adaptive Identification And Authentication
@z

@x
#### Description
@y
#### Description
@z

@x
The organization requires that individuals accessing the information system employ [Assignment: organization-defined supplemental authentication techniques or mechanisms] under specific [Assignment: organization-defined circumstances or situations].
@y
The organization requires that individuals accessing the information system employ [Assignment: organization-defined supplemental authentication techniques or mechanisms] under specific [Assignment: organization-defined circumstances or situations].
@z

@x
#### Control Information
@y
#### Control Information
@z

@x
Responsible role(s) - Organization
@y
Responsible role(s) - Organization
@z

@x
## IA-11 Re-Authentication
@y
## IA-11 Re-Authentication
@z

@x
#### Description
@y
#### Description
@z

@x
The organization requires users and devices to re-authenticate when [Assignment: organization-defined circumstances or situations requiring re-authentication].
@y
The organization requires users and devices to re-authenticate when [Assignment: organization-defined circumstances or situations requiring re-authentication].
@z

@x
#### Control Information
@y
#### Control Information
@z

@x
Responsible role(s) - Organization
@y
Responsible role(s) - Organization
@z
