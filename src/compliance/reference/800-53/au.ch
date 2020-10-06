%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: "Audit and accountability"
description: "Audit and accountability reference"
keywords: "standards, compliance, security, 800-53, Audit and accountability"
---
@y
---
title: "Audit and accountability"
description: "Audit and accountability reference"
keywords: "standards, compliance, security, 800-53, Audit and accountability"
---
@z

@x
## AU-1 Audit And Accountability Policy And Procedures
@y
## AU-1 Audit And Accountability Policy And Procedures
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
<li>An audit and accountability policy that addresses purpose, scope, roles, responsibilities, management commitment, coordination among organizational entities, and compliance; and</li>
<li>Procedures to facilitate the implementation of the audit and accountability policy and associated audit and accountability controls; and</li>
</ol>
<li>Reviews and updates the current:</li>
@y
<ol type="1">
<li>An audit and accountability policy that addresses purpose, scope, roles, responsibilities, management commitment, coordination among organizational entities, and compliance; and</li>
<li>Procedures to facilitate the implementation of the audit and accountability policy and associated audit and accountability controls; and</li>
</ol>
<li>Reviews and updates the current:</li>
@z

@x
<ol type="1">
<li>Audit and accountability policy [Assignment: organization-defined frequency]; and</li>
<li>Audit and accountability procedures [Assignment: organization-defined frequency].</li>
</ol>
</ol>
@y
<ol type="1">
<li>Audit and accountability policy [Assignment: organization-defined frequency]; and</li>
<li>Audit and accountability procedures [Assignment: organization-defined frequency].</li>
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
## AU-2 Audit Events
@y
## AU-2 Audit Events
@z

@x
#### Description
@y
#### Description
@z

@x
The organization:
<ol type="a">
<li>Determines that the information system is capable of auditing the following events: [Assignment: organization-defined auditable events];</li>
<li>Coordinates the security audit function with other organizational entities requiring audit-related information to enhance mutual support and to help guide the selection of auditable events;</li>
<li>Provides a rationale for why the auditable events are deemed to be adequate to support after-the-fact investigations of security incidents; and</li>
<li>Determines that the following events are to be audited within the information system: [Assignment: organization-defined audited events (the subset of the auditable events defined in AU-2 a.) along with the frequency of (or situation requiring) auditing for each identified event].</li>
</ol>
@y
The organization:
<ol type="a">
<li>Determines that the information system is capable of auditing the following events: [Assignment: organization-defined auditable events];</li>
<li>Coordinates the security audit function with other organizational entities requiring audit-related information to enhance mutual support and to help guide the selection of auditable events;</li>
<li>Provides a rationale for why the auditable events are deemed to be adequate to support after-the-fact investigations of security incidents; and</li>
<li>Determines that the following events are to be audited within the information system: [Assignment: organization-defined audited events (the subset of the auditable events defined in AU-2 a.) along with the frequency of (or situation requiring) auditing for each identified event].</li>
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
<td>Docker EE system<br/>service provider corporate<br/>service provider hybrid<br/>shared<br/></td>
</tr>
<tr>
<td>Docker Enterprise Edition Engine</td>
<td>none<br/></td>
<td>service provider hybrid<br/>shared<br/></td>
</tr>
<tr>
<td>Universal Control Plane (UCP)</td>
<td>none<br/></td>
<td>service provider hybrid<br/>shared<br/></td>
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
<td>Docker EE system<br/>service provider corporate<br/>service provider hybrid<br/>shared<br/></td>
</tr>
<tr>
<td>Docker Enterprise Edition Engine</td>
<td>none<br/></td>
<td>service provider hybrid<br/>shared<br/></td>
</tr>
<tr>
<td>Universal Control Plane (UCP)</td>
<td>none<br/></td>
<td>service provider hybrid<br/>shared<br/></td>
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
<li class="active"><a data-toggle="tab" data-target="#bb2j0d1ludq000caeilg">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caeim0">Engine</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caeimg">UCP</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0d1ludq000caeilg">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caeim0">Engine</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caeimg">UCP</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0d1ludq000caeilg" class="tab-pane fade in active">
All of the event types indicated by this control are logged by a
combination of the backend ucp-controller service within Universal
Control Plane and the backend services that make up Docker Trusted
Registry. Additional documentation can be found at the following
resource:
@y
<div class="tab-content">
<div id="bb2j0d1ludq000caeilg" class="tab-pane fade in active">
All of the event types indicated by this control are logged by a
combination of the backend ucp-controller service within Universal
Control Plane and the backend services that make up Docker Trusted
Registry. Additional documentation can be found at the following
resource:
@z

@x
<ul>
<li><a href="https://docs.docker.com/datacenter/dtr/2.3/guides/admin/monitor-and-troubleshoot/">https://docs.docker.com/datacenter/dtr/2.3/guides/admin/monitor-and-troubleshoot/</a></li>
<li><a href="https://docs.docker.com/datacenter/dtr/2.3/guides/architecture/#dtr-internal-components">https://docs.docker.com/datacenter/dtr/2.3/guides/architecture/#dtr-internal-components</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/architecture/#ucp-internal-components">https://docs.docker.com/datacenter/ucp/2.2/guides/architecture/#ucp-internal-components</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/datacenter/dtr/2.3/guides/admin/monitor-and-troubleshoot/">https://docs.docker.com/datacenter/dtr/2.3/guides/admin/monitor-and-troubleshoot/</a></li>
<li><a href="https://docs.docker.com/datacenter/dtr/2.3/guides/architecture/#dtr-internal-components">https://docs.docker.com/datacenter/dtr/2.3/guides/architecture/#dtr-internal-components</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/architecture/#ucp-internal-components">https://docs.docker.com/datacenter/ucp/2.2/guides/architecture/#ucp-internal-components</a></li>
</ul>
@z

@x
</div>
<div id="bb2j0d1ludq000caeim0" class="tab-pane fade">
Both Universal Control Plane and Docker Trusted Registry backend
service containers, all of which reside on Docker Enterprise Edition,
log all of the event types indicated by this control (as explained by
their component narratives). These and other application containers
that reside on Docker Enterprise Edition can be configured to log data
via an appropriate Docker logging driver. Instructions for configuring
logging drivers can be found at the following resource:
@y
</div>
<div id="bb2j0d1ludq000caeim0" class="tab-pane fade">
Both Universal Control Plane and Docker Trusted Registry backend
service containers, all of which reside on Docker Enterprise Edition,
log all of the event types indicated by this control (as explained by
their component narratives). These and other application containers
that reside on Docker Enterprise Edition can be configured to log data
via an appropriate Docker logging driver. Instructions for configuring
logging drivers can be found at the following resource:
@z

@x
<ul>
<li><a href="https://docs.docker.com/engine/admin/logging/overview/">https://docs.docker.com/engine/admin/logging/overview/</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/engine/admin/logging/overview/">https://docs.docker.com/engine/admin/logging/overview/</a></li>
</ul>
@z

@x
</div>
<div id="bb2j0d1ludq000caeimg" class="tab-pane fade">
All of the event types indicated by this control are logged by the
backend ucp-controller service within Universal Control Plane. In
addition, each container created on a Universal Control Plane cluster
logs event data. Supporting documentation for configuring UCP logging
can be referenced at the following resources:
@y
</div>
<div id="bb2j0d1ludq000caeimg" class="tab-pane fade">
All of the event types indicated by this control are logged by the
backend ucp-controller service within Universal Control Plane. In
addition, each container created on a Universal Control Plane cluster
logs event data. Supporting documentation for configuring UCP logging
can be referenced at the following resources:
@z

@x
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/</a></li>
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
### AU-2 (3) Reviews And Updates
@y
### AU-2 (3) Reviews And Updates
@z

@x
#### Description
@y
#### Description
@z

@x
The organization reviews and updates the audited events [Assignment: organization-defined frequency].
@y
The organization reviews and updates the audited events [Assignment: organization-defined frequency].
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
## AU-3 Content Of Audit Records
@y
## AU-3 Content Of Audit Records
@z

@x
#### Description
@y
#### Description
@z

@x
The information system generates audit records containing information that establishes what type of event occurred, when the event occurred, where the event occurred, the source of the event, the outcome of the event, and the identity of any individuals or subjects associated with the event.
@y
The information system generates audit records containing information that establishes what type of event occurred, when the event occurred, where the event occurred, the source of the event, the outcome of the event, and the identity of any individuals or subjects associated with the event.
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
<td>Docker EE system<br/>shared<br/></td>
</tr>
<tr>
<td>Docker Enterprise Edition Engine</td>
<td>none<br/></td>
<td>Docker EE system<br/>shared<br/></td>
</tr>
<tr>
<td>Universal Control Plane (UCP)</td>
<td>none<br/></td>
<td>Docker EE system<br/>shared<br/></td>
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
<td>Docker Trusted Registry (DTR)</td>
<td>none<br/></td>
<td>Docker EE system<br/>shared<br/></td>
</tr>
<tr>
<td>Docker Enterprise Edition Engine</td>
<td>none<br/></td>
<td>Docker EE system<br/>shared<br/></td>
</tr>
<tr>
<td>Universal Control Plane (UCP)</td>
<td>none<br/></td>
<td>Docker EE system<br/>shared<br/></td>
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
<li class="active"><a data-toggle="tab" data-target="#bb2j0d1ludq000caein0">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caeing">Engine</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caeio0">UCP</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caeiog">eNZi</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0d1ludq000caein0">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caeing">Engine</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caeio0">UCP</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caeiog">eNZi</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0d1ludq000caein0" class="tab-pane fade in active">
Docker Trusted Registry generates all of the audit record information
indicated by this control. A sample audit event has been provided
below:
@y
<div class="tab-content">
<div id="bb2j0d1ludq000caein0" class="tab-pane fade in active">
Docker Trusted Registry generates all of the audit record information
indicated by this control. A sample audit event has been provided
below:
@z

@x
{&#34;level&#34;:&#34;info&#34;,&#34;license_key&#34;:&#34;123456789123456789123456789&#34;,&#34;msg&#34;:&#34;eNZi:Password
based auth
suceeded&#34;,&#34;remote_addr&#34;:&#34;192.168.33.1:55905&#34;,&#34;time&#34;:&#34;2016-11-09T22:41:01Z&#34;,&#34;type&#34;:&#34;auth
ok&#34;,&#34;username&#34;:&#34;dockeruser&#34;}
</div>
<div id="bb2j0d1ludq000caeing" class="tab-pane fade">
Both Universal Control Plane and Docker Trusted Registry are
pre-configured to take advantage of Docker Enterprise Edition&#39;s
built-in logging mechanisms. A sample audit event recorded by Docker
Enterprise Edition has been provided below:
@y
{&#34;level&#34;:&#34;info&#34;,&#34;license_key&#34;:&#34;123456789123456789123456789&#34;,&#34;msg&#34;:&#34;eNZi:Password
based auth
suceeded&#34;,&#34;remote_addr&#34;:&#34;192.168.33.1:55905&#34;,&#34;time&#34;:&#34;2016-11-09T22:41:01Z&#34;,&#34;type&#34;:&#34;auth
ok&#34;,&#34;username&#34;:&#34;dockeruser&#34;}
</div>
<div id="bb2j0d1ludq000caeing" class="tab-pane fade">
Both Universal Control Plane and Docker Trusted Registry are
pre-configured to take advantage of Docker Enterprise Edition&#39;s
built-in logging mechanisms. A sample audit event recorded by Docker
Enterprise Edition has been provided below:
@z

@x
{&#34;level&#34;:&#34;info&#34;,&#34;license_key&#34;:&#34;123456789123456789123456789&#34;,&#34;msg&#34;:&#34;eNZi:Password
based auth
suceeded&#34;,&#34;remote_addr&#34;:&#34;192.168.33.1:55905&#34;,&#34;time&#34;:&#34;2016-11-09T22:41:01Z&#34;,&#34;type&#34;:&#34;auth
ok&#34;,&#34;username&#34;:&#34;dockeruser&#34;}
@y
{&#34;level&#34;:&#34;info&#34;,&#34;license_key&#34;:&#34;123456789123456789123456789&#34;,&#34;msg&#34;:&#34;eNZi:Password
based auth
suceeded&#34;,&#34;remote_addr&#34;:&#34;192.168.33.1:55905&#34;,&#34;time&#34;:&#34;2016-11-09T22:41:01Z&#34;,&#34;type&#34;:&#34;auth
ok&#34;,&#34;username&#34;:&#34;dockeruser&#34;}
@z

@x
Additional documentation can be referenced at the following resource:
@y
Additional documentation can be referenced at the following resource:
@z

@x
<ul>
<li><a href="https://docs.docker.com/engine/admin/logging/overview/">https://docs.docker.com/engine/admin/logging/overview/</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/engine/admin/logging/overview/">https://docs.docker.com/engine/admin/logging/overview/</a></li>
</ul>
@z

@x
</div>
<div id="bb2j0d1ludq000caeio0" class="tab-pane fade">
Universal Control Plane generates all of the audit record information
indicated by this control. A sample audit event has been provided
below:
@y
</div>
<div id="bb2j0d1ludq000caeio0" class="tab-pane fade">
Universal Control Plane generates all of the audit record information
indicated by this control. A sample audit event has been provided
below:
@z

@x
{&#34;level&#34;:&#34;info&#34;,&#34;license_key&#34;:&#34;123456789123456789123456789&#34;,&#34;msg&#34;:&#34;eNZi:Password
based auth
suceeded&#34;,&#34;remote_addr&#34;:&#34;192.168.33.1:55905&#34;,&#34;time&#34;:&#34;2016-11-09T22:41:01Z&#34;,&#34;type&#34;:&#34;auth
ok&#34;,&#34;username&#34;:&#34;dockeruser&#34;}
</div>
<div id="bb2j0d1ludq000caeiog" class="tab-pane fade">
Docker Enterprise Edition generates all of the audit record
information indicated by this control. A sample audit event has been
provided below:
@y
{&#34;level&#34;:&#34;info&#34;,&#34;license_key&#34;:&#34;123456789123456789123456789&#34;,&#34;msg&#34;:&#34;eNZi:Password
based auth
suceeded&#34;,&#34;remote_addr&#34;:&#34;192.168.33.1:55905&#34;,&#34;time&#34;:&#34;2016-11-09T22:41:01Z&#34;,&#34;type&#34;:&#34;auth
ok&#34;,&#34;username&#34;:&#34;dockeruser&#34;}
</div>
<div id="bb2j0d1ludq000caeiog" class="tab-pane fade">
Docker Enterprise Edition generates all of the audit record
information indicated by this control. A sample audit event has been
provided below:
@z

@x
{&#34;level&#34;:&#34;info&#34;,&#34;license_key&#34;:&#34;123456789123456789123456789&#34;,&#34;msg&#34;:&#34;eNZi:Password
based auth
suceeded&#34;,&#34;remote_addr&#34;:&#34;192.168.33.1:55905&#34;,&#34;time&#34;:&#34;2016-11-09T22:41:01Z&#34;,&#34;type&#34;:&#34;auth
ok&#34;,&#34;username&#34;:&#34;dockeruser&#34;}
</div>
</div>
@y
{&#34;level&#34;:&#34;info&#34;,&#34;license_key&#34;:&#34;123456789123456789123456789&#34;,&#34;msg&#34;:&#34;eNZi:Password
based auth
suceeded&#34;,&#34;remote_addr&#34;:&#34;192.168.33.1:55905&#34;,&#34;time&#34;:&#34;2016-11-09T22:41:01Z&#34;,&#34;type&#34;:&#34;auth
ok&#34;,&#34;username&#34;:&#34;dockeruser&#34;}
</div>
</div>
@z

@x
### AU-3 (1) Additional Audit Information
@y
### AU-3 (1) Additional Audit Information
@z

@x
#### Description
@y
#### Description
@z

@x
The information system generates audit records containing the following additional information: [Assignment: organization-defined additional, more detailed information].
@y
The information system generates audit records containing the following additional information: [Assignment: organization-defined additional, more detailed information].
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
<td>Docker EE system<br/>shared<br/></td>
</tr>
<tr>
<td>Docker Enterprise Edition Engine</td>
<td>none<br/></td>
<td>Docker EE system<br/>shared<br/></td>
</tr>
<tr>
<td>Universal Control Plane (UCP)</td>
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
<td>Docker Trusted Registry (DTR)</td>
<td>none<br/></td>
<td>Docker EE system<br/>shared<br/></td>
</tr>
<tr>
<td>Docker Enterprise Edition Engine</td>
<td>none<br/></td>
<td>Docker EE system<br/>shared<br/></td>
</tr>
<tr>
<td>Universal Control Plane (UCP)</td>
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
<li class="active"><a data-toggle="tab" data-target="#bb2j0d1ludq000caeip0">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caeipg">Engine</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caeiq0">UCP</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0d1ludq000caeip0">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caeipg">Engine</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caeiq0">UCP</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0d1ludq000caeip0" class="tab-pane fade in active">
Universal Control Plane can be configured to log data to a remote
logging stack, which in turn, sends the Docker Trusted Registry
backend container audit records to the remote logging stack. The
logging stack can subsequently be used to interpolate the information
defined by this control from the logged audit records. Additional
information can be found at the following resource:
@y
<div class="tab-content">
<div id="bb2j0d1ludq000caeip0" class="tab-pane fade in active">
Universal Control Plane can be configured to log data to a remote
logging stack, which in turn, sends the Docker Trusted Registry
backend container audit records to the remote logging stack. The
logging stack can subsequently be used to interpolate the information
defined by this control from the logged audit records. Additional
information can be found at the following resource:
@z

@x
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/</a></li>
</ul>
@z

@x
</div>
<div id="bb2j0d1ludq000caeipg" class="tab-pane fade">
Docker Enterprise Edition can be configured with various logging
drivers to send audit events to an external logging stack. The logging
stack can subsequently be used to interpolate the information defined
by this control from the logged audit records. Additional
documentation can be found at the following resource:
@y
</div>
<div id="bb2j0d1ludq000caeipg" class="tab-pane fade">
Docker Enterprise Edition can be configured with various logging
drivers to send audit events to an external logging stack. The logging
stack can subsequently be used to interpolate the information defined
by this control from the logged audit records. Additional
documentation can be found at the following resource:
@z

@x
<ul>
<li><a href="https://docs.docker.com/engine/admin/logging/overview/">https://docs.docker.com/engine/admin/logging/overview/</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/engine/admin/logging/overview/">https://docs.docker.com/engine/admin/logging/overview/</a></li>
</ul>
@z

@x
</div>
<div id="bb2j0d1ludq000caeiq0" class="tab-pane fade">
Universal Control Plane can be configured to log data to a remote
logging stack. The logging stack can subsequently be used to
interpolate the information defined by this control from the logged
audit records. Additional documentation can be found at the following
resource:
@y
</div>
<div id="bb2j0d1ludq000caeiq0" class="tab-pane fade">
Universal Control Plane can be configured to log data to a remote
logging stack. The logging stack can subsequently be used to
interpolate the information defined by this control from the logged
audit records. Additional documentation can be found at the following
resource:
@z

@x
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/</a></li>
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
### AU-3 (2) Centralized Management Of Planned Audit Record Content
@y
### AU-3 (2) Centralized Management Of Planned Audit Record Content
@z

@x
#### Description
@y
#### Description
@z

@x
The information system provides centralized management and configuration of the content to be captured in audit records generated by [Assignment: organization-defined information system components].
@y
The information system provides centralized management and configuration of the content to be captured in audit records generated by [Assignment: organization-defined information system components].
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
<td>Docker EE system<br/>shared<br/></td>
</tr>
<tr>
<td>Docker Enterprise Edition Engine</td>
<td>none<br/></td>
<td>Docker EE system<br/>shared<br/></td>
</tr>
<tr>
<td>Universal Control Plane (UCP)</td>
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
<td>Docker Trusted Registry (DTR)</td>
<td>none<br/></td>
<td>Docker EE system<br/>shared<br/></td>
</tr>
<tr>
<td>Docker Enterprise Edition Engine</td>
<td>none<br/></td>
<td>Docker EE system<br/>shared<br/></td>
</tr>
<tr>
<td>Universal Control Plane (UCP)</td>
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
<li class="active"><a data-toggle="tab" data-target="#bb2j0d1ludq000caeiqg">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caeir0">Engine</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caeirg">UCP</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0d1ludq000caeiqg">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caeir0">Engine</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caeirg">UCP</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0d1ludq000caeiqg" class="tab-pane fade in active">
Universal Control Plane can be configured to log data to a remote
logging stack, which in turn, sends the Docker Trusted Registry
backend container audit records to the remote logging stack. The
logging stack can subsequently be used to interpolate the information
defined by this control from the logged audit records. Additional
information can be found at the following resource:
@y
<div class="tab-content">
<div id="bb2j0d1ludq000caeiqg" class="tab-pane fade in active">
Universal Control Plane can be configured to log data to a remote
logging stack, which in turn, sends the Docker Trusted Registry
backend container audit records to the remote logging stack. The
logging stack can subsequently be used to interpolate the information
defined by this control from the logged audit records. Additional
information can be found at the following resource:
@z

@x
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/</a></li>
</ul>
@z

@x
</div>
<div id="bb2j0d1ludq000caeir0" class="tab-pane fade">
Docker Enterprise Edition can be configured with various logging
drivers to send audit events to an external logging stack. The logging
stack can subsequently be used to interpolate the information defined
by this control from the logged audit records. Additional
documentation can be found at the following resource:
@y
</div>
<div id="bb2j0d1ludq000caeir0" class="tab-pane fade">
Docker Enterprise Edition can be configured with various logging
drivers to send audit events to an external logging stack. The logging
stack can subsequently be used to interpolate the information defined
by this control from the logged audit records. Additional
documentation can be found at the following resource:
@z

@x
<ul>
<li><a href="https://docs.docker.com/engine/admin/logging/overview/">https://docs.docker.com/engine/admin/logging/overview/</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/engine/admin/logging/overview/">https://docs.docker.com/engine/admin/logging/overview/</a></li>
</ul>
@z

@x
</div>
<div id="bb2j0d1ludq000caeirg" class="tab-pane fade">
Universal Control Plane can be configured to log data to a remote
logging stack. The logging stack can subsequently be used to
interpolate the information defined by this control from the logged
audit records. Additional documentation can be found at the following
resource:
@y
</div>
<div id="bb2j0d1ludq000caeirg" class="tab-pane fade">
Universal Control Plane can be configured to log data to a remote
logging stack. The logging stack can subsequently be used to
interpolate the information defined by this control from the logged
audit records. Additional documentation can be found at the following
resource:
@z

@x
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/</a></li>
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
## AU-4 Audit Storage Capacity
@y
## AU-4 Audit Storage Capacity
@z

@x
#### Description
@y
#### Description
@z

@x
The organization allocates audit record storage capacity in accordance with [Assignment: organization-defined audit record storage requirements].
@y
The organization allocates audit record storage capacity in accordance with [Assignment: organization-defined audit record storage requirements].
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
### AU-4 (1) Transfer To Alternate Storage
@y
### AU-4 (1) Transfer To Alternate Storage
@z

@x
#### Description
@y
#### Description
@z

@x
The information system off-loads audit records [Assignment: organization-defined frequency] onto a different system or media than the system being audited.
@y
The information system off-loads audit records [Assignment: organization-defined frequency] onto a different system or media than the system being audited.
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
## AU-5 Response To Audit Processing Failures
@y
## AU-5 Response To Audit Processing Failures
@z

@x
#### Description
@y
#### Description
@z

@x
The information system:
<ol type="a">
<li>Alerts [Assignment: organization-defined personnel or roles] in the event of an audit processing failure; and</li>
<li>Takes the following additional actions: [Assignment: organization-defined actions to be taken (e.g., shut down information system, overwrite oldest audit records, stop generating audit records)].</li>
</ol>
@y
The information system:
<ol type="a">
<li>Alerts [Assignment: organization-defined personnel or roles] in the event of an audit processing failure; and</li>
<li>Takes the following additional actions: [Assignment: organization-defined actions to be taken (e.g., shut down information system, overwrite oldest audit records, stop generating audit records)].</li>
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
<td>Docker EE system<br/>shared<br/></td>
</tr>
<tr>
<td>Docker Enterprise Edition Engine</td>
<td>none<br/></td>
<td>Docker EE system<br/>shared<br/></td>
</tr>
<tr>
<td>Universal Control Plane (UCP)</td>
<td>none<br/></td>
<td>service provider system specific<br/></td>
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
<td>Docker EE system<br/>shared<br/></td>
</tr>
<tr>
<td>Docker Enterprise Edition Engine</td>
<td>none<br/></td>
<td>Docker EE system<br/>shared<br/></td>
</tr>
<tr>
<td>Universal Control Plane (UCP)</td>
<td>none<br/></td>
<td>service provider system specific<br/></td>
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
<li class="active"><a data-toggle="tab" data-target="#bb2j0d1ludq000caeis0">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caeisg">Engine</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caeit0">UCP</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0d1ludq000caeis0">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caeisg">Engine</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caeit0">UCP</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0d1ludq000caeis0" class="tab-pane fade in active">
Universal Control Plane can be configured to log data to a remote
logging stack, which in turn, sends the Docker Trusted Registry
backend container audit records to the remote logging stack. The
logging stack can subsequently be configured to alert individuals in
the event of log processing failures. Additional information can be
found at the following resources:
@y
<div class="tab-content">
<div id="bb2j0d1ludq000caeis0" class="tab-pane fade in active">
Universal Control Plane can be configured to log data to a remote
logging stack, which in turn, sends the Docker Trusted Registry
backend container audit records to the remote logging stack. The
logging stack can subsequently be configured to alert individuals in
the event of log processing failures. Additional information can be
found at the following resources:
@z

@x
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/</a></li>
</ul>
@z

@x
</div>
<div id="bb2j0d1ludq000caeisg" class="tab-pane fade">
Docker Enterprise Edition can be configured with various logging
drivers to send audit events to an external logging stack. The logging
stack can be used to interpolate the information defined by this
control and also be configured to alert on any audit processing
failures. Additional information can be found at the following
resources:
@y
</div>
<div id="bb2j0d1ludq000caeisg" class="tab-pane fade">
Docker Enterprise Edition can be configured with various logging
drivers to send audit events to an external logging stack. The logging
stack can be used to interpolate the information defined by this
control and also be configured to alert on any audit processing
failures. Additional information can be found at the following
resources:
@z

@x
<ul>
<li><a href="https://docs.docker.com/engine/admin/logging/overview/">https://docs.docker.com/engine/admin/logging/overview/</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/engine/admin/logging/overview/">https://docs.docker.com/engine/admin/logging/overview/</a></li>
</ul>
@z

@x
</div>
<div id="bb2j0d1ludq000caeit0" class="tab-pane fade">
Universal Control Plane can be configured to log data to a remote
logging stack. The logging stack can subsequently be configured to
alert individuals in the event of log processing failures. Additional
information can be found at the following resources:
@y
</div>
<div id="bb2j0d1ludq000caeit0" class="tab-pane fade">
Universal Control Plane can be configured to log data to a remote
logging stack. The logging stack can subsequently be configured to
alert individuals in the event of log processing failures. Additional
information can be found at the following resources:
@z

@x
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/</a></li>
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
### AU-5 (1) Audit Storage Capacity
@y
### AU-5 (1) Audit Storage Capacity
@z

@x
#### Description
@y
#### Description
@z

@x
The information system provides a warning to [Assignment: organization-defined personnel, roles, and/or locations] within [Assignment: organization-defined time period] when allocated audit record storage volume reaches [Assignment: organization-defined percentage] of repository maximum audit record storage capacity.
@y
The information system provides a warning to [Assignment: organization-defined personnel, roles, and/or locations] within [Assignment: organization-defined time period] when allocated audit record storage volume reaches [Assignment: organization-defined percentage] of repository maximum audit record storage capacity.
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
<td>Docker EE system<br/>shared<br/></td>
</tr>
<tr>
<td>Docker Enterprise Edition Engine</td>
<td>none<br/></td>
<td>Docker EE system<br/>shared<br/></td>
</tr>
<tr>
<td>Universal Control Plane (UCP)</td>
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
<td>Docker Trusted Registry (DTR)</td>
<td>none<br/></td>
<td>Docker EE system<br/>shared<br/></td>
</tr>
<tr>
<td>Docker Enterprise Edition Engine</td>
<td>none<br/></td>
<td>Docker EE system<br/>shared<br/></td>
</tr>
<tr>
<td>Universal Control Plane (UCP)</td>
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
<li class="active"><a data-toggle="tab" data-target="#bb2j0d1ludq000caeitg">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caeiu0">Engine</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caeiug">UCP</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0d1ludq000caeitg">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caeiu0">Engine</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caeiug">UCP</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0d1ludq000caeitg" class="tab-pane fade in active">
Universal Control Plane can be configured to log data to a remote
logging stack, which in turn, sends the Docker Trusted Registry
backend container audit records to the remote logging stack. The
logging stack can subsequently be configured to warn the organization
when the allocated log storage is full. Additional information can be
found at the following resources:
@y
<div class="tab-content">
<div id="bb2j0d1ludq000caeitg" class="tab-pane fade in active">
Universal Control Plane can be configured to log data to a remote
logging stack, which in turn, sends the Docker Trusted Registry
backend container audit records to the remote logging stack. The
logging stack can subsequently be configured to warn the organization
when the allocated log storage is full. Additional information can be
found at the following resources:
@z

@x
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/</a></li>
</ul>
@z

@x
</div>
<div id="bb2j0d1ludq000caeiu0" class="tab-pane fade">
Docker Enterprise Edition can be configured with various logging
drivers to send audit events to an external logging stack. The logging
stack can subsequently be configured to warn the organization when the
allocated log storage is full. Additional information can be found at
the following resources:
@y
</div>
<div id="bb2j0d1ludq000caeiu0" class="tab-pane fade">
Docker Enterprise Edition can be configured with various logging
drivers to send audit events to an external logging stack. The logging
stack can subsequently be configured to warn the organization when the
allocated log storage is full. Additional information can be found at
the following resources:
@z

@x
<ul>
<li><a href="https://docs.docker.com/engine/admin/logging/overview/">https://docs.docker.com/engine/admin/logging/overview/</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/engine/admin/logging/overview/">https://docs.docker.com/engine/admin/logging/overview/</a></li>
</ul>
@z

@x
</div>
<div id="bb2j0d1ludq000caeiug" class="tab-pane fade">
Universal Control Plane can be configured to log data to a remote
logging stack. The logging stack can subsequently be configured to
warn the organization when the allocated log storage is full.
Additional information can be found at the following resources:
@y
</div>
<div id="bb2j0d1ludq000caeiug" class="tab-pane fade">
Universal Control Plane can be configured to log data to a remote
logging stack. The logging stack can subsequently be configured to
warn the organization when the allocated log storage is full.
Additional information can be found at the following resources:
@z

@x
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/</a></li>
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
### AU-5 (2) Real-Time Alerts
@y
### AU-5 (2) Real-Time Alerts
@z

@x
#### Description
@y
#### Description
@z

@x
The information system provides an alert in [Assignment: organization-defined real-time period] to [Assignment: organization-defined personnel, roles, and/or locations] when the following audit failure events occur: [Assignment: organization-defined audit failure events requiring real-time alerts].
@y
The information system provides an alert in [Assignment: organization-defined real-time period] to [Assignment: organization-defined personnel, roles, and/or locations] when the following audit failure events occur: [Assignment: organization-defined audit failure events requiring real-time alerts].
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
<td>Docker EE system<br/>shared<br/></td>
</tr>
<tr>
<td>Docker Enterprise Edition Engine</td>
<td>none<br/></td>
<td>Docker EE system<br/>shared<br/></td>
</tr>
<tr>
<td>Universal Control Plane (UCP)</td>
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
<td>Docker Trusted Registry (DTR)</td>
<td>none<br/></td>
<td>Docker EE system<br/>shared<br/></td>
</tr>
<tr>
<td>Docker Enterprise Edition Engine</td>
<td>none<br/></td>
<td>Docker EE system<br/>shared<br/></td>
</tr>
<tr>
<td>Universal Control Plane (UCP)</td>
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
<li class="active"><a data-toggle="tab" data-target="#bb2j0d1ludq000caeiv0">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caeivg">Engine</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caej00">UCP</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0d1ludq000caeiv0">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caeivg">Engine</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caej00">UCP</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0d1ludq000caeiv0" class="tab-pane fade in active">
Universal Control Plane can be configured to log data to a remote
logging stack, which in turn, sends the Docker Trusted Registry
backend container audit records to the remote logging stack. The
logging stack can subsequently be configured to warn the organization
when audit log failures occur. Additional information can be found at
the following resources:
@y
<div class="tab-content">
<div id="bb2j0d1ludq000caeiv0" class="tab-pane fade in active">
Universal Control Plane can be configured to log data to a remote
logging stack, which in turn, sends the Docker Trusted Registry
backend container audit records to the remote logging stack. The
logging stack can subsequently be configured to warn the organization
when audit log failures occur. Additional information can be found at
the following resources:
@z

@x
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/</a></li>
</ul>
@z

@x
</div>
<div id="bb2j0d1ludq000caeivg" class="tab-pane fade">
Docker Enterprise Edition can be configured with various logging
drivers to send audit events to an external logging stack.  The
logging stack can subsequently be configured to warn the organization
when audit log failures occur. Additional information can be found at
the following resources:
@y
</div>
<div id="bb2j0d1ludq000caeivg" class="tab-pane fade">
Docker Enterprise Edition can be configured with various logging
drivers to send audit events to an external logging stack.  The
logging stack can subsequently be configured to warn the organization
when audit log failures occur. Additional information can be found at
the following resources:
@z

@x
<ul>
<li><a href="https://docs.docker.com/engine/admin/logging/overview/">https://docs.docker.com/engine/admin/logging/overview/</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/engine/admin/logging/overview/">https://docs.docker.com/engine/admin/logging/overview/</a></li>
</ul>
@z

@x
</div>
<div id="bb2j0d1ludq000caej00" class="tab-pane fade">
Universal Control Plane can be configured to log data to a remote
logging stack. The logging stack can subsequently be configured to
warn the organization when audit log failures occur. Additional
information can be found at the following resources:
@y
</div>
<div id="bb2j0d1ludq000caej00" class="tab-pane fade">
Universal Control Plane can be configured to log data to a remote
logging stack. The logging stack can subsequently be configured to
warn the organization when audit log failures occur. Additional
information can be found at the following resources:
@z

@x
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/</a></li>
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
### AU-5 (3) Configurable Traffic Volume Thresholds
@y
### AU-5 (3) Configurable Traffic Volume Thresholds
@z

@x
#### Description
@y
#### Description
@z

@x
The information system enforces configurable network communications traffic volume thresholds reflecting limits on auditing capacity and [Selection: rejects; delays] network traffic above those thresholds.
@y
The information system enforces configurable network communications traffic volume thresholds reflecting limits on auditing capacity and [Selection: rejects; delays] network traffic above those thresholds.
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
### AU-5 (4) Shutdown On Failure
@y
### AU-5 (4) Shutdown On Failure
@z

@x
#### Description
@y
#### Description
@z

@x
The information system invokes a [Selection: full system shutdown; partial system shutdown; degraded operational mode with limited mission/business functionality available] in the event of [Assignment: organization-defined audit failures], unless an alternate audit capability exists.
@y
The information system invokes a [Selection: full system shutdown; partial system shutdown; degraded operational mode with limited mission/business functionality available] in the event of [Assignment: organization-defined audit failures], unless an alternate audit capability exists.
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
## AU-6 Audit Review, Analysis, And Reporting
@y
## AU-6 Audit Review, Analysis, And Reporting
@z

@x
#### Description
@y
#### Description
@z

@x
The organization:
<ol type="a">
<li>Reviews and analyzes information system audit records [Assignment: organization-defined frequency] for indications of [Assignment: organization-defined inappropriate or unusual activity]; and</li>
<li>Reports findings to [Assignment: organization-defined personnel or roles].</li>
</ol>
@y
The organization:
<ol type="a">
<li>Reviews and analyzes information system audit records [Assignment: organization-defined frequency] for indications of [Assignment: organization-defined inappropriate or unusual activity]; and</li>
<li>Reports findings to [Assignment: organization-defined personnel or roles].</li>
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
### AU-6 (1) Process Integration
@y
### AU-6 (1) Process Integration
@z

@x
#### Description
@y
#### Description
@z

@x
The organization employs automated mechanisms to integrate audit review, analysis, and reporting processes to support organizational processes for investigation and response to suspicious activities.
@y
The organization employs automated mechanisms to integrate audit review, analysis, and reporting processes to support organizational processes for investigation and response to suspicious activities.
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
### AU-6 (3) Correlate Audit Repositories
@y
### AU-6 (3) Correlate Audit Repositories
@z

@x
#### Description
@y
#### Description
@z

@x
The organization analyzes and correlates audit records across different repositories to gain organization-wide situational awareness.
@y
The organization analyzes and correlates audit records across different repositories to gain organization-wide situational awareness.
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
### AU-6 (4) Central Review And Analysis
@y
### AU-6 (4) Central Review And Analysis
@z

@x
#### Description
@y
#### Description
@z

@x
The information system provides the capability to centrally review and analyze audit records from multiple components within the system.
@y
The information system provides the capability to centrally review and analyze audit records from multiple components within the system.
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
<td>Docker EE system<br/>shared<br/></td>
</tr>
<tr>
<td>Docker Enterprise Edition Engine</td>
<td>none<br/></td>
<td>Docker EE system<br/>shared<br/></td>
</tr>
<tr>
<td>Universal Control Plane (UCP)</td>
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
<td>Docker Trusted Registry (DTR)</td>
<td>none<br/></td>
<td>Docker EE system<br/>shared<br/></td>
</tr>
<tr>
<td>Docker Enterprise Edition Engine</td>
<td>none<br/></td>
<td>Docker EE system<br/>shared<br/></td>
</tr>
<tr>
<td>Universal Control Plane (UCP)</td>
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
<li class="active"><a data-toggle="tab" data-target="#bb2j0d1ludq000caej0g">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caej10">Engine</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caej1g">UCP</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0d1ludq000caej0g">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caej10">Engine</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caej1g">UCP</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0d1ludq000caej0g" class="tab-pane fade in active">
Universal Control Plane can be configured to log data to a remote
logging stack, which in turn, sends the Docker Trusted Registry
backend container audit records to the remote logging stack. The
organization can subsequently centrally review and analyze all of the
Docker EE audit records. Additional information can be found at the
following resources:
@y
<div class="tab-content">
<div id="bb2j0d1ludq000caej0g" class="tab-pane fade in active">
Universal Control Plane can be configured to log data to a remote
logging stack, which in turn, sends the Docker Trusted Registry
backend container audit records to the remote logging stack. The
organization can subsequently centrally review and analyze all of the
Docker EE audit records. Additional information can be found at the
following resources:
@z

@x
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/</a></li>
</ul>
@z

@x
</div>
<div id="bb2j0d1ludq000caej10" class="tab-pane fade">
Docker Enterprise Edition can be configured with various logging
drivers to send audit events to an external logging stack. The
organization can subsequently centrally review and analyze all of the
Docker EE audit records. Additional information can be found at the
following resources:
@y
</div>
<div id="bb2j0d1ludq000caej10" class="tab-pane fade">
Docker Enterprise Edition can be configured with various logging
drivers to send audit events to an external logging stack. The
organization can subsequently centrally review and analyze all of the
Docker EE audit records. Additional information can be found at the
following resources:
@z

@x
<ul>
<li><a href="https://docs.docker.com/engine/admin/logging/overview/">https://docs.docker.com/engine/admin/logging/overview/</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/engine/admin/logging/overview/">https://docs.docker.com/engine/admin/logging/overview/</a></li>
</ul>
@z

@x
</div>
<div id="bb2j0d1ludq000caej1g" class="tab-pane fade">
Universal Control Plane can be configured to log data to a remote
logging stack. The organization can subsequently centrally review and
analyze all of the Docker EE audit records. Additional information can
be found at the following resources:
@y
</div>
<div id="bb2j0d1ludq000caej1g" class="tab-pane fade">
Universal Control Plane can be configured to log data to a remote
logging stack. The organization can subsequently centrally review and
analyze all of the Docker EE audit records. Additional information can
be found at the following resources:
@z

@x
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/</a></li>
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
### AU-6 (5) Integration / Scanning And Monitoring Capabilities
@y
### AU-6 (5) Integration / Scanning And Monitoring Capabilities
@z

@x
#### Description
@y
#### Description
@z

@x
The organization integrates analysis of audit records with analysis of [Selection (one or more): vulnerability scanning information; performance data; information system monitoring information; [Assignment: organization-defined data/information collected from other sources]] to further enhance the ability to identify inappropriate or unusual activity.
@y
The organization integrates analysis of audit records with analysis of [Selection (one or more): vulnerability scanning information; performance data; information system monitoring information; [Assignment: organization-defined data/information collected from other sources]] to further enhance the ability to identify inappropriate or unusual activity.
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
### AU-6 (6) Correlation With Physical Monitoring
@y
### AU-6 (6) Correlation With Physical Monitoring
@z

@x
#### Description
@y
#### Description
@z

@x
The organization correlates information from audit records with information obtained from monitoring physical access to further enhance the ability to identify suspicious, inappropriate, unusual, or malevolent activity.
@y
The organization correlates information from audit records with information obtained from monitoring physical access to further enhance the ability to identify suspicious, inappropriate, unusual, or malevolent activity.
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
### AU-6 (7) Permitted Actions
@y
### AU-6 (7) Permitted Actions
@z

@x
#### Description
@y
#### Description
@z

@x
The organization specifies the permitted actions for each [Selection (one or more): information system process; role; user] associated with the review, analysis, and reporting of audit information.
@y
The organization specifies the permitted actions for each [Selection (one or more): information system process; role; user] associated with the review, analysis, and reporting of audit information.
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
### AU-6 (8) Full Text Analysis Of Privileged Commands
@y
### AU-6 (8) Full Text Analysis Of Privileged Commands
@z

@x
#### Description
@y
#### Description
@z

@x
The organization performs a full text analysis of audited privileged commands in a physically distinct component or subsystem of the information system, or other information system that is dedicated to that analysis.
@y
The organization performs a full text analysis of audited privileged commands in a physically distinct component or subsystem of the information system, or other information system that is dedicated to that analysis.
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
### AU-6 (9) Correlation With Information From Nontechnical Sources
@y
### AU-6 (9) Correlation With Information From Nontechnical Sources
@z

@x
#### Description
@y
#### Description
@z

@x
The organization correlates information from nontechnical sources with audit information to enhance organization-wide situational awareness.
@y
The organization correlates information from nontechnical sources with audit information to enhance organization-wide situational awareness.
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
### AU-6 (10) Audit Level Adjustment
@y
### AU-6 (10) Audit Level Adjustment
@z

@x
#### Description
@y
#### Description
@z

@x
The organization adjusts the level of audit review, analysis, and reporting within the information system when there is a change in risk based on law enforcement information, intelligence information, or other credible sources of information.
@y
The organization adjusts the level of audit review, analysis, and reporting within the information system when there is a change in risk based on law enforcement information, intelligence information, or other credible sources of information.
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
## AU-7 Audit Reduction And Report Generation
@y
## AU-7 Audit Reduction And Report Generation
@z

@x
#### Description
@y
#### Description
@z

@x
The information system provides an audit reduction and report generation capability that:
<ol type="a">
<li>Supports on-demand audit review, analysis, and reporting requirements and after-the-fact investigations of security incidents; and</li>
<li>Does not alter the original content or time ordering of audit records.</li>
</ol>
@y
The information system provides an audit reduction and report generation capability that:
<ol type="a">
<li>Supports on-demand audit review, analysis, and reporting requirements and after-the-fact investigations of security incidents; and</li>
<li>Does not alter the original content or time ordering of audit records.</li>
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
<td></td>
<td>Docker EE system<br/>shared<br/></td>
</tr>
<tr>
<td>Docker Enterprise Edition Engine</td>
<td>none<br/></td>
<td>Docker EE system<br/>shared<br/></td>
</tr>
<tr>
<td>Universal Control Plane (UCP)</td>
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
<td>Docker Trusted Registry (DTR)</td>
<td></td>
<td>Docker EE system<br/>shared<br/></td>
</tr>
<tr>
<td>Docker Enterprise Edition Engine</td>
<td>none<br/></td>
<td>Docker EE system<br/>shared<br/></td>
</tr>
<tr>
<td>Universal Control Plane (UCP)</td>
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
<li class="active"><a data-toggle="tab" data-target="#bb2j0d1ludq000caej20">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caej2g">Engine</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caej30">UCP</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0d1ludq000caej20">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caej2g">Engine</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caej30">UCP</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0d1ludq000caej20" class="tab-pane fade in active">
Universal Control Plane can be configured to log data to a remote
logging stack, which in turn, sends the Docker Trusted Registry
backend container audit records to the remote logging stack. The
logging stack can subsequently be used to facilitate the audit
reduction and report generation requirements of this control.
Additional information can be found at the following resources:
@y
<div class="tab-content">
<div id="bb2j0d1ludq000caej20" class="tab-pane fade in active">
Universal Control Plane can be configured to log data to a remote
logging stack, which in turn, sends the Docker Trusted Registry
backend container audit records to the remote logging stack. The
logging stack can subsequently be used to facilitate the audit
reduction and report generation requirements of this control.
Additional information can be found at the following resources:
@z

@x
The underlying operating system chosen to support Docker Trusted
Registry should be certified to ensure that logs are not altered
during generation and transmission to a remote logging stack.
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/</a></li>
</ul>
@y
The underlying operating system chosen to support Docker Trusted
Registry should be certified to ensure that logs are not altered
during generation and transmission to a remote logging stack.
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/</a></li>
</ul>
@z

@x
</div>
<div id="bb2j0d1ludq000caej2g" class="tab-pane fade">
Docker Enterprise Edition can be configured with various logging
drivers to send audit events to an external logging stack. The logging
stack can subsequently be used to facilitate the audit reduction and
report generation requirements of this control. Additional information
can be found at the following resources:
@y
</div>
<div id="bb2j0d1ludq000caej2g" class="tab-pane fade">
Docker Enterprise Edition can be configured with various logging
drivers to send audit events to an external logging stack. The logging
stack can subsequently be used to facilitate the audit reduction and
report generation requirements of this control. Additional information
can be found at the following resources:
@z

@x
The underlying operating system chosen to support Docker Enterprise
Edition should be certified to ensure that logs are not altered during
generation and transmission to a remote logging stack.
<ul>
<li><a href="https://docs.docker.com/engine/admin/logging/overview/">https://docs.docker.com/engine/admin/logging/overview/</a></li>
</ul>
@y
The underlying operating system chosen to support Docker Enterprise
Edition should be certified to ensure that logs are not altered during
generation and transmission to a remote logging stack.
<ul>
<li><a href="https://docs.docker.com/engine/admin/logging/overview/">https://docs.docker.com/engine/admin/logging/overview/</a></li>
</ul>
@z

@x
</div>
<div id="bb2j0d1ludq000caej30" class="tab-pane fade">
Universal Control Plane can be configured to log data to a remote
logging stack. The logging stack can subsequently be used to
facilitate the audit reduction and report generation requirements of
this control. Additional information can be found at the following
resources:
@y
</div>
<div id="bb2j0d1ludq000caej30" class="tab-pane fade">
Universal Control Plane can be configured to log data to a remote
logging stack. The logging stack can subsequently be used to
facilitate the audit reduction and report generation requirements of
this control. Additional information can be found at the following
resources:
@z

@x
The underlying operating system chosen to support Universal Control
Plane should be certified to ensure that logs are not altered during
generation and transmission to a remote logging stack.
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/</a></li>
</ul>
@y
The underlying operating system chosen to support Universal Control
Plane should be certified to ensure that logs are not altered during
generation and transmission to a remote logging stack.
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/</a></li>
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
### AU-7 (1) Automatic Processing
@y
### AU-7 (1) Automatic Processing
@z

@x
#### Description
@y
#### Description
@z

@x
The information system provides the capability to process audit records for events of interest based on [Assignment: organization-defined audit fields within audit records].
@y
The information system provides the capability to process audit records for events of interest based on [Assignment: organization-defined audit fields within audit records].
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
<td>Docker EE system<br/>shared<br/></td>
</tr>
<tr>
<td>Docker Enterprise Edition Engine</td>
<td>none<br/></td>
<td>Docker EE system<br/>shared<br/></td>
</tr>
<tr>
<td>Universal Control Plane (UCP)</td>
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
<td>Docker Trusted Registry (DTR)</td>
<td>none<br/></td>
<td>Docker EE system<br/>shared<br/></td>
</tr>
<tr>
<td>Docker Enterprise Edition Engine</td>
<td>none<br/></td>
<td>Docker EE system<br/>shared<br/></td>
</tr>
<tr>
<td>Universal Control Plane (UCP)</td>
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
<li class="active"><a data-toggle="tab" data-target="#bb2j0d1ludq000caej3g">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caej40">Engine</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caej4g">UCP</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0d1ludq000caej3g">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caej40">Engine</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caej4g">UCP</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0d1ludq000caej3g" class="tab-pane fade in active">
Universal Control Plane can be configured to log data to a remote
logging stack, which in turn, sends the Docker Trusted Registry
backend container audit records to the remote logging stack. The
logging stack can subsequently be configured to parse information by
organization-defined audit fields. Additional information can be found
at the following resources:
@y
<div class="tab-content">
<div id="bb2j0d1ludq000caej3g" class="tab-pane fade in active">
Universal Control Plane can be configured to log data to a remote
logging stack, which in turn, sends the Docker Trusted Registry
backend container audit records to the remote logging stack. The
logging stack can subsequently be configured to parse information by
organization-defined audit fields. Additional information can be found
at the following resources:
@z

@x
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/</a></li>
</ul>
@z

@x
</div>
<div id="bb2j0d1ludq000caej40" class="tab-pane fade">
Docker Enterprise Edition can be configured with various logging
drivers to send audit events to an external logging stack. The logging
stack can subsequently be configured to parse information by
organization-defined audit fields. Additional information can be found
at the following resources:
@y
</div>
<div id="bb2j0d1ludq000caej40" class="tab-pane fade">
Docker Enterprise Edition can be configured with various logging
drivers to send audit events to an external logging stack. The logging
stack can subsequently be configured to parse information by
organization-defined audit fields. Additional information can be found
at the following resources:
@z

@x
<ul>
<li><a href="https://docs.docker.com/engine/admin/logging/overview/">https://docs.docker.com/engine/admin/logging/overview/</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/engine/admin/logging/overview/">https://docs.docker.com/engine/admin/logging/overview/</a></li>
</ul>
@z

@x
</div>
<div id="bb2j0d1ludq000caej4g" class="tab-pane fade">
Universal Control Plane can be configured to log data to a remote
logging stack. The logging stack can subsequently be configured to
parse information by organization-defined audit fields. Additional
information can be found at the following resources:
@y
</div>
<div id="bb2j0d1ludq000caej4g" class="tab-pane fade">
Universal Control Plane can be configured to log data to a remote
logging stack. The logging stack can subsequently be configured to
parse information by organization-defined audit fields. Additional
information can be found at the following resources:
@z

@x
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/</a></li>
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
### AU-7 (2) Automatic Sort And Search
@y
### AU-7 (2) Automatic Sort And Search
@z

@x
#### Description
@y
#### Description
@z

@x
The information system provides the capability to sort and search audit records for events of interest based on the content of [Assignment: organization-defined audit fields within audit records].
@y
The information system provides the capability to sort and search audit records for events of interest based on the content of [Assignment: organization-defined audit fields within audit records].
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
## AU-8 Time Stamps
@y
## AU-8 Time Stamps
@z

@x
#### Description
@y
#### Description
@z

@x
The information system:
<ol type="a">
<li>Uses internal system clocks to generate time stamps for audit records; and</li>
<li>Records time stamps for audit records that can be mapped to Coordinated Universal Time (UTC) or Greenwich Mean Time (GMT) and meets [Assignment: organization-defined granularity of time measurement].</li>
</ol>
@y
The information system:
<ol type="a">
<li>Uses internal system clocks to generate time stamps for audit records; and</li>
<li>Records time stamps for audit records that can be mapped to Coordinated Universal Time (UTC) or Greenwich Mean Time (GMT) and meets [Assignment: organization-defined granularity of time measurement].</li>
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
<td>service provider hybrid<br/></td>
</tr>
<tr>
<td>Docker Enterprise Edition Engine</td>
<td>none<br/></td>
<td>service provider hybrid<br/></td>
</tr>
<tr>
<td>Universal Control Plane (UCP)</td>
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
<td>Docker Enterprise Edition Engine</td>
<td>none<br/></td>
<td>service provider hybrid<br/></td>
</tr>
<tr>
<td>Universal Control Plane (UCP)</td>
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
<li class="active"><a data-toggle="tab" data-target="#bb2j0d1ludq000caej50">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caej5g">Engine</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caej60">UCP</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0d1ludq000caej50">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caej5g">Engine</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caej60">UCP</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0d1ludq000caej50" class="tab-pane fade in active">
Docker Trusted Registry uses the system clock of the underlying
operating system on which it runs. This behavior cannot be modified.The underlying operating system on which Docker Trusted Registry runs
should be configured such that its system clock uses Coordinated
Universal Time (UTC) as indicated by this control. Refer to the
operating system&#39;s instructions for doing so.
</div>
<div id="bb2j0d1ludq000caej5g" class="tab-pane fade">
Docker Enterprise Edition uses the system clock of the underlying
operating system on which it runs. This behavior cannot be modified.The underlying operating system on which Docker Enterprise Edition
runs should be configured such that its system clock uses Coordinated
Universal Time (UTC) as indicated by this control. Refer to the
operating system&#39;s instructions for doing so.
</div>
<div id="bb2j0d1ludq000caej60" class="tab-pane fade">
Universal Control Plane uses the system clock of the underlying
operating system on which it runs. This behavior cannot be modified.The underlying operating system on which Universal Control Plane runs
should be configured such that its system clock uses Coordinated
Universal Time (UTC) as indicated by this control. Refer to the
operating system&#39;s instructions for doing so.
</div>
</div>
@y
<div class="tab-content">
<div id="bb2j0d1ludq000caej50" class="tab-pane fade in active">
Docker Trusted Registry uses the system clock of the underlying
operating system on which it runs. This behavior cannot be modified.The underlying operating system on which Docker Trusted Registry runs
should be configured such that its system clock uses Coordinated
Universal Time (UTC) as indicated by this control. Refer to the
operating system&#39;s instructions for doing so.
</div>
<div id="bb2j0d1ludq000caej5g" class="tab-pane fade">
Docker Enterprise Edition uses the system clock of the underlying
operating system on which it runs. This behavior cannot be modified.The underlying operating system on which Docker Enterprise Edition
runs should be configured such that its system clock uses Coordinated
Universal Time (UTC) as indicated by this control. Refer to the
operating system&#39;s instructions for doing so.
</div>
<div id="bb2j0d1ludq000caej60" class="tab-pane fade">
Universal Control Plane uses the system clock of the underlying
operating system on which it runs. This behavior cannot be modified.The underlying operating system on which Universal Control Plane runs
should be configured such that its system clock uses Coordinated
Universal Time (UTC) as indicated by this control. Refer to the
operating system&#39;s instructions for doing so.
</div>
</div>
@z

@x
### AU-8 (1) Synchronization With Authoritative Time Source
@y
### AU-8 (1) Synchronization With Authoritative Time Source
@z

@x
#### Description
@y
#### Description
@z

@x
The information system:
<ol type="a">
<li>Compares the internal information system clocks [Assignment: organization-defined frequency] with [Assignment: organization-defined authoritative time source]; and</li>
<li>Synchronizes the internal system clocks to the authoritative time source when the time difference is greater than [Assignment: organization-defined time period].</li>
</ol>
@y
The information system:
<ol type="a">
<li>Compares the internal information system clocks [Assignment: organization-defined frequency] with [Assignment: organization-defined authoritative time source]; and</li>
<li>Synchronizes the internal system clocks to the authoritative time source when the time difference is greater than [Assignment: organization-defined time period].</li>
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
<td>service provider hybrid<br/></td>
</tr>
<tr>
<td>Docker Enterprise Edition Engine</td>
<td>none<br/></td>
<td>service provider hybrid<br/></td>
</tr>
<tr>
<td>Universal Control Plane (UCP)</td>
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
<td>Docker Enterprise Edition Engine</td>
<td>none<br/></td>
<td>service provider hybrid<br/></td>
</tr>
<tr>
<td>Universal Control Plane (UCP)</td>
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
<li class="active"><a data-toggle="tab" data-target="#bb2j0d1ludq000caej6g">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caej70">Engine</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caej7g">UCP</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0d1ludq000caej6g">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caej70">Engine</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caej7g">UCP</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0d1ludq000caej6g" class="tab-pane fade in active">
The underlying operating system on which Docker Trusted Registry runs
should be configured such that its system clock compares itself with
an authoritative time source as indicated by this control. This can be
accomplished by utilizing the Network Time Protocol (NTP). Refer to
the operating system&#39;s instructions for doing so.The underlying operating system on which Docker Trusted Registry runs
should be configured such that its system clock synchronizes itself to
an authoritative time source as defined by part (a) of this control
any time the time difference exceeds that of the organization-defined
time period. This can be accomplished by utilizing the Network Time
Protocol (NTP). Refer to the operating system&#39;s instructions for doing
so.
</div>
<div id="bb2j0d1ludq000caej70" class="tab-pane fade">
The underlying operating system on which Docker Enterprise Edition runs should
be configured such that its system clock compares itself with an
authoritative time source as indicated by this control. This can be
accomplished by utilizing the Network Time Protocol (NTP). Refer to
the operating system&#39;s instructions for doing so.The underlying operating system on which Docker Enterprise Edition
runs should be configured such that its system clock synchronizes
itself to an authoritative time source as defined by part (a) of this
control any time the time difference exceeds that of the
organization-defined time period. This can be accomplished by
utilizing the Network Time Protocol (NTP). Refer to the operating
system&#39;s instructions for doing so.
</div>
<div id="bb2j0d1ludq000caej7g" class="tab-pane fade">
The underlying operating system on which Universal Control Plane runs
should be configured such that its system clock compares itself with
an authoritative time source as indicated by this control. This can be
accomplished by utilizing the Network Time Protocol (NTP). Refer to
the operating system&#39;s instructions for doing so.The underlying operating system on which Universal Control Plane runs
should be configured such that its system clock synchronizes itself to
an authoritative time source as defined by part (a) of this control
any time the time difference exceeds that of the organization-defined
time period. This can be accomplished by utilizing the Network Time
Protocol (NTP). Refer to the operating system&#39;s instructions for doing
so.
</div>
</div>
@y
<div class="tab-content">
<div id="bb2j0d1ludq000caej6g" class="tab-pane fade in active">
The underlying operating system on which Docker Trusted Registry runs
should be configured such that its system clock compares itself with
an authoritative time source as indicated by this control. This can be
accomplished by utilizing the Network Time Protocol (NTP). Refer to
the operating system&#39;s instructions for doing so.The underlying operating system on which Docker Trusted Registry runs
should be configured such that its system clock synchronizes itself to
an authoritative time source as defined by part (a) of this control
any time the time difference exceeds that of the organization-defined
time period. This can be accomplished by utilizing the Network Time
Protocol (NTP). Refer to the operating system&#39;s instructions for doing
so.
</div>
<div id="bb2j0d1ludq000caej70" class="tab-pane fade">
The underlying operating system on which Docker Enterprise Edition runs should
be configured such that its system clock compares itself with an
authoritative time source as indicated by this control. This can be
accomplished by utilizing the Network Time Protocol (NTP). Refer to
the operating system&#39;s instructions for doing so.The underlying operating system on which Docker Enterprise Edition
runs should be configured such that its system clock synchronizes
itself to an authoritative time source as defined by part (a) of this
control any time the time difference exceeds that of the
organization-defined time period. This can be accomplished by
utilizing the Network Time Protocol (NTP). Refer to the operating
system&#39;s instructions for doing so.
</div>
<div id="bb2j0d1ludq000caej7g" class="tab-pane fade">
The underlying operating system on which Universal Control Plane runs
should be configured such that its system clock compares itself with
an authoritative time source as indicated by this control. This can be
accomplished by utilizing the Network Time Protocol (NTP). Refer to
the operating system&#39;s instructions for doing so.The underlying operating system on which Universal Control Plane runs
should be configured such that its system clock synchronizes itself to
an authoritative time source as defined by part (a) of this control
any time the time difference exceeds that of the organization-defined
time period. This can be accomplished by utilizing the Network Time
Protocol (NTP). Refer to the operating system&#39;s instructions for doing
so.
</div>
</div>
@z

@x
### AU-8 (2) Secondary Authoritative Time Source
@y
### AU-8 (2) Secondary Authoritative Time Source
@z

@x
#### Description
@y
#### Description
@z

@x
The information system identifies a secondary authoritative time source that is located in a different geographic region than the primary authoritative time source.
@y
The information system identifies a secondary authoritative time source that is located in a different geographic region than the primary authoritative time source.
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
## AU-9 Protection Of Audit Information
@y
## AU-9 Protection Of Audit Information
@z

@x
#### Description
@y
#### Description
@z

@x
The information system protects audit information and audit tools from unauthorized access, modification, and deletion.
@y
The information system protects audit information and audit tools from unauthorized access, modification, and deletion.
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
<td>Docker Enterprise Edition Engine</td>
<td>none<br/></td>
<td>service provider hybrid<br/></td>
</tr>
<tr>
<td>Universal Control Plane (UCP)</td>
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
<td>Docker Enterprise Edition Engine</td>
<td>none<br/></td>
<td>service provider hybrid<br/></td>
</tr>
<tr>
<td>Universal Control Plane (UCP)</td>
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
<li class="active"><a data-toggle="tab" data-target="#bb2j0d1ludq000caej80">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caej8g">Engine</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caej90">UCP</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0d1ludq000caej80">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caej8g">Engine</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caej90">UCP</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0d1ludq000caej80" class="tab-pane fade in active">
By default, Docker Trusted Registry is configured to use the
underlying logging capabilities of Docker Enterprise Edition. As such,
on the underlying Linux operating system, only root and sudo users and
users that have been added to the &#39;docker&#39; group have the ability to
access the logs generated by UCP backend service containers. In
addition, only UCP Administrator users can change the logging endpoint
of the system should it be decided that logs be sent to a remote
logging stack. In this case, the organization is responsible for
configuring the remote logging stack per the provisions of this
control.
</div>
<div id="bb2j0d1ludq000caej8g" class="tab-pane fade">
On the underlying Linux operating system supporting Docker Enterprise
Edition, only root and sudo users and users that have been added to
the &#34;docker&#34; group have the ability to access the logs generated by
UCP backend service containers. Should the organization decide to
configure Docker Enterprise Edition to use a logging driver other than
the default json-file driver, the organization is subsequently
responsible for configuring the chosen logging stack per the
provisions of this control. In addition, for Linux operating systems
supporting Docker Enterprise Edition that use the systemd daemon, it
is imperative that the Journal is secured per the requirements of this
control. The same applies for Linux operating systems supporting
Docker Enterprise Edition that instead use upstart. Additional
information can be found at the following resources:
@y
<div class="tab-content">
<div id="bb2j0d1ludq000caej80" class="tab-pane fade in active">
By default, Docker Trusted Registry is configured to use the
underlying logging capabilities of Docker Enterprise Edition. As such,
on the underlying Linux operating system, only root and sudo users and
users that have been added to the &#39;docker&#39; group have the ability to
access the logs generated by UCP backend service containers. In
addition, only UCP Administrator users can change the logging endpoint
of the system should it be decided that logs be sent to a remote
logging stack. In this case, the organization is responsible for
configuring the remote logging stack per the provisions of this
control.
</div>
<div id="bb2j0d1ludq000caej8g" class="tab-pane fade">
On the underlying Linux operating system supporting Docker Enterprise
Edition, only root and sudo users and users that have been added to
the &#34;docker&#34; group have the ability to access the logs generated by
UCP backend service containers. Should the organization decide to
configure Docker Enterprise Edition to use a logging driver other than
the default json-file driver, the organization is subsequently
responsible for configuring the chosen logging stack per the
provisions of this control. In addition, for Linux operating systems
supporting Docker Enterprise Edition that use the systemd daemon, it
is imperative that the Journal is secured per the requirements of this
control. The same applies for Linux operating systems supporting
Docker Enterprise Edition that instead use upstart. Additional
information can be found at the following resources:
@z

@x
<ul>
<li><a href="https://docs.docker.com/engine/admin/logging/overview/">https://docs.docker.com/engine/admin/logging/overview/</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/engine/admin/logging/overview/">https://docs.docker.com/engine/admin/logging/overview/</a></li>
</ul>
@z

@x
</div>
<div id="bb2j0d1ludq000caej90" class="tab-pane fade">
By default, Universal Control Plane is configured to use the
underlying logging capabilities of Docker Enterprise Edition. As such,
on the underlying Linux operating system, only root and sudo users and
users that have been added to the &#39;docker&#39; group have the ability to
access the logs generated by UCP backend service containers. In
addition, only UCP Administrator users can change the logging endpoint
of the system should it be decided that logs be sent to a remote
logging stack. In this case, the organization is responsible for
configuring the remote logging stack per the provisions of this
control.
</div>
</div>
@y
</div>
<div id="bb2j0d1ludq000caej90" class="tab-pane fade">
By default, Universal Control Plane is configured to use the
underlying logging capabilities of Docker Enterprise Edition. As such,
on the underlying Linux operating system, only root and sudo users and
users that have been added to the &#39;docker&#39; group have the ability to
access the logs generated by UCP backend service containers. In
addition, only UCP Administrator users can change the logging endpoint
of the system should it be decided that logs be sent to a remote
logging stack. In this case, the organization is responsible for
configuring the remote logging stack per the provisions of this
control.
</div>
</div>
@z

@x
### AU-9 (1) Hardware Write-Once Media
@y
### AU-9 (1) Hardware Write-Once Media
@z

@x
#### Description
@y
#### Description
@z

@x
The information system writes audit trails to hardware-enforced, write-once media.
@y
The information system writes audit trails to hardware-enforced, write-once media.
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
### AU-9 (2) Audit Backup On Separate Physical Systems / Components
@y
### AU-9 (2) Audit Backup On Separate Physical Systems / Components
@z

@x
#### Description
@y
#### Description
@z

@x
The information system backs up audit records [Assignment: organization-defined frequency] onto a physically different system or system component than the system or component being audited.
@y
The information system backs up audit records [Assignment: organization-defined frequency] onto a physically different system or system component than the system or component being audited.
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
<td>Docker Enterprise Edition Engine</td>
<td>none<br/></td>
<td>service provider hybrid<br/></td>
</tr>
<tr>
<td>Universal Control Plane (UCP)</td>
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
<td>Docker Enterprise Edition Engine</td>
<td>none<br/></td>
<td>service provider hybrid<br/></td>
</tr>
<tr>
<td>Universal Control Plane (UCP)</td>
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
<li class="active"><a data-toggle="tab" data-target="#bb2j0d1ludq000caej9g">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caeja0">Engine</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caejag">UCP</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0d1ludq000caej9g">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caeja0">Engine</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caejag">UCP</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0d1ludq000caej9g" class="tab-pane fade in active">
Docker Trusted Registry resides as an Application on a Universal
Control Plane cluster, and can be configured to send logs to a remote
logging stack. The logging stack can subsequently be configured to
back up audit records per the schedule defined by this control.
Additional information can be found at the following resources:
@y
<div class="tab-content">
<div id="bb2j0d1ludq000caej9g" class="tab-pane fade in active">
Docker Trusted Registry resides as an Application on a Universal
Control Plane cluster, and can be configured to send logs to a remote
logging stack. The logging stack can subsequently be configured to
back up audit records per the schedule defined by this control.
Additional information can be found at the following resources:
@z

@x
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/</a></li>
</ul>
@z

@x
</div>
<div id="bb2j0d1ludq000caeja0" class="tab-pane fade">
Docker Enterprise Edition can be configured to use a logging driver
that can subsequently meet the backup requirements of this control.
Additional information can be found at the following resources:
@y
</div>
<div id="bb2j0d1ludq000caeja0" class="tab-pane fade">
Docker Enterprise Edition can be configured to use a logging driver
that can subsequently meet the backup requirements of this control.
Additional information can be found at the following resources:
@z

@x
<ul>
<li><a href="https://docs.docker.com/engine/admin/logging/overview/">https://docs.docker.com/engine/admin/logging/overview/</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/engine/admin/logging/overview/">https://docs.docker.com/engine/admin/logging/overview/</a></li>
</ul>
@z

@x
</div>
<div id="bb2j0d1ludq000caejag" class="tab-pane fade">
Universal Control Plane can be configured to send logs to a remote
logging stack. The logging stack can subsequently be configured to
back up audit records per the schedule defined by this control.
Additional information can be found at the following resources:
@y
</div>
<div id="bb2j0d1ludq000caejag" class="tab-pane fade">
Universal Control Plane can be configured to send logs to a remote
logging stack. The logging stack can subsequently be configured to
back up audit records per the schedule defined by this control.
Additional information can be found at the following resources:
@z

@x
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/</a></li>
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
### AU-9 (3) Cryptographic Protection
@y
### AU-9 (3) Cryptographic Protection
@z

@x
#### Description
@y
#### Description
@z

@x
The information system implements cryptographic mechanisms to protect the integrity of audit information and audit tools.
@y
The information system implements cryptographic mechanisms to protect the integrity of audit information and audit tools.
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
<td>Docker Enterprise Edition Engine</td>
<td>none<br/></td>
<td>service provider hybrid<br/></td>
</tr>
<tr>
<td>Universal Control Plane (UCP)</td>
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
<td>Docker Enterprise Edition Engine</td>
<td>none<br/></td>
<td>service provider hybrid<br/></td>
</tr>
<tr>
<td>Universal Control Plane (UCP)</td>
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
<li class="active"><a data-toggle="tab" data-target="#bb2j0d1ludq000caejb0">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caejbg">Engine</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caejc0">UCP</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0d1ludq000caejb0">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caejbg">Engine</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caejc0">UCP</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0d1ludq000caejb0" class="tab-pane fade in active">
Docker Trusted Registry resides as an Application on a Universal
Control Plane cluster, and can be configured to send logs to a remote
logging stack. The logging stack can subsequently be configured to
meet the encryption mechanisms required by this control. Additional
information can be found at the following resources:
@y
<div class="tab-content">
<div id="bb2j0d1ludq000caejb0" class="tab-pane fade in active">
Docker Trusted Registry resides as an Application on a Universal
Control Plane cluster, and can be configured to send logs to a remote
logging stack. The logging stack can subsequently be configured to
meet the encryption mechanisms required by this control. Additional
information can be found at the following resources:
@z

@x
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/</a></li>
</ul>
@z

@x
</div>
<div id="bb2j0d1ludq000caejbg" class="tab-pane fade">
Docker Enterprise Edition can be configured to use a logging driver
that can subsequently meet the encryption mechanisms required by this
control. Additional information can be found at the following
resources:
@y
</div>
<div id="bb2j0d1ludq000caejbg" class="tab-pane fade">
Docker Enterprise Edition can be configured to use a logging driver
that can subsequently meet the encryption mechanisms required by this
control. Additional information can be found at the following
resources:
@z

@x
<ul>
<li><a href="https://docs.docker.com/engine/admin/logging/overview/">https://docs.docker.com/engine/admin/logging/overview/</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/engine/admin/logging/overview/">https://docs.docker.com/engine/admin/logging/overview/</a></li>
</ul>
@z

@x
</div>
<div id="bb2j0d1ludq000caejc0" class="tab-pane fade">
Universal Control Plane can be configured to send logs to a remote
logging stack. The logging stack can subsequently be configured to
meet the encryption mechanisms required by this control. Additional
information can be found at the following resources:
@y
</div>
<div id="bb2j0d1ludq000caejc0" class="tab-pane fade">
Universal Control Plane can be configured to send logs to a remote
logging stack. The logging stack can subsequently be configured to
meet the encryption mechanisms required by this control. Additional
information can be found at the following resources:
@z

@x
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/</a></li>
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
### AU-9 (4) Access By Subset Of Privileged Users
@y
### AU-9 (4) Access By Subset Of Privileged Users
@z

@x
#### Description
@y
#### Description
@z

@x
The organization authorizes access to management of audit functionality to only [Assignment: organization-defined subset of privileged users].
@y
The organization authorizes access to management of audit functionality to only [Assignment: organization-defined subset of privileged users].
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
### AU-9 (5) Dual Authorization
@y
### AU-9 (5) Dual Authorization
@z

@x
#### Description
@y
#### Description
@z

@x
The organization enforces dual authorization for [Selection (one or more): movement; deletion] of [Assignment: organization-defined audit information].
@y
The organization enforces dual authorization for [Selection (one or more): movement; deletion] of [Assignment: organization-defined audit information].
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
### AU-9 (6) Read Only Access
@y
### AU-9 (6) Read Only Access
@z

@x
#### Description
@y
#### Description
@z

@x
The organization authorizes read-only access to audit information to [Assignment: organization-defined subset of privileged users].
@y
The organization authorizes read-only access to audit information to [Assignment: organization-defined subset of privileged users].
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
## AU-10 Non-Repudiation
@y
## AU-10 Non-Repudiation
@z

@x
#### Description
@y
#### Description
@z

@x
The information system protects against an individual (or process acting on behalf of an individual) falsely denying having performed [Assignment: organization-defined actions to be covered by non-repudiation].
@y
The information system protects against an individual (or process acting on behalf of an individual) falsely denying having performed [Assignment: organization-defined actions to be covered by non-repudiation].
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
<td>Docker Enterprise Edition Engine</td>
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
<td>Docker Enterprise Edition Engine</td>
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
<li class="active"><a data-toggle="tab" data-target="#bb2j0d1ludq000caejcg">Engine</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0d1ludq000caejcg">Engine</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0d1ludq000caejcg" class="tab-pane fade in active">
Docker Enterprise Edition includes functionality known as Docker
Content Trust which allows one to cryptographically sign Docker
images. It enforces client-side signing and verification of image tags
and provides the ability to use digital signatures for data sent to
and received from Docker Trusted Registry. This ultimately provides
one with the ability to verify both the integrity and the publisher of
all data received from DTR over any channel. With Docker Content
Trust, an organization can enforce signature verification of all
content and prohibit unsigned and unapproved content from being
manipulated; thus supproting the non-repudiation requirements of this
control. Additional information can be found at the following
resources:
@y
<div class="tab-content">
<div id="bb2j0d1ludq000caejcg" class="tab-pane fade in active">
Docker Enterprise Edition includes functionality known as Docker
Content Trust which allows one to cryptographically sign Docker
images. It enforces client-side signing and verification of image tags
and provides the ability to use digital signatures for data sent to
and received from Docker Trusted Registry. This ultimately provides
one with the ability to verify both the integrity and the publisher of
all data received from DTR over any channel. With Docker Content
Trust, an organization can enforce signature verification of all
content and prohibit unsigned and unapproved content from being
manipulated; thus supproting the non-repudiation requirements of this
control. Additional information can be found at the following
resources:
@z

@x
<ul>
<li><a href="https://docs.docker.com/engine/security/trust/content_trust/">https://docs.docker.com/engine/security/trust/content_trust/</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/engine/security/trust/content_trust/">https://docs.docker.com/engine/security/trust/content_trust/</a></li>
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
### AU-10 (1) Association Of Identities
@y
### AU-10 (1) Association Of Identities
@z

@x
#### Description
@y
#### Description
@z

@x
The information system:
<ol type="a">
<li>Binds the identity of the information producer with the information to [Assignment: organization-defined strength of binding]; and</li>
<li>Provides the means for authorized individuals to determine the identity of the producer of the information.</li>
</ol>
@y
The information system:
<ol type="a">
<li>Binds the identity of the information producer with the information to [Assignment: organization-defined strength of binding]; and</li>
<li>Provides the means for authorized individuals to determine the identity of the producer of the information.</li>
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
### AU-10 (2) Validate Binding Of Information Producer Identity
@y
### AU-10 (2) Validate Binding Of Information Producer Identity
@z

@x
#### Description
@y
#### Description
@z

@x
The information system:
<ol type="a">
<li>Validates the binding of the information producer identity to the information at [Assignment: organization-defined frequency]; and</li>
<li>Performs [Assignment: organization-defined actions] in the event of a validation error.</li>
</ol>
@y
The information system:
<ol type="a">
<li>Validates the binding of the information producer identity to the information at [Assignment: organization-defined frequency]; and</li>
<li>Performs [Assignment: organization-defined actions] in the event of a validation error.</li>
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
### AU-10 (3) Chain Of Custody
@y
### AU-10 (3) Chain Of Custody
@z

@x
#### Description
@y
#### Description
@z

@x
The information system maintains reviewer/releaser identity and credentials within the established chain of custody for all information reviewed or released.
@y
The information system maintains reviewer/releaser identity and credentials within the established chain of custody for all information reviewed or released.
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
### AU-10 (4) Validate Binding Of Information Reviewer Identity
@y
### AU-10 (4) Validate Binding Of Information Reviewer Identity
@z

@x
#### Description
@y
#### Description
@z

@x
The information system:
<ol type="a">
<li>Validates the binding of the information reviewer identity to the information at the transfer or release points prior to release/transfer between [Assignment: organization-defined security domains]; and</li>
<li>Performs [Assignment: organization-defined actions] in the event of a validation error.</li>
</ol>
@y
The information system:
<ol type="a">
<li>Validates the binding of the information reviewer identity to the information at the transfer or release points prior to release/transfer between [Assignment: organization-defined security domains]; and</li>
<li>Performs [Assignment: organization-defined actions] in the event of a validation error.</li>
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
## AU-11 Audit Record Retention
@y
## AU-11 Audit Record Retention
@z

@x
#### Description
@y
#### Description
@z

@x
The organization retains audit records for [Assignment: organization-defined time period consistent with records retention policy] to provide support for after-the-fact investigations of security incidents and to meet regulatory and organizational information retention requirements.
@y
The organization retains audit records for [Assignment: organization-defined time period consistent with records retention policy] to provide support for after-the-fact investigations of security incidents and to meet regulatory and organizational information retention requirements.
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
<td>Docker EE system<br/>service provider corporate<br/>service provider hybrid<br/>shared<br/></td>
</tr>
<tr>
<td>Docker Enterprise Edition Engine</td>
<td>none<br/></td>
<td>service provider hybrid<br/>shared<br/></td>
</tr>
<tr>
<td>Universal Control Plane (UCP)</td>
<td>none<br/></td>
<td>service provider hybrid<br/>shared<br/></td>
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
<td>Docker EE system<br/>service provider corporate<br/>service provider hybrid<br/>shared<br/></td>
</tr>
<tr>
<td>Docker Enterprise Edition Engine</td>
<td>none<br/></td>
<td>service provider hybrid<br/>shared<br/></td>
</tr>
<tr>
<td>Universal Control Plane (UCP)</td>
<td>none<br/></td>
<td>service provider hybrid<br/>shared<br/></td>
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
<li class="active"><a data-toggle="tab" data-target="#bb2j0d1ludq000caejd0">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caejdg">Engine</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caeje0">UCP</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0d1ludq000caejd0">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caejdg">Engine</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caeje0">UCP</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0d1ludq000caejd0" class="tab-pane fade in active">
The organization will be responsible for meeting the requirements of
this control. To assist with these requirements, Docker Trusted
Registry resides as an Application on a Universal Control Plane
cluster, and as such, can be configured to send logs to a remote
logging stack. This logging stack can subsequently be configured to
retain logs for the duration required by this control. Additional
information can be found at the following resources:
@y
<div class="tab-content">
<div id="bb2j0d1ludq000caejd0" class="tab-pane fade in active">
The organization will be responsible for meeting the requirements of
this control. To assist with these requirements, Docker Trusted
Registry resides as an Application on a Universal Control Plane
cluster, and as such, can be configured to send logs to a remote
logging stack. This logging stack can subsequently be configured to
retain logs for the duration required by this control. Additional
information can be found at the following resources:
@z

@x
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/</a></li>
</ul>
@z

@x
</div>
<div id="bb2j0d1ludq000caejdg" class="tab-pane fade">
The organization will be responsible for meeting the requirements of
this control. To assist with these requirements, Docker Enterprise
Edition can be configured to use a logging driver that stores data in
a location for the duration specified by this control. Additional
information can be found at the following resources:
@y
</div>
<div id="bb2j0d1ludq000caejdg" class="tab-pane fade">
The organization will be responsible for meeting the requirements of
this control. To assist with these requirements, Docker Enterprise
Edition can be configured to use a logging driver that stores data in
a location for the duration specified by this control. Additional
information can be found at the following resources:
@z

@x
<ul>
<li><a href="https://docs.docker.com/engine/admin/logging/overview/">https://docs.docker.com/engine/admin/logging/overview/</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/engine/admin/logging/overview/">https://docs.docker.com/engine/admin/logging/overview/</a></li>
</ul>
@z

@x
</div>
<div id="bb2j0d1ludq000caeje0" class="tab-pane fade">
The organization will be responsible for meeting the requirements of
this control. To assist with these requirements, Universal Control
Plane can be configured to send logs to a remote logging stack. This
logging stack can subsequently be configured retain logs for the
duration required by this control. Additional information can be found
at the following resources:
@y
</div>
<div id="bb2j0d1ludq000caeje0" class="tab-pane fade">
The organization will be responsible for meeting the requirements of
this control. To assist with these requirements, Universal Control
Plane can be configured to send logs to a remote logging stack. This
logging stack can subsequently be configured retain logs for the
duration required by this control. Additional information can be found
at the following resources:
@z

@x
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/</a></li>
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
### AU-11 (1) Long-Term Retrieval Capability
@y
### AU-11 (1) Long-Term Retrieval Capability
@z

@x
#### Description
@y
#### Description
@z

@x
The organization employs [Assignment: organization-defined measures] to ensure that long-term audit records generated by the information system can be retrieved.
@y
The organization employs [Assignment: organization-defined measures] to ensure that long-term audit records generated by the information system can be retrieved.
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
## AU-12 Audit Generation
@y
## AU-12 Audit Generation
@z

@x
#### Description
@y
#### Description
@z

@x
The information system:
<ol type="a">
<li>Provides audit record generation capability for the auditable events defined in AU-2 a. at [Assignment: organization-defined information system components];</li>
<li>Allows [Assignment: organization-defined personnel or roles] to select which auditable events are to be audited by specific components of the information system; and</li>
<li>Generates audit records for the events defined in AU-2 d. with the content defined in AU-3.</li>
</ol>
@y
The information system:
<ol type="a">
<li>Provides audit record generation capability for the auditable events defined in AU-2 a. at [Assignment: organization-defined information system components];</li>
<li>Allows [Assignment: organization-defined personnel or roles] to select which auditable events are to be audited by specific components of the information system; and</li>
<li>Generates audit records for the events defined in AU-2 d. with the content defined in AU-3.</li>
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
<td>Docker EE system<br/>shared<br/></td>
</tr>
<tr>
<td>Docker Enterprise Edition Engine</td>
<td>none<br/></td>
<td>Docker EE system<br/>shared<br/></td>
</tr>
<tr>
<td>Universal Control Plane (UCP)</td>
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
<td>Docker Trusted Registry (DTR)</td>
<td>none<br/></td>
<td>Docker EE system<br/>shared<br/></td>
</tr>
<tr>
<td>Docker Enterprise Edition Engine</td>
<td>none<br/></td>
<td>Docker EE system<br/>shared<br/></td>
</tr>
<tr>
<td>Universal Control Plane (UCP)</td>
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
<li class="active"><a data-toggle="tab" data-target="#bb2j0d1ludq000caejeg">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caejf0">Engine</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caejfg">UCP</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0d1ludq000caejeg">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caejf0">Engine</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caejfg">UCP</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0d1ludq000caejeg" class="tab-pane fade in active">
All of the event types indicated by AU-2 a. are logged by a
combination of the backend services within Universal Control Plane and
Docker Trusted Registry. The underlying Linux operating system
supporting DTR can be configured to audit Docker-specific events with
the auditd daemon. Refer to the specific Linux distribution in use for
instructions on configuring this service. Additional information can
be found at the following resources:
@y
<div class="tab-content">
<div id="bb2j0d1ludq000caejeg" class="tab-pane fade in active">
All of the event types indicated by AU-2 a. are logged by a
combination of the backend services within Universal Control Plane and
Docker Trusted Registry. The underlying Linux operating system
supporting DTR can be configured to audit Docker-specific events with
the auditd daemon. Refer to the specific Linux distribution in use for
instructions on configuring this service. Additional information can
be found at the following resources:
@z

@x
Using auditd on the Linux operating system supporting DTR, the
organization can configure audit rules to select which Docker-specific
events are to be audited. Refer to the specific Linux distribution in
use for instructions on configuring this service.
<ul>
<li><a href="https://docs.docker.com/datacenter/dtr/2.3/guides/admin/monitor-and-troubleshoot/">https://docs.docker.com/datacenter/dtr/2.3/guides/admin/monitor-and-troubleshoot/</a></li>
</ul>
@y
Using auditd on the Linux operating system supporting DTR, the
organization can configure audit rules to select which Docker-specific
events are to be audited. Refer to the specific Linux distribution in
use for instructions on configuring this service.
<ul>
<li><a href="https://docs.docker.com/datacenter/dtr/2.3/guides/admin/monitor-and-troubleshoot/">https://docs.docker.com/datacenter/dtr/2.3/guides/admin/monitor-and-troubleshoot/</a></li>
</ul>
@z

@x
</div>
<div id="bb2j0d1ludq000caejf0" class="tab-pane fade">
Both Universal Control Plane and Docker Trusted Registry backend
service containers, all of which reside on Docker Enterprise Edition,
log all of the event types indicated by this AU-2 a. These and other
application containers that reside on Docker Enterprise Edition can be
configured to log data via an appropriate Docker logging driver. The
underlying Linux operating system supporting Docker Enterprise Edition
can be configured to audit Docker-specific events with the auditd
daemon. Refer to the specific Linux distribution in use for
instructions on configuring this service. Additional information can
be found at the following resources:
@y
</div>
<div id="bb2j0d1ludq000caejf0" class="tab-pane fade">
Both Universal Control Plane and Docker Trusted Registry backend
service containers, all of which reside on Docker Enterprise Edition,
log all of the event types indicated by this AU-2 a. These and other
application containers that reside on Docker Enterprise Edition can be
configured to log data via an appropriate Docker logging driver. The
underlying Linux operating system supporting Docker Enterprise Edition
can be configured to audit Docker-specific events with the auditd
daemon. Refer to the specific Linux distribution in use for
instructions on configuring this service. Additional information can
be found at the following resources:
@z

@x
Using auditd on the Linux operating system supporting CS Docker
Engine, the organization can configure audit rules to select which
Docker-specific events are to be audited. Refer to the specific Linux
distribution in use for instructions on configuring this service.
<ul>
<li><a href="https://docs.docker.com/engine/admin/logging/overview/">https://docs.docker.com/engine/admin/logging/overview/</a></li>
</ul>
@y
Using auditd on the Linux operating system supporting CS Docker
Engine, the organization can configure audit rules to select which
Docker-specific events are to be audited. Refer to the specific Linux
distribution in use for instructions on configuring this service.
<ul>
<li><a href="https://docs.docker.com/engine/admin/logging/overview/">https://docs.docker.com/engine/admin/logging/overview/</a></li>
</ul>
@z

@x
</div>
<div id="bb2j0d1ludq000caejfg" class="tab-pane fade">
All of the event types indicated by AU-2 a. are logged by the backend
ucp-controller service within Universal Control Plane. In addition,
each container created on a Universal Control Plane cluster logs event
data. The underlying Linux operating system supporting UCP can be
configured to audit Docker-specific events with the auditd daemon.
Refer to the specific Linux distribution in use for instructions on
configuring this service. Additional information can be found at the
following resources:
@y
</div>
<div id="bb2j0d1ludq000caejfg" class="tab-pane fade">
All of the event types indicated by AU-2 a. are logged by the backend
ucp-controller service within Universal Control Plane. In addition,
each container created on a Universal Control Plane cluster logs event
data. The underlying Linux operating system supporting UCP can be
configured to audit Docker-specific events with the auditd daemon.
Refer to the specific Linux distribution in use for instructions on
configuring this service. Additional information can be found at the
following resources:
@z

@x
Using auditd on the Linux operating system supporting UCP, the
organization can configure audit rules to select which Docker-specific
events are to be audited. Refer to the specific Linux distribution in
use for instructions on configuring this service.
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/</a></li>
</ul>
@y
Using auditd on the Linux operating system supporting UCP, the
organization can configure audit rules to select which Docker-specific
events are to be audited. Refer to the specific Linux distribution in
use for instructions on configuring this service.
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/</a></li>
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
### AU-12 (1) System-Wide / Time-Correlated Audit Trail
@y
### AU-12 (1) System-Wide / Time-Correlated Audit Trail
@z

@x
#### Description
@y
#### Description
@z

@x
The information system compiles audit records from [Assignment: organization-defined information system components] into a system-wide (logical or physical) audit trail that is time-correlated to within [Assignment: organization-defined level of tolerance for the relationship between time stamps of individual records in the audit trail].
@y
The information system compiles audit records from [Assignment: organization-defined information system components] into a system-wide (logical or physical) audit trail that is time-correlated to within [Assignment: organization-defined level of tolerance for the relationship between time stamps of individual records in the audit trail].
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
<td>Docker EE system<br/>shared<br/></td>
</tr>
<tr>
<td>Docker Enterprise Edition Engine</td>
<td>none<br/></td>
<td>Docker EE system<br/>shared<br/></td>
</tr>
<tr>
<td>Universal Control Plane (UCP)</td>
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
<td>Docker Trusted Registry (DTR)</td>
<td>none<br/></td>
<td>Docker EE system<br/>shared<br/></td>
</tr>
<tr>
<td>Docker Enterprise Edition Engine</td>
<td>none<br/></td>
<td>Docker EE system<br/>shared<br/></td>
</tr>
<tr>
<td>Universal Control Plane (UCP)</td>
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
<li class="active"><a data-toggle="tab" data-target="#bb2j0d1ludq000caejg0">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caejgg">Engine</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caejh0">UCP</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0d1ludq000caejg0">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caejgg">Engine</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caejh0">UCP</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0d1ludq000caejg0" class="tab-pane fade in active">
Docker Trusted Registry resides as an Application on a Universal
Control Plane cluster, and as such, can be configured to send logs to
a remote logging stack. This logging stack can subsequently be used to
compile audit records in to a system-wide audit trail that is
time-correlated per the requirements of this control. Additional
information can be found at the following resources:
@y
<div class="tab-content">
<div id="bb2j0d1ludq000caejg0" class="tab-pane fade in active">
Docker Trusted Registry resides as an Application on a Universal
Control Plane cluster, and as such, can be configured to send logs to
a remote logging stack. This logging stack can subsequently be used to
compile audit records in to a system-wide audit trail that is
time-correlated per the requirements of this control. Additional
information can be found at the following resources:
@z

@x
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/</a></li>
</ul>
@z

@x
</div>
<div id="bb2j0d1ludq000caejgg" class="tab-pane fade">
Docker Enterprise Edition can be configured with various logging
drivers to send audit events to an external logging stack. This
logging stack can subsequently be used to compile audit records in to
a system-wide audit trail that is time-correlated per the requirements
of this control. Additional information can be found at the following
resources:
@y
</div>
<div id="bb2j0d1ludq000caejgg" class="tab-pane fade">
Docker Enterprise Edition can be configured with various logging
drivers to send audit events to an external logging stack. This
logging stack can subsequently be used to compile audit records in to
a system-wide audit trail that is time-correlated per the requirements
of this control. Additional information can be found at the following
resources:
@z

@x
<ul>
<li><a href="https://docs.docker.com/engine/admin/logging/overview/">https://docs.docker.com/engine/admin/logging/overview/</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/engine/admin/logging/overview/">https://docs.docker.com/engine/admin/logging/overview/</a></li>
</ul>
@z

@x
</div>
<div id="bb2j0d1ludq000caejh0" class="tab-pane fade">
Universal Control Plane can be configured to send logs to a remote
logging stack. This logging stack can subsequently be used to compile
audit records in to a system-wide audit trail that is time-correlated
per the requirements of this control. Additional information can be
found at the following resources:
@y
</div>
<div id="bb2j0d1ludq000caejh0" class="tab-pane fade">
Universal Control Plane can be configured to send logs to a remote
logging stack. This logging stack can subsequently be used to compile
audit records in to a system-wide audit trail that is time-correlated
per the requirements of this control. Additional information can be
found at the following resources:
@z

@x
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/</a></li>
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
### AU-12 (2) Standardized Formats
@y
### AU-12 (2) Standardized Formats
@z

@x
#### Description
@y
#### Description
@z

@x
The information system produces a system-wide (logical or physical) audit trail composed of audit records in a standardized format.
@y
The information system produces a system-wide (logical or physical) audit trail composed of audit records in a standardized format.
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
### AU-12 (3) Changes By Authorized Individuals
@y
### AU-12 (3) Changes By Authorized Individuals
@z

@x
#### Description
@y
#### Description
@z

@x
The information system provides the capability for [Assignment: organization-defined individuals or roles] to change the auditing to be performed on [Assignment: organization-defined information system components] based on [Assignment: organization-defined selectable event criteria] within [Assignment: organization-defined time thresholds].
@y
The information system provides the capability for [Assignment: organization-defined individuals or roles] to change the auditing to be performed on [Assignment: organization-defined information system components] based on [Assignment: organization-defined selectable event criteria] within [Assignment: organization-defined time thresholds].
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
<td>service provider hybrid<br/>shared<br/></td>
</tr>
<tr>
<td>Docker Enterprise Edition Engine</td>
<td>none<br/></td>
<td>service provider hybrid<br/>shared<br/></td>
</tr>
<tr>
<td>Universal Control Plane (UCP)</td>
<td>none<br/></td>
<td>service provider hybrid<br/>shared<br/></td>
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
<td>service provider hybrid<br/>shared<br/></td>
</tr>
<tr>
<td>Docker Enterprise Edition Engine</td>
<td>none<br/></td>
<td>service provider hybrid<br/>shared<br/></td>
</tr>
<tr>
<td>Universal Control Plane (UCP)</td>
<td>none<br/></td>
<td>service provider hybrid<br/>shared<br/></td>
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
<li class="active"><a data-toggle="tab" data-target="#bb2j0d1ludq000caejhg">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caeji0">Engine</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caejig">UCP</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0d1ludq000caejhg">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caeji0">Engine</a></li>
<li><a data-toggle="tab" data-target="#bb2j0d1ludq000caejig">UCP</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0d1ludq000caejhg" class="tab-pane fade in active">
Docker Trusted Registry resides as an Application on a Universal
Control Plane cluster, and as such, can be configured to send logs to
a remote logging stack. This logging stack can subsequently be used to
meet the requirements of this control. Additional information can be
found at the following resources:
@y
<div class="tab-content">
<div id="bb2j0d1ludq000caejhg" class="tab-pane fade in active">
Docker Trusted Registry resides as an Application on a Universal
Control Plane cluster, and as such, can be configured to send logs to
a remote logging stack. This logging stack can subsequently be used to
meet the requirements of this control. Additional information can be
found at the following resources:
@z

@x
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/</a></li>
</ul>
@z

@x
</div>
<div id="bb2j0d1ludq000caeji0" class="tab-pane fade">
Docker Enterprise Edition can be configured with various logging
drivers to send audit events to an external logging stack. This
logging stack can subsequently be used to meet the requirements of
this control. Additional information can be found at the following
resources:
@y
</div>
<div id="bb2j0d1ludq000caeji0" class="tab-pane fade">
Docker Enterprise Edition can be configured with various logging
drivers to send audit events to an external logging stack. This
logging stack can subsequently be used to meet the requirements of
this control. Additional information can be found at the following
resources:
@z

@x
<ul>
<li><a href="https://docs.docker.com/engine/admin/logging/overview/">https://docs.docker.com/engine/admin/logging/overview/</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/engine/admin/logging/overview/">https://docs.docker.com/engine/admin/logging/overview/</a></li>
</ul>
@z

@x
</div>
<div id="bb2j0d1ludq000caejig" class="tab-pane fade">
Universal Control Plane can be configured to send logs to a remote
logging stack. This logging stack can subsequently be used to meet the
requirements of this control. Additional information can be found at
the following resources:
@y
</div>
<div id="bb2j0d1ludq000caejig" class="tab-pane fade">
Universal Control Plane can be configured to send logs to a remote
logging stack. This logging stack can subsequently be used to meet the
requirements of this control. Additional information can be found at
the following resources:
@z

@x
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/</a></li>
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
## AU-13 Monitoring For Information Disclosure
@y
## AU-13 Monitoring For Information Disclosure
@z

@x
#### Description
@y
#### Description
@z

@x
The organization monitors [Assignment: organization-defined open source information and/or information sites] [Assignment: organization-defined frequency] for evidence of unauthorized disclosure of organizational information.
@y
The organization monitors [Assignment: organization-defined open source information and/or information sites] [Assignment: organization-defined frequency] for evidence of unauthorized disclosure of organizational information.
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
### AU-13 (1) Use Of Automated Tools
@y
### AU-13 (1) Use Of Automated Tools
@z

@x
#### Description
@y
#### Description
@z

@x
The organization employs automated mechanisms to determine if organizational information has been disclosed in an unauthorized manner.
@y
The organization employs automated mechanisms to determine if organizational information has been disclosed in an unauthorized manner.
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
### AU-13 (2) Review Of Monitored Sites
@y
### AU-13 (2) Review Of Monitored Sites
@z

@x
#### Description
@y
#### Description
@z

@x
The organization reviews the open source information sites being monitored [Assignment: organization-defined frequency].
@y
The organization reviews the open source information sites being monitored [Assignment: organization-defined frequency].
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
## AU-14 Session Audit
@y
## AU-14 Session Audit
@z

@x
#### Description
@y
#### Description
@z

@x
The information system provides the capability for authorized users to select a user session to capture/record or view/hear.
@y
The information system provides the capability for authorized users to select a user session to capture/record or view/hear.
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
### AU-14 (1) System Start-Up
@y
### AU-14 (1) System Start-Up
@z

@x
#### Description
@y
#### Description
@z

@x
The information system initiates session audits at system start-up.
@y
The information system initiates session audits at system start-up.
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
### AU-14 (2) Capture/Record And Log Content
@y
### AU-14 (2) Capture/Record And Log Content
@z

@x
#### Description
@y
#### Description
@z

@x
The information system provides the capability for authorized users to capture/record and log content related to a user session.
@y
The information system provides the capability for authorized users to capture/record and log content related to a user session.
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
### AU-14 (3) Remote Viewing / Listening
@y
### AU-14 (3) Remote Viewing / Listening
@z

@x
#### Description
@y
#### Description
@z

@x
The information system provides the capability for authorized users to remotely view/hear all content related to an established user session in real time.
@y
The information system provides the capability for authorized users to remotely view/hear all content related to an established user session in real time.
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
## AU-15 Alternate Audit Capability
@y
## AU-15 Alternate Audit Capability
@z

@x
#### Description
@y
#### Description
@z

@x
The organization provides an alternate audit capability in the event of a failure in primary audit capability that provides [Assignment: organization-defined alternate audit functionality].
@y
The organization provides an alternate audit capability in the event of a failure in primary audit capability that provides [Assignment: organization-defined alternate audit functionality].
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
## AU-16 Cross-Organizational Auditing
@y
## AU-16 Cross-Organizational Auditing
@z

@x
#### Description
@y
#### Description
@z

@x
The organization employs [Assignment: organization-defined methods] for coordinating [Assignment: organization-defined audit information] among external organizations when audit information is transmitted across organizational boundaries.
@y
The organization employs [Assignment: organization-defined methods] for coordinating [Assignment: organization-defined audit information] among external organizations when audit information is transmitted across organizational boundaries.
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
### AU-16 (1) Identity Preservation
@y
### AU-16 (1) Identity Preservation
@z

@x
#### Description
@y
#### Description
@z

@x
The organization requires that the identity of individuals be preserved in cross-organizational audit trails.
@y
The organization requires that the identity of individuals be preserved in cross-organizational audit trails.
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
### AU-16 (2) Sharing Of Audit Information
@y
### AU-16 (2) Sharing Of Audit Information
@z

@x
#### Description
@y
#### Description
@z

@x
The organization provides cross-organizational audit information to [Assignment: organization-defined organizations] based on [Assignment: organization-defined cross-organizational sharing agreements].
@y
The organization provides cross-organizational audit information to [Assignment: organization-defined organizations] based on [Assignment: organization-defined cross-organizational sharing agreements].
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
