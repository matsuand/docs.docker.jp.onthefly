%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Docker Enterprise Edition and FIPS 140-2
keywords: standards, compliance, security
title: FIPS 140-2
---
@y
---
description: Docker Enterprise Edition and FIPS 140-2
keywords: standards, compliance, security
title: FIPS 140-2
---
@z

@x
Federal Information Processing Standard (FIPS) 140-2 is a standard defined by the U.S. Government that defines the security requirements for cryptographic modules. The standard is published and maintained by the National Institute of Standards and Technology (NIST) and is mandated by the White House Office of Management and Budget (OMB) in [Circular A-130](https://www.whitehouse.gov/sites/whitehouse.gov/files/omb/circulars/A130/a130revised.pdf) and pursuant to FISMA (44 U.S.C Chapter 35). NIST operates the [Cryptographic Module Validation Program (CMVP)](https://csrc.nist.gov/Projects/Cryptographic-Module-Validation-Program) which validates cryptographic modules per the requirements defined by the standard. All Federal information systems that transmit and store sensitive information must utilize FIPS 140-2 validated cryptography.
@y
Federal Information Processing Standard (FIPS) 140-2 is a standard defined by the U.S. Government that defines the security requirements for cryptographic modules. The standard is published and maintained by the National Institute of Standards and Technology (NIST) and is mandated by the White House Office of Management and Budget (OMB) in [Circular A-130](https://www.whitehouse.gov/sites/whitehouse.gov/files/omb/circulars/A130/a130revised.pdf) and pursuant to FISMA (44 U.S.C Chapter 35). NIST operates the [Cryptographic Module Validation Program (CMVP)](https://csrc.nist.gov/Projects/Cryptographic-Module-Validation-Program) which validates cryptographic modules per the requirements defined by the standard. All Federal information systems that transmit and store sensitive information must utilize FIPS 140-2 validated cryptography.
@z

@x
As of October 2018, Docker's own cryptographic module has been validated by NIST ([Certificate #3304](https://csrc.nist.gov/Projects/Cryptographic-Module-Validation-Program/Certificate/3304)). This module is only included with Docker Engine - Enterprise and supports the following cryptographic security functions in the Engine:
@y
As of October 2018, Docker's own cryptographic module has been validated by NIST ([Certificate #3304](https://csrc.nist.gov/Projects/Cryptographic-Module-Validation-Program/Certificate/3304)). This module is only included with Docker Engine - Enterprise and supports the following cryptographic security functions in the Engine:
@z

@x
- ID hashes
- Swarm Mode distributed state store and Raft log (securely stores Docker Secrets and Docker - Configs)
- Swarm Mode overlay networks (control plane only)
- Swarm Mode mutual TLS implementation
- Docker daemon socket TLS binding
@y
- ID hashes
- Swarm Mode distributed state store and Raft log (securely stores Docker Secrets and Docker - Configs)
- Swarm Mode overlay networks (control plane only)
- Swarm Mode mutual TLS implementation
- Docker daemon socket TLS binding
@z

@x
The FIPS Mode of operation can be enabled on the Engine to activate the module. Instructions for doing so on Red Hat Enterprise Linux can be found [here](https://docs.docker.com/install/linux/docker-ee/rhel/#fips-140-2-cryptographic-module-support) and on Windows Server [here](https://docs.docker.com/install/windows/docker-ee/#fips-140-2-cryptographic-module-support).
@y
The FIPS Mode of operation can be enabled on the Engine to activate the module. Instructions for doing so on Red Hat Enterprise Linux can be found [here](https://docs.docker.com/install/linux/docker-ee/rhel/#fips-140-2-cryptographic-module-support) and on Windows Server [here](https://docs.docker.com/install/windows/docker-ee/#fips-140-2-cryptographic-module-support).
@z

@x
Refer to our [blog post](https://blog.docker.com/2018/10/docker-achieves-fips-140-2-validation/) and [press release](https://www.docker.com/docker-news-and-press/docker-awarded-fips-140-2-validation-nist) on the announcement for more information.
@y
Refer to our [blog post](https://blog.docker.com/2018/10/docker-achieves-fips-140-2-validation/) and [press release](https://www.docker.com/docker-news-and-press/docker-awarded-fips-140-2-validation-nist) on the announcement for more information.
@z
