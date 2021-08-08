%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Deploying a Registry in an insecure fashion
keywords: registry, on-prem, images, tags, repository, distribution, insecure
title: Test an insecure registry
---
@y
---
description: Deploying a Registry in an insecure fashion
keywords: registry, on-prem, images, tags, repository, distribution, insecure
title: Test an insecure registry
---
@z

@x
{% include registry.md %}
@y
{% include registry.md %}
@z

@x
While it's highly recommended to secure your registry using a TLS certificate
issued by a known CA, you can choose to use self-signed certificates, or use
your registry over an unencrypted HTTP connection. Either of these choices
involves security trade-offs and additional configuration steps.
@y
While it's highly recommended to secure your registry using a TLS certificate
issued by a known CA, you can choose to use self-signed certificates, or use
your registry over an unencrypted HTTP connection. Either of these choices
involves security trade-offs and additional configuration steps.
@z

@x
## Deploy a plain HTTP registry
@y
## Deploy a plain HTTP registry
@z

@x
> **Warning**:
> It's not possible to use an insecure registry with basic authentication.
{:.warning}
@y
> **Warning**:
> It's not possible to use an insecure registry with basic authentication.
{:.warning}
@z

@x
This procedure configures Docker to entirely disregard security for your
registry. This is **very** insecure and is not recommended. It exposes your
registry to trivial man-in-the-middle (MITM) attacks. Only use this solution for
isolated testing or in a tightly controlled, air-gapped environment.
@y
This procedure configures Docker to entirely disregard security for your
registry. This is **very** insecure and is not recommended. It exposes your
registry to trivial man-in-the-middle (MITM) attacks. Only use this solution for
isolated testing or in a tightly controlled, air-gapped environment.
@z

@x
1.  Edit the `daemon.json` file, whose default location is
    `/etc/docker/daemon.json` on Linux or
    `C:\ProgramData\docker\config\daemon.json` on Windows Server. If you use
    Docker Desktop for Mac or Docker Desktop for Windows, click the Docker icon, choose
    **Preferences** (Mac) or **Settings** (Windows), and choose **Docker Engine**.
@y
1.  Edit the `daemon.json` file, whose default location is
    `/etc/docker/daemon.json` on Linux or
    `C:\ProgramData\docker\config\daemon.json` on Windows Server. If you use
    Docker Desktop for Mac or Docker Desktop for Windows, click the Docker icon, choose
    **Preferences** (Mac) or **Settings** (Windows), and choose **Docker Engine**.
@z

@x
    If the `daemon.json` file does not exist, create it. Assuming there are no
    other settings in the file, it should have the following contents:
@y
    If the `daemon.json` file does not exist, create it. Assuming there are no
    other settings in the file, it should have the following contents:
@z

@x
    ```json
    {
      "insecure-registries" : ["myregistrydomain.com:5000"]
    }
    ```
@y
    ```json
    {
      "insecure-registries" : ["myregistrydomain.com:5000"]
    }
    ```
@z

@x
    Substitute the address of your insecure registry for the one in the example.
@y
    Substitute the address of your insecure registry for the one in the example.
@z

@x
    With insecure registries enabled, Docker goes through the following steps:
@y
    With insecure registries enabled, Docker goes through the following steps:
@z

@x
    - First, try using HTTPS.
      - If HTTPS is available but the certificate is invalid, ignore the error
        about the certificate.
      - If HTTPS is not available, fall back to HTTP.
@y
    - First, try using HTTPS.
      - If HTTPS is available but the certificate is invalid, ignore the error
        about the certificate.
      - If HTTPS is not available, fall back to HTTP.
@z

@x
2. Restart Docker for the changes to take effect.
@y
2. Restart Docker for the changes to take effect.
@z

@x
Repeat these steps on every Engine host that wants to access your registry.
@y
Repeat these steps on every Engine host that wants to access your registry.
@z

@x
## Use self-signed certificates
@y
## Use self-signed certificates
@z

@x
> **Warning**:
> Using this along with basic authentication requires to **also** trust the certificate into the OS cert store for some versions of docker (see below)
{:.warning}
@y
> **Warning**:
> Using this along with basic authentication requires to **also** trust the certificate into the OS cert store for some versions of docker (see below)
{:.warning}
@z

@x
This is more secure than the insecure registry solution.
@y
This is more secure than the insecure registry solution.
@z

@x
1.  Generate your own certificate:
@y
1.  Generate your own certificate:
@z

@x
    ```console
    $ mkdir -p certs
@y
    ```console
    $ mkdir -p certs
@z

@x
    $ openssl req \
      -newkey rsa:4096 -nodes -sha256 -keyout certs/domain.key \
      -addext "subjectAltName = DNS:myregistry.domain.com" \
      -x509 -days 365 -out certs/domain.crt
    ```
@y
    $ openssl req \
      -newkey rsa:4096 -nodes -sha256 -keyout certs/domain.key \
      -addext "subjectAltName = DNS:myregistry.domain.com" \
      -x509 -days 365 -out certs/domain.crt
    ```
@z

@x
    Be sure to use the name `myregistrydomain.com` as a CN.
@y
    Be sure to use the name `myregistrydomain.com` as a CN.
@z

@x
2.  Use the result to [start your registry with TLS enabled](./deploying.md#get-a-certificate).
@y
2.  Use the result to [start your registry with TLS enabled](./deploying.md#get-a-certificate).
@z

@x
3.  Instruct every Docker daemon to trust that certificate. The way to do this
    depends on your OS.
@y
3.  Instruct every Docker daemon to trust that certificate. The way to do this
    depends on your OS.
@z

@x
    - **Linux**: Copy the `domain.crt` file to
      `/etc/docker/certs.d/myregistrydomain.com:5000/ca.crt` on every Docker
      host. You do not need to restart Docker.
@y
    - **Linux**: Copy the `domain.crt` file to
      `/etc/docker/certs.d/myregistrydomain.com:5000/ca.crt` on every Docker
      host. You do not need to restart Docker.
@z

@x
    - **Windows Server**:
@y
    - **Windows Server**:
@z

@x
      1.  Open Windows Explorer, right-click the `domain.crt`
          file, and choose Install certificate. When prompted, select the following
          options:
@y
      1.  Open Windows Explorer, right-click the `domain.crt`
          file, and choose Install certificate. When prompted, select the following
          options:
@z

@x
          | Store location                                | local machine |
          | Place all certificates in the following store | selected      |
@y
          | Store location                                | local machine |
          | Place all certificates in the following store | selected      |
@z

@x
      2.  Click **Browser** and select **Trusted Root Certificate Authorities**.
@y
      2.  Click **Browser** and select **Trusted Root Certificate Authorities**.
@z

@x
      3.  Click **Finish**. Restart Docker.
@y
      3.  Click **Finish**. Restart Docker.
@z

@x
    - **Docker Desktop for Mac**: Follow the instructions in
      [Adding custom CA certificates](../docker-for-mac/index.md#add-tls-certificates){: target="_blank" rel="noopener" class="_"}.
      Restart Docker.
@y
    - **Docker Desktop for Mac**: Follow the instructions in
      [Adding custom CA certificates](../docker-for-mac/index.md#add-tls-certificates){: target="_blank" rel="noopener" class="_"}.
      Restart Docker.
@z

@x
    - **Docker Desktop for Windows**: Follow the instructions in
      [Adding custom CA certificates](../docker-for-windows/index.md#adding-tls-certificates){: target="_blank" rel="noopener" class="_"}.
      Restart Docker.
@y
    - **Docker Desktop for Windows**: Follow the instructions in
      [Adding custom CA certificates](../docker-for-windows/index.md#adding-tls-certificates){: target="_blank" rel="noopener" class="_"}.
      Restart Docker.
@z

@x
## Troubleshoot insecure registry
@y
## Troubleshoot insecure registry
@z

@x
This section lists some common failures and how to recover from them.
@y
This section lists some common failures and how to recover from them.
@z

@x
### Failing...
@y
### Failing...
@z

@x
Failing to configure the Engine daemon and trying to pull from a registry that is not using
TLS results in the following message:
@y
Failing to configure the Engine daemon and trying to pull from a registry that is not using
TLS results in the following message:
@z

@x
```none
FATA[0000] Error response from daemon: v1 ping attempt failed with error:
Get https://myregistrydomain.com:5000/v1/_ping: tls: oversized record received with length 20527.
If this private registry supports only HTTP or HTTPS with an unknown CA certificate, add
`--insecure-registry myregistrydomain.com:5000` to the daemon's arguments.
In the case of HTTPS, if you have access to the registry's CA certificate, no need for the flag;
simply place the CA certificate at /etc/docker/certs.d/myregistrydomain.com:5000/ca.crt
```
@y
```none
FATA[0000] Error response from daemon: v1 ping attempt failed with error:
Get https://myregistrydomain.com:5000/v1/_ping: tls: oversized record received with length 20527.
If this private registry supports only HTTP or HTTPS with an unknown CA certificate, add
`--insecure-registry myregistrydomain.com:5000` to the daemon's arguments.
In the case of HTTPS, if you have access to the registry's CA certificate, no need for the flag;
simply place the CA certificate at /etc/docker/certs.d/myregistrydomain.com:5000/ca.crt
```
@z

@x
### Docker still complains about the certificate when using authentication?
@y
### Docker still complains about the certificate when using authentication?
@z

@x
When using authentication, some versions of Docker also require you to trust the
certificate at the OS level.
@y
When using authentication, some versions of Docker also require you to trust the
certificate at the OS level.
@z

@x
#### Ubuntu
@y
#### Ubuntu
@z

@x
```console
$ cp certs/domain.crt /usr/local/share/ca-certificates/myregistrydomain.com.crt
update-ca-certificates
```
@y
```console
$ cp certs/domain.crt /usr/local/share/ca-certificates/myregistrydomain.com.crt
update-ca-certificates
```
@z

@x
#### Red Hat Enterprise Linux
@y
#### Red Hat Enterprise Linux
@z

@x
```console
$ cp certs/domain.crt /etc/pki/ca-trust/source/anchors/myregistrydomain.com.crt
update-ca-trust
```
@y
```console
$ cp certs/domain.crt /etc/pki/ca-trust/source/anchors/myregistrydomain.com.crt
update-ca-trust
```
@z

@x
#### Oracle Linux
@y
#### Oracle Linux
@z

@x
```console
$ update-ca-trust enable
```
@y
```console
$ update-ca-trust enable
```
@z

@x
Restart Docker for the changes to take effect.
@y
Restart Docker for the changes to take effect.
@z

@x
### Windows
@y
### Windows
@z

@x
Open Windows Explorer, right-click the certificate, and choose
**Install certificate**.
@y
Open Windows Explorer, right-click the certificate, and choose
**Install certificate**.
@z

@x
Then, select the following options:
@y
Then, select the following options:
@z

@x
* Store location: local machine
* Check **place all certificates in the following store**
* Click **Browser**, and select **Trusted Root Certificate Authorities**
* Click **Finish**
@y
* Store location: local machine
* Check **place all certificates in the following store**
* Click **Browser**, and select **Trusted Root Certificate Authorities**
* Click **Finish**
@z

@x
[Learn more about managing TLS certificates](https://technet.microsoft.com/en-us/library/cc754841(v=ws.11).aspx#BKMK_addlocal).
@y
[Learn more about managing TLS certificates](https://technet.microsoft.com/en-us/library/cc754841(v=ws.11).aspx#BKMK_addlocal).
@z

@x
After adding the CA certificate to Windows, restart Docker Desktop for Windows.
@y
After adding the CA certificate to Windows, restart Docker Desktop for Windows.
@z
