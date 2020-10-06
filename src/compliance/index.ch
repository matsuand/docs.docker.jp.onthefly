%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Compliance guidance for Docker Enterprise Edition
keywords: standards, compliance, security
title: Docker standards and compliance
---
@y
---
description: Compliance guidance for Docker Enterprise Edition
keywords: standards, compliance, security
title: Docker standards and compliance
---
@z

@x
Docker Enterprise Edition can be configured and used in accordance with various
security and compliance laws, regulations, and standards. Use the guidance in
this section to verify and validate your Docker EE deployment against applicable
security controls and configuration baselines. The catalogs, frameworks,
publications, and benchmarks that we've highlighted thus far are as follows:
@y
Docker Enterprise Edition can be configured and used in accordance with various
security and compliance laws, regulations, and standards. Use the guidance in
this section to verify and validate your Docker EE deployment against applicable
security controls and configuration baselines. The catalogs, frameworks,
publications, and benchmarks that we've highlighted thus far are as follows:
@z

@x
**Laws:**
@y
**Laws:**
@z

@x
- [Federal Information Security Management Act (FISMA)](fisma.md)
@y
- [Federal Information Security Management Act (FISMA)](fisma.md)
@z

@x
**Catalogs:**
@y
**Catalogs:**
@z

@x
- [NIST Special Publication (SP) 800-53 Revision 4](nist/800_53.md)
@y
- [NIST Special Publication (SP) 800-53 Revision 4](nist/800_53.md)
@z

@x
**Frameworks:**
@y
**Frameworks:**
@z

@x
- [Federal Risk and Authorization Management Program (FedRAMP)](fedramp.md)
- [Risk Management Framework (NIST SP 800-37)](nist/800_37.md)
@y
- [Federal Risk and Authorization Management Program (FedRAMP)](fedramp.md)
- [Risk Management Framework (NIST SP 800-37)](nist/800_37.md)
@z

@x
**Standards:**
@y
**Standards:**
@z

@x
- [Federal Information Processing Standards (FIPS) 140-2](nist/fips140_2.md)
@y
- [Federal Information Processing Standards (FIPS) 140-2](nist/fips140_2.md)
@z

@x
**Container-Specific Publications:**
@y
**Container-Specific Publications:**
@z

@x
- [NIST Special Publication (SP) 800-190](nist/800_190.md) - Application
  Container Security Guide
- [NIST Interagency Report (NISTIR) 8176](nist/nistir_8176.md) - Security
  Assurance Requirements for Linux Application Container Deployments
- [NIST Information Technology Laboratory (ITL) Bulletin October
  2017](nist/itl_october2017.md) - NIST Guidance on Application Container
  Security
@y
- [NIST Special Publication (SP) 800-190](nist/800_190.md) - Application
  Container Security Guide
- [NIST Interagency Report (NISTIR) 8176](nist/nistir_8176.md) - Security
  Assurance Requirements for Linux Application Container Deployments
- [NIST Information Technology Laboratory (ITL) Bulletin October
  2017](nist/itl_october2017.md) - NIST Guidance on Application Container
  Security
@z

@x
**Benchmarks:**
@y
**Benchmarks:**
@z

@x
- [CIS Docker EE Benchmark (In Development)](cis/docker_ee.md)
- [CIS Docker CE Benchmark](cis/docker_ce.md)
- [CIS Kubernetes Benchmark](cis/k8s.md)
@y
- [CIS Docker EE Benchmark (In Development)](cis/docker_ee.md)
- [CIS Docker CE Benchmark](cis/docker_ce.md)
- [CIS Kubernetes Benchmark](cis/k8s.md)
@z

@x
Docker maintains an [open source
repository](https://github.com/docker/compliance) where you can find a number of
machine-readable compliance resources in addition to the source of this
documentation. This repository also includes tools for automatically generating
security documentation and auditing Docker Enterprise Edition systems against
the security controls. An experimental natural language processing (NLP) utility
is also included, for proofreading security narratives.
@y
Docker maintains an [open source
repository](https://github.com/docker/compliance) where you can find a number of
machine-readable compliance resources in addition to the source of this
documentation. This repository also includes tools for automatically generating
security documentation and auditing Docker Enterprise Edition systems against
the security controls. An experimental natural language processing (NLP) utility
is also included, for proofreading security narratives.
@z

@x
The guidance referenced here and at
[https://github.com/docker/compliance](https://github.com/docker/compliance) is
provided for informational purposes only and has not been vetted by any
third-party security assessors. You are solely responsible for developing,
implementing, and managing your applications and subscriptions running on your
own platform in compliance with applicable laws, regulations, and contractual
obligations. The documentation is provided "as-is" and without any warranty of
any kind, whether express, implied or statutory, and Docker, Inc. expressly
disclaims all warranties for non-infringement, merchantability or fitness for a
particular purpose.
@y
The guidance referenced here and at
[https://github.com/docker/compliance](https://github.com/docker/compliance) is
provided for informational purposes only and has not been vetted by any
third-party security assessors. You are solely responsible for developing,
implementing, and managing your applications and subscriptions running on your
own platform in compliance with applicable laws, regulations, and contractual
obligations. The documentation is provided "as-is" and without any warranty of
any kind, whether express, implied or statutory, and Docker, Inc. expressly
disclaims all warranties for non-infringement, merchantability or fitness for a
particular purpose.
@z
