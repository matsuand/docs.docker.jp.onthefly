%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: "Access control"
description: "Access control reference"
keywords: "standards, compliance, security, 800-53, Access control"
---
@y
---
title: "Access control"
description: "Access control reference"
keywords: "standards, compliance, security, 800-53, Access control"
---
@z

@x
## AC-1 Access Control Policy And Procedures
@y
## AC-1 Access Control Policy And Procedures
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
<li>An access control policy that addresses purpose, scope, roles, responsibilities, management commitment, coordination among organizational entities, and compliance; and</li>
<li>Procedures to facilitate the implementation of the access control policy and associated access controls; and</li>
</ol>
<li>Reviews and updates the current:</li>
@y
<ol type="1">
<li>An access control policy that addresses purpose, scope, roles, responsibilities, management commitment, coordination among organizational entities, and compliance; and</li>
<li>Procedures to facilitate the implementation of the access control policy and associated access controls; and</li>
</ol>
<li>Reviews and updates the current:</li>
@z

@x
<ol type="1">
<li>Access control policy [Assignment: organization-defined frequency]; and</li>
<li>Access control procedures [Assignment: organization-defined frequency].</li>
</ol>
</ol>
@y
<ol type="1">
<li>Access control policy [Assignment: organization-defined frequency]; and</li>
<li>Access control procedures [Assignment: organization-defined frequency].</li>
</ol>
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
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caehf0">eNZi</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caehf0">eNZi</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0cpludq000caehf0" class="tab-pane fade in active">
To assist the organization in meeting the requirements of this
control, one can control which users and teams are allowed to create
and manipulate Docker Enterprise Edition resources. By default, no one
can make changes to the cluster. Permissions can be granted and
managed to enforce fine-grained access control. Supporting
documentation can found at the following resources:
@y
<div class="tab-content">
<div id="bb2j0cpludq000caehf0" class="tab-pane fade in active">
To assist the organization in meeting the requirements of this
control, one can control which users and teams are allowed to create
and manipulate Docker Enterprise Edition resources. By default, no one
can make changes to the cluster. Permissions can be granted and
managed to enforce fine-grained access control. Supporting
documentation can found at the following resources:
@z

@x
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/">https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/</a></li>
<li><a href="https://docs.docker.com/datacenter/dtr/2.3/guides/admin/manage-users/">https://docs.docker.com/datacenter/dtr/2.3/guides/admin/manage-users/</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/">https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/</a></li>
<li><a href="https://docs.docker.com/datacenter/dtr/2.3/guides/admin/manage-users/">https://docs.docker.com/datacenter/dtr/2.3/guides/admin/manage-users/</a></li>
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
## AC-2 Account Management
@y
## AC-2 Account Management
@z

@x
#### Description
@y
#### Description
@z

@x
The organization:
<ol type="a">
<li>Identifies and selects the following types of information system accounts to support organizational missions/business functions: [Assignment: organization-defined information system account types];</li>
<li>Assigns account managers for information system accounts;</li>
<li>Establishes conditions for group and role membership;</li>
<li>Specifies authorized users of the information system, group and role membership, and access authorizations (i.e., privileges) and other attributes (as required) for each account;</li>
<li>Requires approvals by [Assignment: organization-defined personnel or roles] for requests to create information system accounts;</li>
<li>Creates, enables, modifies, disables, and removes information system accounts in accordance with [Assignment: organization-defined procedures or conditions];</li>
<li>Monitors the use of information system accounts;</li>
<li>Notifies account managers:</li>
@y
The organization:
<ol type="a">
<li>Identifies and selects the following types of information system accounts to support organizational missions/business functions: [Assignment: organization-defined information system account types];</li>
<li>Assigns account managers for information system accounts;</li>
<li>Establishes conditions for group and role membership;</li>
<li>Specifies authorized users of the information system, group and role membership, and access authorizations (i.e., privileges) and other attributes (as required) for each account;</li>
<li>Requires approvals by [Assignment: organization-defined personnel or roles] for requests to create information system accounts;</li>
<li>Creates, enables, modifies, disables, and removes information system accounts in accordance with [Assignment: organization-defined procedures or conditions];</li>
<li>Monitors the use of information system accounts;</li>
<li>Notifies account managers:</li>
@z

@x
<ol type="1">
<li>When accounts are no longer required;</li>
<li>When users are terminated or transferred; and</li>
<li>When individual information system usage or need-to-know changes;</li>
</ol>
<li>Authorizes access to the information system based on:</li>
@y
<ol type="1">
<li>When accounts are no longer required;</li>
<li>When users are terminated or transferred; and</li>
<li>When individual information system usage or need-to-know changes;</li>
</ol>
<li>Authorizes access to the information system based on:</li>
@z

@x
<ol type="1">
<li>A valid access authorization;</li>
<li>Intended system usage; and</li>
<li>Other attributes as required by the organization or associated missions/business functions;</li>
</ol>
<li>Reviews accounts for compliance with account management requirements [Assignment: organization-defined frequency]; and</li>
<li>Establishes a process for reissuing shared/group account credentials (if deployed) when individuals are removed from the group.</li>
</ol>
@y
<ol type="1">
<li>A valid access authorization;</li>
<li>Intended system usage; and</li>
<li>Other attributes as required by the organization or associated missions/business functions;</li>
</ol>
<li>Reviews accounts for compliance with account management requirements [Assignment: organization-defined frequency]; and</li>
<li>Establishes a process for reissuing shared/group account credentials (if deployed) when individuals are removed from the group.</li>
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
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caehfg">eNZi</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caehfg">eNZi</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0cpludq000caehfg" class="tab-pane fade in active">
To assist the organization in meeting the requirements of this
control, an external identity management system (such as Microsoft&#39;s
Active Directory or an LDAP endpoint) can be configured as mandated by
this control and can be integrated with Docker Enterprise Edition.
Supporting documentation can be found at the following resources:
@y
<div class="tab-content">
<div id="bb2j0cpludq000caehfg" class="tab-pane fade in active">
To assist the organization in meeting the requirements of this
control, an external identity management system (such as Microsoft&#39;s
Active Directory or an LDAP endpoint) can be configured as mandated by
this control and can be integrated with Docker Enterprise Edition.
Supporting documentation can be found at the following resources:
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
### AC-2 (1) Automated System Account Management
@y
### AC-2 (1) Automated System Account Management
@z

@x
#### Description
@y
#### Description
@z

@x
The organization employs automated mechanisms to support the management of information system accounts.
@y
The organization employs automated mechanisms to support the management of information system accounts.
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
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caehg0">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0cpludq000caehgg">UCP</a></li>
<li><a data-toggle="tab" data-target="#bb2j0cpludq000caehh0">eNZi</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caehg0">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0cpludq000caehgg">UCP</a></li>
<li><a data-toggle="tab" data-target="#bb2j0cpludq000caehh0">eNZi</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0cpludq000caehg0" class="tab-pane fade in active">
To assist the organization in meeting the requirements of this
control, supporting documentation for managing users and teams can
found at the following resources:
@y
<div class="tab-content">
<div id="bb2j0cpludq000caehg0" class="tab-pane fade in active">
To assist the organization in meeting the requirements of this
control, supporting documentation for managing users and teams can
found at the following resources:
@z

@x
<ul>
<li><a href="https://docs.docker.com/datacenter/dtr/2.3/guides/admin/manage-users/create-and-manage-users/">https://docs.docker.com/datacenter/dtr/2.3/guides/admin/manage-users/create-and-manage-users/</a></li>
<li><a href="https://docs.docker.com/datacenter/dtr/2.3/guides/admin/manage-users/create-and-manage-teams/">https://docs.docker.com/datacenter/dtr/2.3/guides/admin/manage-users/create-and-manage-teams/</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/datacenter/dtr/2.3/guides/admin/manage-users/create-and-manage-users/">https://docs.docker.com/datacenter/dtr/2.3/guides/admin/manage-users/create-and-manage-users/</a></li>
<li><a href="https://docs.docker.com/datacenter/dtr/2.3/guides/admin/manage-users/create-and-manage-teams/">https://docs.docker.com/datacenter/dtr/2.3/guides/admin/manage-users/create-and-manage-teams/</a></li>
</ul>
@z

@x
</div>
<div id="bb2j0cpludq000caehgg" class="tab-pane fade">
To assist the organization in meeting the requirements of this
control, supporting documentation for managing users and teams can
found at the following resources:
@y
</div>
<div id="bb2j0cpludq000caehgg" class="tab-pane fade">
To assist the organization in meeting the requirements of this
control, supporting documentation for managing users and teams can
found at the following resources:
@z

@x
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/create-and-manage-users/">https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/create-and-manage-users/</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/create-and-manage-teams/">https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/create-and-manage-teams/</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/create-and-manage-users/">https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/create-and-manage-users/</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/create-and-manage-teams/">https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/create-and-manage-teams/</a></li>
</ul>
@z

@x
</div>
<div id="bb2j0cpludq000caehh0" class="tab-pane fade">
To assist the organization in meeting the requirements of this
control, an external identity management system (such as Microsoft&#39;s
Active Directory or an LDAP endpoint) can be configured as mandated by
this control and can be integrated with Docker Enterprise Edition.
Supporting documentation can be found at the following resources:
@y
</div>
<div id="bb2j0cpludq000caehh0" class="tab-pane fade">
To assist the organization in meeting the requirements of this
control, an external identity management system (such as Microsoft&#39;s
Active Directory or an LDAP endpoint) can be configured as mandated by
this control and can be integrated with Docker Enterprise Edition.
Supporting documentation can be found at the following resources:
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
### AC-2 (2) Removal Of Temporary / Emergency Accounts
@y
### AC-2 (2) Removal Of Temporary / Emergency Accounts
@z

@x
#### Description
@y
#### Description
@z

@x
The information system automatically [Selection: removes; disables] temporary and emergency accounts after [Assignment: organization-defined time period for each type of account].
@y
The information system automatically [Selection: removes; disables] temporary and emergency accounts after [Assignment: organization-defined time period for each type of account].
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
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caehhg">eNZi</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caehhg">eNZi</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0cpludq000caehhg" class="tab-pane fade in active">
Using Docker Enterprise Edition&#39;s LDAP integration capabilities, one
can disable and/or remove temporary and emergency accounts in a
connected directory service (such as Active Directory) after an
organization-defined time period. When a user is removed from LDAP,
that user becomes inactive after the LDAP synchronization runs.
Supporting documentation can be found at the following resources:
@y
<div class="tab-content">
<div id="bb2j0cpludq000caehhg" class="tab-pane fade in active">
Using Docker Enterprise Edition&#39;s LDAP integration capabilities, one
can disable and/or remove temporary and emergency accounts in a
connected directory service (such as Active Directory) after an
organization-defined time period. When a user is removed from LDAP,
that user becomes inactive after the LDAP synchronization runs.
Supporting documentation can be found at the following resources:
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
### AC-2 (3) Disable Inactive Accounts
@y
### AC-2 (3) Disable Inactive Accounts
@z

@x
#### Description
@y
#### Description
@z

@x
The information system automatically disables inactive accounts after [Assignment: organization-defined time period].
@y
The information system automatically disables inactive accounts after [Assignment: organization-defined time period].
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
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caehi0">eNZi</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caehi0">eNZi</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0cpludq000caehi0" class="tab-pane fade in active">
Using Docker Enterprise Edition&#39;s LDAP integration capabilities, one
can automatically disable inactive accounts in a connected directory
service (such as Active Directory). When a user is removed from LDAP,
that user becomes inactive after the LDAP synchronization runs.
Supporting documentation can be found at the following resources:
@y
<div class="tab-content">
<div id="bb2j0cpludq000caehi0" class="tab-pane fade in active">
Using Docker Enterprise Edition&#39;s LDAP integration capabilities, one
can automatically disable inactive accounts in a connected directory
service (such as Active Directory). When a user is removed from LDAP,
that user becomes inactive after the LDAP synchronization runs.
Supporting documentation can be found at the following resources:
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
### AC-2 (4) Automated Audit Actions
@y
### AC-2 (4) Automated Audit Actions
@z

@x
#### Description
@y
#### Description
@z

@x
The information system automatically audits account creation, modification, enabling, disabling, and removal actions, and notifies [Assignment: organization-defined personnel or roles].
@y
The information system automatically audits account creation, modification, enabling, disabling, and removal actions, and notifies [Assignment: organization-defined personnel or roles].
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
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caehig">eNZi</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caehig">eNZi</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0cpludq000caehig" class="tab-pane fade in active">
Docker Enterprise Edition logs various authentication and
authorization events to standard log files. One can configure Docker
Enterprise Edition to direct these event logs to a remote logging
service such as an Elasticsearch, Logstash and Kibana (ELK) stack and
subsequently alert on specific event types. When integrating Docker
Enterprise Edition with LDAP, one can refer the the directory
service&#39;s logging mechanisms for auditing the events defined by this
control. Supporting documentation can be found at the following
resources:
@y
<div class="tab-content">
<div id="bb2j0cpludq000caehig" class="tab-pane fade in active">
Docker Enterprise Edition logs various authentication and
authorization events to standard log files. One can configure Docker
Enterprise Edition to direct these event logs to a remote logging
service such as an Elasticsearch, Logstash and Kibana (ELK) stack and
subsequently alert on specific event types. When integrating Docker
Enterprise Edition with LDAP, one can refer the the directory
service&#39;s logging mechanisms for auditing the events defined by this
control. Supporting documentation can be found at the following
resources:
@z

@x
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/monitor-and-troubleshoot/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/monitor-and-troubleshoot/</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/monitor-and-troubleshoot/troubleshoot-with-logs/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/monitor-and-troubleshoot/troubleshoot-with-logs/</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/</a></li>
<li><a href="https://success.docker.com/Architecture/Docker_Reference_Architecture%3A_Docker_Logging_Design_and_Best_Practices">https://success.docker.com/Architecture/Docker_Reference_Architecture%3A_Docker_Logging_Design_and_Best_Practices</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/monitor-and-troubleshoot/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/monitor-and-troubleshoot/</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/monitor-and-troubleshoot/troubleshoot-with-logs/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/monitor-and-troubleshoot/troubleshoot-with-logs/</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/</a></li>
<li><a href="https://success.docker.com/Architecture/Docker_Reference_Architecture%3A_Docker_Logging_Design_and_Best_Practices">https://success.docker.com/Architecture/Docker_Reference_Architecture%3A_Docker_Logging_Design_and_Best_Practices</a></li>
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
### AC-2 (5) Inactivity Logout
@y
### AC-2 (5) Inactivity Logout
@z

@x
#### Description
@y
#### Description
@z

@x
The organization requires that users log out when [Assignment: organization-defined time-period of expected inactivity or description of when to log out].
@y
The organization requires that users log out when [Assignment: organization-defined time-period of expected inactivity or description of when to log out].
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
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caehj0">eNZi</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caehj0">eNZi</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0cpludq000caehj0" class="tab-pane fade in active">
To assist the organization in meeting the requirements of this
control, Docker Enterprise Edition can be configured to enforce automated
session termination of users after an organization-defined time period
of inactivity. By default, the initial lifetime of a user&#39;s session
is set to 72 hours and the renewal session for a user&#39;s session is
set to 24 hours. These values can both be changed in the &#34;Auth&#34;
section of the &#34;Admin Settings&#34; in Universal Control Plane.
</div>
</div>
@y
<div class="tab-content">
<div id="bb2j0cpludq000caehj0" class="tab-pane fade in active">
To assist the organization in meeting the requirements of this
control, Docker Enterprise Edition can be configured to enforce automated
session termination of users after an organization-defined time period
of inactivity. By default, the initial lifetime of a user&#39;s session
is set to 72 hours and the renewal session for a user&#39;s session is
set to 24 hours. These values can both be changed in the &#34;Auth&#34;
section of the &#34;Admin Settings&#34; in Universal Control Plane.
</div>
</div>
@z

@x
### AC-2 (6) Dynamic Privilege Management
@y
### AC-2 (6) Dynamic Privilege Management
@z

@x
#### Description
@y
#### Description
@z

@x
The information system implements the following dynamic privilege management capabilities: [Assignment: organization-defined list of dynamic privilege management capabilities].
@y
The information system implements the following dynamic privilege management capabilities: [Assignment: organization-defined list of dynamic privilege management capabilities].
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
### AC-2 (7) Role-Based Schemes
@y
### AC-2 (7) Role-Based Schemes
@z

@x
#### Description
@y
#### Description
@z

@x
The organization:
<ol type="a">
<li>Establishes and administers privileged user accounts in accordance with a role-based access scheme that organizes allowed information system access and privileges into roles;</li>
<li>Monitors privileged role assignments; and</li>
<li>Takes [Assignment: organization-defined actions] when privileged role assignments are no longer appropriate.</li>
</ol>
@y
The organization:
<ol type="a">
<li>Establishes and administers privileged user accounts in accordance with a role-based access scheme that organizes allowed information system access and privileges into roles;</li>
<li>Monitors privileged role assignments; and</li>
<li>Takes [Assignment: organization-defined actions] when privileged role assignments are no longer appropriate.</li>
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
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caehjg">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0cpludq000caehk0">UCP</a></li>
<li><a data-toggle="tab" data-target="#bb2j0cpludq000caehkg">eNZi</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caehjg">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0cpludq000caehk0">UCP</a></li>
<li><a data-toggle="tab" data-target="#bb2j0cpludq000caehkg">eNZi</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0cpludq000caehjg" class="tab-pane fade in active">
To assist the organization in meeting the requirements of this
control, supporting documentation can be found at the following
resources:
@y
<div class="tab-content">
<div id="bb2j0cpludq000caehjg" class="tab-pane fade in active">
To assist the organization in meeting the requirements of this
control, supporting documentation can be found at the following
resources:
@z

@x
<ul>
<li><a href="https://docs.docker.com/datacenter/dtr/2.3/guides/admin/manage-users/permission-levels/">https://docs.docker.com/datacenter/dtr/2.3/guides/admin/manage-users/permission-levels/</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/datacenter/dtr/2.3/guides/admin/manage-users/permission-levels/">https://docs.docker.com/datacenter/dtr/2.3/guides/admin/manage-users/permission-levels/</a></li>
</ul>
@z

@x
</div>
<div id="bb2j0cpludq000caehk0" class="tab-pane fade">
To assist the organization in meeting the requirements of this
control, supporting documentation can be found at the following
resources:
@y
</div>
<div id="bb2j0cpludq000caehk0" class="tab-pane fade">
To assist the organization in meeting the requirements of this
control, supporting documentation can be found at the following
resources:
@z

@x
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/permission-levels/">https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/permission-levels/</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/permission-levels/">https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/permission-levels/</a></li>
</ul>
@z

@x
</div>
<div id="bb2j0cpludq000caehkg" class="tab-pane fade">
To assist the organization in meeting the requirements of this
control, Docker Enterprise Edition supports various levels of user
permissions and role-based access control enforcements. Administrator
users have permissions to: manage other Docker Enterprise Edition
users, manage Docker Trusted Registry repositories and settings, and
manage the Universal Control Plane and underlying Docker Swarm Mode
cluster. Supporting documentation can be found at the following
resources:
@y
</div>
<div id="bb2j0cpludq000caehkg" class="tab-pane fade">
To assist the organization in meeting the requirements of this
control, Docker Enterprise Edition supports various levels of user
permissions and role-based access control enforcements. Administrator
users have permissions to: manage other Docker Enterprise Edition
users, manage Docker Trusted Registry repositories and settings, and
manage the Universal Control Plane and underlying Docker Swarm Mode
cluster. Supporting documentation can be found at the following
resources:
@z

@x
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/">https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/</a></li>
<li><a href="https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Docker_Datacenter_Best_Practices_and_Design_Considerations#Identity_Management">https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Docker_Datacenter_Best_Practices_and_Design_Considerations#Identity_Management</a></li>
<li><a href="https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Securing_Docker_Datacenter_and_Security_Best_Practices#RBAC">https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Securing_Docker_Datacenter_and_Security_Best_Practices#RBAC</a></li>
<li><a href="https://docs.docker.com/datacenter/dtr/2.3/guides/admin/manage-users/">https://docs.docker.com/datacenter/dtr/2.3/guides/admin/manage-users/</a></li>
<li><a href="https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Securing_Docker_Datacenter_and_Security_Best_Practices#Organizations_.E2.80.94_RBAC">https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Securing_Docker_Datacenter_and_Security_Best_Practices#Organizations_.E2.80.94_RBAC</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/">https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/</a></li>
<li><a href="https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Docker_Datacenter_Best_Practices_and_Design_Considerations#Identity_Management">https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Docker_Datacenter_Best_Practices_and_Design_Considerations#Identity_Management</a></li>
<li><a href="https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Securing_Docker_Datacenter_and_Security_Best_Practices#RBAC">https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Securing_Docker_Datacenter_and_Security_Best_Practices#RBAC</a></li>
<li><a href="https://docs.docker.com/datacenter/dtr/2.3/guides/admin/manage-users/">https://docs.docker.com/datacenter/dtr/2.3/guides/admin/manage-users/</a></li>
<li><a href="https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Securing_Docker_Datacenter_and_Security_Best_Practices#Organizations_.E2.80.94_RBAC">https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Securing_Docker_Datacenter_and_Security_Best_Practices#Organizations_.E2.80.94_RBAC</a></li>
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
### AC-2 (8) Dynamic Account Creation
@y
### AC-2 (8) Dynamic Account Creation
@z

@x
#### Description
@y
#### Description
@z

@x
The information system creates [Assignment: organization-defined information system accounts] dynamically.
@y
The information system creates [Assignment: organization-defined information system accounts] dynamically.
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
### AC-2 (9) Restrictions On Use Of Shared / Group Accounts
@y
### AC-2 (9) Restrictions On Use Of Shared / Group Accounts
@z

@x
#### Description
@y
#### Description
@z

@x
The organization only permits the use of shared/group accounts that meet [Assignment: organization-defined conditions for establishing shared/group accounts].
@y
The organization only permits the use of shared/group accounts that meet [Assignment: organization-defined conditions for establishing shared/group accounts].
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
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caehl0">eNZi</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caehl0">eNZi</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0cpludq000caehl0" class="tab-pane fade in active">
To assist the organization in meeting the requirements of this
control, users and/or groups synchronized to Docker Enterprise Edition
via LDAP can be configured at the directory service.
</div>
</div>
@y
<div class="tab-content">
<div id="bb2j0cpludq000caehl0" class="tab-pane fade in active">
To assist the organization in meeting the requirements of this
control, users and/or groups synchronized to Docker Enterprise Edition
via LDAP can be configured at the directory service.
</div>
</div>
@z

@x
### AC-2 (10) Shared / Group Account Credential Termination
@y
### AC-2 (10) Shared / Group Account Credential Termination
@z

@x
#### Description
@y
#### Description
@z

@x
The information system terminates shared/group account credentials when members leave the group.
@y
The information system terminates shared/group account credentials when members leave the group.
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
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caehlg">eNZi</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caehlg">eNZi</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0cpludq000caehlg" class="tab-pane fade in active">
Users and/or groups synchronized to Docker Enterprise Edition via
LDAP can be configured at the directory service to ensure shared/group
account credentials are terminated when members leave the group.
</div>
</div>
@y
<div class="tab-content">
<div id="bb2j0cpludq000caehlg" class="tab-pane fade in active">
Users and/or groups synchronized to Docker Enterprise Edition via
LDAP can be configured at the directory service to ensure shared/group
account credentials are terminated when members leave the group.
</div>
</div>
@z

@x
### AC-2 (11) Usage Conditions
@y
### AC-2 (11) Usage Conditions
@z

@x
#### Description
@y
#### Description
@z

@x
The information system enforces [Assignment: organization-defined circumstances and/or usage conditions] for [Assignment: organization-defined information system accounts].
@y
The information system enforces [Assignment: organization-defined circumstances and/or usage conditions] for [Assignment: organization-defined information system accounts].
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
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caehm0">eNZi</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caehm0">eNZi</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0cpludq000caehm0" class="tab-pane fade in active">
Information system accounts synchronized to Docker Enterprise Edition
via LDAP can be configured at the directory service to meet this
requirement as necessary.
</div>
</div>
@y
<div class="tab-content">
<div id="bb2j0cpludq000caehm0" class="tab-pane fade in active">
Information system accounts synchronized to Docker Enterprise Edition
via LDAP can be configured at the directory service to meet this
requirement as necessary.
</div>
</div>
@z

@x
### AC-2 (12) Account Monitoring / Atypical Usage
@y
### AC-2 (12) Account Monitoring / Atypical Usage
@z

@x
#### Description
@y
#### Description
@z

@x
The organization:
<ol type="a">
<li>Monitors information system accounts for [Assignment: organization-defined atypical usage]; and</li>
<li>Reports atypical usage of information system accounts to [Assignment: organization-defined personnel or roles].</li>
</ol>
@y
The organization:
<ol type="a">
<li>Monitors information system accounts for [Assignment: organization-defined atypical usage]; and</li>
<li>Reports atypical usage of information system accounts to [Assignment: organization-defined personnel or roles].</li>
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
<td>Docker Enterprise Edition Engine</td>
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
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caehmg">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0cpludq000caehn0">Engine</a></li>
<li><a data-toggle="tab" data-target="#bb2j0cpludq000caehng">UCP</a></li>
<li><a data-toggle="tab" data-target="#bb2j0cpludq000caeho0">eNZi</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caehmg">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0cpludq000caehn0">Engine</a></li>
<li><a data-toggle="tab" data-target="#bb2j0cpludq000caehng">UCP</a></li>
<li><a data-toggle="tab" data-target="#bb2j0cpludq000caeho0">eNZi</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0cpludq000caehmg" class="tab-pane fade in active">
To assist the organization in meeting the requirements of this
control, supporting documentation can be found at the following
resources:
@y
<div class="tab-content">
<div id="bb2j0cpludq000caehmg" class="tab-pane fade in active">
To assist the organization in meeting the requirements of this
control, supporting documentation can be found at the following
resources:
@z

@x
<ul>
<li><a href="https://docs.docker.com/datacenter/dtr/2.3/guides/admin/monitor-and-troubleshoot/">https://docs.docker.com/datacenter/dtr/2.3/guides/admin/monitor-and-troubleshoot/</a></li>
<li><a href="https://docs.docker.com/datacenter/dtr/2.3/guides/admin/monitor-and-troubleshoot/troubleshoot-with-logs/">https://docs.docker.com/datacenter/dtr/2.3/guides/admin/monitor-and-troubleshoot/troubleshoot-with-logs/</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/datacenter/dtr/2.3/guides/admin/monitor-and-troubleshoot/">https://docs.docker.com/datacenter/dtr/2.3/guides/admin/monitor-and-troubleshoot/</a></li>
<li><a href="https://docs.docker.com/datacenter/dtr/2.3/guides/admin/monitor-and-troubleshoot/troubleshoot-with-logs/">https://docs.docker.com/datacenter/dtr/2.3/guides/admin/monitor-and-troubleshoot/troubleshoot-with-logs/</a></li>
</ul>
@z

@x
</div>
<div id="bb2j0cpludq000caehn0" class="tab-pane fade">
To assist the organization in meeting the requirements of this
control, Docker Enterprise Edition can be configured to aggregate
container and daemon events via a number of logging drivers.
Supporting documentation can be found at the following resources:
@y
</div>
<div id="bb2j0cpludq000caehn0" class="tab-pane fade">
To assist the organization in meeting the requirements of this
control, Docker Enterprise Edition can be configured to aggregate
container and daemon events via a number of logging drivers.
Supporting documentation can be found at the following resources:
@z

@x
<ul>
<li><a href="https://docs.docker.com/engine/admin/logging/view_container_logs/">https://docs.docker.com/engine/admin/logging/view_container_logs/</a></li>
<li><a href="https://docs.docker.com/engine/admin/logging/overview/">https://docs.docker.com/engine/admin/logging/overview/</a></li>
<li><a href="https://docs.docker.com/engine/admin/logging/log_tags/">https://docs.docker.com/engine/admin/logging/log_tags/</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/engine/admin/logging/view_container_logs/">https://docs.docker.com/engine/admin/logging/view_container_logs/</a></li>
<li><a href="https://docs.docker.com/engine/admin/logging/overview/">https://docs.docker.com/engine/admin/logging/overview/</a></li>
<li><a href="https://docs.docker.com/engine/admin/logging/log_tags/">https://docs.docker.com/engine/admin/logging/log_tags/</a></li>
</ul>
@z

@x
</div>
<div id="bb2j0cpludq000caehng" class="tab-pane fade">
To assist the organization in meeting the requirements of this
control, Universal Control Plane can be configured to send system
account log data to a remote logging service such as an Elasticsearch,
Logstash and Kibana (ELK) stack. Supporting documentation can be found
at the following resources:
@y
</div>
<div id="bb2j0cpludq000caehng" class="tab-pane fade">
To assist the organization in meeting the requirements of this
control, Universal Control Plane can be configured to send system
account log data to a remote logging service such as an Elasticsearch,
Logstash and Kibana (ELK) stack. Supporting documentation can be found
at the following resources:
@z

@x
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/monitor-and-troubleshoot/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/monitor-and-troubleshoot/</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/monitor-and-troubleshoot/troubleshoot-node-messages/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/monitor-and-troubleshoot/troubleshoot-node-messages/</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/monitor-and-troubleshoot/troubleshoot-with-logs/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/monitor-and-troubleshoot/troubleshoot-with-logs/</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/monitor-and-troubleshoot/troubleshoot-configurations/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/monitor-and-troubleshoot/troubleshoot-configurations/</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/monitor-and-troubleshoot/troubleshoot-task-state/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/monitor-and-troubleshoot/troubleshoot-task-state/</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/</a></li>
<li><a href="https://success.docker.com/Architecture/Docker_Reference_Architecture%3A_Docker_Logging_Design_and_Best_Practices">https://success.docker.com/Architecture/Docker_Reference_Architecture%3A_Docker_Logging_Design_and_Best_Practices</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/monitor-and-troubleshoot/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/monitor-and-troubleshoot/</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/monitor-and-troubleshoot/troubleshoot-node-messages/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/monitor-and-troubleshoot/troubleshoot-node-messages/</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/monitor-and-troubleshoot/troubleshoot-with-logs/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/monitor-and-troubleshoot/troubleshoot-with-logs/</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/monitor-and-troubleshoot/troubleshoot-configurations/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/monitor-and-troubleshoot/troubleshoot-configurations/</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/monitor-and-troubleshoot/troubleshoot-task-state/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/monitor-and-troubleshoot/troubleshoot-task-state/</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/</a></li>
<li><a href="https://success.docker.com/Architecture/Docker_Reference_Architecture%3A_Docker_Logging_Design_and_Best_Practices">https://success.docker.com/Architecture/Docker_Reference_Architecture%3A_Docker_Logging_Design_and_Best_Practices</a></li>
</ul>
@z

@x
</div>
<div id="bb2j0cpludq000caeho0" class="tab-pane fade">
To assist the organization in meeting the requirements of this
control, when Docker Enterprise Edition is configured for LDAP
integration, one can refer to the directory service&#39;s existing
monitoring tools.
</div>
</div>
@y
</div>
<div id="bb2j0cpludq000caeho0" class="tab-pane fade">
To assist the organization in meeting the requirements of this
control, when Docker Enterprise Edition is configured for LDAP
integration, one can refer to the directory service&#39;s existing
monitoring tools.
</div>
</div>
@z

@x
### AC-2 (13) Disable Accounts For High-Risk Individuals
@y
### AC-2 (13) Disable Accounts For High-Risk Individuals
@z

@x
#### Description
@y
#### Description
@z

@x
The organization disables accounts of users posing a significant risk within [Assignment: organization-defined time period] of discovery of the risk.
@y
The organization disables accounts of users posing a significant risk within [Assignment: organization-defined time period] of discovery of the risk.
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
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caehog">eNZi</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caehog">eNZi</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0cpludq000caehog" class="tab-pane fade in active">
To assist the organization in meeting the requirements of this
control, users and/or groups synchronized to Docker Enterprise Edition
via LDAP can be managed at the directory service and disabled if
posing a significant risk.
</div>
</div>
@y
<div class="tab-content">
<div id="bb2j0cpludq000caehog" class="tab-pane fade in active">
To assist the organization in meeting the requirements of this
control, users and/or groups synchronized to Docker Enterprise Edition
via LDAP can be managed at the directory service and disabled if
posing a significant risk.
</div>
</div>
@z

@x
## AC-3 Access Enforcement
@y
## AC-3 Access Enforcement
@z

@x
#### Description
@y
#### Description
@z

@x
The information system enforces approved authorizations for logical access to information           and system resources in accordance with applicable access control policies.
@y
The information system enforces approved authorizations for logical access to information           and system resources in accordance with applicable access control policies.
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
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caehp0">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0cpludq000caehpg">UCP</a></li>
<li><a data-toggle="tab" data-target="#bb2j0cpludq000caehq0">eNZi</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caehp0">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0cpludq000caehpg">UCP</a></li>
<li><a data-toggle="tab" data-target="#bb2j0cpludq000caehq0">eNZi</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0cpludq000caehp0" class="tab-pane fade in active">
One can control which users and teams can create and manipulate
Docker Trusted Registry resources. By default, no one can make changes
to the cluster. Permissions can be granted and managed to enforce
fine-grained access control. Supporting documentation can be found at
the following resources:
@y
<div class="tab-content">
<div id="bb2j0cpludq000caehp0" class="tab-pane fade in active">
One can control which users and teams can create and manipulate
Docker Trusted Registry resources. By default, no one can make changes
to the cluster. Permissions can be granted and managed to enforce
fine-grained access control. Supporting documentation can be found at
the following resources:
@z

@x
<ul>
<li><a href="https://docs.docker.com/datacenter/dtr/2.3/guides/admin/manage-users/">https://docs.docker.com/datacenter/dtr/2.3/guides/admin/manage-users/</a></li>
<li><a href="https://docs.docker.com/datacenter/dtr/2.3/guides/admin/manage-users/permission-levels/">https://docs.docker.com/datacenter/dtr/2.3/guides/admin/manage-users/permission-levels/</a></li>
<li><a href="https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Securing_Docker_Datacenter_and_Security_Best_Practices#Organizations_.E2.80.94_RBAC">https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Securing_Docker_Datacenter_and_Security_Best_Practices#Organizations_.E2.80.94_RBAC</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/datacenter/dtr/2.3/guides/admin/manage-users/">https://docs.docker.com/datacenter/dtr/2.3/guides/admin/manage-users/</a></li>
<li><a href="https://docs.docker.com/datacenter/dtr/2.3/guides/admin/manage-users/permission-levels/">https://docs.docker.com/datacenter/dtr/2.3/guides/admin/manage-users/permission-levels/</a></li>
<li><a href="https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Securing_Docker_Datacenter_and_Security_Best_Practices#Organizations_.E2.80.94_RBAC">https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Securing_Docker_Datacenter_and_Security_Best_Practices#Organizations_.E2.80.94_RBAC</a></li>
</ul>
@z

@x
</div>
<div id="bb2j0cpludq000caehpg" class="tab-pane fade">
One can control which users and teams can create and manipulate
Universal Control Plane resources. By default, no one can make changes
to the cluster. Permissions can be granted and managed to enforce
fine-grained access control. Supporting documentation can be found at
the following resources:
@y
</div>
<div id="bb2j0cpludq000caehpg" class="tab-pane fade">
One can control which users and teams can create and manipulate
Universal Control Plane resources. By default, no one can make changes
to the cluster. Permissions can be granted and managed to enforce
fine-grained access control. Supporting documentation can be found at
the following resources:
@z

@x
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/">https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/deploy-view-only-service/">https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/deploy-view-only-service/</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/grant-permissions/">https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/grant-permissions/</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/isolate-nodes-between-teams/">https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/isolate-nodes-between-teams/</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/isolate-volumes-between-teams/">https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/isolate-volumes-between-teams/</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/manage-access-with-collections/">https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/manage-access-with-collections/</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/access-control-node/">https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/access-control-node/</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/permission-levels/">https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/permission-levels/</a></li>
<li><a href="https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Docker_Datacenter_Best_Practices_and_Design_Considerations#RBAC_and_Managing_Team_Level_Access_to_Resources">https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Docker_Datacenter_Best_Practices_and_Design_Considerations#RBAC_and_Managing_Team_Level_Access_to_Resources</a></li>
<li><a href="https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Securing_Docker_Datacenter_and_Security_Best_Practices#RBAC">https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Securing_Docker_Datacenter_and_Security_Best_Practices#RBAC</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/">https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/deploy-view-only-service/">https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/deploy-view-only-service/</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/grant-permissions/">https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/grant-permissions/</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/isolate-nodes-between-teams/">https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/isolate-nodes-between-teams/</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/isolate-volumes-between-teams/">https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/isolate-volumes-between-teams/</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/manage-access-with-collections/">https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/manage-access-with-collections/</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/access-control-node/">https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/access-control-node/</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/permission-levels/">https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/permission-levels/</a></li>
<li><a href="https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Docker_Datacenter_Best_Practices_and_Design_Considerations#RBAC_and_Managing_Team_Level_Access_to_Resources">https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Docker_Datacenter_Best_Practices_and_Design_Considerations#RBAC_and_Managing_Team_Level_Access_to_Resources</a></li>
<li><a href="https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Securing_Docker_Datacenter_and_Security_Best_Practices#RBAC">https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Securing_Docker_Datacenter_and_Security_Best_Practices#RBAC</a></li>
</ul>
@z

@x
</div>
<div id="bb2j0cpludq000caehq0" class="tab-pane fade">
One can control which users and teams can create and manipulate
Docker Enterprise Edition resources. By default, no one can make
changes to the cluster. Permissions can be granted and managed to
enforce fine-grained access control. The eNZi component facilitates
authorizations as dictated by the system&#39;s administrators. Supporting
documentation can be found at the following resources:
@y
</div>
<div id="bb2j0cpludq000caehq0" class="tab-pane fade">
One can control which users and teams can create and manipulate
Docker Enterprise Edition resources. By default, no one can make
changes to the cluster. Permissions can be granted and managed to
enforce fine-grained access control. The eNZi component facilitates
authorizations as dictated by the system&#39;s administrators. Supporting
documentation can be found at the following resources:
@z

@x
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/">https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/">https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/</a></li>
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
### AC-3 (2) Dual Authorization
@y
### AC-3 (2) Dual Authorization
@z

@x
#### Description
@y
#### Description
@z

@x
The information system enforces dual authorization for [Assignment: organization-defined privileged commands and/or other organization-defined actions].
@y
The information system enforces dual authorization for [Assignment: organization-defined privileged commands and/or other organization-defined actions].
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
### AC-3 (3) Mandatory Access Control
@y
### AC-3 (3) Mandatory Access Control
@z

@x
#### Description
@y
#### Description
@z

@x
The information system enforces [Assignment: organization-defined mandatory access control policy] over all subjects and objects where the policy:
<ol type="a">
<li>Is uniformly enforced across all subjects and objects within the boundary of the information system;</li>
<li>Specifies that a subject that has been granted access to information is constrained from doing any of the following;</li>
@y
The information system enforces [Assignment: organization-defined mandatory access control policy] over all subjects and objects where the policy:
<ol type="a">
<li>Is uniformly enforced across all subjects and objects within the boundary of the information system;</li>
<li>Specifies that a subject that has been granted access to information is constrained from doing any of the following;</li>
@z

@x
<ol type="1">
<li>Passing the information to unauthorized subjects or objects;</li>
<li>Granting its privileges to other subjects;</li>
<li>Changing one or more security attributes on subjects, objects, the information system, or information system components;</li>
<li>Choosing the security attributes and attribute values to be associated with newly created or modified objects; or</li>
<li>Changing the rules governing access control; and</li>
</ol>
<li>Specifies that [Assignment: organization-defined subjects] may explicitly be granted [Assignment: organization-defined privileges (i.e., they are trusted subjects)] such that they are not limited by some or all of the above constraints.</li>
</ol>
@y
<ol type="1">
<li>Passing the information to unauthorized subjects or objects;</li>
<li>Granting its privileges to other subjects;</li>
<li>Changing one or more security attributes on subjects, objects, the information system, or information system components;</li>
<li>Choosing the security attributes and attribute values to be associated with newly created or modified objects; or</li>
<li>Changing the rules governing access control; and</li>
</ol>
<li>Specifies that [Assignment: organization-defined subjects] may explicitly be granted [Assignment: organization-defined privileges (i.e., they are trusted subjects)] such that they are not limited by some or all of the above constraints.</li>
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
### AC-3 (4) Discretionary Access Control
@y
### AC-3 (4) Discretionary Access Control
@z

@x
#### Description
@y
#### Description
@z

@x
The information system enforces [Assignment: organization-defined discretionary access control policy] over defined subjects and objects where the policy specifies that a subject that has been granted access to information can do one or more of the following:
<ol type="a">
<li>Pass the  information to any other subjects or objects;</li>
<li>Grant its privileges to other subjects;</li>
<li>Change security attributes on subjects, objects, the information system, or the information system�s components;</li>
<li>Choose the security attributes to be associated with newly created or revised objects; or</li>
<li>Change the rules governing access control.</li>
</ol>
@y
The information system enforces [Assignment: organization-defined discretionary access control policy] over defined subjects and objects where the policy specifies that a subject that has been granted access to information can do one or more of the following:
<ol type="a">
<li>Pass the  information to any other subjects or objects;</li>
<li>Grant its privileges to other subjects;</li>
<li>Change security attributes on subjects, objects, the information system, or the information system�s components;</li>
<li>Choose the security attributes to be associated with newly created or revised objects; or</li>
<li>Change the rules governing access control.</li>
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
### AC-3 (5) Security-Relevant Information
@y
### AC-3 (5) Security-Relevant Information
@z

@x
#### Description
@y
#### Description
@z

@x
The information system prevents access to [Assignment: organization-defined security-relevant information] except during secure, non-operable system states.
@y
The information system prevents access to [Assignment: organization-defined security-relevant information] except during secure, non-operable system states.
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
### AC-3 (7) Role-Based Access Control
@y
### AC-3 (7) Role-Based Access Control
@z

@x
#### Description
@y
#### Description
@z

@x
The information system enforces a role-based access control policy over defined subjects and objects and controls access based upon [Assignment: organization-defined roles and users authorized to assume such roles].
@y
The information system enforces a role-based access control policy over defined subjects and objects and controls access based upon [Assignment: organization-defined roles and users authorized to assume such roles].
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
### AC-3 (8) Revocation Of Access Authorizations
@y
### AC-3 (8) Revocation Of Access Authorizations
@z

@x
#### Description
@y
#### Description
@z

@x
The information system enforces the revocation of access authorizations resulting from changes to the security attributes of subjects and objects based on [Assignment: organization-defined rules governing the timing of revocations of access authorizations].
@y
The information system enforces the revocation of access authorizations resulting from changes to the security attributes of subjects and objects based on [Assignment: organization-defined rules governing the timing of revocations of access authorizations].
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
### AC-3 (9) Controlled Release
@y
### AC-3 (9) Controlled Release
@z

@x
#### Description
@y
#### Description
@z

@x
The information system does not release information outside of the established system boundary unless:
<ol type="a">
<li>The receiving [Assignment: organization-defined information system or system component] provides [Assignment: organization-defined security safeguards]; and</li>
<li>[Assignment: organization-defined security safeguards] are used to validate the appropriateness of the information designated for release.</li>
</ol>
@y
The information system does not release information outside of the established system boundary unless:
<ol type="a">
<li>The receiving [Assignment: organization-defined information system or system component] provides [Assignment: organization-defined security safeguards]; and</li>
<li>[Assignment: organization-defined security safeguards] are used to validate the appropriateness of the information designated for release.</li>
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
### AC-3 (10) Audited Override Of Access Control Mechanisms
@y
### AC-3 (10) Audited Override Of Access Control Mechanisms
@z

@x
#### Description
@y
#### Description
@z

@x
The organization employs an audited override of automated access control mechanisms under [Assignment: organization-defined conditions].
@y
The organization employs an audited override of automated access control mechanisms under [Assignment: organization-defined conditions].
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
## AC-4 Information Flow Enforcement
@y
## AC-4 Information Flow Enforcement
@z

@x
#### Description
@y
#### Description
@z

@x
The information system enforces approved authorizations for controlling the flow of information within the system and between interconnected systems based on [Assignment: organization-defined information flow control policies].
@y
The information system enforces approved authorizations for controlling the flow of information within the system and between interconnected systems based on [Assignment: organization-defined information flow control policies].
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
<td>service provider hybrid<br/></td>
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
<td>service provider hybrid<br/></td>
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
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caehqg">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0cpludq000caehr0">Engine</a></li>
<li><a data-toggle="tab" data-target="#bb2j0cpludq000caehrg">UCP</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caehqg">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0cpludq000caehr0">Engine</a></li>
<li><a data-toggle="tab" data-target="#bb2j0cpludq000caehrg">UCP</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0cpludq000caehqg" class="tab-pane fade in active">
Supporting documentation to configure Docker Trusted Registry to meet
the requirements of this control can be found at the following
resources:
@y
<div class="tab-content">
<div id="bb2j0cpludq000caehqg" class="tab-pane fade in active">
Supporting documentation to configure Docker Trusted Registry to meet
the requirements of this control can be found at the following
resources:
@z

@x
<ul>
<li><a href="https://docs.docker.com/datacenter/dtr/2.3/guides/architecture/">https://docs.docker.com/datacenter/dtr/2.3/guides/architecture/</a></li>
<li><a href="https://docs.docker.com/datacenter/dtr/2.3/guides/admin/install/system-requirements/#/ports-used">https://docs.docker.com/datacenter/dtr/2.3/guides/admin/install/system-requirements/#/ports-used</a></li>
<li><a href="https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Docker_Datacenter_Best_Practices_and_Design_Considerations#Infrastructure_Considerations">https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Docker_Datacenter_Best_Practices_and_Design_Considerations#Infrastructure_Considerations</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/datacenter/dtr/2.3/guides/architecture/">https://docs.docker.com/datacenter/dtr/2.3/guides/architecture/</a></li>
<li><a href="https://docs.docker.com/datacenter/dtr/2.3/guides/admin/install/system-requirements/#/ports-used">https://docs.docker.com/datacenter/dtr/2.3/guides/admin/install/system-requirements/#/ports-used</a></li>
<li><a href="https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Docker_Datacenter_Best_Practices_and_Design_Considerations#Infrastructure_Considerations">https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Docker_Datacenter_Best_Practices_and_Design_Considerations#Infrastructure_Considerations</a></li>
</ul>
@z

@x
</div>
<div id="bb2j0cpludq000caehr0" class="tab-pane fade">
Docker Enterprise Edition can be configured to control the flow of
information that originates from applications running in containers.
Supporting documentation can be found at the following resources:
@y
</div>
<div id="bb2j0cpludq000caehr0" class="tab-pane fade">
Docker Enterprise Edition can be configured to control the flow of
information that originates from applications running in containers.
Supporting documentation can be found at the following resources:
@z

@x
<ul>
<li><a href="https://docs.docker.com/engine/userguide/networking/">https://docs.docker.com/engine/userguide/networking/</a></li>
<li><a href="http://success.docker.com/Datacenter/Apply/Docker_Reference_Architecture%3A_Designing_Scalable%2C_Portable_Docker_Container_Networks">http://success.docker.com/Datacenter/Apply/Docker_Reference_Architecture%3A_Designing_Scalable%2C_Portable_Docker_Container_Networks</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/engine/userguide/networking/">https://docs.docker.com/engine/userguide/networking/</a></li>
<li><a href="http://success.docker.com/Datacenter/Apply/Docker_Reference_Architecture%3A_Designing_Scalable%2C_Portable_Docker_Container_Networks">http://success.docker.com/Datacenter/Apply/Docker_Reference_Architecture%3A_Designing_Scalable%2C_Portable_Docker_Container_Networks</a></li>
</ul>
@z

@x
</div>
<div id="bb2j0cpludq000caehrg" class="tab-pane fade">
Supporting documentation to configure Universal Control Plane to meet
the requirements of this control can be found at the following
resources:
@y
</div>
<div id="bb2j0cpludq000caehrg" class="tab-pane fade">
Supporting documentation to configure Universal Control Plane to meet
the requirements of this control can be found at the following
resources:
@z

@x
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/architecture/">https://docs.docker.com/datacenter/ucp/2.2/guides/architecture/</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/install/system-requirements/#ports-used">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/install/system-requirements/#ports-used</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/use-domain-names-to-access-services/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/use-domain-names-to-access-services/</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/restrict-services-to-worker-nodes/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/restrict-services-to-worker-nodes/</a></li>
<li><a href="https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Universal_Control_Plane_2.0_Service_Discovery_and_Load_Balancing">https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Universal_Control_Plane_2.0_Service_Discovery_and_Load_Balancing</a></li>
<li><a href="https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Docker_Datacenter_Best_Practices_and_Design_Considerations#Infrastructure_Considerations">https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Docker_Datacenter_Best_Practices_and_Design_Considerations#Infrastructure_Considerations</a></li>
<li><a href="https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Securing_Docker_Datacenter_and_Security_Best_Practices#Networking">https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Securing_Docker_Datacenter_and_Security_Best_Practices#Networking</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/architecture/">https://docs.docker.com/datacenter/ucp/2.2/guides/architecture/</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/install/system-requirements/#ports-used">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/install/system-requirements/#ports-used</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/use-domain-names-to-access-services/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/use-domain-names-to-access-services/</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/restrict-services-to-worker-nodes/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/restrict-services-to-worker-nodes/</a></li>
<li><a href="https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Universal_Control_Plane_2.0_Service_Discovery_and_Load_Balancing">https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Universal_Control_Plane_2.0_Service_Discovery_and_Load_Balancing</a></li>
<li><a href="https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Docker_Datacenter_Best_Practices_and_Design_Considerations#Infrastructure_Considerations">https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Docker_Datacenter_Best_Practices_and_Design_Considerations#Infrastructure_Considerations</a></li>
<li><a href="https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Securing_Docker_Datacenter_and_Security_Best_Practices#Networking">https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Securing_Docker_Datacenter_and_Security_Best_Practices#Networking</a></li>
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
### AC-4 (1) Object Security Attributes
@y
### AC-4 (1) Object Security Attributes
@z

@x
#### Description
@y
#### Description
@z

@x
The information system uses [Assignment: organization-defined security attributes] associated with [Assignment: organization-defined information, source, and destination objects] to enforce [Assignment: organization-defined information flow control policies] as a basis for flow control decisions.
@y
The information system uses [Assignment: organization-defined security attributes] associated with [Assignment: organization-defined information, source, and destination objects] to enforce [Assignment: organization-defined information flow control policies] as a basis for flow control decisions.
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
### AC-4 (2) Processing Domains
@y
### AC-4 (2) Processing Domains
@z

@x
#### Description
@y
#### Description
@z

@x
The information system uses protected processing domains to enforce [Assignment: organization-defined information flow control policies] as a basis for flow control decisions.
@y
The information system uses protected processing domains to enforce [Assignment: organization-defined information flow control policies] as a basis for flow control decisions.
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
### AC-4 (3) Dynamic Information Flow Control
@y
### AC-4 (3) Dynamic Information Flow Control
@z

@x
#### Description
@y
#### Description
@z

@x
The information system enforces dynamic information flow control based on [Assignment: organization-defined policies].
@y
The information system enforces dynamic information flow control based on [Assignment: organization-defined policies].
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
### AC-4 (4) Content Check Encrypted Information
@y
### AC-4 (4) Content Check Encrypted Information
@z

@x
#### Description
@y
#### Description
@z

@x
The information system prevents encrypted information from bypassing content-checking mechanisms by [Selection (one or more): decrypting the information; blocking the flow of the encrypted information; terminating communications sessions attempting to pass encrypted information; [Assignment: organization-defined procedure or method]].
@y
The information system prevents encrypted information from bypassing content-checking mechanisms by [Selection (one or more): decrypting the information; blocking the flow of the encrypted information; terminating communications sessions attempting to pass encrypted information; [Assignment: organization-defined procedure or method]].
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
### AC-4 (5) Embedded Data Types
@y
### AC-4 (5) Embedded Data Types
@z

@x
#### Description
@y
#### Description
@z

@x
The information system enforces [Assignment: organization-defined limitations] on embedding data types within other data types.
@y
The information system enforces [Assignment: organization-defined limitations] on embedding data types within other data types.
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
### AC-4 (6) Metadata
@y
### AC-4 (6) Metadata
@z

@x
#### Description
@y
#### Description
@z

@x
The information system enforces information flow control based on [Assignment: organization-defined metadata].
@y
The information system enforces information flow control based on [Assignment: organization-defined metadata].
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
### AC-4 (7) One-Way Flow Mechanisms
@y
### AC-4 (7) One-Way Flow Mechanisms
@z

@x
#### Description
@y
#### Description
@z

@x
The information system enforces [Assignment: organization-defined one-way information flows] using hardware mechanisms.
@y
The information system enforces [Assignment: organization-defined one-way information flows] using hardware mechanisms.
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
### AC-4 (8) Security Policy Filters
@y
### AC-4 (8) Security Policy Filters
@z

@x
#### Description
@y
#### Description
@z

@x
The information system enforces information flow control using [Assignment: organization-defined security policy filters] as a basis for flow control decisions for [Assignment: organization-defined information flows].
@y
The information system enforces information flow control using [Assignment: organization-defined security policy filters] as a basis for flow control decisions for [Assignment: organization-defined information flows].
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
<td>shared<br/></td>
</tr>
<tr>
<td>Docker Enterprise Edition Engine</td>
<td>none<br/></td>
<td>service provider hybrid<br/></td>
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
<td>shared<br/></td>
</tr>
<tr>
<td>Docker Enterprise Edition Engine</td>
<td>none<br/></td>
<td>service provider hybrid<br/></td>
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
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caehs0">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0cpludq000caehsg">Engine</a></li>
<li><a data-toggle="tab" data-target="#bb2j0cpludq000caeht0">UCP</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caehs0">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0cpludq000caehsg">Engine</a></li>
<li><a data-toggle="tab" data-target="#bb2j0cpludq000caeht0">UCP</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0cpludq000caehs0" class="tab-pane fade in active">
Supporting documentation to configure Docker Trusted Registry to meet
the requirements of this control can be found at the following
resources:
@y
<div class="tab-content">
<div id="bb2j0cpludq000caehs0" class="tab-pane fade in active">
Supporting documentation to configure Docker Trusted Registry to meet
the requirements of this control can be found at the following
resources:
@z

@x
<ul>
<li><a href="https://docs.docker.com/datacenter/dtr/2.3/guides/architecture/">https://docs.docker.com/datacenter/dtr/2.3/guides/architecture/</a></li>
<li><a href="https://docs.docker.com/datacenter/dtr/2.3/guides/admin/install/system-requirements/#/ports-used">https://docs.docker.com/datacenter/dtr/2.3/guides/admin/install/system-requirements/#/ports-used</a></li>
<li><a href="https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Docker_Datacenter_Best_Practices_and_Design_Considerations#Infrastructure_Considerations">https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Docker_Datacenter_Best_Practices_and_Design_Considerations#Infrastructure_Considerations</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/datacenter/dtr/2.3/guides/architecture/">https://docs.docker.com/datacenter/dtr/2.3/guides/architecture/</a></li>
<li><a href="https://docs.docker.com/datacenter/dtr/2.3/guides/admin/install/system-requirements/#/ports-used">https://docs.docker.com/datacenter/dtr/2.3/guides/admin/install/system-requirements/#/ports-used</a></li>
<li><a href="https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Docker_Datacenter_Best_Practices_and_Design_Considerations#Infrastructure_Considerations">https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Docker_Datacenter_Best_Practices_and_Design_Considerations#Infrastructure_Considerations</a></li>
</ul>
@z

@x
</div>
<div id="bb2j0cpludq000caehsg" class="tab-pane fade">
Docker Enterprise Edition can be configured to control the flow of
information that originates from applications running in containers
per organization-defined security policy filters. Supporting
documentation can be found at the following resources:
@y
</div>
<div id="bb2j0cpludq000caehsg" class="tab-pane fade">
Docker Enterprise Edition can be configured to control the flow of
information that originates from applications running in containers
per organization-defined security policy filters. Supporting
documentation can be found at the following resources:
@z

@x
<ul>
<li><a href="https://docs.docker.com/engine/userguide/networking/">https://docs.docker.com/engine/userguide/networking/</a></li>
<li><a href="http://success.docker.com/Datacenter/Apply/Docker_Reference_Architecture%3A_Designing_Scalable%2C_Portable_Docker_Container_Networks">http://success.docker.com/Datacenter/Apply/Docker_Reference_Architecture%3A_Designing_Scalable%2C_Portable_Docker_Container_Networks</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/engine/userguide/networking/">https://docs.docker.com/engine/userguide/networking/</a></li>
<li><a href="http://success.docker.com/Datacenter/Apply/Docker_Reference_Architecture%3A_Designing_Scalable%2C_Portable_Docker_Container_Networks">http://success.docker.com/Datacenter/Apply/Docker_Reference_Architecture%3A_Designing_Scalable%2C_Portable_Docker_Container_Networks</a></li>
</ul>
@z

@x
</div>
<div id="bb2j0cpludq000caeht0" class="tab-pane fade">
Supporting documentation to configure Universal Control Plane to meet
the requirements of this control can be found at the following
resources:
@y
</div>
<div id="bb2j0cpludq000caeht0" class="tab-pane fade">
Supporting documentation to configure Universal Control Plane to meet
the requirements of this control can be found at the following
resources:
@z

@x
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/architecture/">https://docs.docker.com/datacenter/ucp/2.2/guides/architecture/</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/install/system-requirements/#/ports-used">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/install/system-requirements/#/ports-used</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/use-domain-names-to-access-services/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/use-domain-names-to-access-services/</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/restrict-services-to-worker-nodes/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/restrict-services-to-worker-nodes/</a></li>
<li><a href="https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Universal_Control_Plane_2.0_Service_Discovery_and_Load_Balancing">https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Universal_Control_Plane_2.0_Service_Discovery_and_Load_Balancing</a></li>
<li><a href="https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Docker_Datacenter_Best_Practices_and_Design_Considerations#Infrastructure_Considerations">https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Docker_Datacenter_Best_Practices_and_Design_Considerations#Infrastructure_Considerations</a></li>
<li><a href="https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Securing_Docker_Datacenter_and_Security_Best_Practices#Networking">https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Securing_Docker_Datacenter_and_Security_Best_Practices#Networking</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/architecture/">https://docs.docker.com/datacenter/ucp/2.2/guides/architecture/</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/install/system-requirements/#/ports-used">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/install/system-requirements/#/ports-used</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/use-domain-names-to-access-services/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/use-domain-names-to-access-services/</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/restrict-services-to-worker-nodes/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/restrict-services-to-worker-nodes/</a></li>
<li><a href="https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Universal_Control_Plane_2.0_Service_Discovery_and_Load_Balancing">https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Universal_Control_Plane_2.0_Service_Discovery_and_Load_Balancing</a></li>
<li><a href="https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Docker_Datacenter_Best_Practices_and_Design_Considerations#Infrastructure_Considerations">https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Docker_Datacenter_Best_Practices_and_Design_Considerations#Infrastructure_Considerations</a></li>
<li><a href="https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Securing_Docker_Datacenter_and_Security_Best_Practices#Networking">https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Securing_Docker_Datacenter_and_Security_Best_Practices#Networking</a></li>
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
### AC-4 (9) Human Reviews
@y
### AC-4 (9) Human Reviews
@z

@x
#### Description
@y
#### Description
@z

@x
The information system enforces the use of human reviews for [Assignment: organization-defined information flows] under the following conditions: [Assignment: organization-defined conditions].
@y
The information system enforces the use of human reviews for [Assignment: organization-defined information flows] under the following conditions: [Assignment: organization-defined conditions].
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
### AC-4 (10) Enable / Disable Security Policy Filters
@y
### AC-4 (10) Enable / Disable Security Policy Filters
@z

@x
#### Description
@y
#### Description
@z

@x
The information system provides the capability for privileged administrators to enable/disable [Assignment: organization-defined security policy filters] under the following conditions: [Assignment: organization-defined conditions].
@y
The information system provides the capability for privileged administrators to enable/disable [Assignment: organization-defined security policy filters] under the following conditions: [Assignment: organization-defined conditions].
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
### AC-4 (11) Configuration Of Security Policy Filters
@y
### AC-4 (11) Configuration Of Security Policy Filters
@z

@x
#### Description
@y
#### Description
@z

@x
The information system provides the capability for privileged administrators to configure [Assignment: organization-defined security policy filters] to support different security policies.
@y
The information system provides the capability for privileged administrators to configure [Assignment: organization-defined security policy filters] to support different security policies.
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
### AC-4 (12) Data Type Identifiers
@y
### AC-4 (12) Data Type Identifiers
@z

@x
#### Description
@y
#### Description
@z

@x
The information system, when transferring information between different security domains, uses [Assignment: organization-defined data type identifiers] to validate data essential for information flow decisions.
@y
The information system, when transferring information between different security domains, uses [Assignment: organization-defined data type identifiers] to validate data essential for information flow decisions.
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
### AC-4 (13) Decomposition Into Policy-Relevant Subcomponents
@y
### AC-4 (13) Decomposition Into Policy-Relevant Subcomponents
@z

@x
#### Description
@y
#### Description
@z

@x
The information system, when transferring information between different security domains, decomposes information into [Assignment: organization-defined policy-relevant subcomponents] for submission to policy enforcement mechanisms.
@y
The information system, when transferring information between different security domains, decomposes information into [Assignment: organization-defined policy-relevant subcomponents] for submission to policy enforcement mechanisms.
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
### AC-4 (14) Security Policy Filter Constraints
@y
### AC-4 (14) Security Policy Filter Constraints
@z

@x
#### Description
@y
#### Description
@z

@x
The information system, when transferring information between different security domains, implements [Assignment: organization-defined security policy filters] requiring fully enumerated formats that restrict data structure and content.
@y
The information system, when transferring information between different security domains, implements [Assignment: organization-defined security policy filters] requiring fully enumerated formats that restrict data structure and content.
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
### AC-4 (15) Detection Of Unsanctioned Information
@y
### AC-4 (15) Detection Of Unsanctioned Information
@z

@x
#### Description
@y
#### Description
@z

@x
The information system, when transferring information between different security domains, examines the information for the presence of [Assignment: organized-defined unsanctioned information] and prohibits the transfer of such information in accordance with the [Assignment: organization-defined security policy].
@y
The information system, when transferring information between different security domains, examines the information for the presence of [Assignment: organized-defined unsanctioned information] and prohibits the transfer of such information in accordance with the [Assignment: organization-defined security policy].
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
### AC-4 (17) Domain Authentication
@y
### AC-4 (17) Domain Authentication
@z

@x
#### Description
@y
#### Description
@z

@x
The information system uniquely identifies and authenticates source and destination points by [Selection (one or more): organization, system, application, individual] for information transfer.
@y
The information system uniquely identifies and authenticates source and destination points by [Selection (one or more): organization, system, application, individual] for information transfer.
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
### AC-4 (18) Security Attribute Binding
@y
### AC-4 (18) Security Attribute Binding
@z

@x
#### Description
@y
#### Description
@z

@x
The information system binds security attributes to information using [Assignment: organization-defined binding techniques] to facilitate information flow policy enforcement.
@y
The information system binds security attributes to information using [Assignment: organization-defined binding techniques] to facilitate information flow policy enforcement.
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
### AC-4 (19) Validation Of Metadata
@y
### AC-4 (19) Validation Of Metadata
@z

@x
#### Description
@y
#### Description
@z

@x
The information system, when transferring information between different security domains, applies the same security policy filtering to metadata as it applies to data payloads.
@y
The information system, when transferring information between different security domains, applies the same security policy filtering to metadata as it applies to data payloads.
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
### AC-4 (20) Approved Solutions
@y
### AC-4 (20) Approved Solutions
@z

@x
#### Description
@y
#### Description
@z

@x
The organization employs [Assignment: organization-defined solutions in approved configurations] to control the flow of [Assignment: organization-defined information] across security domains.
@y
The organization employs [Assignment: organization-defined solutions in approved configurations] to control the flow of [Assignment: organization-defined information] across security domains.
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
### AC-4 (21) Physical / Logical Separation Of Information Flows
@y
### AC-4 (21) Physical / Logical Separation Of Information Flows
@z

@x
#### Description
@y
#### Description
@z

@x
The information system separates information flows logically or physically using [Assignment: organization-defined mechanisms and/or techniques] to accomplish [Assignment: organization-defined required separations by types of information].
@y
The information system separates information flows logically or physically using [Assignment: organization-defined mechanisms and/or techniques] to accomplish [Assignment: organization-defined required separations by types of information].
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
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caehtg">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0cpludq000caehu0">Engine</a></li>
<li><a data-toggle="tab" data-target="#bb2j0cpludq000caehug">UCP</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caehtg">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0cpludq000caehu0">Engine</a></li>
<li><a data-toggle="tab" data-target="#bb2j0cpludq000caehug">UCP</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0cpludq000caehtg" class="tab-pane fade in active">
Supporting documentation to configure Docker Trusted Registry to meet
the requirements of this control can be found at the following
resources:
@y
<div class="tab-content">
<div id="bb2j0cpludq000caehtg" class="tab-pane fade in active">
Supporting documentation to configure Docker Trusted Registry to meet
the requirements of this control can be found at the following
resources:
@z

@x
<ul>
<li><a href="https://docs.docker.com/datacenter/dtr/2.3/guides/architecture/">https://docs.docker.com/datacenter/dtr/2.3/guides/architecture/</a></li>
<li><a href="https://docs.docker.com/datacenter/dtr/2.3/guides/admin/install/system-requirements/#/ports-used">https://docs.docker.com/datacenter/dtr/2.3/guides/admin/install/system-requirements/#/ports-used</a></li>
<li><a href="https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Docker_Datacenter_Best_Practices_and_Design_Considerations#Infrastructure_Considerations">https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Docker_Datacenter_Best_Practices_and_Design_Considerations#Infrastructure_Considerations</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/datacenter/dtr/2.3/guides/architecture/">https://docs.docker.com/datacenter/dtr/2.3/guides/architecture/</a></li>
<li><a href="https://docs.docker.com/datacenter/dtr/2.3/guides/admin/install/system-requirements/#/ports-used">https://docs.docker.com/datacenter/dtr/2.3/guides/admin/install/system-requirements/#/ports-used</a></li>
<li><a href="https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Docker_Datacenter_Best_Practices_and_Design_Considerations#Infrastructure_Considerations">https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Docker_Datacenter_Best_Practices_and_Design_Considerations#Infrastructure_Considerations</a></li>
</ul>
@z

@x
</div>
<div id="bb2j0cpludq000caehu0" class="tab-pane fade">
Docker Enterprise Edition can be configured to separate the flow of
information that originates from applications running in containers.
Supporting documentation can be found at the following resources:
@y
</div>
<div id="bb2j0cpludq000caehu0" class="tab-pane fade">
Docker Enterprise Edition can be configured to separate the flow of
information that originates from applications running in containers.
Supporting documentation can be found at the following resources:
@z

@x
<ul>
<li><a href="https://docs.docker.com/engine/userguide/networking/">https://docs.docker.com/engine/userguide/networking/</a></li>
<li><a href="http://success.docker.com/Datacenter/Apply/Docker_Reference_Architecture%3A_Designing_Scalable%2C_Portable_Docker_Container_Networks">http://success.docker.com/Datacenter/Apply/Docker_Reference_Architecture%3A_Designing_Scalable%2C_Portable_Docker_Container_Networks</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/engine/userguide/networking/">https://docs.docker.com/engine/userguide/networking/</a></li>
<li><a href="http://success.docker.com/Datacenter/Apply/Docker_Reference_Architecture%3A_Designing_Scalable%2C_Portable_Docker_Container_Networks">http://success.docker.com/Datacenter/Apply/Docker_Reference_Architecture%3A_Designing_Scalable%2C_Portable_Docker_Container_Networks</a></li>
</ul>
@z

@x
</div>
<div id="bb2j0cpludq000caehug" class="tab-pane fade">
Supporting documentation to configure Universal Control Plane to meet
the requirements of this control can be found at the following
resources:
@y
</div>
<div id="bb2j0cpludq000caehug" class="tab-pane fade">
Supporting documentation to configure Universal Control Plane to meet
the requirements of this control can be found at the following
resources:
@z

@x
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/architecture/">https://docs.docker.com/datacenter/ucp/2.2/guides/architecture/</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/install/system-requirements/#/ports-used">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/install/system-requirements/#/ports-used</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/use-domain-names-to-access-services/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/use-domain-names-to-access-services/</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/restrict-services-to-worker-nodes/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/restrict-services-to-worker-nodes/</a></li>
<li><a href="https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Universal_Control_Plane_2.0_Service_Discovery_and_Load_Balancing">https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Universal_Control_Plane_2.0_Service_Discovery_and_Load_Balancing</a></li>
<li><a href="https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Docker_Datacenter_Best_Practices_and_Design_Considerations#Infrastructure_Considerations">https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Docker_Datacenter_Best_Practices_and_Design_Considerations#Infrastructure_Considerations</a></li>
<li><a href="https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Securing_Docker_Datacenter_and_Security_Best_Practices#Networking">https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Securing_Docker_Datacenter_and_Security_Best_Practices#Networking</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/architecture/">https://docs.docker.com/datacenter/ucp/2.2/guides/architecture/</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/install/system-requirements/#/ports-used">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/install/system-requirements/#/ports-used</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/use-domain-names-to-access-services/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/use-domain-names-to-access-services/</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/restrict-services-to-worker-nodes/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/restrict-services-to-worker-nodes/</a></li>
<li><a href="https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Universal_Control_Plane_2.0_Service_Discovery_and_Load_Balancing">https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Universal_Control_Plane_2.0_Service_Discovery_and_Load_Balancing</a></li>
<li><a href="https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Docker_Datacenter_Best_Practices_and_Design_Considerations#Infrastructure_Considerations">https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Docker_Datacenter_Best_Practices_and_Design_Considerations#Infrastructure_Considerations</a></li>
<li><a href="https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Securing_Docker_Datacenter_and_Security_Best_Practices#Networking">https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Securing_Docker_Datacenter_and_Security_Best_Practices#Networking</a></li>
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
### AC-4 (22) Access Only
@y
### AC-4 (22) Access Only
@z

@x
#### Description
@y
#### Description
@z

@x
The information system provides access from a single device to computing platforms, applications, or data residing on multiple different security domains, while preventing any information flow between the different security domains.
@y
The information system provides access from a single device to computing platforms, applications, or data residing on multiple different security domains, while preventing any information flow between the different security domains.
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
## AC-5 Separation Of Duties
@y
## AC-5 Separation Of Duties
@z

@x
#### Description
@y
#### Description
@z

@x
The organization:
<ol type="a">
<li>Separates [Assignment: organization-defined duties of individuals];</li>
<li>Documents separation of duties of individuals; and</li>
<li>Defines information system access authorizations to support separation of duties.</li>
</ol>
@y
The organization:
<ol type="a">
<li>Separates [Assignment: organization-defined duties of individuals];</li>
<li>Documents separation of duties of individuals; and</li>
<li>Defines information system access authorizations to support separation of duties.</li>
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
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caehv0">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0cpludq000caehvg">UCP</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caehv0">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0cpludq000caehvg">UCP</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0cpludq000caehv0" class="tab-pane fade in active">
To assist the organization in meeting the requirements of this
control, one can control which users and teams can create and
manipulate Docker Trusted Registry resources. By default, no one can
make changes to the cluster. Permissions can be granted and managed to
enforce fine-grained access control. Supporting documentation can be
found at the following resources:
@y
<div class="tab-content">
<div id="bb2j0cpludq000caehv0" class="tab-pane fade in active">
To assist the organization in meeting the requirements of this
control, one can control which users and teams can create and
manipulate Docker Trusted Registry resources. By default, no one can
make changes to the cluster. Permissions can be granted and managed to
enforce fine-grained access control. Supporting documentation can be
found at the following resources:
@z

@x
<ul>
<li><a href="https://docs.docker.com/datacenter/dtr/2.3/guides/admin/manage-users/">https://docs.docker.com/datacenter/dtr/2.3/guides/admin/manage-users/</a></li>
<li><a href="https://docs.docker.com/datacenter/dtr/2.3/guides/admin/manage-users/permission-levels/">https://docs.docker.com/datacenter/dtr/2.3/guides/admin/manage-users/permission-levels/</a></li>
<li><a href="https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Securing_Docker_Datacenter_and_Security_Best_Practices#Organizations_.E2.80.94_RBAC">https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Securing_Docker_Datacenter_and_Security_Best_Practices#Organizations_.E2.80.94_RBAC</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/datacenter/dtr/2.3/guides/admin/manage-users/">https://docs.docker.com/datacenter/dtr/2.3/guides/admin/manage-users/</a></li>
<li><a href="https://docs.docker.com/datacenter/dtr/2.3/guides/admin/manage-users/permission-levels/">https://docs.docker.com/datacenter/dtr/2.3/guides/admin/manage-users/permission-levels/</a></li>
<li><a href="https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Securing_Docker_Datacenter_and_Security_Best_Practices#Organizations_.E2.80.94_RBAC">https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Securing_Docker_Datacenter_and_Security_Best_Practices#Organizations_.E2.80.94_RBAC</a></li>
</ul>
@z

@x
</div>
<div id="bb2j0cpludq000caehvg" class="tab-pane fade">
To assist the organization in meeting the requirements of this
control, one can control which users and teams can create and
manipulate Universal Control Plane resources. By default, no one can
make changes to the cluster. Permissions can be granted and managed to
enforce fine-grained access control. Supporting documentation can be
found at the following resources:
@y
</div>
<div id="bb2j0cpludq000caehvg" class="tab-pane fade">
To assist the organization in meeting the requirements of this
control, one can control which users and teams can create and
manipulate Universal Control Plane resources. By default, no one can
make changes to the cluster. Permissions can be granted and managed to
enforce fine-grained access control. Supporting documentation can be
found at the following resources:
@z

@x
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/create-and-manage-users/">https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/create-and-manage-users/</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/permission-levels/">https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/permission-levels/</a></li>
<li><a href="https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Docker_Datacenter_Best_Practices_and_Design_Considerations#RBAC_and_Managing_Team_Level_Access_to_Resources">https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Docker_Datacenter_Best_Practices_and_Design_Considerations#RBAC_and_Managing_Team_Level_Access_to_Resources</a></li>
<li><a href="https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Securing_Docker_Datacenter_and_Security_Best_Practices#RBAC">https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Securing_Docker_Datacenter_and_Security_Best_Practices#RBAC</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/create-and-manage-users/">https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/create-and-manage-users/</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/permission-levels/">https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/permission-levels/</a></li>
<li><a href="https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Docker_Datacenter_Best_Practices_and_Design_Considerations#RBAC_and_Managing_Team_Level_Access_to_Resources">https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Docker_Datacenter_Best_Practices_and_Design_Considerations#RBAC_and_Managing_Team_Level_Access_to_Resources</a></li>
<li><a href="https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Securing_Docker_Datacenter_and_Security_Best_Practices#RBAC">https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Securing_Docker_Datacenter_and_Security_Best_Practices#RBAC</a></li>
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
## AC-6 Least Privilege
@y
## AC-6 Least Privilege
@z

@x
#### Description
@y
#### Description
@z

@x
The organization employs the principle of least privilege, allowing only authorized accesses for users (or processes acting on behalf of users) which are necessary to accomplish assigned tasks in accordance with organizational missions and business functions.
@y
The organization employs the principle of least privilege, allowing only authorized accesses for users (or processes acting on behalf of users) which are necessary to accomplish assigned tasks in accordance with organizational missions and business functions.
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
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caei00">UCP</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caei00">UCP</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0cpludq000caei00" class="tab-pane fade in active">
To assist the organization in meeting the requirements of this
control, one can control which users and teams can create and
manipulate Universal Control Plane resources and employ principles of
least privilege. By default, no one can make changes to the cluster.
Permissions can be granted and managed to enforce fine-grained access
control. Supporting documentation can be found at the following
resources:
@y
<div class="tab-content">
<div id="bb2j0cpludq000caei00" class="tab-pane fade in active">
To assist the organization in meeting the requirements of this
control, one can control which users and teams can create and
manipulate Universal Control Plane resources and employ principles of
least privilege. By default, no one can make changes to the cluster.
Permissions can be granted and managed to enforce fine-grained access
control. Supporting documentation can be found at the following
resources:
@z

@x
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/create-and-manage-users/">https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/create-and-manage-users/</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/permission-levels/">https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/permission-levels/</a></li>
<li><a href="https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Docker_Datacenter_Best_Practices_and_Design_Considerations#RBAC_and_Managing_Team_Level_Access_to_Resources">https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Docker_Datacenter_Best_Practices_and_Design_Considerations#RBAC_and_Managing_Team_Level_Access_to_Resources</a></li>
<li><a href="https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Securing_Docker_Datacenter_and_Security_Best_Practices#RBAC">https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Securing_Docker_Datacenter_and_Security_Best_Practices#RBAC</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/create-and-manage-users/">https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/create-and-manage-users/</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/permission-levels/">https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/permission-levels/</a></li>
<li><a href="https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Docker_Datacenter_Best_Practices_and_Design_Considerations#RBAC_and_Managing_Team_Level_Access_to_Resources">https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Docker_Datacenter_Best_Practices_and_Design_Considerations#RBAC_and_Managing_Team_Level_Access_to_Resources</a></li>
<li><a href="https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Securing_Docker_Datacenter_and_Security_Best_Practices#RBAC">https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Securing_Docker_Datacenter_and_Security_Best_Practices#RBAC</a></li>
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
### AC-6 (1) Authorize Access To Security Functions
@y
### AC-6 (1) Authorize Access To Security Functions
@z

@x
#### Description
@y
#### Description
@z

@x
The organization explicitly authorizes access to [Assignment: organization-defined security functions (deployed in hardware, software, and firmware) and security-relevant information].
@y
The organization explicitly authorizes access to [Assignment: organization-defined security functions (deployed in hardware, software, and firmware) and security-relevant information].
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
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caei0g">UCP</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caei0g">UCP</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0cpludq000caei0g" class="tab-pane fade in active">
To assist the organization in meeting the requirements of this
control, one can control which users and teams can create and
manipulate Universal Control Plane resources and explicitly authorize
access as necessary. By default, no one can make changes to the
cluster. Permissions can be granted and managed to enforce
fine-grained access control. Supporting documentation can be found at
the following resources:
@y
<div class="tab-content">
<div id="bb2j0cpludq000caei0g" class="tab-pane fade in active">
To assist the organization in meeting the requirements of this
control, one can control which users and teams can create and
manipulate Universal Control Plane resources and explicitly authorize
access as necessary. By default, no one can make changes to the
cluster. Permissions can be granted and managed to enforce
fine-grained access control. Supporting documentation can be found at
the following resources:
@z

@x
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/create-and-manage-users/">https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/create-and-manage-users/</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/permission-levels/">https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/permission-levels/</a></li>
<li><a href="https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Docker_Datacenter_Best_Practices_and_Design_Considerations#RBAC_and_Managing_Team_Level_Access_to_Resources">https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Docker_Datacenter_Best_Practices_and_Design_Considerations#RBAC_and_Managing_Team_Level_Access_to_Resources</a></li>
<li><a href="https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Securing_Docker_Datacenter_and_Security_Best_Practices#RBAC">https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Securing_Docker_Datacenter_and_Security_Best_Practices#RBAC</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/create-and-manage-users/">https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/create-and-manage-users/</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/permission-levels/">https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/permission-levels/</a></li>
<li><a href="https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Docker_Datacenter_Best_Practices_and_Design_Considerations#RBAC_and_Managing_Team_Level_Access_to_Resources">https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Docker_Datacenter_Best_Practices_and_Design_Considerations#RBAC_and_Managing_Team_Level_Access_to_Resources</a></li>
<li><a href="https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Securing_Docker_Datacenter_and_Security_Best_Practices#RBAC">https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Securing_Docker_Datacenter_and_Security_Best_Practices#RBAC</a></li>
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
### AC-6 (2) Non-Privileged Access For Nonsecurity Functions
@y
### AC-6 (2) Non-Privileged Access For Nonsecurity Functions
@z

@x
#### Description
@y
#### Description
@z

@x
The organization requires that users of information system accounts, or roles, with access to [Assignment: organization-defined security functions or security-relevant information], use non-privileged accounts or roles, when accessing nonsecurity functions.
@y
The organization requires that users of information system accounts, or roles, with access to [Assignment: organization-defined security functions or security-relevant information], use non-privileged accounts or roles, when accessing nonsecurity functions.
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
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caei10">UCP</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caei10">UCP</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0cpludq000caei10" class="tab-pane fade in active">
To assist the organization in meeting the requirements of this
control, one can control which users and teams can create and
manipulate Universal Control Plane resources. By default, no one can
make changes to the cluster. Permissions can be granted and managed to
enforce fine-grained access control. Supporting documentation can be
found at the following resources:
@y
<div class="tab-content">
<div id="bb2j0cpludq000caei10" class="tab-pane fade in active">
To assist the organization in meeting the requirements of this
control, one can control which users and teams can create and
manipulate Universal Control Plane resources. By default, no one can
make changes to the cluster. Permissions can be granted and managed to
enforce fine-grained access control. Supporting documentation can be
found at the following resources:
@z

@x
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/create-and-manage-users/">https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/create-and-manage-users/</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/permission-levels/">https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/permission-levels/</a></li>
<li><a href="https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Docker_Datacenter_Best_Practices_and_Design_Considerations#RBAC_and_Managing_Team_Level_Access_to_Resources">https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Docker_Datacenter_Best_Practices_and_Design_Considerations#RBAC_and_Managing_Team_Level_Access_to_Resources</a></li>
<li><a href="https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Securing_Docker_Datacenter_and_Security_Best_Practices#RBAC">https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Securing_Docker_Datacenter_and_Security_Best_Practices#RBAC</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/create-and-manage-users/">https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/create-and-manage-users/</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/permission-levels/">https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/permission-levels/</a></li>
<li><a href="https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Docker_Datacenter_Best_Practices_and_Design_Considerations#RBAC_and_Managing_Team_Level_Access_to_Resources">https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Docker_Datacenter_Best_Practices_and_Design_Considerations#RBAC_and_Managing_Team_Level_Access_to_Resources</a></li>
<li><a href="https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Securing_Docker_Datacenter_and_Security_Best_Practices#RBAC">https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Securing_Docker_Datacenter_and_Security_Best_Practices#RBAC</a></li>
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
### AC-6 (3) Network Access To Privileged Commands
@y
### AC-6 (3) Network Access To Privileged Commands
@z

@x
#### Description
@y
#### Description
@z

@x
The organization authorizes network access to [Assignment: organization-defined privileged commands] only for [Assignment: organization-defined compelling operational needs] and documents the rationale for such access in the security plan for the information system.
@y
The organization authorizes network access to [Assignment: organization-defined privileged commands] only for [Assignment: organization-defined compelling operational needs] and documents the rationale for such access in the security plan for the information system.
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
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caei1g">UCP</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caei1g">UCP</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0cpludq000caei1g" class="tab-pane fade in active">
To assist the organization in meeting the requirements of this
control, one can control which users and teams can create and
manipulate Universal Control Plane resources, including Docker
networking components. By default, no one can make changes to the
cluster. Permissions can be granted and managed to enforce
fine-grained access control. Supporting documentation can be found at
the following resources:
@y
<div class="tab-content">
<div id="bb2j0cpludq000caei1g" class="tab-pane fade in active">
To assist the organization in meeting the requirements of this
control, one can control which users and teams can create and
manipulate Universal Control Plane resources, including Docker
networking components. By default, no one can make changes to the
cluster. Permissions can be granted and managed to enforce
fine-grained access control. Supporting documentation can be found at
the following resources:
@z

@x
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/">https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/create-and-manage-users/">https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/create-and-manage-users/</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/permission-levels/">https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/permission-levels/</a></li>
<li><a href="https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Docker_Datacenter_Best_Practices_and_Design_Considerations#RBAC_and_Managing_Team_Level_Access_to_Resources">https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Docker_Datacenter_Best_Practices_and_Design_Considerations#RBAC_and_Managing_Team_Level_Access_to_Resources</a></li>
<li><a href="https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Securing_Docker_Datacenter_and_Security_Best_Practices#RBAC">https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Securing_Docker_Datacenter_and_Security_Best_Practices#RBAC</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/">https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/create-and-manage-users/">https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/create-and-manage-users/</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/permission-levels/">https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/permission-levels/</a></li>
<li><a href="https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Docker_Datacenter_Best_Practices_and_Design_Considerations#RBAC_and_Managing_Team_Level_Access_to_Resources">https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Docker_Datacenter_Best_Practices_and_Design_Considerations#RBAC_and_Managing_Team_Level_Access_to_Resources</a></li>
<li><a href="https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Securing_Docker_Datacenter_and_Security_Best_Practices#RBAC">https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Securing_Docker_Datacenter_and_Security_Best_Practices#RBAC</a></li>
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
### AC-6 (4) Separate Processing Domains
@y
### AC-6 (4) Separate Processing Domains
@z

@x
#### Description
@y
#### Description
@z

@x
The information system provides separate processing domains to enable finer-grained allocation of user privileges.
@y
The information system provides separate processing domains to enable finer-grained allocation of user privileges.
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
### AC-6 (5) Privileged Accounts
@y
### AC-6 (5) Privileged Accounts
@z

@x
#### Description
@y
#### Description
@z

@x
The organization restricts privileged accounts on the information system to [Assignment: organization-defined personnel or roles].
@y
The organization restricts privileged accounts on the information system to [Assignment: organization-defined personnel or roles].
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
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caei20">UCP</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caei20">UCP</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0cpludq000caei20" class="tab-pane fade in active">
To assist the organization in meeting the requirements of this
control, one can restrict privileged accounts within Universal Control
Plane to custom-defined roles. By default, no one can make changes to
the cluster. Permissions can be granted and managed to enforce
fine-grained access control. Supporting documentation can be found at
the following resources:
@y
<div class="tab-content">
<div id="bb2j0cpludq000caei20" class="tab-pane fade in active">
To assist the organization in meeting the requirements of this
control, one can restrict privileged accounts within Universal Control
Plane to custom-defined roles. By default, no one can make changes to
the cluster. Permissions can be granted and managed to enforce
fine-grained access control. Supporting documentation can be found at
the following resources:
@z

@x
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/">https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/create-and-manage-users/">https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/create-and-manage-users/</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/permission-levels/">https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/permission-levels/</a></li>
<li><a href="https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Docker_Datacenter_Best_Practices_and_Design_Considerations#RBAC_and_Managing_Team_Level_Access_to_Resources">https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Docker_Datacenter_Best_Practices_and_Design_Considerations#RBAC_and_Managing_Team_Level_Access_to_Resources</a></li>
<li><a href="https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Securing_Docker_Datacenter_and_Security_Best_Practices#RBAC">https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Securing_Docker_Datacenter_and_Security_Best_Practices#RBAC</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/">https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/create-and-manage-users/">https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/create-and-manage-users/</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/permission-levels/">https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/permission-levels/</a></li>
<li><a href="https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Docker_Datacenter_Best_Practices_and_Design_Considerations#RBAC_and_Managing_Team_Level_Access_to_Resources">https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Docker_Datacenter_Best_Practices_and_Design_Considerations#RBAC_and_Managing_Team_Level_Access_to_Resources</a></li>
<li><a href="https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Securing_Docker_Datacenter_and_Security_Best_Practices#RBAC">https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Securing_Docker_Datacenter_and_Security_Best_Practices#RBAC</a></li>
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
### AC-6 (6) Privileged Access By Non-Organizational Users
@y
### AC-6 (6) Privileged Access By Non-Organizational Users
@z

@x
#### Description
@y
#### Description
@z

@x
The organization prohibits privileged access to the information system by non-organizational users.
@y
The organization prohibits privileged access to the information system by non-organizational users.
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
### AC-6 (7) Review Of User Privileges
@y
### AC-6 (7) Review Of User Privileges
@z

@x
#### Description
@y
#### Description
@z

@x
The organization:
<ol type="a">
<li>Reviews [Assignment: organization-defined frequency] the privileges assigned to [Assignment: organization-defined roles or classes of users] to validate the need for such privileges; and</li>
<li>Reassigns or removes privileges, if necessary, to correctly reflect organizational mission/business needs.</li>
</ol>
@y
The organization:
<ol type="a">
<li>Reviews [Assignment: organization-defined frequency] the privileges assigned to [Assignment: organization-defined roles or classes of users] to validate the need for such privileges; and</li>
<li>Reassigns or removes privileges, if necessary, to correctly reflect organizational mission/business needs.</li>
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
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caei2g">UCP</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caei2g">UCP</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0cpludq000caei2g" class="tab-pane fade in active">
To assist the organization in meeting the requirements of this
control, one can review all implemented grants, accounts and roles
within Universal Control Plane and reassign/revoke privileges as
necessary. Supporting documentation can be found at the following
resources:
@y
<div class="tab-content">
<div id="bb2j0cpludq000caei2g" class="tab-pane fade in active">
To assist the organization in meeting the requirements of this
control, one can review all implemented grants, accounts and roles
within Universal Control Plane and reassign/revoke privileges as
necessary. Supporting documentation can be found at the following
resources:
@z

@x
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/">https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/create-and-manage-users/">https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/create-and-manage-users/</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/permission-levels/">https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/permission-levels/</a></li>
<li><a href="https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Docker_Datacenter_Best_Practices_and_Design_Considerations#RBAC_and_Managing_Team_Level_Access_to_Resources">https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Docker_Datacenter_Best_Practices_and_Design_Considerations#RBAC_and_Managing_Team_Level_Access_to_Resources</a></li>
<li><a href="https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Securing_Docker_Datacenter_and_Security_Best_Practices#RBAC">https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Securing_Docker_Datacenter_and_Security_Best_Practices#RBAC</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/">https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/create-and-manage-users/">https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/create-and-manage-users/</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/permission-levels/">https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/permission-levels/</a></li>
<li><a href="https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Docker_Datacenter_Best_Practices_and_Design_Considerations#RBAC_and_Managing_Team_Level_Access_to_Resources">https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Docker_Datacenter_Best_Practices_and_Design_Considerations#RBAC_and_Managing_Team_Level_Access_to_Resources</a></li>
<li><a href="https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Securing_Docker_Datacenter_and_Security_Best_Practices#RBAC">https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Securing_Docker_Datacenter_and_Security_Best_Practices#RBAC</a></li>
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
### AC-6 (8) Privilege Levels For Code Execution
@y
### AC-6 (8) Privilege Levels For Code Execution
@z

@x
#### Description
@y
#### Description
@z

@x
The information system prevents [Assignment: organization-defined software] from executing at higher privilege levels than users executing the software.
@y
The information system prevents [Assignment: organization-defined software] from executing at higher privilege levels than users executing the software.
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
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caei30">UCP</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caei30">UCP</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0cpludq000caei30" class="tab-pane fade in active">
Universal Control Plane users can be assigned to one of a number of
different permission levels. The permission level assigned to a
specific user determines that user&#39;s ability to execute certain
Docker functions within UCP. Only users mapped to either the &#34;Full
Control&#34; or &#34;Admin&#34; roles can execute Docker commands without any
restrictions. Users mapped to either the &#34;View Only&#34; or &#34;No Access&#34;
roles cannot execute any Docker commands. Users assigned to the
&#34;Restricted Control&#34; role can only run Docker commands under their own
purview and cannot see other users UCP resources nor run commands that
required privileged access to the host. Furthermore, custom roles can
be created for fine-grained access to specific UCP resources and
functionality. Additional documentation regarding the various
permission levels within UCP can be found at the following resource:
@y
<div class="tab-content">
<div id="bb2j0cpludq000caei30" class="tab-pane fade in active">
Universal Control Plane users can be assigned to one of a number of
different permission levels. The permission level assigned to a
specific user determines that user&#39;s ability to execute certain
Docker functions within UCP. Only users mapped to either the &#34;Full
Control&#34; or &#34;Admin&#34; roles can execute Docker commands without any
restrictions. Users mapped to either the &#34;View Only&#34; or &#34;No Access&#34;
roles cannot execute any Docker commands. Users assigned to the
&#34;Restricted Control&#34; role can only run Docker commands under their own
purview and cannot see other users UCP resources nor run commands that
required privileged access to the host. Furthermore, custom roles can
be created for fine-grained access to specific UCP resources and
functionality. Additional documentation regarding the various
permission levels within UCP can be found at the following resource:
@z

@x
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/">https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/create-and-manage-users/">https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/create-and-manage-users/</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/permission-levels/">https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/permission-levels/</a></li>
<li><a href="https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Docker_Datacenter_Best_Practices_and_Design_Considerations#RBAC_and_Managing_Team_Level_Access_to_Resources">https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Docker_Datacenter_Best_Practices_and_Design_Considerations#RBAC_and_Managing_Team_Level_Access_to_Resources</a></li>
<li><a href="https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Securing_Docker_Datacenter_and_Security_Best_Practices#RBAC">https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Securing_Docker_Datacenter_and_Security_Best_Practices#RBAC</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/">https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/create-and-manage-users/">https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/create-and-manage-users/</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/permission-levels/">https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/permission-levels/</a></li>
<li><a href="https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Docker_Datacenter_Best_Practices_and_Design_Considerations#RBAC_and_Managing_Team_Level_Access_to_Resources">https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Docker_Datacenter_Best_Practices_and_Design_Considerations#RBAC_and_Managing_Team_Level_Access_to_Resources</a></li>
<li><a href="https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Securing_Docker_Datacenter_and_Security_Best_Practices#RBAC">https://success.docker.com/KBase/Docker_Reference_Architecture%3A_Securing_Docker_Datacenter_and_Security_Best_Practices#RBAC</a></li>
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
### AC-6 (9) Auditing Use Of Privileged Functions
@y
### AC-6 (9) Auditing Use Of Privileged Functions
@z

@x
#### Description
@y
#### Description
@z

@x
The information system audits the execution of privileged functions.
@y
The information system audits the execution of privileged functions.
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
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caei3g">eNZi</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caei3g">eNZi</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0cpludq000caei3g" class="tab-pane fade in active">
Docker Enterprise Edition logs privileged user events to standard log
files. One can configure Docker Enterprise Edition to direct these
event logs to a remote logging service such as an Elasticsearch,
Logstash and Kibana (ELK) stack and subsequently alert on specific
event types. When integrating Docker Enterprise Edition with LDAP, one
can refer the the directory service&#39;s logging mechanisms for auditing
the events defined by this control. Supporting documentation regarding
logging and monitoring can be found at the following resources:
@y
<div class="tab-content">
<div id="bb2j0cpludq000caei3g" class="tab-pane fade in active">
Docker Enterprise Edition logs privileged user events to standard log
files. One can configure Docker Enterprise Edition to direct these
event logs to a remote logging service such as an Elasticsearch,
Logstash and Kibana (ELK) stack and subsequently alert on specific
event types. When integrating Docker Enterprise Edition with LDAP, one
can refer the the directory service&#39;s logging mechanisms for auditing
the events defined by this control. Supporting documentation regarding
logging and monitoring can be found at the following resources:
@z

@x
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/monitor-and-troubleshoot/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/monitor-and-troubleshoot/</a></li>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/configure/store-logs-in-an-external-system/</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/admin/monitor-and-troubleshoot/">https://docs.docker.com/datacenter/ucp/2.2/guides/admin/monitor-and-troubleshoot/</a></li>
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
### AC-6 (10) Prohibit Non-Privileged Users From Executing Privileged Functions
@y
### AC-6 (10) Prohibit Non-Privileged Users From Executing Privileged Functions
@z

@x
#### Description
@y
#### Description
@z

@x
The information system prevents non-privileged users from executing privileged functions to include disabling, circumventing, or altering implemented security safeguards/countermeasures.
@y
The information system prevents non-privileged users from executing privileged functions to include disabling, circumventing, or altering implemented security safeguards/countermeasures.
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
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caei40">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0cpludq000caei4g">UCP</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caei40">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0cpludq000caei4g">UCP</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0cpludq000caei40" class="tab-pane fade in active">
One can control which users and teams can create and manipulate
Docker Trusted Registry resources and prevent non-privileged users
from executing privileged functions per the requirements of this
control. By default, no one can make changes to the cluster.
Permissions can be granted and managed to enforce fine-grained access
control. Supporting documentation for the configuration of this
functionality can be found at the following resources:
@y
<div class="tab-content">
<div id="bb2j0cpludq000caei40" class="tab-pane fade in active">
One can control which users and teams can create and manipulate
Docker Trusted Registry resources and prevent non-privileged users
from executing privileged functions per the requirements of this
control. By default, no one can make changes to the cluster.
Permissions can be granted and managed to enforce fine-grained access
control. Supporting documentation for the configuration of this
functionality can be found at the following resources:
@z

@x
<ul>
<li><a href="https://docs.docker.com/datacenter/dtr/2.3/guides/admin/manage-users/">https://docs.docker.com/datacenter/dtr/2.3/guides/admin/manage-users/</a></li>
<li><a href="https://docs.docker.com/datacenter/dtr/2.3/guides/admin/manage-users/permission-levels/">https://docs.docker.com/datacenter/dtr/2.3/guides/admin/manage-users/permission-levels/</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/datacenter/dtr/2.3/guides/admin/manage-users/">https://docs.docker.com/datacenter/dtr/2.3/guides/admin/manage-users/</a></li>
<li><a href="https://docs.docker.com/datacenter/dtr/2.3/guides/admin/manage-users/permission-levels/">https://docs.docker.com/datacenter/dtr/2.3/guides/admin/manage-users/permission-levels/</a></li>
</ul>
@z

@x
</div>
<div id="bb2j0cpludq000caei4g" class="tab-pane fade">
One can control which users and teams can create and manipulate
Universal Control Plane resources and prevent non-privileged users
from executing privileged functions per the requirements of this
control. By default, no one can make changes to the cluster.
Permissions can be granted and managed to enforce fine-grained access
control. Supporting documentation for the configuration of this
functionality can be found at the following resources:
@y
</div>
<div id="bb2j0cpludq000caei4g" class="tab-pane fade">
One can control which users and teams can create and manipulate
Universal Control Plane resources and prevent non-privileged users
from executing privileged functions per the requirements of this
control. By default, no one can make changes to the cluster.
Permissions can be granted and managed to enforce fine-grained access
control. Supporting documentation for the configuration of this
functionality can be found at the following resources:
@z

@x
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/">https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/</a></li>
</ul>
@y
<ul>
<li><a href="https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/">https://docs.docker.com/datacenter/ucp/2.2/guides/access-control/</a></li>
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
## AC-7 Unsuccessful Logon Attempts
@y
## AC-7 Unsuccessful Logon Attempts
@z

@x
#### Description
@y
#### Description
@z

@x
The information system:
<ol type="a">
<li>Enforces a limit of [Assignment: organization-defined number] consecutive invalid logon attempts by a user during a [Assignment: organization-defined time period]; and</li>
<li>Automatically [Selection: locks the account/node for an [Assignment: organization-defined time period]; locks the account/node until released by an administrator; delays next logon prompt according to [Assignment: organization-defined delay algorithm]] when the maximum number of unsuccessful attempts is exceeded.</li>
</ol>
@y
The information system:
<ol type="a">
<li>Enforces a limit of [Assignment: organization-defined number] consecutive invalid logon attempts by a user during a [Assignment: organization-defined time period]; and</li>
<li>Automatically [Selection: locks the account/node for an [Assignment: organization-defined time period]; locks the account/node until released by an administrator; delays next logon prompt according to [Assignment: organization-defined delay algorithm]] when the maximum number of unsuccessful attempts is exceeded.</li>
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
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caei50">eNZi</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caei50">eNZi</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0cpludq000caei50" class="tab-pane fade in active">
When Docker Enterprise Edition is integrated to a directory service
via LDAP, one can reference the functionality of the directory service
to configure the enforcement of a limit to the number of conesecutive
invalid logon attempts by a user during a specified time period.When Docker Enterprise Edition is integrated to a directory service
via LDAP, one can reference the functionality of the directory service
to configure he ability to automatically lock/disable an account for a
specified period of time after a consecutive invalid logon attempt
limit is reached.
</div>
</div>
@y
<div class="tab-content">
<div id="bb2j0cpludq000caei50" class="tab-pane fade in active">
When Docker Enterprise Edition is integrated to a directory service
via LDAP, one can reference the functionality of the directory service
to configure the enforcement of a limit to the number of conesecutive
invalid logon attempts by a user during a specified time period.When Docker Enterprise Edition is integrated to a directory service
via LDAP, one can reference the functionality of the directory service
to configure he ability to automatically lock/disable an account for a
specified period of time after a consecutive invalid logon attempt
limit is reached.
</div>
</div>
@z

@x
### AC-7 (2) Purge / Wipe Mobile Device
@y
### AC-7 (2) Purge / Wipe Mobile Device
@z

@x
#### Description
@y
#### Description
@z

@x
The information system purges/wipes information from [Assignment: organization-defined mobile devices] based on [Assignment: organization-defined purging/wiping requirements/techniques] after [Assignment: organization-defined number] consecutive, unsuccessful device logon attempts.
@y
The information system purges/wipes information from [Assignment: organization-defined mobile devices] based on [Assignment: organization-defined purging/wiping requirements/techniques] after [Assignment: organization-defined number] consecutive, unsuccessful device logon attempts.
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
## AC-8 System Use Notification
@y
## AC-8 System Use Notification
@z

@x
#### Description
@y
#### Description
@z

@x
The information system:
<ol type="a">
<li>Displays to users [Assignment: organization-defined system use notification message or banner] before granting access to the system that provides privacy and security notices consistent with applicable federal laws, Executive Orders, directives, policies, regulations, standards, and guidance and states that:</li>
@y
The information system:
<ol type="a">
<li>Displays to users [Assignment: organization-defined system use notification message or banner] before granting access to the system that provides privacy and security notices consistent with applicable federal laws, Executive Orders, directives, policies, regulations, standards, and guidance and states that:</li>
@z

@x
<ol type="1">
<li>Users are accessing a U.S. Government information system;</li>
<li>Information system usage may be monitored, recorded, and subject to audit;</li>
<li>Unauthorized use of the information system is prohibited and subject to criminal and civil penalties; and</li>
<li>Use of the information system indicates consent to monitoring and recording;</li>
</ol>
<li>Retains the notification message or banner on the screen until users acknowledge the usage conditions and take explicit actions to log on to or further access the information system; and</li>
<li>For publicly accessible systems:</li>
@y
<ol type="1">
<li>Users are accessing a U.S. Government information system;</li>
<li>Information system usage may be monitored, recorded, and subject to audit;</li>
<li>Unauthorized use of the information system is prohibited and subject to criminal and civil penalties; and</li>
<li>Use of the information system indicates consent to monitoring and recording;</li>
</ol>
<li>Retains the notification message or banner on the screen until users acknowledge the usage conditions and take explicit actions to log on to or further access the information system; and</li>
<li>For publicly accessible systems:</li>
@z

@x
<ol type="1">
<li>Displays system use information [Assignment: organization-defined conditions], before granting further access;</li>
<li>Displays references, if any, to monitoring, recording, or auditing that are consistent with privacy accommodations for such systems that generally prohibit those activities; and</li>
<li>Includes a description of the authorized uses of the system.</li>
</ol>
</ol>
@y
<ol type="1">
<li>Displays system use information [Assignment: organization-defined conditions], before granting further access;</li>
<li>Displays references, if any, to monitoring, recording, or auditing that are consistent with privacy accommodations for such systems that generally prohibit those activities; and</li>
<li>Includes a description of the authorized uses of the system.</li>
</ol>
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
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caei5g">eNZi</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caei5g">eNZi</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0cpludq000caei5g" class="tab-pane fade in active">
The feature required to satisfy the requirements of this control has
not yet been built in to Docker EE but is none for a future
release.The feature required to satisfy the requirements of this control has
not yet been built in to Docker EE but is none for a future
release.The feature required to satisfy control has
not yet been built in to Docker EE but is none for a future
release.
</div>
</div>
@y
<div class="tab-content">
<div id="bb2j0cpludq000caei5g" class="tab-pane fade in active">
The feature required to satisfy the requirements of this control has
not yet been built in to Docker EE but is none for a future
release.The feature required to satisfy the requirements of this control has
not yet been built in to Docker EE but is none for a future
release.The feature required to satisfy control has
not yet been built in to Docker EE but is none for a future
release.
</div>
</div>
@z

@x
## AC-9 Previous Logon (Access) Notification
@y
## AC-9 Previous Logon (Access) Notification
@z

@x
#### Description
@y
#### Description
@z

@x
The information system notifies the user, upon successful logon (access) to the system, of the date and time of the last logon (access).
@y
The information system notifies the user, upon successful logon (access) to the system, of the date and time of the last logon (access).
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
### AC-9 (1) Unsuccessful Logons
@y
### AC-9 (1) Unsuccessful Logons
@z

@x
#### Description
@y
#### Description
@z

@x
The information system notifies the user, upon successful logon/access, of the number of unsuccessful logon/access attempts since the last successful logon/access.
@y
The information system notifies the user, upon successful logon/access, of the number of unsuccessful logon/access attempts since the last successful logon/access.
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
### AC-9 (2) Successful / Unsuccessful Logons
@y
### AC-9 (2) Successful / Unsuccessful Logons
@z

@x
#### Description
@y
#### Description
@z

@x
The information system notifies the user of the number of [Selection: successful logons/accesses; unsuccessful logon/access attempts; both] during [Assignment: organization-defined time period].
@y
The information system notifies the user of the number of [Selection: successful logons/accesses; unsuccessful logon/access attempts; both] during [Assignment: organization-defined time period].
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
### AC-9 (3) Notification Of Account Changes
@y
### AC-9 (3) Notification Of Account Changes
@z

@x
#### Description
@y
#### Description
@z

@x
The information system notifies the user of changes to [Assignment: organization-defined security-related characteristics/parameters of the user�s account] during [Assignment: organization-defined time period].
@y
The information system notifies the user of changes to [Assignment: organization-defined security-related characteristics/parameters of the user�s account] during [Assignment: organization-defined time period].
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
### AC-9 (4) Additional Logon Information
@y
### AC-9 (4) Additional Logon Information
@z

@x
#### Description
@y
#### Description
@z

@x
The information system notifies the user, upon successful logon (access), of the following additional information: [Assignment: organization-defined information to be included in addition to the date and time of the last logon (access)].
@y
The information system notifies the user, upon successful logon (access), of the following additional information: [Assignment: organization-defined information to be included in addition to the date and time of the last logon (access)].
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
## AC-10 Concurrent Session Control
@y
## AC-10 Concurrent Session Control
@z

@x
#### Description
@y
#### Description
@z

@x
The information system limits the number of concurrent sessions for each [Assignment: organization-defined account and/or account type] to [Assignment: organization-defined number].
@y
The information system limits the number of concurrent sessions for each [Assignment: organization-defined account and/or account type] to [Assignment: organization-defined number].
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
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caei60">eNZi</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caei60">eNZi</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0cpludq000caei60" class="tab-pane fade in active">
Docker Enterprise Edition can be configured to limit the number of
concurrent sessions for each account. These options can be found
within the Universal Control Plane Admin Settings under the
&#34;Authentication &amp; Authorization&#34; section. 
</div>
</div>
@y
<div class="tab-content">
<div id="bb2j0cpludq000caei60" class="tab-pane fade in active">
Docker Enterprise Edition can be configured to limit the number of
concurrent sessions for each account. These options can be found
within the Universal Control Plane Admin Settings under the
&#34;Authentication &amp; Authorization&#34; section. 
</div>
</div>
@z

@x
## AC-11 Session Lock
@y
## AC-11 Session Lock
@z

@x
#### Description
@y
#### Description
@z

@x
The information system:
<ol type="a">
<li>Prevents further access to the system by initiating a session lock after [Assignment: organization-defined time period] of inactivity or upon receiving a request from a user; and</li>
<li>Retains the session lock until the user reestablishes access using established identification and authentication procedures.</li>
</ol>
@y
The information system:
<ol type="a">
<li>Prevents further access to the system by initiating a session lock after [Assignment: organization-defined time period] of inactivity or upon receiving a request from a user; and</li>
<li>Retains the session lock until the user reestablishes access using established identification and authentication procedures.</li>
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
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caei6g">eNZi</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caei6g">eNZi</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0cpludq000caei6g" class="tab-pane fade in active">
Per the requirements of AC-2 (5), Docker Enterprise Edition can be
configured to enforce user session lifetime limits and renewal
thresholds. These options can be found within the Universal Control
Plane Admin Settings under the &#34;Authentication &amp; Authorization&#34;
section. Configurable options include the initial lifetime (in hours)
of a user&#39;s session and the renewal threshold of a session (in
hours).
</div>
</div>
@y
<div class="tab-content">
<div id="bb2j0cpludq000caei6g" class="tab-pane fade in active">
Per the requirements of AC-2 (5), Docker Enterprise Edition can be
configured to enforce user session lifetime limits and renewal
thresholds. These options can be found within the Universal Control
Plane Admin Settings under the &#34;Authentication &amp; Authorization&#34;
section. Configurable options include the initial lifetime (in hours)
of a user&#39;s session and the renewal threshold of a session (in
hours).
</div>
</div>
@z

@x
### AC-11 (1) Pattern-Hiding Displays
@y
### AC-11 (1) Pattern-Hiding Displays
@z

@x
#### Description
@y
#### Description
@z

@x
The information system conceals, via the session lock, information previously visible on the display with a publicly viewable image.
@y
The information system conceals, via the session lock, information previously visible on the display with a publicly viewable image.
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
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caei70">eNZi</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caei70">eNZi</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0cpludq000caei70" class="tab-pane fade in active">
Per the requirements of AC-2 (5), Docker Enterprise Edition can be
configured to enforce user session lifetime limits and renewal
thresholds. These options can be found within the Universal Control
Plane Admin Settings under the &#34;Authentication &amp; Authorization&#34;
section. Configurable options include the initial lifetime (in hours)
of a user&#39;s session and the renewal threshold of a session (in
hours). Upon the expiration of the configured session thresholds, a
user will be locked out of his/her session per the requirements of
this controls.
</div>
</div>
@y
<div class="tab-content">
<div id="bb2j0cpludq000caei70" class="tab-pane fade in active">
Per the requirements of AC-2 (5), Docker Enterprise Edition can be
configured to enforce user session lifetime limits and renewal
thresholds. These options can be found within the Universal Control
Plane Admin Settings under the &#34;Authentication &amp; Authorization&#34;
section. Configurable options include the initial lifetime (in hours)
of a user&#39;s session and the renewal threshold of a session (in
hours). Upon the expiration of the configured session thresholds, a
user will be locked out of his/her session per the requirements of
this controls.
</div>
</div>
@z

@x
## AC-12 Session Termination
@y
## AC-12 Session Termination
@z

@x
#### Description
@y
#### Description
@z

@x
The information system automatically terminates a user session after [Assignment: organization-defined conditions or trigger events requiring session disconnect].
@y
The information system automatically terminates a user session after [Assignment: organization-defined conditions or trigger events requiring session disconnect].
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
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caei7g">eNZi</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caei7g">eNZi</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0cpludq000caei7g" class="tab-pane fade in active">
Per the requirements of AC-2 (5), Docker Enterprise Edition can be
configured to enforce user session lifetime limits and renewal
thresholds. These options can be found within the Universal Control
Plane Admin Settings under the &#34;Authentication &amp; Authorization&#34;
section. Configurable options include the initial lifetime (in hours)
of a user&#39;s session and the renewal threshold of a session (in
hours). Upon the expiration of the configured session thresholds, a
user will be locked out of his/her session.
</div>
</div>
@y
<div class="tab-content">
<div id="bb2j0cpludq000caei7g" class="tab-pane fade in active">
Per the requirements of AC-2 (5), Docker Enterprise Edition can be
configured to enforce user session lifetime limits and renewal
thresholds. These options can be found within the Universal Control
Plane Admin Settings under the &#34;Authentication &amp; Authorization&#34;
section. Configurable options include the initial lifetime (in hours)
of a user&#39;s session and the renewal threshold of a session (in
hours). Upon the expiration of the configured session thresholds, a
user will be locked out of his/her session.
</div>
</div>
@z

@x
### AC-12 (1) User-Initiated Logouts / Message Displays
@y
### AC-12 (1) User-Initiated Logouts / Message Displays
@z

@x
#### Description
@y
#### Description
@z

@x
The information system:
<ol type="a">
<li>Provides a logout capability for user-initiated communications sessions whenever authentication is used to gain access to [Assignment: organization-defined information resources]; and</li>
<li>Displays an explicit logout message to users indicating the reliable termination of authenticated communications sessions.</li>
</ol>
@y
The information system:
<ol type="a">
<li>Provides a logout capability for user-initiated communications sessions whenever authentication is used to gain access to [Assignment: organization-defined information resources]; and</li>
<li>Displays an explicit logout message to users indicating the reliable termination of authenticated communications sessions.</li>
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
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caei80">UCP</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caei80">UCP</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0cpludq000caei80" class="tab-pane fade in active">
Universal Control Plane includes a logout capability that allows a
user to terminate his/her current session.
</div>
</div>
@y
<div class="tab-content">
<div id="bb2j0cpludq000caei80" class="tab-pane fade in active">
Universal Control Plane includes a logout capability that allows a
user to terminate his/her current session.
</div>
</div>
@z

@x
## AC-14 Permitted Actions Without Identification Or Authentication
@y
## AC-14 Permitted Actions Without Identification Or Authentication
@z

@x
#### Description
@y
#### Description
@z

@x
The organization:
<ol type="a">
<li>Identifies [Assignment: organization-defined user actions] that can be performed on the information system without identification or authentication consistent with organizational missions/business functions; and</li>
<li>Documents and provides supporting rationale in the security plan for the information system, user actions not requiring identification or authentication.</li>
</ol>
@y
The organization:
<ol type="a">
<li>Identifies [Assignment: organization-defined user actions] that can be performed on the information system without identification or authentication consistent with organizational missions/business functions; and</li>
<li>Documents and provides supporting rationale in the security plan for the information system, user actions not requiring identification or authentication.</li>
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
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caei8g">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0cpludq000caei90">Engine</a></li>
<li><a data-toggle="tab" data-target="#bb2j0cpludq000caei9g">UCP</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caei8g">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0cpludq000caei90">Engine</a></li>
<li><a data-toggle="tab" data-target="#bb2j0cpludq000caei9g">UCP</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0cpludq000caei8g" class="tab-pane fade in active">
To help the organization meet the requirements of this control, a
review of actions allowed by unauthenticated users can be performed
within Docker Trusted Registry.
</div>
<div id="bb2j0cpludq000caei90" class="tab-pane fade">
To help the organization meet the requirements of this control, one
can restrict membership to the &#39;docker&#39; group on underlying Linux
hosts or the local &#34;Administrators&#34; group (and any other groups
defined within &#39;daemon.json&#39;) on underlying Windows Server 2016 hosts
to only authorized users.
</div>
<div id="bb2j0cpludq000caei9g" class="tab-pane fade">
To help the organization meet the requirements of this control, a
review of actions allowed by unauthenticated users can be performed
within Universal Control Plane.
</div>
</div>
@y
<div class="tab-content">
<div id="bb2j0cpludq000caei8g" class="tab-pane fade in active">
To help the organization meet the requirements of this control, a
review of actions allowed by unauthenticated users can be performed
within Docker Trusted Registry.
</div>
<div id="bb2j0cpludq000caei90" class="tab-pane fade">
To help the organization meet the requirements of this control, one
can restrict membership to the &#39;docker&#39; group on underlying Linux
hosts or the local &#34;Administrators&#34; group (and any other groups
defined within &#39;daemon.json&#39;) on underlying Windows Server 2016 hosts
to only authorized users.
</div>
<div id="bb2j0cpludq000caei9g" class="tab-pane fade">
To help the organization meet the requirements of this control, a
review of actions allowed by unauthenticated users can be performed
within Universal Control Plane.
</div>
</div>
@z

@x
## AC-16 Security Attributes
@y
## AC-16 Security Attributes
@z

@x
#### Description
@y
#### Description
@z

@x
The organization:
<ol type="a">
<li>Provides the means to associate [Assignment: organization-defined types of security attributes] having [Assignment: organization-defined security attribute values] with information in storage, in process, and/or in transmission;</li>
<li>Ensures that the security attribute associations are made and retained with the information;</li>
<li>Establishes the permitted [Assignment: organization-defined security attributes] for [Assignment: organization-defined information systems]; and</li>
<li>Determines the permitted [Assignment: organization-defined values or ranges] for each of the established security attributes.</li>
</ol>
@y
The organization:
<ol type="a">
<li>Provides the means to associate [Assignment: organization-defined types of security attributes] having [Assignment: organization-defined security attribute values] with information in storage, in process, and/or in transmission;</li>
<li>Ensures that the security attribute associations are made and retained with the information;</li>
<li>Establishes the permitted [Assignment: organization-defined security attributes] for [Assignment: organization-defined information systems]; and</li>
<li>Determines the permitted [Assignment: organization-defined values or ranges] for each of the established security attributes.</li>
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
### AC-16 (1) Dynamic Attribute Association
@y
### AC-16 (1) Dynamic Attribute Association
@z

@x
#### Description
@y
#### Description
@z

@x
The information system dynamically associates security attributes with [Assignment: organization-defined subjects and objects] in accordance with [Assignment: organization-defined security policies] as information is created and combined.
@y
The information system dynamically associates security attributes with [Assignment: organization-defined subjects and objects] in accordance with [Assignment: organization-defined security policies] as information is created and combined.
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
### AC-16 (2) Attribute Value Changes By Authorized Individuals
@y
### AC-16 (2) Attribute Value Changes By Authorized Individuals
@z

@x
#### Description
@y
#### Description
@z

@x
The information system provides authorized individuals (or processes acting on behalf of individuals) the capability to define or change the value of associated security attributes.
@y
The information system provides authorized individuals (or processes acting on behalf of individuals) the capability to define or change the value of associated security attributes.
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
### AC-16 (3) Maintenance Of Attribute Associations By Information System
@y
### AC-16 (3) Maintenance Of Attribute Associations By Information System
@z

@x
#### Description
@y
#### Description
@z

@x
The information system maintains the association and integrity of [Assignment: organization-defined security attributes] to [Assignment: organization-defined subjects and objects].
@y
The information system maintains the association and integrity of [Assignment: organization-defined security attributes] to [Assignment: organization-defined subjects and objects].
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
### AC-16 (4) Association Of Attributes By Authorized Individuals
@y
### AC-16 (4) Association Of Attributes By Authorized Individuals
@z

@x
#### Description
@y
#### Description
@z

@x
The information system supports the association of [Assignment: organization-defined security attributes] with [Assignment: organization-defined subjects and objects] by authorized individuals (or processes acting on behalf of individuals).
@y
The information system supports the association of [Assignment: organization-defined security attributes] with [Assignment: organization-defined subjects and objects] by authorized individuals (or processes acting on behalf of individuals).
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
### AC-16 (5) Attribute Displays For Output Devices
@y
### AC-16 (5) Attribute Displays For Output Devices
@z

@x
#### Description
@y
#### Description
@z

@x
The information system displays security attributes in human-readable form on each object that the system transmits to output devices to identify [Assignment: organization-identified special dissemination, handling, or distribution instructions] using [Assignment: organization-identified human-readable, standard naming conventions].
@y
The information system displays security attributes in human-readable form on each object that the system transmits to output devices to identify [Assignment: organization-identified special dissemination, handling, or distribution instructions] using [Assignment: organization-identified human-readable, standard naming conventions].
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
### AC-16 (6) Maintenance Of Attribute Association By Organization
@y
### AC-16 (6) Maintenance Of Attribute Association By Organization
@z

@x
#### Description
@y
#### Description
@z

@x
The organization allows personnel to associate, and maintain the association of [Assignment: organization-defined security attributes] with [Assignment: organization-defined subjects and objects] in accordance with [Assignment: organization-defined security policies].
@y
The organization allows personnel to associate, and maintain the association of [Assignment: organization-defined security attributes] with [Assignment: organization-defined subjects and objects] in accordance with [Assignment: organization-defined security policies].
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
### AC-16 (7) Consistent Attribute Interpretation
@y
### AC-16 (7) Consistent Attribute Interpretation
@z

@x
#### Description
@y
#### Description
@z

@x
The organization provides a consistent interpretation of security attributes transmitted between distributed information system components.
@y
The organization provides a consistent interpretation of security attributes transmitted between distributed information system components.
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
### AC-16 (8) Association Techniques / Technologies
@y
### AC-16 (8) Association Techniques / Technologies
@z

@x
#### Description
@y
#### Description
@z

@x
The information system implements [Assignment: organization-defined techniques or technologies] with [Assignment: organization-defined level of assurance] in associating security attributes to information.
@y
The information system implements [Assignment: organization-defined techniques or technologies] with [Assignment: organization-defined level of assurance] in associating security attributes to information.
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
### AC-16 (9) Attribute Reassignment
@y
### AC-16 (9) Attribute Reassignment
@z

@x
#### Description
@y
#### Description
@z

@x
The organization ensures that security attributes associated with information are reassigned only via re-grading mechanisms validated using [Assignment: organization-defined techniques or procedures].
@y
The organization ensures that security attributes associated with information are reassigned only via re-grading mechanisms validated using [Assignment: organization-defined techniques or procedures].
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
### AC-16 (10) Attribute Configuration By Authorized Individuals
@y
### AC-16 (10) Attribute Configuration By Authorized Individuals
@z

@x
#### Description
@y
#### Description
@z

@x
The information system provides authorized individuals the capability to define or change the type and value of security attributes available for association with subjects and objects.
@y
The information system provides authorized individuals the capability to define or change the type and value of security attributes available for association with subjects and objects.
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
## AC-17 Remote Access
@y
## AC-17 Remote Access
@z

@x
#### Description
@y
#### Description
@z

@x
The organization:
<ol type="a">
<li>Establishes and documents usage restrictions, configuration/connection requirements, and implementation guidance for each type of remote access allowed; and</li>
<li>Authorizes remote access to the information system prior to allowing such connections.</li>
</ol>
@y
The organization:
<ol type="a">
<li>Establishes and documents usage restrictions, configuration/connection requirements, and implementation guidance for each type of remote access allowed; and</li>
<li>Authorizes remote access to the information system prior to allowing such connections.</li>
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
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caeia0">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0cpludq000caeiag">Engine</a></li>
<li><a data-toggle="tab" data-target="#bb2j0cpludq000caeib0">UCP</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caeia0">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0cpludq000caeiag">Engine</a></li>
<li><a data-toggle="tab" data-target="#bb2j0cpludq000caeib0">UCP</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0cpludq000caeia0" class="tab-pane fade in active">
To help the organization meet the requirements of this control,
Docker Trusted Registry can be configured to allow/prohibit remote
access.
</div>
<div id="bb2j0cpludq000caeiag" class="tab-pane fade">
To help the organization meet the requirements of this control,
Docker Enterprise Edition can be configured to allow/prohibit remote
access to the Engine.
</div>
<div id="bb2j0cpludq000caeib0" class="tab-pane fade">
To help the organization meet the requirements of this control,
Universal Control Plane can be configured to allow/prohibit remote
access.
</div>
</div>
@y
<div class="tab-content">
<div id="bb2j0cpludq000caeia0" class="tab-pane fade in active">
To help the organization meet the requirements of this control,
Docker Trusted Registry can be configured to allow/prohibit remote
access.
</div>
<div id="bb2j0cpludq000caeiag" class="tab-pane fade">
To help the organization meet the requirements of this control,
Docker Enterprise Edition can be configured to allow/prohibit remote
access to the Engine.
</div>
<div id="bb2j0cpludq000caeib0" class="tab-pane fade">
To help the organization meet the requirements of this control,
Universal Control Plane can be configured to allow/prohibit remote
access.
</div>
</div>
@z

@x
### AC-17 (1) Automated Monitoring / Control
@y
### AC-17 (1) Automated Monitoring / Control
@z

@x
#### Description
@y
#### Description
@z

@x
The information system monitors and controls remote access methods.
@y
The information system monitors and controls remote access methods.
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
<td>Docker Enterprise Edition Engine</td>
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
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caeibg">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0cpludq000caeic0">Engine</a></li>
<li><a data-toggle="tab" data-target="#bb2j0cpludq000caeicg">UCP</a></li>
<li><a data-toggle="tab" data-target="#bb2j0cpludq000caeid0">eNZi</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caeibg">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0cpludq000caeic0">Engine</a></li>
<li><a data-toggle="tab" data-target="#bb2j0cpludq000caeicg">UCP</a></li>
<li><a data-toggle="tab" data-target="#bb2j0cpludq000caeid0">eNZi</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0cpludq000caeibg" class="tab-pane fade in active">
Docker Trusted Registry logs and controls all local and remote
access events. In addition, auditing can be configured on the
underlying operating system to meet this control.
</div>
<div id="bb2j0cpludq000caeic0" class="tab-pane fade">
Docker Enterprise Edition logs and controls all local and remote
access events. In addition, auditing can be configured on the
underlying operating system to meet this control.
</div>
<div id="bb2j0cpludq000caeicg" class="tab-pane fade">
Universal Control Plane logs and controls all local and remote
access events. In addition, auditing can be configured on the
underlying operating system to meet this control.
</div>
<div id="bb2j0cpludq000caeid0" class="tab-pane fade">
Docker Enterprise Edition logs and controls all local and remote
access events. In addition, auditing can be configured on the
underlying operating system to meet this control.
</div>
</div>
@y
<div class="tab-content">
<div id="bb2j0cpludq000caeibg" class="tab-pane fade in active">
Docker Trusted Registry logs and controls all local and remote
access events. In addition, auditing can be configured on the
underlying operating system to meet this control.
</div>
<div id="bb2j0cpludq000caeic0" class="tab-pane fade">
Docker Enterprise Edition logs and controls all local and remote
access events. In addition, auditing can be configured on the
underlying operating system to meet this control.
</div>
<div id="bb2j0cpludq000caeicg" class="tab-pane fade">
Universal Control Plane logs and controls all local and remote
access events. In addition, auditing can be configured on the
underlying operating system to meet this control.
</div>
<div id="bb2j0cpludq000caeid0" class="tab-pane fade">
Docker Enterprise Edition logs and controls all local and remote
access events. In addition, auditing can be configured on the
underlying operating system to meet this control.
</div>
</div>
@z

@x
### AC-17 (2) Protection Of Confidentiality / Integrity Using Encryption
@y
### AC-17 (2) Protection Of Confidentiality / Integrity Using Encryption
@z

@x
#### Description
@y
#### Description
@z

@x
The information system implements cryptographic mechanisms to protect the confidentiality and integrity of remote access sessions.
@y
The information system implements cryptographic mechanisms to protect the confidentiality and integrity of remote access sessions.
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
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caeidg">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0cpludq000caeie0">Engine</a></li>
<li><a data-toggle="tab" data-target="#bb2j0cpludq000caeieg">UCP</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caeidg">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0cpludq000caeie0">Engine</a></li>
<li><a data-toggle="tab" data-target="#bb2j0cpludq000caeieg">UCP</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0cpludq000caeidg" class="tab-pane fade in active">
All remote access sessions to Docker Trusted Registry are protected
with Transport Layer Security (TLS) 1.2. This is included at both the
HTTPS application layer for access to the DTR user interface and for
command-line based connections to the registry. In addition to this,
all communication to DTR is enforced by way of two-way mutual TLS
authentication.
</div>
<div id="bb2j0cpludq000caeie0" class="tab-pane fade">
All remote access sessions to Docker Enterprise Edition are protected
with Transport Layer Security (TLS) 1.2. In addition to this, all
communication to Docker Enterprise Edition is enforced by way of
two-way mutual TLS authentication.
</div>
<div id="bb2j0cpludq000caeieg" class="tab-pane fade">
All remote access sessions to Universal Control Plane are protected
with Transport Layer Security (TLS) 1.2. This is included at both the
HTTPS application layer for access to the UCP user interface and for
command-line based connections to the cluster. In addition to this,
all communication to UCP is enforced by way of two-way mutual TLS
authentication.
</div>
</div>
@y
<div class="tab-content">
<div id="bb2j0cpludq000caeidg" class="tab-pane fade in active">
All remote access sessions to Docker Trusted Registry are protected
with Transport Layer Security (TLS) 1.2. This is included at both the
HTTPS application layer for access to the DTR user interface and for
command-line based connections to the registry. In addition to this,
all communication to DTR is enforced by way of two-way mutual TLS
authentication.
</div>
<div id="bb2j0cpludq000caeie0" class="tab-pane fade">
All remote access sessions to Docker Enterprise Edition are protected
with Transport Layer Security (TLS) 1.2. In addition to this, all
communication to Docker Enterprise Edition is enforced by way of
two-way mutual TLS authentication.
</div>
<div id="bb2j0cpludq000caeieg" class="tab-pane fade">
All remote access sessions to Universal Control Plane are protected
with Transport Layer Security (TLS) 1.2. This is included at both the
HTTPS application layer for access to the UCP user interface and for
command-line based connections to the cluster. In addition to this,
all communication to UCP is enforced by way of two-way mutual TLS
authentication.
</div>
</div>
@z

@x
### AC-17 (3) Managed Access Control Points
@y
### AC-17 (3) Managed Access Control Points
@z

@x
#### Description
@y
#### Description
@z

@x
The information system routes all remote accesses through [Assignment: organization-defined number] managed network access control points.
@y
The information system routes all remote accesses through [Assignment: organization-defined number] managed network access control points.
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
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caeif0">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0cpludq000caeifg">Engine</a></li>
<li><a data-toggle="tab" data-target="#bb2j0cpludq000caeig0">UCP</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caeif0">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0cpludq000caeifg">Engine</a></li>
<li><a data-toggle="tab" data-target="#bb2j0cpludq000caeig0">UCP</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0cpludq000caeif0" class="tab-pane fade in active">
A combination of managed load balancers, firewalls and access control
lists, and virtual networking resources can be used to ensure traffic
destined for Docker Trusted Registry replicas is routed through
managed network access control points.
</div>
<div id="bb2j0cpludq000caeifg" class="tab-pane fade">
A combination of managed load balancers, firewalls and access control
lists, and virtual networking resources can be used to ensure traffic
destined for Docker Enterprise Edition is routed through managed
network access control points.
</div>
<div id="bb2j0cpludq000caeig0" class="tab-pane fade">
A combination of managed load balancers, firewalls and access control
lists, and virtual networking resources can be used to ensure traffic
destined for Universal Control Plane managers and worker nodes is
routed through managed network access control points.
</div>
</div>
@y
<div class="tab-content">
<div id="bb2j0cpludq000caeif0" class="tab-pane fade in active">
A combination of managed load balancers, firewalls and access control
lists, and virtual networking resources can be used to ensure traffic
destined for Docker Trusted Registry replicas is routed through
managed network access control points.
</div>
<div id="bb2j0cpludq000caeifg" class="tab-pane fade">
A combination of managed load balancers, firewalls and access control
lists, and virtual networking resources can be used to ensure traffic
destined for Docker Enterprise Edition is routed through managed
network access control points.
</div>
<div id="bb2j0cpludq000caeig0" class="tab-pane fade">
A combination of managed load balancers, firewalls and access control
lists, and virtual networking resources can be used to ensure traffic
destined for Universal Control Plane managers and worker nodes is
routed through managed network access control points.
</div>
</div>
@z

@x
### AC-17 (4) Privileged Commands / Access
@y
### AC-17 (4) Privileged Commands / Access
@z

@x
#### Description
@y
#### Description
@z

@x
The organization:
<ol type="a">
<li>Authorizes the execution of privileged commands and access to security-relevant information via remote access only for [Assignment: organization-defined needs]; and</li>
<li>Documents the rationale for such access in the security plan for the information system.</li>
</ol>
@y
The organization:
<ol type="a">
<li>Authorizes the execution of privileged commands and access to security-relevant information via remote access only for [Assignment: organization-defined needs]; and</li>
<li>Documents the rationale for such access in the security plan for the information system.</li>
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
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caeigg">UCP</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caeigg">UCP</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0cpludq000caeigg" class="tab-pane fade in active">
To help the organization meet the requirements of this control,
Universal Control Plane can be configured to authorize certain
privileged functions via remote access.
</div>
</div>
@y
<div class="tab-content">
<div id="bb2j0cpludq000caeigg" class="tab-pane fade in active">
To help the organization meet the requirements of this control,
Universal Control Plane can be configured to authorize certain
privileged functions via remote access.
</div>
</div>
@z

@x
### AC-17 (6) Protection Of Information
@y
### AC-17 (6) Protection Of Information
@z

@x
#### Description
@y
#### Description
@z

@x
The organization ensures that users protect information about remote access mechanisms from unauthorized use and disclosure.
@y
The organization ensures that users protect information about remote access mechanisms from unauthorized use and disclosure.
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
### AC-17 (9) Disconnect / Disable Access
@y
### AC-17 (9) Disconnect / Disable Access
@z

@x
#### Description
@y
#### Description
@z

@x
The organization provides the capability to expeditiously disconnect or disable remote access to the information system within [Assignment: organization-defined time period].
@y
The organization provides the capability to expeditiously disconnect or disable remote access to the information system within [Assignment: organization-defined time period].
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
<td>configured by customer<br/>service provider hybrid<br/></td>
</tr>
<tr>
<td>Docker Enterprise Edition Engine</td>
<td>none<br/></td>
<td>configured by customer<br/>service provider hybrid<br/></td>
</tr>
<tr>
<td>Universal Control Plane (UCP)</td>
<td>none<br/>partial<br/></td>
<td>configured by customer<br/>service provider hybrid<br/></td>
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
<td>configured by customer<br/>service provider hybrid<br/></td>
</tr>
<tr>
<td>Docker Enterprise Edition Engine</td>
<td>none<br/></td>
<td>configured by customer<br/>service provider hybrid<br/></td>
</tr>
<tr>
<td>Universal Control Plane (UCP)</td>
<td>none<br/>partial<br/></td>
<td>configured by customer<br/>service provider hybrid<br/></td>
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
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caeih0">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0cpludq000caeihg">Engine</a></li>
<li><a data-toggle="tab" data-target="#bb2j0cpludq000caeii0">UCP</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caeih0">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0cpludq000caeihg">Engine</a></li>
<li><a data-toggle="tab" data-target="#bb2j0cpludq000caeii0">UCP</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0cpludq000caeih0" class="tab-pane fade in active">
Built-in firewall technology in Docker Trusted Registry&#39;s underlying
operating system can be used to force the disconnection of remote
connections to the host. In addition, UCP slave nodes running Docker
Trusted Registry replicas can be paused or drained, which subsequently
stops sessions to the DTR replica.
</div>
<div id="bb2j0cpludq000caeihg" class="tab-pane fade">
Built-in firewall technology in Docker Enterprise Edition&#39;s
underlying operating system can be used to force the disconnection of
remote connections to the host. In addition, Docker Enterprise Edition
provides the option to pause or drain a node in the cluster, which
subsequently stops and/or removes sessions to the node. Individual
services and/or applications running on Docker Enterprise Edition can
also be stopped and/or removed.
</div>
<div id="bb2j0cpludq000caeii0" class="tab-pane fade">
Built-in firewall technology in Universal Control Plane&#39;s underlying
operating system can be used to force the disconnection of remote
connections to the host. In addition, UCP provides the option to pause
or drain a node in the cluster, which subsequently stops and/or
removes sessions to the node. Individual services and/or applications
running on a UCP cluster can also be stopped and/or removed.
</div>
</div>
@y
<div class="tab-content">
<div id="bb2j0cpludq000caeih0" class="tab-pane fade in active">
Built-in firewall technology in Docker Trusted Registry&#39;s underlying
operating system can be used to force the disconnection of remote
connections to the host. In addition, UCP slave nodes running Docker
Trusted Registry replicas can be paused or drained, which subsequently
stops sessions to the DTR replica.
</div>
<div id="bb2j0cpludq000caeihg" class="tab-pane fade">
Built-in firewall technology in Docker Enterprise Edition&#39;s
underlying operating system can be used to force the disconnection of
remote connections to the host. In addition, Docker Enterprise Edition
provides the option to pause or drain a node in the cluster, which
subsequently stops and/or removes sessions to the node. Individual
services and/or applications running on Docker Enterprise Edition can
also be stopped and/or removed.
</div>
<div id="bb2j0cpludq000caeii0" class="tab-pane fade">
Built-in firewall technology in Universal Control Plane&#39;s underlying
operating system can be used to force the disconnection of remote
connections to the host. In addition, UCP provides the option to pause
or drain a node in the cluster, which subsequently stops and/or
removes sessions to the node. Individual services and/or applications
running on a UCP cluster can also be stopped and/or removed.
</div>
</div>
@z

@x
## AC-18 Wireless Access
@y
## AC-18 Wireless Access
@z

@x
#### Description
@y
#### Description
@z

@x
The organization:
<ol type="a">
<li>Establishes usage restrictions, configuration/connection requirements, and implementation guidance for wireless access; and</li>
<li>Authorizes wireless access to the information system prior to allowing such connections.</li>
</ol>
@y
The organization:
<ol type="a">
<li>Establishes usage restrictions, configuration/connection requirements, and implementation guidance for wireless access; and</li>
<li>Authorizes wireless access to the information system prior to allowing such connections.</li>
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
### AC-18 (1) Authentication And Encryption
@y
### AC-18 (1) Authentication And Encryption
@z

@x
#### Description
@y
#### Description
@z

@x
The information system protects wireless access to the system using authentication of [Selection (one or more): users; devices] and encryption.
@y
The information system protects wireless access to the system using authentication of [Selection (one or more): users; devices] and encryption.
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
### AC-18 (3) Disable Wireless Networking
@y
### AC-18 (3) Disable Wireless Networking
@z

@x
#### Description
@y
#### Description
@z

@x
The organization disables, when not intended for use, wireless networking capabilities internally embedded within information system components prior to issuance and deployment.
@y
The organization disables, when not intended for use, wireless networking capabilities internally embedded within information system components prior to issuance and deployment.
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
### AC-18 (4) Restrict Configurations By Users
@y
### AC-18 (4) Restrict Configurations By Users
@z

@x
#### Description
@y
#### Description
@z

@x
The organization identifies and explicitly authorizes users allowed to independently configure wireless networking capabilities.
@y
The organization identifies and explicitly authorizes users allowed to independently configure wireless networking capabilities.
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
### AC-18 (5) Antennas / Transmission Power Levels
@y
### AC-18 (5) Antennas / Transmission Power Levels
@z

@x
#### Description
@y
#### Description
@z

@x
The organization selects radio antennas and calibrates transmission power levels to reduce the probability that usable signals can be received outside of organization-controlled boundaries.
@y
The organization selects radio antennas and calibrates transmission power levels to reduce the probability that usable signals can be received outside of organization-controlled boundaries.
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
## AC-19 Access Control For Mobile Devices
@y
## AC-19 Access Control For Mobile Devices
@z

@x
#### Description
@y
#### Description
@z

@x
The organization:
<ol type="a">
<li>Establishes usage restrictions, configuration requirements, connection requirements, and implementation guidance for organization-controlled mobile devices; and</li>
<li>Authorizes the connection of mobile devices to organizational information systems.</li>
</ol>
@y
The organization:
<ol type="a">
<li>Establishes usage restrictions, configuration requirements, connection requirements, and implementation guidance for organization-controlled mobile devices; and</li>
<li>Authorizes the connection of mobile devices to organizational information systems.</li>
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
### AC-19 (4) Restrictions For Classified Information
@y
### AC-19 (4) Restrictions For Classified Information
@z

@x
#### Description
@y
#### Description
@z

@x
The organization:
<ol type="a">
<li>Prohibits the use of unclassified mobile devices in facilities containing information systems processing, storing, or transmitting classified information unless specifically permitted by the authorizing official; and</li>
<li>Enforces the following restrictions on individuals permitted by the authorizing official to use unclassified mobile devices in facilities containing information systems processing, storing, or transmitting classified information:</li>
@y
The organization:
<ol type="a">
<li>Prohibits the use of unclassified mobile devices in facilities containing information systems processing, storing, or transmitting classified information unless specifically permitted by the authorizing official; and</li>
<li>Enforces the following restrictions on individuals permitted by the authorizing official to use unclassified mobile devices in facilities containing information systems processing, storing, or transmitting classified information:</li>
@z

@x
<ol type="1">
<li>Connection of unclassified mobile devices to classified information systems is prohibited;</li>
<li>Connection of unclassified mobile devices to unclassified information systems requires approval from the authorizing official;</li>
<li>Use of internal or external modems or wireless interfaces within the unclassified mobile devices is prohibited; and</li>
<li>Unclassified mobile devices and the information stored on those devices are subject to random reviews and inspections by [Assignment: organization-defined security officials], and if classified information is found, the incident handling policy is followed.</li>
</ol>
<li>Restricts the connection of classified mobile devices to classified information systems in accordance with [Assignment: organization-defined security policies].</li>
</ol>
@y
<ol type="1">
<li>Connection of unclassified mobile devices to classified information systems is prohibited;</li>
<li>Connection of unclassified mobile devices to unclassified information systems requires approval from the authorizing official;</li>
<li>Use of internal or external modems or wireless interfaces within the unclassified mobile devices is prohibited; and</li>
<li>Unclassified mobile devices and the information stored on those devices are subject to random reviews and inspections by [Assignment: organization-defined security officials], and if classified information is found, the incident handling policy is followed.</li>
</ol>
<li>Restricts the connection of classified mobile devices to classified information systems in accordance with [Assignment: organization-defined security policies].</li>
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
### AC-19 (5) Full Device / Container-Based  Encryption
@y
### AC-19 (5) Full Device / Container-Based  Encryption
@z

@x
#### Description
@y
#### Description
@z

@x
The organization employs [Selection: full-device encryption; container encryption] to protect the confidentiality and integrity of information on [Assignment: organization-defined mobile devices].
@y
The organization employs [Selection: full-device encryption; container encryption] to protect the confidentiality and integrity of information on [Assignment: organization-defined mobile devices].
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
## AC-20 Use Of External Information Systems
@y
## AC-20 Use Of External Information Systems
@z

@x
#### Description
@y
#### Description
@z

@x
The organization establishes terms and conditions, consistent with any trust relationships established with other organizations owning, operating, and/or maintaining external information systems, allowing authorized individuals to:
<ol type="a">
<li>Access the information system from external information systems; and</li>
<li>Process, store, or transmit organization-controlled information using external information systems.</li>
</ol>
@y
The organization establishes terms and conditions, consistent with any trust relationships established with other organizations owning, operating, and/or maintaining external information systems, allowing authorized individuals to:
<ol type="a">
<li>Access the information system from external information systems; and</li>
<li>Process, store, or transmit organization-controlled information using external information systems.</li>
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
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caeiig">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0cpludq000caeij0">UCP</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caeiig">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0cpludq000caeij0">UCP</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0cpludq000caeiig" class="tab-pane fade in active">
To help the organization meet the requirements of this control, one
can control which external systems can access Docker Trusted Registry.
</div>
<div id="bb2j0cpludq000caeij0" class="tab-pane fade">
To help the organization meet the requirements of this control, one
can control which external systems can access Universal Control
Plane.
</div>
</div>
@y
<div class="tab-content">
<div id="bb2j0cpludq000caeiig" class="tab-pane fade in active">
To help the organization meet the requirements of this control, one
can control which external systems can access Docker Trusted Registry.
</div>
<div id="bb2j0cpludq000caeij0" class="tab-pane fade">
To help the organization meet the requirements of this control, one
can control which external systems can access Universal Control
Plane.
</div>
</div>
@z

@x
### AC-20 (1) Limits On Authorized Use
@y
### AC-20 (1) Limits On Authorized Use
@z

@x
#### Description
@y
#### Description
@z

@x
The organization permits authorized individuals to use an external information system to access the information system or to process, store, or transmit organization-controlled information only when the organization:
<ol type="a">
<li>Verifies the implementation of required security controls on the external system as specified in the organization�s information security policy and security plan; or</li>
<li>Retains approved information system connection or processing agreements with the organizational entity hosting the external information system.</li>
</ol>
@y
The organization permits authorized individuals to use an external information system to access the information system or to process, store, or transmit organization-controlled information only when the organization:
<ol type="a">
<li>Verifies the implementation of required security controls on the external system as specified in the organization�s information security policy and security plan; or</li>
<li>Retains approved information system connection or processing agreements with the organizational entity hosting the external information system.</li>
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
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caeijg">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0cpludq000caeik0">UCP</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caeijg">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0cpludq000caeik0">UCP</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0cpludq000caeijg" class="tab-pane fade in active">
To help the organization meet the requirements of this control, one
can control which external systems can access Docker Trusted Registry.
</div>
<div id="bb2j0cpludq000caeik0" class="tab-pane fade">
To help the organization meet the requirements of this control, one
can control which external systems can access Universal Control
Plane.
</div>
</div>
@y
<div class="tab-content">
<div id="bb2j0cpludq000caeijg" class="tab-pane fade in active">
To help the organization meet the requirements of this control, one
can control which external systems can access Docker Trusted Registry.
</div>
<div id="bb2j0cpludq000caeik0" class="tab-pane fade">
To help the organization meet the requirements of this control, one
can control which external systems can access Universal Control
Plane.
</div>
</div>
@z

@x
### AC-20 (2) Portable Storage Devices
@y
### AC-20 (2) Portable Storage Devices
@z

@x
#### Description
@y
#### Description
@z

@x
The organization [Selection: restricts; prohibits] the use of organization-controlled portable storage devices by authorized individuals on external information systems.
@y
The organization [Selection: restricts; prohibits] the use of organization-controlled portable storage devices by authorized individuals on external information systems.
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
### AC-20 (3) Non-Organizationally Owned Systems / Components / Devices
@y
### AC-20 (3) Non-Organizationally Owned Systems / Components / Devices
@z

@x
#### Description
@y
#### Description
@z

@x
The organization [Selection: restricts; prohibits] the use of non-organizationally owned information systems, system components, or devices to process, store, or transmit organizational information.
@y
The organization [Selection: restricts; prohibits] the use of non-organizationally owned information systems, system components, or devices to process, store, or transmit organizational information.
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
### AC-20 (4) Network Accessible Storage Devices
@y
### AC-20 (4) Network Accessible Storage Devices
@z

@x
#### Description
@y
#### Description
@z

@x
The organization prohibits the use of [Assignment: organization-defined network accessible storage devices] in external information systems.
@y
The organization prohibits the use of [Assignment: organization-defined network accessible storage devices] in external information systems.
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
## AC-21 Information Sharing
@y
## AC-21 Information Sharing
@z

@x
#### Description
@y
#### Description
@z

@x
The organization:
<ol type="a">
<li>Facilitates information sharing by enabling authorized users to determine whether access authorizations assigned to the sharing partner match the access restrictions on the information for [Assignment: organization-defined information sharing circumstances where user discretion is required]; and</li>
<li>Employs [Assignment: organization-defined automated mechanisms or manual processes] to assist users in making information sharing/collaboration decisions.</li>
</ol>
@y
The organization:
<ol type="a">
<li>Facilitates information sharing by enabling authorized users to determine whether access authorizations assigned to the sharing partner match the access restrictions on the information for [Assignment: organization-defined information sharing circumstances where user discretion is required]; and</li>
<li>Employs [Assignment: organization-defined automated mechanisms or manual processes] to assist users in making information sharing/collaboration decisions.</li>
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
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caeikg">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0cpludq000caeil0">UCP</a></li>
</ul>
@y
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#bb2j0cpludq000caeikg">DTR</a></li>
<li><a data-toggle="tab" data-target="#bb2j0cpludq000caeil0">UCP</a></li>
</ul>
@z

@x
<div class="tab-content">
<div id="bb2j0cpludq000caeikg" class="tab-pane fade in active">
To help the organization meet the requirements of this control, one
can validate the assigned roles and access levels within Docker
Trusted Registry to control information sharing.
</div>
<div id="bb2j0cpludq000caeil0" class="tab-pane fade">
To help the organization meet the requirements of this control, one
can validate the assigned roles and access levels within Universal
Control Plane to control information sharing.
</div>
</div>
@y
<div class="tab-content">
<div id="bb2j0cpludq000caeikg" class="tab-pane fade in active">
To help the organization meet the requirements of this control, one
can validate the assigned roles and access levels within Docker
Trusted Registry to control information sharing.
</div>
<div id="bb2j0cpludq000caeil0" class="tab-pane fade">
To help the organization meet the requirements of this control, one
can validate the assigned roles and access levels within Universal
Control Plane to control information sharing.
</div>
</div>
@z

@x
### AC-21 (1) Automated Decision Support
@y
### AC-21 (1) Automated Decision Support
@z

@x
#### Description
@y
#### Description
@z

@x
The information system enforces information-sharing decisions by authorized users based on access authorizations of sharing partners and access restrictions on information to be shared.
@y
The information system enforces information-sharing decisions by authorized users based on access authorizations of sharing partners and access restrictions on information to be shared.
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
### AC-21 (2) Information Search And Retrieval
@y
### AC-21 (2) Information Search And Retrieval
@z

@x
#### Description
@y
#### Description
@z

@x
The information system implements information search and retrieval services that enforce [Assignment: organization-defined information sharing restrictions].
@y
The information system implements information search and retrieval services that enforce [Assignment: organization-defined information sharing restrictions].
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
## AC-22 Publicly Accessible Content
@y
## AC-22 Publicly Accessible Content
@z

@x
#### Description
@y
#### Description
@z

@x
The organization:
<ol type="a">
<li>Designates individuals authorized to post information onto a publicly accessible information system;</li>
<li>Trains authorized individuals to ensure that publicly accessible information does not contain nonpublic information;</li>
<li>Reviews the proposed content of information prior to posting onto the publicly accessible information system to ensure that nonpublic information is not included; and</li>
<li>Reviews the content on the publicly accessible information system for nonpublic information [Assignment: organization-defined frequency] and removes such information, if discovered.</li>
</ol>
@y
The organization:
<ol type="a">
<li>Designates individuals authorized to post information onto a publicly accessible information system;</li>
<li>Trains authorized individuals to ensure that publicly accessible information does not contain nonpublic information;</li>
<li>Reviews the proposed content of information prior to posting onto the publicly accessible information system to ensure that nonpublic information is not included; and</li>
<li>Reviews the content on the publicly accessible information system for nonpublic information [Assignment: organization-defined frequency] and removes such information, if discovered.</li>
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
## AC-23 Data Mining Protection
@y
## AC-23 Data Mining Protection
@z

@x
#### Description
@y
#### Description
@z

@x
The organization employs [Assignment: organization-defined data mining prevention and detection techniques] for [Assignment: organization-defined data storage objects] to adequately detect and protect against data mining.
@y
The organization employs [Assignment: organization-defined data mining prevention and detection techniques] for [Assignment: organization-defined data storage objects] to adequately detect and protect against data mining.
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
## AC-24 Access Control Decisions
@y
## AC-24 Access Control Decisions
@z

@x
#### Description
@y
#### Description
@z

@x
The organization establishes procedures to ensure [Assignment: organization-defined access control decisions] are applied to each access request prior to access enforcement.
@y
The organization establishes procedures to ensure [Assignment: organization-defined access control decisions] are applied to each access request prior to access enforcement.
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
### AC-24 (1) Transmit Access Authorization Information
@y
### AC-24 (1) Transmit Access Authorization Information
@z

@x
#### Description
@y
#### Description
@z

@x
The information system transmits [Assignment: organization-defined access authorization information] using [Assignment: organization-defined security safeguards] to [Assignment: organization-defined information systems] that enforce access control decisions.
@y
The information system transmits [Assignment: organization-defined access authorization information] using [Assignment: organization-defined security safeguards] to [Assignment: organization-defined information systems] that enforce access control decisions.
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
### AC-24 (2) No User Or Process Identity
@y
### AC-24 (2) No User Or Process Identity
@z

@x
#### Description
@y
#### Description
@z

@x
The information system enforces access control decisions based on [Assignment: organization-defined security attributes] that do not include the identity of the user or process acting on behalf of the user.
@y
The information system enforces access control decisions based on [Assignment: organization-defined security attributes] that do not include the identity of the user or process acting on behalf of the user.
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
## AC-25 Reference Monitor
@y
## AC-25 Reference Monitor
@z

@x
#### Description
@y
#### Description
@z

@x
The information system implements a reference monitor for [Assignment: organization-defined access control policies] that is tamperproof, always invoked, and small enough to be subject to analysis and testing, the completeness of which can be assured.
@y
The information system implements a reference monitor for [Assignment: organization-defined access control policies] that is tamperproof, always invoked, and small enough to be subject to analysis and testing, the completeness of which can be assured.
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
