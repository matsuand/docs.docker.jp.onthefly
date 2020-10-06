%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: "Configuring a registry"
description: "Explains how to configure a registry"
keywords: registry, on-prem, images, tags, repository, distribution, configuration
---
@y
---
title: "Registry の設定"
description: "Explains how to configure a registry"
keywords: registry, on-prem, images, tags, repository, distribution, configuration
---
@z

@x
The Registry configuration is based on a YAML file, detailed below. While it
comes with sane default values out of the box, you should review it exhaustively
before moving your systems to production.
@y
{% comment %}
{% endcomment %}
The Registry configuration is based on a YAML file, detailed below. While it
comes with sane default values out of the box, you should review it exhaustively
before moving your systems to production.
@z

@x
## Override specific configuration options
@y
{% comment %}
{% endcomment %}
## Override specific configuration options
@z

@x
In a typical setup where you run your Registry from the official image, you can
specify a configuration variable from the environment by passing `-e` arguments
to your `docker run` stanza or from within a Dockerfile using the `ENV`
instruction.
@y
{% comment %}
{% endcomment %}
In a typical setup where you run your Registry from the official image, you can
specify a configuration variable from the environment by passing `-e` arguments
to your `docker run` stanza or from within a Dockerfile using the `ENV`
instruction.
@z

@x
To override a configuration option, create an environment variable named
`REGISTRY_variable` where `variable` is the name of the configuration option
and the `_` (underscore) represents indention levels. For example, you can
configure the `rootdirectory` of the `filesystem` storage backend:
@y
{% comment %}
{% endcomment %}
To override a configuration option, create an environment variable named
`REGISTRY_variable` where `variable` is the name of the configuration option
and the `_` (underscore) represents indention levels. For example, you can
configure the `rootdirectory` of the `filesystem` storage backend:
@z

@x
```none
storage:
  filesystem:
    rootdirectory: /var/lib/registry
```
@y
```none
storage:
  filesystem:
    rootdirectory: /var/lib/registry
```
@z

@x
To override this value, set an environment variable like this:
@y
{% comment %}
{% endcomment %}
To override this value, set an environment variable like this:
@z

@x
```none
REGISTRY_STORAGE_FILESYSTEM_ROOTDIRECTORY=/somewhere
```
@y
```none
REGISTRY_STORAGE_FILESYSTEM_ROOTDIRECTORY=/somewhere
```
@z

@x
This variable overrides the `/var/lib/registry` value to the `/somewhere`
directory.
@y
{% comment %}
{% endcomment %}
This variable overrides the `/var/lib/registry` value to the `/somewhere`
directory.
@z

@x
> **Note**: Create a base configuration file with environment variables that can
> be configured to tweak individual values. Overriding configuration sections
> with environment variables is not recommended.
@y
{% comment %}
{% endcomment %}
> **Note**: Create a base configuration file with environment variables that can
> be configured to tweak individual values. Overriding configuration sections
> with environment variables is not recommended.
@z

@x
## Overriding the entire configuration file
@y
{% comment %}
{% endcomment %}
## Overriding the entire configuration file
@z

@x
If the default configuration is not a sound basis for your usage, or if you are
having issues overriding keys from the environment, you can specify an alternate
YAML configuration file by mounting it as a volume in the container.
@y
{% comment %}
{% endcomment %}
If the default configuration is not a sound basis for your usage, or if you are
having issues overriding keys from the environment, you can specify an alternate
YAML configuration file by mounting it as a volume in the container.
@z

@x
Typically, create a new configuration file from scratch,named `config.yml`, then
specify it in the `docker run` command:
@y
{% comment %}
{% endcomment %}
Typically, create a new configuration file from scratch,named `config.yml`, then
specify it in the `docker run` command:
@z

@x
```bash
$ docker run -d -p 5000:5000 --restart=always --name registry \
             -v `pwd`/config.yml:/etc/docker/registry/config.yml \
             registry:2
```
@y
```bash
$ docker run -d -p 5000:5000 --restart=always --name registry \
             -v `pwd`/config.yml:/etc/docker/registry/config.yml \
             registry:2
```
@z

@x
Use this
[example YAML file](https://github.com/docker/distribution/blob/master/cmd/registry/config-example.yml)
as a starting point.
@y
{% comment %}
{% endcomment %}
Use this
[example YAML file](https://github.com/docker/distribution/blob/master/cmd/registry/config-example.yml)
as a starting point.
@z

@x
## List of configuration options
@y
{% comment %}
{% endcomment %}
## List of configuration options
@z

@x
These are all configuration options for the registry. Some options in the list
are mutually exclusive. Read the detailed reference information about each
option before finalizing your configuration.
@y
{% comment %}
{% endcomment %}
These are all configuration options for the registry. Some options in the list
are mutually exclusive. Read the detailed reference information about each
option before finalizing your configuration.
@z

@x
```none
version: 0.1
log:
  accesslog:
    disabled: true
  level: debug
  formatter: text
  fields:
    service: registry
    environment: staging
  hooks:
    - type: mail
      disabled: true
      levels:
        - panic
      options:
        smtp:
          addr: mail.example.com:25
          username: mailuser
          password: password
          insecure: true
        from: sender@example.com
        to:
          - errors@example.com
loglevel: debug # deprecated: use "log"
storage:
  filesystem:
    rootdirectory: /var/lib/registry
    maxthreads: 100
  azure:
    accountname: accountname
    accountkey: base64encodedaccountkey
    container: containername
  gcs:
    bucket: bucketname
    keyfile: /path/to/keyfile
    credentials:
      type: service_account
      project_id: project_id_string
      private_key_id: private_key_id_string
      private_key: private_key_string
      client_email: client@example.com
      client_id: client_id_string
      auth_uri: http://example.com/auth_uri
      token_uri: http://example.com/token_uri
      auth_provider_x509_cert_url: http://example.com/provider_cert_url
      client_x509_cert_url: http://example.com/client_cert_url
    rootdirectory: /gcs/object/name/prefix
    chunksize: 5242880
  s3:
    accesskey: awsaccesskey
    secretkey: awssecretkey
    region: us-west-1
    regionendpoint: http://myobjects.local
    bucket: bucketname
    encrypt: true
    keyid: mykeyid
    secure: true
    v4auth: true
    chunksize: 5242880
    multipartcopychunksize: 33554432
    multipartcopymaxconcurrency: 100
    multipartcopythresholdsize: 33554432
    rootdirectory: /s3/object/name/prefix
  swift:
    username: username
    password: password
    authurl: https://storage.myprovider.com/auth/v1.0 or https://storage.myprovider.com/v2.0 or https://storage.myprovider.com/v3/auth
    tenant: tenantname
    tenantid: tenantid
    domain: domain name for Openstack Identity v3 API
    domainid: domain id for Openstack Identity v3 API
    insecureskipverify: true
    region: fr
    container: containername
    rootdirectory: /swift/object/name/prefix
  oss:
    accesskeyid: accesskeyid
    accesskeysecret: accesskeysecret
    region: OSS region name
    endpoint: optional endpoints
    internal: optional internal endpoint
    bucket: OSS bucket
    encrypt: optional data encryption setting
    secure: optional ssl setting
    chunksize: optional size valye
    rootdirectory: optional root directory
  inmemory:  # This driver takes no parameters
  delete:
    enabled: false
  redirect:
    disable: false
  cache:
    blobdescriptor: redis
  maintenance:
    uploadpurging:
      enabled: true
      age: 168h
      interval: 24h
      dryrun: false
    readonly:
      enabled: false
auth:
  silly:
    realm: silly-realm
    service: silly-service
  token:
    autoredirect: true
    realm: token-realm
    service: token-service
    issuer: registry-token-issuer
    rootcertbundle: /root/certs/bundle
  htpasswd:
    realm: basic-realm
    path: /path/to/htpasswd
middleware:
  registry:
    - name: ARegistryMiddleware
      options:
        foo: bar
  repository:
    - name: ARepositoryMiddleware
      options:
        foo: bar
  storage:
    - name: cloudfront
      options:
        baseurl: https://my.cloudfronted.domain.com/
        privatekey: /path/to/pem
        keypairid: cloudfrontkeypairid
        duration: 3000s
        ipfilteredby: awsregion
        awsregion: us-east-1, use-east-2
        updatefrenquency: 12h
        iprangesurl: https://ip-ranges.amazonaws.com/ip-ranges.json
  storage:
    - name: redirect
      options:
        baseurl: https://example.com/
reporting:
  bugsnag:
    apikey: bugsnagapikey
    releasestage: bugsnagreleasestage
    endpoint: bugsnagendpoint
  newrelic:
    licensekey: newreliclicensekey
    name: newrelicname
    verbose: true
http:
  addr: localhost:5000
  prefix: /my/nested/registry/
  host: https://myregistryaddress.org:5000
  secret: asecretforlocaldevelopment
  relativeurls: false
  draintimeout: 60s
  tls:
    certificate: /path/to/x509/public
    key: /path/to/x509/private
    clientcas:
      - /path/to/ca.pem
      - /path/to/another/ca.pem
    letsencrypt:
      cachefile: /path/to/cache-file
      email: emailused@letsencrypt.com
      hosts: [myregistryaddress.org]
  debug:
    addr: localhost:5001
    prometheus:
      enabled: true
      path: /metrics
  headers:
    X-Content-Type-Options: [nosniff]
  http2:
    disabled: false
notifications:
  events:
    includereferences: true
  endpoints:
    - name: alistener
      disabled: false
      url: https://my.listener.com/event
      headers: <http.Header>
      timeout: 1s
      threshold: 10
      backoff: 1s
      ignoredmediatypes:
        - application/octet-stream
      ignore:
        mediatypes:
           - application/octet-stream
        actions:
           - pull
redis:
  addr: localhost:6379
  password: asecret
  db: 0
  dialtimeout: 10ms
  readtimeout: 10ms
  writetimeout: 10ms
  pool:
    maxidle: 16
    maxactive: 64
    idletimeout: 300s
health:
  storagedriver:
    enabled: true
    interval: 10s
    threshold: 3
  file:
    - file: /path/to/checked/file
      interval: 10s
  http:
    - uri: http://server.to.check/must/return/200
      headers:
        Authorization: [Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ==]
      statuscode: 200
      timeout: 3s
      interval: 10s
      threshold: 3
  tcp:
    - addr: redis-server.domain.com:6379
      timeout: 3s
      interval: 10s
      threshold: 3
proxy:
  remoteurl: https://registry-1.docker.io
  username: [username]
  password: [password]
compatibility:
  schema1:
    signingkeyfile: /etc/registry/key.json
    enabled: true
validation:
  manifests:
    urls:
      allow:
        - ^https?://([^/]+\.)*example\.com/
      deny:
        - ^https?://www\.example\.com/
```
@y
```none
version: 0.1
log:
  accesslog:
    disabled: true
  level: debug
  formatter: text
  fields:
    service: registry
    environment: staging
  hooks:
    - type: mail
      disabled: true
      levels:
        - panic
      options:
        smtp:
          addr: mail.example.com:25
          username: mailuser
          password: password
          insecure: true
        from: sender@example.com
        to:
          - errors@example.com
loglevel: debug # deprecated: use "log"
storage:
  filesystem:
    rootdirectory: /var/lib/registry
    maxthreads: 100
  azure:
    accountname: accountname
    accountkey: base64encodedaccountkey
    container: containername
  gcs:
    bucket: bucketname
    keyfile: /path/to/keyfile
    credentials:
      type: service_account
      project_id: project_id_string
      private_key_id: private_key_id_string
      private_key: private_key_string
      client_email: client@example.com
      client_id: client_id_string
      auth_uri: http://example.com/auth_uri
      token_uri: http://example.com/token_uri
      auth_provider_x509_cert_url: http://example.com/provider_cert_url
      client_x509_cert_url: http://example.com/client_cert_url
    rootdirectory: /gcs/object/name/prefix
    chunksize: 5242880
  s3:
    accesskey: awsaccesskey
    secretkey: awssecretkey
    region: us-west-1
    regionendpoint: http://myobjects.local
    bucket: bucketname
    encrypt: true
    keyid: mykeyid
    secure: true
    v4auth: true
    chunksize: 5242880
    multipartcopychunksize: 33554432
    multipartcopymaxconcurrency: 100
    multipartcopythresholdsize: 33554432
    rootdirectory: /s3/object/name/prefix
  swift:
    username: username
    password: password
    authurl: https://storage.myprovider.com/auth/v1.0 or https://storage.myprovider.com/v2.0 or https://storage.myprovider.com/v3/auth
    tenant: tenantname
    tenantid: tenantid
    domain: domain name for Openstack Identity v3 API
    domainid: domain id for Openstack Identity v3 API
    insecureskipverify: true
    region: fr
    container: containername
    rootdirectory: /swift/object/name/prefix
  oss:
    accesskeyid: accesskeyid
    accesskeysecret: accesskeysecret
    region: OSS region name
    endpoint: optional endpoints
    internal: optional internal endpoint
    bucket: OSS bucket
    encrypt: optional data encryption setting
    secure: optional ssl setting
    chunksize: optional size valye
    rootdirectory: optional root directory
  inmemory:  # This driver takes no parameters
  delete:
    enabled: false
  redirect:
    disable: false
  cache:
    blobdescriptor: redis
  maintenance:
    uploadpurging:
      enabled: true
      age: 168h
      interval: 24h
      dryrun: false
    readonly:
      enabled: false
auth:
  silly:
    realm: silly-realm
    service: silly-service
  token:
    autoredirect: true
    realm: token-realm
    service: token-service
    issuer: registry-token-issuer
    rootcertbundle: /root/certs/bundle
  htpasswd:
    realm: basic-realm
    path: /path/to/htpasswd
middleware:
  registry:
    - name: ARegistryMiddleware
      options:
        foo: bar
  repository:
    - name: ARepositoryMiddleware
      options:
        foo: bar
  storage:
    - name: cloudfront
      options:
        baseurl: https://my.cloudfronted.domain.com/
        privatekey: /path/to/pem
        keypairid: cloudfrontkeypairid
        duration: 3000s
        ipfilteredby: awsregion
        awsregion: us-east-1, use-east-2
        updatefrenquency: 12h
        iprangesurl: https://ip-ranges.amazonaws.com/ip-ranges.json
  storage:
    - name: redirect
      options:
        baseurl: https://example.com/
reporting:
  bugsnag:
    apikey: bugsnagapikey
    releasestage: bugsnagreleasestage
    endpoint: bugsnagendpoint
  newrelic:
    licensekey: newreliclicensekey
    name: newrelicname
    verbose: true
http:
  addr: localhost:5000
  prefix: /my/nested/registry/
  host: https://myregistryaddress.org:5000
  secret: asecretforlocaldevelopment
  relativeurls: false
  draintimeout: 60s
  tls:
    certificate: /path/to/x509/public
    key: /path/to/x509/private
    clientcas:
      - /path/to/ca.pem
      - /path/to/another/ca.pem
    letsencrypt:
      cachefile: /path/to/cache-file
      email: emailused@letsencrypt.com
      hosts: [myregistryaddress.org]
  debug:
    addr: localhost:5001
    prometheus:
      enabled: true
      path: /metrics
  headers:
    X-Content-Type-Options: [nosniff]
  http2:
    disabled: false
notifications:
  events:
    includereferences: true
  endpoints:
    - name: alistener
      disabled: false
      url: https://my.listener.com/event
      headers: <http.Header>
      timeout: 1s
      threshold: 10
      backoff: 1s
      ignoredmediatypes:
        - application/octet-stream
      ignore:
        mediatypes:
           - application/octet-stream
        actions:
           - pull
redis:
  addr: localhost:6379
  password: asecret
  db: 0
  dialtimeout: 10ms
  readtimeout: 10ms
  writetimeout: 10ms
  pool:
    maxidle: 16
    maxactive: 64
    idletimeout: 300s
health:
  storagedriver:
    enabled: true
    interval: 10s
    threshold: 3
  file:
    - file: /path/to/checked/file
      interval: 10s
  http:
    - uri: http://server.to.check/must/return/200
      headers:
        Authorization: [Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ==]
      statuscode: 200
      timeout: 3s
      interval: 10s
      threshold: 3
  tcp:
    - addr: redis-server.domain.com:6379
      timeout: 3s
      interval: 10s
      threshold: 3
proxy:
  remoteurl: https://registry-1.docker.io
  username: [username]
  password: [password]
compatibility:
  schema1:
    signingkeyfile: /etc/registry/key.json
    enabled: true
validation:
  manifests:
    urls:
      allow:
        - ^https?://([^/]+\.)*example\.com/
      deny:
        - ^https?://www\.example\.com/
```
@z

@x
In some instances a configuration option is **optional** but it contains child
options marked as **required**. In these cases, you can omit the parent with
all its children. However, if the parent is included, you must also include all
the children marked **required**.
@y
{% comment %}
{% endcomment %}
In some instances a configuration option is **optional** but it contains child
options marked as **required**. In these cases, you can omit the parent with
all its children. However, if the parent is included, you must also include all
the children marked **required**.
@z

@x
## `version`
@y
{% comment %}
{% endcomment %}
## `version`
@z

@x
```none
version: 0.1
```
@y
```none
version: 0.1
```
@z

@x
The `version` option is **required**. It specifies the configuration's version.
It is expected to remain a top-level field, to allow for a consistent version
check before parsing the remainder of the configuration file.
@y
{% comment %}
{% endcomment %}
The `version` option is **required**. It specifies the configuration's version.
It is expected to remain a top-level field, to allow for a consistent version
check before parsing the remainder of the configuration file.
@z

@x
## `log`
@y
{% comment %}
{% endcomment %}
## `log`
@z

@x
The `log` subsection configures the behavior of the logging system. The logging
system outputs everything to stdout. You can adjust the granularity and format
with this configuration section.
@y
{% comment %}
{% endcomment %}
The `log` subsection configures the behavior of the logging system. The logging
system outputs everything to stdout. You can adjust the granularity and format
with this configuration section.
@z

@x
```none
log:
  accesslog:
    disabled: true
  level: debug
  formatter: text
  fields:
    service: registry
    environment: staging
```
@y
```none
log:
  accesslog:
    disabled: true
  level: debug
  formatter: text
  fields:
    service: registry
    environment: staging
```
@z

@x
| Parameter   | Required | Description |
|-------------|----------|-------------|
| `level`     | no       | Sets the sensitivity of logging output. Permitted values are `error`, `warn`, `info`, and `debug`. The default is `info`. |
| `formatter` | no       | This selects the format of logging output. The format primarily affects how keyed attributes for a log line are encoded. Options are `text`, `json`, and `logstash`. The default is `text`. |
| `fields`    | no       | A map of field names to values. These are added to every log line for the context. This is useful for identifying log messages source after being mixed in other systems. |
@y
{% comment %}
{% endcomment %}
| Parameter   | Required | Description |
|-------------|----------|-------------|
| `level`     | no       | Sets the sensitivity of logging output. Permitted values are `error`, `warn`, `info`, and `debug`. The default is `info`. |
| `formatter` | no       | This selects the format of logging output. The format primarily affects how keyed attributes for a log line are encoded. Options are `text`, `json`, and `logstash`. The default is `text`. |
| `fields`    | no       | A map of field names to values. These are added to every log line for the context. This is useful for identifying log messages source after being mixed in other systems. |
@z

@x
### `accesslog`
@y
{% comment %}
{% endcomment %}
### `accesslog`
@z

@x
```none
accesslog:
  disabled: true
```
@y
```none
accesslog:
  disabled: true
```
@z

@x
Within `log`, `accesslog` configures the behavior of the access logging
system. By default, the access logging system outputs to stdout in
[Combined Log Format](https://httpd.apache.org/docs/2.4/logs.html#combined).
Access logging can be disabled by setting the boolean flag `disabled` to `true`.
@y
{% comment %}
{% endcomment %}
Within `log`, `accesslog` configures the behavior of the access logging
system. By default, the access logging system outputs to stdout in
[Combined Log Format](https://httpd.apache.org/docs/2.4/logs.html#combined).
Access logging can be disabled by setting the boolean flag `disabled` to `true`.
@z

@x
## `hooks`
@y
{% comment %}
{% endcomment %}
## `hooks`
@z

@x
```none
hooks:
  - type: mail
    levels:
      - panic
    options:
      smtp:
        addr: smtp.sendhost.com:25
        username: sendername
        password: password
        insecure: true
      from: name@sendhost.com
      to:
        - name@receivehost.com
```
@y
```none
hooks:
  - type: mail
    levels:
      - panic
    options:
      smtp:
        addr: smtp.sendhost.com:25
        username: sendername
        password: password
        insecure: true
      from: name@sendhost.com
      to:
        - name@receivehost.com
```
@z

@x
The `hooks` subsection configures the logging hooks' behavior. This subsection
includes a sequence handler which you can use for sending mail, for example.
Refer to `loglevel` to configure the level of messages printed.
@y
{% comment %}
{% endcomment %}
The `hooks` subsection configures the logging hooks' behavior. This subsection
includes a sequence handler which you can use for sending mail, for example.
Refer to `loglevel` to configure the level of messages printed.
@z

@x
## `loglevel`
@y
{% comment %}
{% endcomment %}
## `loglevel`
@z

@x
> **DEPRECATED:** Please use [log](#log) instead.
@y
{% comment %}
{% endcomment %}
> **DEPRECATED:** Please use [log](#log) instead.
@z

@x
```none
loglevel: debug
```
@y
```none
loglevel: debug
```
@z

@x
Permitted values are `error`, `warn`, `info` and `debug`. The default is
`info`.
@y
{% comment %}
{% endcomment %}
Permitted values are `error`, `warn`, `info` and `debug`. The default is
`info`.
@z

@x
## `storage`
@y
{% comment %}
{% endcomment %}
## `storage`
@z

@x
```none
storage:
  filesystem:
    rootdirectory: /var/lib/registry
  azure:
    accountname: accountname
    accountkey: base64encodedaccountkey
    container: containername
  gcs:
    bucket: bucketname
    keyfile: /path/to/keyfile
    credentials:
      type: service_account
      project_id: project_id_string
      private_key_id: private_key_id_string
      private_key: private_key_string
      client_email: client@example.com
      client_id: client_id_string
      auth_uri: http://example.com/auth_uri
      token_uri: http://example.com/token_uri
      auth_provider_x509_cert_url: http://example.com/provider_cert_url
      client_x509_cert_url: http://example.com/client_cert_url
    rootdirectory: /gcs/object/name/prefix
  s3:
    accesskey: awsaccesskey
    secretkey: awssecretkey
    region: us-west-1
    regionendpoint: http://myobjects.local
    bucket: bucketname
    encrypt: true
    keyid: mykeyid
    secure: true
    v4auth: true
    chunksize: 5242880
    multipartcopychunksize: 33554432
    multipartcopymaxconcurrency: 100
    multipartcopythresholdsize: 33554432
    rootdirectory: /s3/object/name/prefix
  swift:
    username: username
    password: password
    authurl: https://storage.myprovider.com/auth/v1.0 or https://storage.myprovider.com/v2.0 or https://storage.myprovider.com/v3/auth
    tenant: tenantname
    tenantid: tenantid
    domain: domain name for Openstack Identity v3 API
    domainid: domain id for Openstack Identity v3 API
    insecureskipverify: true
    region: fr
    container: containername
    rootdirectory: /swift/object/name/prefix
  oss:
    accesskeyid: accesskeyid
    accesskeysecret: accesskeysecret
    region: OSS region name
    endpoint: optional endpoints
    internal: optional internal endpoint
    bucket: OSS bucket
    encrypt: optional data encryption setting
    secure: optional ssl setting
    chunksize: optional size valye
    rootdirectory: optional root directory
  inmemory:
  delete:
    enabled: false
  cache:
    blobdescriptor: inmemory
  maintenance:
    uploadpurging:
      enabled: true
      age: 168h
      interval: 24h
      dryrun: false
    readonly:
      enabled: false
  redirect:
    disable: false
```
@y
```none
storage:
  filesystem:
    rootdirectory: /var/lib/registry
  azure:
    accountname: accountname
    accountkey: base64encodedaccountkey
    container: containername
  gcs:
    bucket: bucketname
    keyfile: /path/to/keyfile
    credentials:
      type: service_account
      project_id: project_id_string
      private_key_id: private_key_id_string
      private_key: private_key_string
      client_email: client@example.com
      client_id: client_id_string
      auth_uri: http://example.com/auth_uri
      token_uri: http://example.com/token_uri
      auth_provider_x509_cert_url: http://example.com/provider_cert_url
      client_x509_cert_url: http://example.com/client_cert_url
    rootdirectory: /gcs/object/name/prefix
  s3:
    accesskey: awsaccesskey
    secretkey: awssecretkey
    region: us-west-1
    regionendpoint: http://myobjects.local
    bucket: bucketname
    encrypt: true
    keyid: mykeyid
    secure: true
    v4auth: true
    chunksize: 5242880
    multipartcopychunksize: 33554432
    multipartcopymaxconcurrency: 100
    multipartcopythresholdsize: 33554432
    rootdirectory: /s3/object/name/prefix
  swift:
    username: username
    password: password
    authurl: https://storage.myprovider.com/auth/v1.0 or https://storage.myprovider.com/v2.0 or https://storage.myprovider.com/v3/auth
    tenant: tenantname
    tenantid: tenantid
    domain: domain name for Openstack Identity v3 API
    domainid: domain id for Openstack Identity v3 API
    insecureskipverify: true
    region: fr
    container: containername
    rootdirectory: /swift/object/name/prefix
  oss:
    accesskeyid: accesskeyid
    accesskeysecret: accesskeysecret
    region: OSS region name
    endpoint: optional endpoints
    internal: optional internal endpoint
    bucket: OSS bucket
    encrypt: optional data encryption setting
    secure: optional ssl setting
    chunksize: optional size valye
    rootdirectory: optional root directory
  inmemory:
  delete:
    enabled: false
  cache:
    blobdescriptor: inmemory
  maintenance:
    uploadpurging:
      enabled: true
      age: 168h
      interval: 24h
      dryrun: false
    readonly:
      enabled: false
  redirect:
    disable: false
```
@z

@x
The `storage` option is **required** and defines which storage backend is in
use. You must configure exactly one backend. If you configure more, the registry
returns an error. You can choose any of these backend storage drivers:
@y
{% comment %}
{% endcomment %}
The `storage` option is **required** and defines which storage backend is in
use. You must configure exactly one backend. If you configure more, the registry
returns an error. You can choose any of these backend storage drivers:
@z

@x
| Storage driver      | Description                                                                                                                                                                                                                                                                              |
|---------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `filesystem`        | Uses the local disk to store registry files. It is ideal for development and may be appropriate for some small-scale production applications. See the [driver's reference documentation](https://github.com/docker/docker.github.io/tree/master/registry/storage-drivers/filesystem.md). |
| `azure`             | Uses Microsoft Azure Blob Storage. See the [driver's reference documentation](https://github.com/docker/docker.github.io/tree/master/registry/storage-drivers/azure.md).                                                                                                               |
| `gcs`               | Uses Google Cloud Storage. See the [driver's reference documentation](https://github.com/docker/docker.github.io/tree/master/registry/storage-drivers/gcs.md).                                                                                                                           |
| `s3`                | Uses Amazon Simple Storage Service (S3) and compatible Storage Services. See the [driver's reference documentation](https://github.com/docker/docker.github.io/tree/master/registry/storage-drivers/s3.md).                                                                            |
| `swift`             | Uses Openstack Swift object storage. See the [driver's reference documentation](https://github.com/docker/docker.github.io/tree/master/registry/storage-drivers/swift.md).                                                                                                               |
| `oss`               | Uses Aliyun OSS for object storage. See the [driver's reference documentation](https://github.com/docker/docker.github.io/tree/master/registry/storage-drivers/oss.md).                                                                                                                  |
@y
{% comment %}
{% endcomment %}
| Storage driver      | Description                                                                                                                                                                                                                                                                              |
|---------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `filesystem`        | Uses the local disk to store registry files. It is ideal for development and may be appropriate for some small-scale production applications. See the [driver's reference documentation](https://github.com/docker/docker.github.io/tree/master/registry/storage-drivers/filesystem.md). |
| `azure`             | Uses Microsoft Azure Blob Storage. See the [driver's reference documentation](https://github.com/docker/docker.github.io/tree/master/registry/storage-drivers/azure.md).                                                                                                               |
| `gcs`               | Uses Google Cloud Storage. See the [driver's reference documentation](https://github.com/docker/docker.github.io/tree/master/registry/storage-drivers/gcs.md).                                                                                                                           |
| `s3`                | Uses Amazon Simple Storage Service (S3) and compatible Storage Services. See the [driver's reference documentation](https://github.com/docker/docker.github.io/tree/master/registry/storage-drivers/s3.md).                                                                            |
| `swift`             | Uses Openstack Swift object storage. See the [driver's reference documentation](https://github.com/docker/docker.github.io/tree/master/registry/storage-drivers/swift.md).                                                                                                               |
| `oss`               | Uses Aliyun OSS for object storage. See the [driver's reference documentation](https://github.com/docker/docker.github.io/tree/master/registry/storage-drivers/oss.md).                                                                                                                  |
@z

@x
For testing only, you can use the [`inmemory` storage
driver](https://github.com/docker/docker.github.io/tree/master/registry/storage-drivers/inmemory.md).
If you would like to run a registry from volatile memory, use the
[`filesystem` driver](https://github.com/docker/docker.github.io/tree/master/registry/storage-drivers/filesystem.md)
on a ramdisk.
@y
{% comment %}
{% endcomment %}
For testing only, you can use the [`inmemory` storage
driver](https://github.com/docker/docker.github.io/tree/master/registry/storage-drivers/inmemory.md).
If you would like to run a registry from volatile memory, use the
[`filesystem` driver](https://github.com/docker/docker.github.io/tree/master/registry/storage-drivers/filesystem.md)
on a ramdisk.
@z

@x
If you are deploying a registry on Windows, a Windows volume mounted from the
host is not recommended. Instead, you can use a S3 or Azure backing
data-store. If you do use a Windows volume, the length of the `PATH` to
the mount point must be within the `MAX_PATH` limits (typically 255 characters),
or this error will occur:
@y
{% comment %}
{% endcomment %}
If you are deploying a registry on Windows, a Windows volume mounted from the
host is not recommended. Instead, you can use a S3 or Azure backing
data-store. If you do use a Windows volume, the length of the `PATH` to
the mount point must be within the `MAX_PATH` limits (typically 255 characters),
or this error will occur:
@z

@x
```none
mkdir /XXX protocol error and your registry will not function properly.
```
@y
```none
mkdir /XXX protocol error and your registry will not function properly.
```
@z

@x
### `maintenance`
@y
{% comment %}
{% endcomment %}
### `maintenance`
@z

@x
Currently, upload purging and read-only mode are the only `maintenance`
functions available.
@y
{% comment %}
{% endcomment %}
Currently, upload purging and read-only mode are the only `maintenance`
functions available.
@z

@x
### `uploadpurging`
@y
{% comment %}
{% endcomment %}
### `uploadpurging`
@z

@x
Upload purging is a background process that periodically removes orphaned files
from the upload directories of the registry. Upload purging is enabled by
default. To configure upload directory purging, the following parameters must
be set.
@y
{% comment %}
{% endcomment %}
Upload purging is a background process that periodically removes orphaned files
from the upload directories of the registry. Upload purging is enabled by
default. To configure upload directory purging, the following parameters must
be set.
@z

@x
| Parameter  | Required | Description                                                                                        |
|------------|----------|----------------------------------------------------------------------------------------------------|
| `enabled`  | yes      | Set to `true` to enable upload purging. Defaults to `true`.                                        |
| `age`      | yes      | Upload directories which are older than this age will be deleted.Defaults to `168h` (1 week).      |
| `interval` | yes      | The interval between upload directory purging. Defaults to `24h`.                                  |
| `dryrun`   | yes      | Set `dryrun` to `true` to obtain a summary of what directories will be deleted. Defaults to `false`.|
@y
{% comment %}
{% endcomment %}
| Parameter  | Required | Description                                                                                        |
|------------|----------|----------------------------------------------------------------------------------------------------|
| `enabled`  | yes      | Set to `true` to enable upload purging. Defaults to `true`.                                        |
| `age`      | yes      | Upload directories which are older than this age will be deleted.Defaults to `168h` (1 week).      |
| `interval` | yes      | The interval between upload directory purging. Defaults to `24h`.                                  |
| `dryrun`   | yes      | Set `dryrun` to `true` to obtain a summary of what directories will be deleted. Defaults to `false`.|
@z

@x
> **Note**: `age` and `interval` are strings containing a number with optional
fraction and a unit suffix. Some examples: `45m`, `2h10m`, `168h`.
@y
{% comment %}
{% endcomment %}
> **Note**: `age` and `interval` are strings containing a number with optional
fraction and a unit suffix. Some examples: `45m`, `2h10m`, `168h`.
@z

@x
### `readonly`
@y
{% comment %}
{% endcomment %}
### `readonly`
@z

@x
If the `readonly` section under `maintenance` has `enabled` set to `true`,
clients will not be allowed to write to the registry. This mode is useful to
temporarily prevent writes to the backend storage so a garbage collection pass
can be run.  Before running garbage collection, the registry should be
restarted with readonly's `enabled` set to true. After the garbage collection
pass finishes, the registry may be restarted again, this time with `readonly`
removed from the configuration (or set to false).
@y
{% comment %}
{% endcomment %}
If the `readonly` section under `maintenance` has `enabled` set to `true`,
clients will not be allowed to write to the registry. This mode is useful to
temporarily prevent writes to the backend storage so a garbage collection pass
can be run.  Before running garbage collection, the registry should be
restarted with readonly's `enabled` set to true. After the garbage collection
pass finishes, the registry may be restarted again, this time with `readonly`
removed from the configuration (or set to false).
@z

@x
### `delete`
@y
{% comment %}
{% endcomment %}
### `delete`
@z

@x
Use the `delete` structure to enable the deletion of image blobs and manifests
by digest. It defaults to false, but it can be enabled by writing the following
on the configuration file:
@y
{% comment %}
{% endcomment %}
Use the `delete` structure to enable the deletion of image blobs and manifests
by digest. It defaults to false, but it can be enabled by writing the following
on the configuration file:
@z

@x
```none
delete:
  enabled: true
```
@y
```none
delete:
  enabled: true
```
@z

@x
### `cache`
@y
{% comment %}
{% endcomment %}
### `cache`
@z

@x
Use the `cache` structure to enable caching of data accessed in the storage
backend. Currently, the only available cache provides fast access to layer
metadata, which uses the `blobdescriptor` field if configured.
@y
{% comment %}
{% endcomment %}
Use the `cache` structure to enable caching of data accessed in the storage
backend. Currently, the only available cache provides fast access to layer
metadata, which uses the `blobdescriptor` field if configured.
@z

@x
You can set `blobdescriptor` field to `redis` or `inmemory`. If set to `redis`,a
Redis pool caches layer metadata. If set to `inmemory`, an in-memory map caches
layer metadata.
@y
{% comment %}
{% endcomment %}
You can set `blobdescriptor` field to `redis` or `inmemory`. If set to `redis`,a
Redis pool caches layer metadata. If set to `inmemory`, an in-memory map caches
layer metadata.
@z

@x
> **NOTE**: Formerly, `blobdescriptor` was known as `layerinfo`. While these
> are equivalent, `layerinfo` has been deprecated.
@y
{% comment %}
{% endcomment %}
> **NOTE**: Formerly, `blobdescriptor` was known as `layerinfo`. While these
> are equivalent, `layerinfo` has been deprecated.
@z

@x
### `redirect`
@y
{% comment %}
{% endcomment %}
### `redirect`
@z

@x
The `redirect` subsection provides configuration for managing redirects from
content backends. For backends that support it, redirecting is enabled by
default. In certain deployment scenarios, you may decide to route all data
through the Registry, rather than redirecting to the backend. This may be more
efficient when using a backend that is not co-located or when a registry
instance is aggressively caching.
@y
{% comment %}
{% endcomment %}
The `redirect` subsection provides configuration for managing redirects from
content backends. For backends that support it, redirecting is enabled by
default. In certain deployment scenarios, you may decide to route all data
through the Registry, rather than redirecting to the backend. This may be more
efficient when using a backend that is not co-located or when a registry
instance is aggressively caching.
@z

@x
To disable redirects, add a single flag `disable`, set to `true`
under the `redirect` section:
@y
{% comment %}
{% endcomment %}
To disable redirects, add a single flag `disable`, set to `true`
under the `redirect` section:
@z

@x
```none
redirect:
  disable: true
```
@y
```none
redirect:
  disable: true
```
@z

@x
## `auth`
@y
{% comment %}
{% endcomment %}
## `auth`
@z

@x
```none
auth:
  silly:
    realm: silly-realm
    service: silly-service
  token:
    realm: token-realm
    service: token-service
    issuer: registry-token-issuer
    rootcertbundle: /root/certs/bundle
  htpasswd:
    realm: basic-realm
    path: /path/to/htpasswd
```
@y
```none
auth:
  silly:
    realm: silly-realm
    service: silly-service
  token:
    realm: token-realm
    service: token-service
    issuer: registry-token-issuer
    rootcertbundle: /root/certs/bundle
  htpasswd:
    realm: basic-realm
    path: /path/to/htpasswd
```
@z

@x
The `auth` option is **optional**. Possible auth providers include:
@y
{% comment %}
{% endcomment %}
The `auth` option is **optional**. Possible auth providers include:
@z

@x
- [`silly`](#silly)
- [`token`](#token)
- [`htpasswd`](#htpasswd)
- [`none`]
@y
- [`silly`](#silly)
- [`token`](#token)
- [`htpasswd`](#htpasswd)
- [`none`]
@z

@x
You can configure only one authentication provider.
@y
{% comment %}
{% endcomment %}
You can configure only one authentication provider.
@z

@x
### `silly`
@y
{% comment %}
{% endcomment %}
### `silly`
@z

@x
The `silly` authentication provider is only appropriate for development. It simply checks
for the existence of the `Authorization` header in the HTTP request. It does not
check the header's value. If the header does not exist, the `silly` auth
responds with a challenge response, echoing back the realm, service, and scope
for which access was denied.
@y
{% comment %}
{% endcomment %}
The `silly` authentication provider is only appropriate for development. It simply checks
for the existence of the `Authorization` header in the HTTP request. It does not
check the header's value. If the header does not exist, the `silly` auth
responds with a challenge response, echoing back the realm, service, and scope
for which access was denied.
@z

@x
The following values are used to configure the response:
@y
{% comment %}
{% endcomment %}
The following values are used to configure the response:
@z

@x
| Parameter | Required | Description                                           |
|-----------|----------|-------------------------------------------------------|
| `realm`   | yes      | The realm in which the registry server authenticates. |
| `service` | yes      | The service being authenticated.                      |
@y
{% comment %}
{% endcomment %}
| Parameter | Required | Description                                           |
|-----------|----------|-------------------------------------------------------|
| `realm`   | yes      | The realm in which the registry server authenticates. |
| `service` | yes      | The service being authenticated.                      |
@z

@x
### `token`
@y
{% comment %}
{% endcomment %}
### `token`
@z

@x
Token-based authentication allows you to decouple the authentication system from
the registry. It is an established authentication paradigm with a high degree of
security.
@y
{% comment %}
{% endcomment %}
Token-based authentication allows you to decouple the authentication system from
the registry. It is an established authentication paradigm with a high degree of
security.
@z

@x
| Parameter | Required | Description                                           |
|-----------|----------|-------------------------------------------------------|
| `realm`   | yes      | The realm in which the registry server authenticates. |
| `service` | yes      | The service being authenticated.                      |
| `issuer`  | yes      | The name of the token issuer. The issuer inserts this into the token so it must match the value configured for the issuer. |
| `rootcertbundle` | yes | The absolute path to the root certificate bundle. This bundle contains the public part of the certificates used to sign authentication tokens. |
| `autoredirect`   | no      | When set to `true`, `realm` will automatically be set using the Host header of the request as the domain and a path of `/auth/token/`|
@y
{% comment %}
{% endcomment %}
| Parameter | Required | Description                                           |
|-----------|----------|-------------------------------------------------------|
| `realm`   | yes      | The realm in which the registry server authenticates. |
| `service` | yes      | The service being authenticated.                      |
| `issuer`  | yes      | The name of the token issuer. The issuer inserts this into the token so it must match the value configured for the issuer. |
| `rootcertbundle` | yes | The absolute path to the root certificate bundle. This bundle contains the public part of the certificates used to sign authentication tokens. |
| `autoredirect`   | no      | When set to `true`, `realm` will automatically be set using the Host header of the request as the domain and a path of `/auth/token/`|
@z

@x
For more information about Token based authentication configuration, see the
[specification](spec/auth/token.md).
@y
{% comment %}
{% endcomment %}
For more information about Token based authentication configuration, see the
[specification](spec/auth/token.md).
@z

@x
### `htpasswd`
@y
{% comment %}
{% endcomment %}
### `htpasswd`
@z

@x
The _htpasswd_ authentication backed allows you to configure basic
authentication using an
[Apache htpasswd file](https://httpd.apache.org/docs/2.4/programs/htpasswd.html).
The only supported password format is
[`bcrypt`](http://en.wikipedia.org/wiki/Bcrypt). Entries with other hash types
are ignored. The `htpasswd` file is loaded once, at startup. If the file is
invalid, the registry will display an error and will not start.
@y
{% comment %}
{% endcomment %}
The _htpasswd_ authentication backed allows you to configure basic
authentication using an
[Apache htpasswd file](https://httpd.apache.org/docs/2.4/programs/htpasswd.html).
The only supported password format is
[`bcrypt`](http://en.wikipedia.org/wiki/Bcrypt). Entries with other hash types
are ignored. The `htpasswd` file is loaded once, at startup. If the file is
invalid, the registry will display an error and will not start.
@z

@x
> **Warning**: If the `htpasswd` file is missing, the file will be created and provisioned with a default user and automatically generated password.
> The password will be printed to stdout.
@y
{% comment %}
{% endcomment %}
> **Warning**: If the `htpasswd` file is missing, the file will be created and provisioned with a default user and automatically generated password.
> The password will be printed to stdout.
@z

@x
> **Warning**: Only use the `htpasswd` authentication scheme with TLS
> configured, since basic authentication sends passwords as part of the HTTP
> header.
@y
{% comment %}
{% endcomment %}
> **Warning**: Only use the `htpasswd` authentication scheme with TLS
> configured, since basic authentication sends passwords as part of the HTTP
> header.
@z

@x
| Parameter | Required | Description                                           |
|-----------|----------|-------------------------------------------------------|
| `realm`   | yes      | The realm in which the registry server authenticates. |
| `path`    | yes      | The path to the `htpasswd` file to load at startup.   |
@y
{% comment %}
{% endcomment %}
| Parameter | Required | Description                                           |
|-----------|----------|-------------------------------------------------------|
| `realm`   | yes      | The realm in which the registry server authenticates. |
| `path`    | yes      | The path to the `htpasswd` file to load at startup.   |
@z

@x
## `middleware`
@y
{% comment %}
{% endcomment %}
## `middleware`
@z

@x
The `middleware` structure is **optional**. Use this option to inject middleware at
named hook points. Each middleware must implement the same interface as the
object it is wrapping. For instance, a registry middleware must implement the
`distribution.Namespace` interface, while a repository middleware must implement
`distribution.Repository`, and a storage middleware must implement
`driver.StorageDriver`.
@y
{% comment %}
{% endcomment %}
The `middleware` structure is **optional**. Use this option to inject middleware at
named hook points. Each middleware must implement the same interface as the
object it is wrapping. For instance, a registry middleware must implement the
`distribution.Namespace` interface, while a repository middleware must implement
`distribution.Repository`, and a storage middleware must implement
`driver.StorageDriver`.
@z

@x
This is an example configuration of the `cloudfront`  middleware, a storage
middleware:
@y
{% comment %}
{% endcomment %}
This is an example configuration of the `cloudfront`  middleware, a storage
middleware:
@z

@x
```none
middleware:
  registry:
    - name: ARegistryMiddleware
      options:
        foo: bar
  repository:
    - name: ARepositoryMiddleware
      options:
        foo: bar
  storage:
    - name: cloudfront
      options:
        baseurl: https://my.cloudfronted.domain.com/
        privatekey: /path/to/pem
        keypairid: cloudfrontkeypairid
        duration: 3000s
        ipfilteredby: awsregion
        awsregion: us-east-1, use-east-2
        updatefrenquency: 12h
        iprangesurl: https://ip-ranges.amazonaws.com/ip-ranges.json
```
@y
```none
middleware:
  registry:
    - name: ARegistryMiddleware
      options:
        foo: bar
  repository:
    - name: ARepositoryMiddleware
      options:
        foo: bar
  storage:
    - name: cloudfront
      options:
        baseurl: https://my.cloudfronted.domain.com/
        privatekey: /path/to/pem
        keypairid: cloudfrontkeypairid
        duration: 3000s
        ipfilteredby: awsregion
        awsregion: us-east-1, use-east-2
        updatefrenquency: 12h
        iprangesurl: https://ip-ranges.amazonaws.com/ip-ranges.json
```
@z

@x
Each middleware entry has `name` and `options` entries. The `name` must
correspond to the name under which the middleware registers itself. The
`options` field is a map that details custom configuration required to
initialize the middleware. It is treated as a `map[string]interface{}`. As such,
it supports any interesting structures desired, leaving it up to the middleware
initialization function to best determine how to handle the specific
interpretation of the options.
@y
{% comment %}
{% endcomment %}
Each middleware entry has `name` and `options` entries. The `name` must
correspond to the name under which the middleware registers itself. The
`options` field is a map that details custom configuration required to
initialize the middleware. It is treated as a `map[string]interface{}`. As such,
it supports any interesting structures desired, leaving it up to the middleware
initialization function to best determine how to handle the specific
interpretation of the options.
@z

@x
### `cloudfront`
@y
{% comment %}
{% endcomment %}
### `cloudfront`
@z

@x
| Parameter | Required | Description                                           |
|-----------|----------|-------------------------------------------------------|
| `baseurl` | yes      | The `SCHEME://HOST[/PATH]` at which Cloudfront is served. |
| `privatekey` | yes   | The private key for Cloudfront, provided by AWS.        |
| `keypairid` | yes    | The key pair ID provided by AWS.                         |
| `duration` | no      | An integer and unit for the duration of the Cloudfront session. Valid time units are `ns`, `us` (or `µs`), `ms`, `s`, `m`, or `h`. For example, `3000s` is valid, but `3000 s` is not. If you do not specify a `duration` or you specify an integer without a time unit, the duration defaults to `20m` (20 minutes). |
| `ipfilteredby` | no     | A string with the following value `none`, `aws` or `awsregion`. |
| `awsregion` | no        | A comma separated string of AWS regions, only available when `ipfilteredby` is `awsregion`. For example, `us-east-1, us-west-2` |
| `updatefrenquency` | no | The frequency to update AWS IP regions, default: `12h` |
| `iprangesurl` | no      | The URL contains the AWS IP ranges information, default: `https://ip-ranges.amazonaws.com/ip-ranges.json` |
@y
{% comment %}
{% endcomment %}
| Parameter | Required | Description                                           |
|-----------|----------|-------------------------------------------------------|
| `baseurl` | yes      | The `SCHEME://HOST[/PATH]` at which Cloudfront is served. |
| `privatekey` | yes   | The private key for Cloudfront, provided by AWS.        |
| `keypairid` | yes    | The key pair ID provided by AWS.                         |
| `duration` | no      | An integer and unit for the duration of the Cloudfront session. Valid time units are `ns`, `us` (or `µs`), `ms`, `s`, `m`, or `h`. For example, `3000s` is valid, but `3000 s` is not. If you do not specify a `duration` or you specify an integer without a time unit, the duration defaults to `20m` (20 minutes). |
| `ipfilteredby` | no     | A string with the following value `none`, `aws` or `awsregion`. |
| `awsregion` | no        | A comma separated string of AWS regions, only available when `ipfilteredby` is `awsregion`. For example, `us-east-1, us-west-2` |
| `updatefrenquency` | no | The frequency to update AWS IP regions, default: `12h` |
| `iprangesurl` | no      | The URL contains the AWS IP ranges information, default: `https://ip-ranges.amazonaws.com/ip-ranges.json` |
@z

@x
Value of `ipfilteredby` can be:
@y
{% comment %}
{% endcomment %}
Value of `ipfilteredby` can be:
@z

@x
| Value       | Description                        |
|-------------|------------------------------------|
| `none`      | default, do not filter by IP       |
| `aws`       | IP from AWS goes to S3 directly    |
| `awsregion` | IP from certain AWS regions goes to S3 directly, use together with `awsregion`. |
@y
{% comment %}
{% endcomment %}
| Value       | Description                        |
|-------------|------------------------------------|
| `none`      | default, do not filter by IP       |
| `aws`       | IP from AWS goes to S3 directly    |
| `awsregion` | IP from certain AWS regions goes to S3 directly, use together with `awsregion`. |
@z

@x
### `redirect`
@y
{% comment %}
{% endcomment %}
### `redirect`
@z

@x
You can use the `redirect` storage middleware to specify a custom URL to a
location of a proxy for the layer stored by the S3 storage driver.
@y
{% comment %}
{% endcomment %}
You can use the `redirect` storage middleware to specify a custom URL to a
location of a proxy for the layer stored by the S3 storage driver.
@z

@x
| Parameter | Required | Description                                                                                                 |
|-----------|----------|-------------------------------------------------------------------------------------------------------------|
| `baseurl` | yes      | `SCHEME://HOST` at which layers are served. Can also contain port. For example, `https://example.com:5443`. |
@y
{% comment %}
{% endcomment %}
| Parameter | Required | Description                                                                                                 |
|-----------|----------|-------------------------------------------------------------------------------------------------------------|
| `baseurl` | yes      | `SCHEME://HOST` at which layers are served. Can also contain port. For example, `https://example.com:5443`. |
@z

@x
## `reporting`
@y
{% comment %}
{% endcomment %}
## `reporting`
@z

@x
```
reporting:
  bugsnag:
    apikey: bugsnagapikey
    releasestage: bugsnagreleasestage
    endpoint: bugsnagendpoint
  newrelic:
    licensekey: newreliclicensekey
    name: newrelicname
    verbose: true
```
@y
```
reporting:
  bugsnag:
    apikey: bugsnagapikey
    releasestage: bugsnagreleasestage
    endpoint: bugsnagendpoint
  newrelic:
    licensekey: newreliclicensekey
    name: newrelicname
    verbose: true
```
@z

@x
The `reporting` option is **optional** and configures error and metrics
reporting tools. At the moment only two services are supported:
@y
{% comment %}
{% endcomment %}
The `reporting` option is **optional** and configures error and metrics
reporting tools. At the moment only two services are supported:
@z

@x
- [Bugsnag](#bugsnag)
- [New Relic](#new-relic)
@y
- [Bugsnag](#bugsnag)
- [New Relic](#new-relic)
@z

@x
A valid configuration may contain both.
@y
{% comment %}
{% endcomment %}
A valid configuration may contain both.
@z

@x
### `bugsnag`
@y
{% comment %}
{% endcomment %}
### `bugsnag`
@z

@x
| Parameter | Required | Description                                           |
|-----------|----------|-------------------------------------------------------|
| `apikey`  | yes      | The API Key provided by Bugsnag.                      |
| `releasestage` | no  | Tracks where the registry is deployed, using a string like `production`, `staging`, or `development`.|
| `endpoint`| no       | The enterprise Bugsnag endpoint.                      |
@y
{% comment %}
{% endcomment %}
| Parameter | Required | Description                                           |
|-----------|----------|-------------------------------------------------------|
| `apikey`  | yes      | The API Key provided by Bugsnag.                      |
| `releasestage` | no  | Tracks where the registry is deployed, using a string like `production`, `staging`, or `development`.|
| `endpoint`| no       | The enterprise Bugsnag endpoint.                      |
@z

@x
### `newrelic`
@y
{% comment %}
{% endcomment %}
### `newrelic`
@z

@x
| Parameter | Required | Description                                           |
|-----------|----------|-------------------------------------------------------|
| `licensekey` | yes   | License key provided by New Relic.                    |
| `name`    | no       | New Relic application name.                           |
|  `verbose`| no       | Set to `true` to enable New Relic debugging output on `stdout`. |
@y
{% comment %}
{% endcomment %}
| Parameter | Required | Description                                           |
|-----------|----------|-------------------------------------------------------|
| `licensekey` | yes   | License key provided by New Relic.                    |
| `name`    | no       | New Relic application name.                           |
|  `verbose`| no       | Set to `true` to enable New Relic debugging output on `stdout`. |
@z

@x
## `http`
@y
{% comment %}
{% endcomment %}
## `http`
@z

@x
```none
http:
  addr: localhost:5000
  net: tcp
  prefix: /my/nested/registry/
  host: https://myregistryaddress.org:5000
  secret: asecretforlocaldevelopment
  relativeurls: false
  draintimeout: 60s
  tls:
    certificate: /path/to/x509/public
    key: /path/to/x509/private
    clientcas:
      - /path/to/ca.pem
      - /path/to/another/ca.pem
    letsencrypt:
      cachefile: /path/to/cache-file
      email: emailused@letsencrypt.com
      hosts: [myregistryaddress.org]
  debug:
    addr: localhost:5001
  headers:
    X-Content-Type-Options: [nosniff]
  http2:
    disabled: false
```
@y
```none
http:
  addr: localhost:5000
  net: tcp
  prefix: /my/nested/registry/
  host: https://myregistryaddress.org:5000
  secret: asecretforlocaldevelopment
  relativeurls: false
  draintimeout: 60s
  tls:
    certificate: /path/to/x509/public
    key: /path/to/x509/private
    clientcas:
      - /path/to/ca.pem
      - /path/to/another/ca.pem
    letsencrypt:
      cachefile: /path/to/cache-file
      email: emailused@letsencrypt.com
      hosts: [myregistryaddress.org]
  debug:
    addr: localhost:5001
  headers:
    X-Content-Type-Options: [nosniff]
  http2:
    disabled: false
```
@z

@x
The `http` option details the configuration for the HTTP server that hosts the
registry.
@y
{% comment %}
{% endcomment %}
The `http` option details the configuration for the HTTP server that hosts the
registry.
@z

@x
| Parameter | Required | Description                                           |
|-----------|----------|-------------------------------------------------------|
| `addr`    | yes      | The address for which the server should accept connections. The form depends on a network type (see the `net` option). Use `HOST:PORT` for TCP and `FILE` for a UNIX socket. |
| `net`     | no       | The network used to create a listening socket. Known networks are `unix` and `tcp`. |
| `prefix`  | no       | If the server does not run at the root path, set this to the value of the prefix. The root path is the section before `v2`. It requires both preceding and trailing slashes, such as in the example `/path/`. |
| `host`    | no       | A fully-qualified URL for an externally-reachable address for the registry. If present, it is used when creating generated URLs. Otherwise, these URLs are derived from client requests. |
| `secret`  | no       | A random piece of data used to sign state that may be stored with the client to protect against tampering. For production environments you should generate a random piece of data using a cryptographically secure random generator. If you omit the secret, the registry will automatically generate a secret when it starts. **If you are building a cluster of registries behind a load balancer, you MUST ensure the secret is the same for all registries.**|
| `relativeurls`| no    | If `true`,  the registry returns relative URLs in Location headers. The client is responsible for resolving the correct URL. **This option is not compatible with Docker 1.7 and earlier.**|
| `draintimeout`| no    | Amount of time to wait for HTTP connections to drain before shutting down after registry receives SIGTERM signal|
@y
{% comment %}
{% endcomment %}
| Parameter | Required | Description                                           |
|-----------|----------|-------------------------------------------------------|
| `addr`    | yes      | The address for which the server should accept connections. The form depends on a network type (see the `net` option). Use `HOST:PORT` for TCP and `FILE` for a UNIX socket. |
| `net`     | no       | The network used to create a listening socket. Known networks are `unix` and `tcp`. |
| `prefix`  | no       | If the server does not run at the root path, set this to the value of the prefix. The root path is the section before `v2`. It requires both preceding and trailing slashes, such as in the example `/path/`. |
| `host`    | no       | A fully-qualified URL for an externally-reachable address for the registry. If present, it is used when creating generated URLs. Otherwise, these URLs are derived from client requests. |
| `secret`  | no       | A random piece of data used to sign state that may be stored with the client to protect against tampering. For production environments you should generate a random piece of data using a cryptographically secure random generator. If you omit the secret, the registry will automatically generate a secret when it starts. **If you are building a cluster of registries behind a load balancer, you MUST ensure the secret is the same for all registries.**|
| `relativeurls`| no    | If `true`,  the registry returns relative URLs in Location headers. The client is responsible for resolving the correct URL. **This option is not compatible with Docker 1.7 and earlier.**|
| `draintimeout`| no    | Amount of time to wait for HTTP connections to drain before shutting down after registry receives SIGTERM signal|
@z

@x
### `tls`
@y
{% comment %}
{% endcomment %}
### `tls`
@z

@x
The `tls` structure within `http` is **optional**. Use this to configure TLS
for the server. If you already have a web server running on
the same host as the registry, you may prefer to configure TLS on that web server
and proxy connections to the registry server.
@y
{% comment %}
{% endcomment %}
The `tls` structure within `http` is **optional**. Use this to configure TLS
for the server. If you already have a web server running on
the same host as the registry, you may prefer to configure TLS on that web server
and proxy connections to the registry server.
@z

@x
| Parameter | Required | Description                                           |
|-----------|----------|-------------------------------------------------------|
| `certificate` | yes  | Absolute path to the x509 certificate file.           |
| `key`     | yes      | Absolute path to the x509 private key file.           |
| `clientcas` | no     | An array of absolute paths to x509 CA files.          |
@y
{% comment %}
{% endcomment %}
| Parameter | Required | Description                                           |
|-----------|----------|-------------------------------------------------------|
| `certificate` | yes  | Absolute path to the x509 certificate file.           |
| `key`     | yes      | Absolute path to the x509 private key file.           |
| `clientcas` | no     | An array of absolute paths to x509 CA files.          |
@z

@x
### `letsencrypt`
@y
{% comment %}
{% endcomment %}
### `letsencrypt`
@z

@x
The `letsencrypt` structure within `tls` is **optional**. Use this to configure
TLS certificates provided by
[Let's Encrypt](https://letsencrypt.org/how-it-works/).
@y
{% comment %}
{% endcomment %}
The `letsencrypt` structure within `tls` is **optional**. Use this to configure
TLS certificates provided by
[Let's Encrypt](https://letsencrypt.org/how-it-works/).
@z

@x
>**NOTE**: When using Let's Encrypt, ensure that the outward-facing address is
> accessible on port `443`. The registry defaults to listening on port `5000`.
> If you run the registry as a container, consider adding the flag `-p 443:5000`
> to the `docker run` command or using a similar setting in a cloud
> configuration. You should also set the `hosts` option to the list of hostnames
> that are valid for this registry to avoid trying to get certificates for random
> hostnames due to malicious clients connecting with bogus SNI hostnames.
@y
{% comment %}
{% endcomment %}
>**NOTE**: When using Let's Encrypt, ensure that the outward-facing address is
> accessible on port `443`. The registry defaults to listening on port `5000`.
> If you run the registry as a container, consider adding the flag `-p 443:5000`
> to the `docker run` command or using a similar setting in a cloud
> configuration. You should also set the `hosts` option to the list of hostnames
> that are valid for this registry to avoid trying to get certificates for random
> hostnames due to malicious clients connecting with bogus SNI hostnames.
@z

@x
| Parameter | Required | Description                                           |
|-----------|----------|-------------------------------------------------------|
| `cachefile` | yes    | Absolute path to a file where the Let's Encrypt agent can cache data. |
| `email`   | yes      | The email address used to register with Let's Encrypt. |
| `hosts`   | no       | The hostnames allowed for Let's Encrypt certificates. |
@y
{% comment %}
{% endcomment %}
| Parameter | Required | Description                                           |
|-----------|----------|-------------------------------------------------------|
| `cachefile` | yes    | Absolute path to a file where the Let's Encrypt agent can cache data. |
| `email`   | yes      | The email address used to register with Let's Encrypt. |
| `hosts`   | no       | The hostnames allowed for Let's Encrypt certificates. |
@z

@x
### `debug`
@y
{% comment %}
{% endcomment %}
### `debug`
@z

@x
The `debug` option is **optional** . Use it to configure a debug server that
can be helpful in diagnosing problems. The debug endpoint can be used for
monitoring registry metrics and health, as well as profiling. Sensitive
information may be available via the debug endpoint. Please be certain that
access to the debug endpoint is locked down in a production environment.
@y
{% comment %}
{% endcomment %}
The `debug` option is **optional** . Use it to configure a debug server that
can be helpful in diagnosing problems. The debug endpoint can be used for
monitoring registry metrics and health, as well as profiling. Sensitive
information may be available via the debug endpoint. Please be certain that
access to the debug endpoint is locked down in a production environment.
@z

@x
The `debug` section takes a single required `addr` parameter, which specifies
the `HOST:PORT` on which the debug server should accept connections.
@y
{% comment %}
{% endcomment %}
The `debug` section takes a single required `addr` parameter, which specifies
the `HOST:PORT` on which the debug server should accept connections.
@z

@x
## `prometheus`
@y
{% comment %}
{% endcomment %}
## `prometheus`
@z

@x
The `prometheus` option defines whether the prometheus metrics is enable, as well
as the path to access the metrics.
@y
{% comment %}
{% endcomment %}
The `prometheus` option defines whether the prometheus metrics is enable, as well
as the path to access the metrics.
@z

@x
| Parameter | Required | Description                                           |
|-----------|----------|-------------------------------------------------------|
| `enabled` | no       | Set `true` to enable the prometheus server            |
| `path`    | no       | The path to access the metrics, `/metrics` by default |
@y
{% comment %}
{% endcomment %}
| Parameter | Required | Description                                           |
|-----------|----------|-------------------------------------------------------|
| `enabled` | no       | Set `true` to enable the prometheus server            |
| `path`    | no       | The path to access the metrics, `/metrics` by default |
@z

@x
The url to access the metrics is `HOST:PORT/path`, where `HOST:PORT` is defined
in `addr` under `debug`.
@y
{% comment %}
{% endcomment %}
The url to access the metrics is `HOST:PORT/path`, where `HOST:PORT` is defined
in `addr` under `debug`.
@z

@x
### `headers`
@y
{% comment %}
{% endcomment %}
### `headers`
@z

@x
The `headers` option is **optional** . Use it to specify headers that the HTTP
server should include in responses. This can be used for security headers such
as `Strict-Transport-Security`.
@y
{% comment %}
{% endcomment %}
The `headers` option is **optional** . Use it to specify headers that the HTTP
server should include in responses. This can be used for security headers such
as `Strict-Transport-Security`.
@z

@x
The `headers` option should contain an option for each header to include, where
the parameter name is the header's name, and the parameter value a list of the
header's payload values.
@y
{% comment %}
{% endcomment %}
The `headers` option should contain an option for each header to include, where
the parameter name is the header's name, and the parameter value a list of the
header's payload values.
@z

@x
Including `X-Content-Type-Options: [nosniff]` is recommended, so that browsers
will not interpret content as HTML if they are directed to load a page from the
registry. This header is included in the example configuration file.
@y
{% comment %}
{% endcomment %}
Including `X-Content-Type-Options: [nosniff]` is recommended, so that browsers
will not interpret content as HTML if they are directed to load a page from the
registry. This header is included in the example configuration file.
@z

@x
### `http2`
@y
{% comment %}
{% endcomment %}
### `http2`
@z

@x
The `http2` structure within `http` is **optional**. Use this to control http2
settings for the registry.
@y
{% comment %}
{% endcomment %}
The `http2` structure within `http` is **optional**. Use this to control http2
settings for the registry.
@z

@x
| Parameter | Required | Description                                           |
|-----------|----------|-------------------------------------------------------|
| `disabled` | no      | If `true`, then `http2` support is disabled.          |
@y
{% comment %}
{% endcomment %}
| Parameter | Required | Description                                           |
|-----------|----------|-------------------------------------------------------|
| `disabled` | no      | If `true`, then `http2` support is disabled.          |
@z

@x
## `notifications`
@y
{% comment %}
{% endcomment %}
## `notifications`
@z

@x
```none
notifications:
  events:
    includereferences: true
  endpoints:
    - name: alistener
      disabled: false
      url: https://my.listener.com/event
      headers: <http.Header>
      timeout: 1s
      threshold: 10
      backoff: 1s
      ignoredmediatypes:
        - application/octet-stream
      ignore:
        mediatypes:
           - application/octet-stream
        actions:
           - pull
```
@y
```none
notifications:
  events:
    includereferences: true
  endpoints:
    - name: alistener
      disabled: false
      url: https://my.listener.com/event
      headers: <http.Header>
      timeout: 1s
      threshold: 10
      backoff: 1s
      ignoredmediatypes:
        - application/octet-stream
      ignore:
        mediatypes:
           - application/octet-stream
        actions:
           - pull
```
@z

@x
The notifications option is **optional** and currently may contain a single
option, `endpoints`.
@y
{% comment %}
{% endcomment %}
The notifications option is **optional** and currently may contain a single
option, `endpoints`.
@z

@x
### `endpoints`
@y
{% comment %}
{% endcomment %}
### `endpoints`
@z

@x
The `endpoints` structure contains a list of named services (URLs) that can
accept event notifications.
@y
{% comment %}
{% endcomment %}
The `endpoints` structure contains a list of named services (URLs) that can
accept event notifications.
@z

@x
| Parameter | Required | Description                                           |
|-----------|----------|-------------------------------------------------------|
| `name`    | yes      | A human-readable name for the service.                |
| `disabled` | no      | If `true`, notifications are disabled for the service.|
| `url`     | yes      | The URL to which events should be published.          |
| `headers` | yes      | A list of static headers to add to each request. Each header's name is a key beneath `headers`, and each value is a list of payloads for that header name. Values must always be lists. |
| `timeout` | yes      | A value for the HTTP timeout. A positive integer and an optional suffix indicating the unit of time, which may be `ns`, `us`, `ms`, `s`, `m`, or `h`. If you omit the unit of time, `ns` is used. |
| `threshold` | yes    | An integer specifying how long to wait before backing off a failure. |
| `backoff` | yes      | How long the system backs off before retrying after a failure. A positive integer and an optional suffix indicating the unit of time, which may be `ns`, `us`, `ms`, `s`, `m`, or `h`. If you omit the unit of time, `ns` is used. |
| `ignoredmediatypes`|no| A list of target media types to ignore. Events with these target media types are not published to the endpoint. |
| `ignore`  |no| Events with these mediatypes or actions are not published to the endpoint. |
@y
{% comment %}
{% endcomment %}
| Parameter | Required | Description                                           |
|-----------|----------|-------------------------------------------------------|
| `name`    | yes      | A human-readable name for the service.                |
| `disabled` | no      | If `true`, notifications are disabled for the service.|
| `url`     | yes      | The URL to which events should be published.          |
| `headers` | yes      | A list of static headers to add to each request. Each header's name is a key beneath `headers`, and each value is a list of payloads for that header name. Values must always be lists. |
| `timeout` | yes      | A value for the HTTP timeout. A positive integer and an optional suffix indicating the unit of time, which may be `ns`, `us`, `ms`, `s`, `m`, or `h`. If you omit the unit of time, `ns` is used. |
| `threshold` | yes    | An integer specifying how long to wait before backing off a failure. |
| `backoff` | yes      | How long the system backs off before retrying after a failure. A positive integer and an optional suffix indicating the unit of time, which may be `ns`, `us`, `ms`, `s`, `m`, or `h`. If you omit the unit of time, `ns` is used. |
| `ignoredmediatypes`|no| A list of target media types to ignore. Events with these target media types are not published to the endpoint. |
| `ignore`  |no| Events with these mediatypes or actions are not published to the endpoint. |
@z

@x
#### `ignore`
@y
{% comment %}
{% endcomment %}
#### `ignore`
@z

@x
| Parameter | Required | Description                                           |
|-----------|----------|-------------------------------------------------------|
| `mediatypes`|no| A list of target media types to ignore. Events with these target media types are not published to the endpoint. |
| `actions`   |no| A list of actions to ignore. Events with these actions are not published to the endpoint. |
@y
{% comment %}
{% endcomment %}
| Parameter | Required | Description                                           |
|-----------|----------|-------------------------------------------------------|
| `mediatypes`|no| A list of target media types to ignore. Events with these target media types are not published to the endpoint. |
| `actions`   |no| A list of actions to ignore. Events with these actions are not published to the endpoint. |
@z

@x
### `events`
@y
{% comment %}
{% endcomment %}
### `events`
@z

@x
The `events` structure configures the information provided in event notifications.
@y
{% comment %}
{% endcomment %}
The `events` structure configures the information provided in event notifications.
@z

@x
| Parameter | Required | Description                                           |
|-----------|----------|-------------------------------------------------------|
| `includereferences` | no | If `true`, include reference information in manifest events. |
@y
{% comment %}
{% endcomment %}
| Parameter | Required | Description                                           |
|-----------|----------|-------------------------------------------------------|
| `includereferences` | no | If `true`, include reference information in manifest events. |
@z

@x
## `redis`
@y
{% comment %}
{% endcomment %}
## `redis`
@z

@x
```none
redis:
  addr: localhost:6379
  password: asecret
  db: 0
  dialtimeout: 10ms
  readtimeout: 10ms
  writetimeout: 10ms
  pool:
    maxidle: 16
    maxactive: 64
    idletimeout: 300s
```
@y
```none
redis:
  addr: localhost:6379
  password: asecret
  db: 0
  dialtimeout: 10ms
  readtimeout: 10ms
  writetimeout: 10ms
  pool:
    maxidle: 16
    maxactive: 64
    idletimeout: 300s
```
@z

@x
Declare parameters for constructing the `redis` connections. Registry instances
may use the Redis instance for several applications. Currently, it caches
information about immutable blobs. Most of the `redis` options control
how the registry connects to the `redis` instance. You can control the pool's
behavior with the [pool](#pool) subsection.
@y
{% comment %}
{% endcomment %}
Declare parameters for constructing the `redis` connections. Registry instances
may use the Redis instance for several applications. Currently, it caches
information about immutable blobs. Most of the `redis` options control
how the registry connects to the `redis` instance. You can control the pool's
behavior with the [pool](#pool) subsection.
@z

@x
You should configure Redis with the **allkeys-lru** eviction policy, because the
registry does not set an expiration value on keys.
@y
{% comment %}
{% endcomment %}
You should configure Redis with the **allkeys-lru** eviction policy, because the
registry does not set an expiration value on keys.
@z

@x
| Parameter | Required | Description                                           |
|-----------|----------|-------------------------------------------------------|
| `addr`    | yes      | The address (host and port) of the Redis instance.    |
| `password`| no       | A password used to authenticate to the Redis instance.|
| `db`      | no       | The name of the database to use for each connection.  |
| `dialtimeout` | no   | The timeout for connecting to the Redis instance.     |
| `readtimeout` | no   | The timeout for reading from the Redis instance.      |
| `writetimeout` | no  | The timeout for writing to the Redis instance.        |
@y
{% comment %}
{% endcomment %}
| Parameter | Required | Description                                           |
|-----------|----------|-------------------------------------------------------|
| `addr`    | yes      | The address (host and port) of the Redis instance.    |
| `password`| no       | A password used to authenticate to the Redis instance.|
| `db`      | no       | The name of the database to use for each connection.  |
| `dialtimeout` | no   | The timeout for connecting to the Redis instance.     |
| `readtimeout` | no   | The timeout for reading from the Redis instance.      |
| `writetimeout` | no  | The timeout for writing to the Redis instance.        |
@z

@x
### `pool`
@y
{% comment %}
{% endcomment %}
### `pool`
@z

@x
```none
pool:
  maxidle: 16
  maxactive: 64
  idletimeout: 300s
```
@y
```none
pool:
  maxidle: 16
  maxactive: 64
  idletimeout: 300s
```
@z

@x
Use these settings to configure the behavior of the Redis connection pool.
@y
{% comment %}
{% endcomment %}
Use these settings to configure the behavior of the Redis connection pool.
@z

@x
| Parameter | Required | Description                                           |
|-----------|----------|-------------------------------------------------------|
| `maxidle` | no       | The maximum number of idle connections in the pool.   |
| `maxactive`| no      | The maximum number of connections which can be open before blocking a connection request. |
| `idletimeout`| no    | How long to wait before closing inactive connections. |
@y
{% comment %}
{% endcomment %}
| Parameter | Required | Description                                           |
|-----------|----------|-------------------------------------------------------|
| `maxidle` | no       | The maximum number of idle connections in the pool.   |
| `maxactive`| no      | The maximum number of connections which can be open before blocking a connection request. |
| `idletimeout`| no    | How long to wait before closing inactive connections. |
@z

@x
## `health`
@y
{% comment %}
{% endcomment %}
## `health`
@z

@x
```none
health:
  storagedriver:
    enabled: true
    interval: 10s
    threshold: 3
  file:
    - file: /path/to/checked/file
      interval: 10s
  http:
    - uri: http://server.to.check/must/return/200
      headers:
        Authorization: [Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ==]
      statuscode: 200
      timeout: 3s
      interval: 10s
      threshold: 3
  tcp:
    - addr: redis-server.domain.com:6379
      timeout: 3s
      interval: 10s
      threshold: 3
```
@y
```none
health:
  storagedriver:
    enabled: true
    interval: 10s
    threshold: 3
  file:
    - file: /path/to/checked/file
      interval: 10s
  http:
    - uri: http://server.to.check/must/return/200
      headers:
        Authorization: [Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ==]
      statuscode: 200
      timeout: 3s
      interval: 10s
      threshold: 3
  tcp:
    - addr: redis-server.domain.com:6379
      timeout: 3s
      interval: 10s
      threshold: 3
```
@z

@x
The health option is **optional**, and contains preferences for a periodic
health check on the storage driver's backend storage, as well as optional
periodic checks on local files, HTTP URIs, and/or TCP servers. The results of
the health checks are available at the `/debug/health` endpoint on the debug
HTTP server if the debug HTTP server is enabled (see http section).
@y
{% comment %}
{% endcomment %}
The health option is **optional**, and contains preferences for a periodic
health check on the storage driver's backend storage, as well as optional
periodic checks on local files, HTTP URIs, and/or TCP servers. The results of
the health checks are available at the `/debug/health` endpoint on the debug
HTTP server if the debug HTTP server is enabled (see http section).
@z

@x
### `storagedriver`
@y
{% comment %}
{% endcomment %}
### `storagedriver`
@z

@x
The `storagedriver` structure contains options for a health check on the
configured storage driver's backend storage. The health check is only active
when `enabled` is set to `true`.
@y
{% comment %}
{% endcomment %}
The `storagedriver` structure contains options for a health check on the
configured storage driver's backend storage. The health check is only active
when `enabled` is set to `true`.
@z

@x
| Parameter | Required | Description                                           |
|-----------|----------|-------------------------------------------------------|
| `enabled` | yes      | Set to `true` to enable storage driver health checks or `false` to disable them. |
| `interval`| no       | How long to wait between repetitions of the storage driver health check. A positive integer and an optional suffix indicating the unit of time. The suffix is one of `ns`, `us`, `ms`, `s`, `m`, or `h`. Defaults to `10s` if the value is omitted. If you specify a value but omit the suffix, the value is interpreted as a number of nanoseconds. |
| `threshold`| no      | A positive integer which represents the number of times the check must fail before the state is marked as unhealthy. If not specified, a single failure marks the state as unhealthy. |
@y
{% comment %}
{% endcomment %}
| Parameter | Required | Description                                           |
|-----------|----------|-------------------------------------------------------|
| `enabled` | yes      | Set to `true` to enable storage driver health checks or `false` to disable them. |
| `interval`| no       | How long to wait between repetitions of the storage driver health check. A positive integer and an optional suffix indicating the unit of time. The suffix is one of `ns`, `us`, `ms`, `s`, `m`, or `h`. Defaults to `10s` if the value is omitted. If you specify a value but omit the suffix, the value is interpreted as a number of nanoseconds. |
| `threshold`| no      | A positive integer which represents the number of times the check must fail before the state is marked as unhealthy. If not specified, a single failure marks the state as unhealthy. |
@z

@x
### `file`
@y
{% comment %}
{% endcomment %}
### `file`
@z

@x
The `file` structure includes a list of paths to be periodically checked for the\
existence of a file. If a file exists at the given path, the health check will
fail. You can use this mechanism to bring a registry out of rotation by creating
a file.
@y
{% comment %}
{% endcomment %}
The `file` structure includes a list of paths to be periodically checked for the\
existence of a file. If a file exists at the given path, the health check will
fail. You can use this mechanism to bring a registry out of rotation by creating
a file.
@z

@x
| Parameter | Required | Description                                           |
|-----------|----------|-------------------------------------------------------|
| `file`    | yes      | The path to check for existence of a file.            |
| `interval`| no       | How long to wait before repeating the check. A positive integer and an optional suffix indicating the unit of time. The suffix is one of `ns`, `us`, `ms`, `s`, `m`, or `h`. Defaults to `10s` if the value is omitted. If you specify a value but omit the suffix, the value is interpreted as a number of nanoseconds. |
@y
{% comment %}
{% endcomment %}
| Parameter | Required | Description                                           |
|-----------|----------|-------------------------------------------------------|
| `file`    | yes      | The path to check for existence of a file.            |
| `interval`| no       | How long to wait before repeating the check. A positive integer and an optional suffix indicating the unit of time. The suffix is one of `ns`, `us`, `ms`, `s`, `m`, or `h`. Defaults to `10s` if the value is omitted. If you specify a value but omit the suffix, the value is interpreted as a number of nanoseconds. |
@z

@x
### `http`
@y
{% comment %}
{% endcomment %}
### `http`
@z

@x
The `http` structure includes a list of HTTP URIs to periodically check with
`HEAD` requests. If a `HEAD` request does not complete or returns an unexpected
status code, the health check will fail.
@y
{% comment %}
{% endcomment %}
The `http` structure includes a list of HTTP URIs to periodically check with
`HEAD` requests. If a `HEAD` request does not complete or returns an unexpected
status code, the health check will fail.
@z

@x
| Parameter | Required | Description                                           |
|-----------|----------|-------------------------------------------------------|
| `uri`     | yes      | The URI to check.                                     |
| `headers` | no       | Static headers to add to each request. Each header's name is a key beneath `headers`, and each value is a list of payloads for that header name. Values must always be lists. |
| `statuscode` | no    | The expected status code from the HTTP URI. Defaults to `200`. |
| `timeout` | no       | How long to wait before timing out the HTTP request. A positive integer and an optional suffix indicating the unit of time. The suffix is one of `ns`, `us`, `ms`, `s`, `m`, or `h`. If you specify a value but omit the suffix, the value is interpreted as a number of nanoseconds. |
| `interval`| no       | How long to wait before repeating the check. A positive integer and an optional suffix indicating the unit of time. The suffix is one of `ns`, `us`, `ms`, `s`, `m`, or `h`. Defaults to `10s` if the value is omitted. If you specify a value but omit the suffix, the value is interpreted as a number of nanoseconds. |
| `threshold`| no      | The number of times the check must fail before the state is marked as unhealthy. If this field is not specified, a single failure marks the state as unhealthy. |
@y
{% comment %}
{% endcomment %}
| Parameter | Required | Description                                           |
|-----------|----------|-------------------------------------------------------|
| `uri`     | yes      | The URI to check.                                     |
| `headers` | no       | Static headers to add to each request. Each header's name is a key beneath `headers`, and each value is a list of payloads for that header name. Values must always be lists. |
| `statuscode` | no    | The expected status code from the HTTP URI. Defaults to `200`. |
| `timeout` | no       | How long to wait before timing out the HTTP request. A positive integer and an optional suffix indicating the unit of time. The suffix is one of `ns`, `us`, `ms`, `s`, `m`, or `h`. If you specify a value but omit the suffix, the value is interpreted as a number of nanoseconds. |
| `interval`| no       | How long to wait before repeating the check. A positive integer and an optional suffix indicating the unit of time. The suffix is one of `ns`, `us`, `ms`, `s`, `m`, or `h`. Defaults to `10s` if the value is omitted. If you specify a value but omit the suffix, the value is interpreted as a number of nanoseconds. |
| `threshold`| no      | The number of times the check must fail before the state is marked as unhealthy. If this field is not specified, a single failure marks the state as unhealthy. |
@z

@x
### `tcp`
@y
{% comment %}
{% endcomment %}
### `tcp`
@z

@x
The `tcp` structure includes a list of TCP addresses to periodically check using
TCP connection attempts. Addresses must include port numbers. If a connection
attempt fails, the health check will fail.
@y
{% comment %}
{% endcomment %}
The `tcp` structure includes a list of TCP addresses to periodically check using
TCP connection attempts. Addresses must include port numbers. If a connection
attempt fails, the health check will fail.
@z

@x
| Parameter | Required | Description                                           |
|-----------|----------|-------------------------------------------------------|
| `addr`    | yes      | The TCP address and port to connect to.               |
| `timeout` | no       | How long to wait before timing out the TCP connection. A positive integer and an optional suffix indicating the unit of time. The suffix is one of `ns`, `us`, `ms`, `s`, `m`, or `h`. If you specify a value but omit the suffix, the value is interpreted as a number of nanoseconds. |
| `interval`| no       | How long to wait between repetitions of the check. A positive integer and an optional suffix indicating the unit of time. The suffix is one of `ns`, `us`, `ms`, `s`, `m`, or `h`. Defaults to `10s` if the value is omitted. If you specify a value but omit the suffix, the value is interpreted as a number of nanoseconds. |
| `threshold`| no      | The number of times the check must fail before the state is marked as unhealthy. If this field is not specified, a single failure marks the state as unhealthy. |
@y
{% comment %}
{% endcomment %}
| Parameter | Required | Description                                           |
|-----------|----------|-------------------------------------------------------|
| `addr`    | yes      | The TCP address and port to connect to.               |
| `timeout` | no       | How long to wait before timing out the TCP connection. A positive integer and an optional suffix indicating the unit of time. The suffix is one of `ns`, `us`, `ms`, `s`, `m`, or `h`. If you specify a value but omit the suffix, the value is interpreted as a number of nanoseconds. |
| `interval`| no       | How long to wait between repetitions of the check. A positive integer and an optional suffix indicating the unit of time. The suffix is one of `ns`, `us`, `ms`, `s`, `m`, or `h`. Defaults to `10s` if the value is omitted. If you specify a value but omit the suffix, the value is interpreted as a number of nanoseconds. |
| `threshold`| no      | The number of times the check must fail before the state is marked as unhealthy. If this field is not specified, a single failure marks the state as unhealthy. |
@z

@x
## `proxy`
@y
{% comment %}
{% endcomment %}
## `proxy`
@z

@x
```
proxy:
  remoteurl: https://registry-1.docker.io
  username: [username]
  password: [password]
```
@y
```
proxy:
  remoteurl: https://registry-1.docker.io
  username: [username]
  password: [password]
```
@z

@x
The `proxy` structure allows a registry to be configured as a pull-through cache
to Docker Hub.  See
[mirror](https://github.com/docker/docker.github.io/tree/master/registry/recipes/mirror.md)
for more information. Pushing to a registry configured as a pull-through cache
is unsupported.
@y
{% comment %}
{% endcomment %}
The `proxy` structure allows a registry to be configured as a pull-through cache
to Docker Hub.  See
[mirror](https://github.com/docker/docker.github.io/tree/master/registry/recipes/mirror.md)
for more information. Pushing to a registry configured as a pull-through cache
is unsupported.
@z

@x
| Parameter | Required | Description                                           |
|-----------|----------|-------------------------------------------------------|
| `remoteurl`| yes     | The URL for the repository on Docker Hub.             |
| `username` | no      | The username registered with Docker Hub which has access to the repository. |
| `password` | no      | The password used to authenticate to Docker Hub using the username specified in `username`. |
@y
{% comment %}
{% endcomment %}
| Parameter | Required | Description                                           |
|-----------|----------|-------------------------------------------------------|
| `remoteurl`| yes     | The URL for the repository on Docker Hub.             |
| `username` | no      | The username registered with Docker Hub which has access to the repository. |
| `password` | no      | The password used to authenticate to Docker Hub using the username specified in `username`. |
@z

@x
To enable pulling private repositories (e.g. `batman/robin`) specify the
username (such as `batman`) and the password for that username.
@y
{% comment %}
{% endcomment %}
To enable pulling private repositories (e.g. `batman/robin`) specify the
username (such as `batman`) and the password for that username.
@z

@x
> **Note**: These private repositories are stored in the proxy cache's storage.
> Take appropriate measures to protect access to the proxy cache.
@y
{% comment %}
{% endcomment %}
> **Note**: These private repositories are stored in the proxy cache's storage.
> Take appropriate measures to protect access to the proxy cache.
@z

@x
## `compatibility`
@y
{% comment %}
{% endcomment %}
## `compatibility`
@z

@x
```none
compatibility:
  schema1:
    signingkeyfile: /etc/registry/key.json
    enabled: true
```
@y
```none
compatibility:
  schema1:
    signingkeyfile: /etc/registry/key.json
    enabled: true
```
@z

@x
Use the `compatibility` structure to configure handling of older and deprecated
features. Each subsection defines such a feature with configurable behavior.
@y
{% comment %}
{% endcomment %}
Use the `compatibility` structure to configure handling of older and deprecated
features. Each subsection defines such a feature with configurable behavior.
@z

@x
### `schema1`
@y
{% comment %}
{% endcomment %}
### `schema1`
@z

@x
| Parameter | Required | Description                                           |
|-----------|----------|-------------------------------------------------------|
| `signingkeyfile` | no | The signing private key used to add signatures to `schema1` manifests. If no signing key is provided, a new ECDSA key is generated when the registry starts. |
| `enabled` | no | If this is not set to true, `schema1` manifests cannot be pushed. |
@y
{% comment %}
{% endcomment %}
| Parameter | Required | Description                                           |
|-----------|----------|-------------------------------------------------------|
| `signingkeyfile` | no | The signing private key used to add signatures to `schema1` manifests. If no signing key is provided, a new ECDSA key is generated when the registry starts. |
| `enabled` | no | If this is not set to true, `schema1` manifests cannot be pushed. |
@z

@x
## `validation`
@y
{% comment %}
{% endcomment %}
## `validation`
@z

@x
```none
validation:
  manifests:
    urls:
      allow:
        - ^https?://([^/]+\.)*example\.com/
      deny:
        - ^https?://www\.example\.com/
```
@y
```none
validation:
  manifests:
    urls:
      allow:
        - ^https?://([^/]+\.)*example\.com/
      deny:
        - ^https?://www\.example\.com/
```
@z

@x
### `disabled`
@y
{% comment %}
{% endcomment %}
### `disabled`
@z

@x
The `disabled` flag disables the other options in the `validation`
section. They are enabled by default. This option deprecates the `enabled` flag.
@y
{% comment %}
{% endcomment %}
The `disabled` flag disables the other options in the `validation`
section. They are enabled by default. This option deprecates the `enabled` flag.
@z

@x
### `manifests`
@y
{% comment %}
{% endcomment %}
### `manifests`
@z

@x
Use the `manifests` subsection to configure validation of manifests. If
`disabled` is `false`, the validation allows nothing.
@y
{% comment %}
{% endcomment %}
Use the `manifests` subsection to configure validation of manifests. If
`disabled` is `false`, the validation allows nothing.
@z

@x
#### `urls`
@y
{% comment %}
{% endcomment %}
#### `urls`
@z

@x
The `allow` and `deny` options are each a list of
[regular expressions](https://godoc.org/regexp/syntax) that restrict the URLs in
pushed manifests.
@y
{% comment %}
{% endcomment %}
The `allow` and `deny` options are each a list of
[regular expressions](https://godoc.org/regexp/syntax) that restrict the URLs in
pushed manifests.
@z

@x
If `allow` is unset, pushing a manifest containing URLs fails.
@y
{% comment %}
{% endcomment %}
If `allow` is unset, pushing a manifest containing URLs fails.
@z

@x
If `allow` is set, pushing a manifest succeeds only if all URLs match
one of the `allow` regular expressions **and** one of the following holds:
@y
{% comment %}
{% endcomment %}
If `allow` is set, pushing a manifest succeeds only if all URLs match
one of the `allow` regular expressions **and** one of the following holds:
@z

@x
1.  `deny` is unset.
2.  `deny` is set but no URLs within the manifest match any of the `deny` regular
    expressions.
@y
{% comment %}
{% endcomment %}
1.  `deny` is unset.
2.  `deny` is set but no URLs within the manifest match any of the `deny` regular
    expressions.
@z

@x
## Example: Development configuration
@y
{% comment %}
{% endcomment %}
## Example: Development configuration
@z

@x
You can use this simple example for local development:
@y
{% comment %}
{% endcomment %}
You can use this simple example for local development:
@z

@x
```none
version: 0.1
log:
  level: debug
storage:
    filesystem:
        rootdirectory: /var/lib/registry
http:
    addr: localhost:5000
    secret: asecretforlocaldevelopment
    debug:
        addr: localhost:5001
```
@y
```none
version: 0.1
log:
  level: debug
storage:
    filesystem:
        rootdirectory: /var/lib/registry
http:
    addr: localhost:5000
    secret: asecretforlocaldevelopment
    debug:
        addr: localhost:5001
```
@z

@x
This example configures the registry instance to run on port `5000`, binding to
`localhost`, with the `debug` server enabled. Registry data is stored in the
`/var/lib/registry` directory. Logging is set to `debug` mode, which is the most
verbose.
@y
{% comment %}
{% endcomment %}
This example configures the registry instance to run on port `5000`, binding to
`localhost`, with the `debug` server enabled. Registry data is stored in the
`/var/lib/registry` directory. Logging is set to `debug` mode, which is the most
verbose.
@z

@x
See
[config-example.yml](https://github.com/docker/distribution/blob/master/cmd/registry/config-example.yml)
for another simple configuration. Both examples are generally useful for local
development.
@y
{% comment %}
{% endcomment %}
See
[config-example.yml](https://github.com/docker/distribution/blob/master/cmd/registry/config-example.yml)
for another simple configuration. Both examples are generally useful for local
development.
@z

@x
## Example: Middleware configuration
@y
{% comment %}
{% endcomment %}
## Example: Middleware configuration
@z

@x
This example configures [Amazon Cloudfront](http://aws.amazon.com/cloudfront/)
as the storage middleware in a registry. Middleware allows the registry to serve
layers via a content delivery network (CDN). This reduces requests to the
storage layer.
@y
{% comment %}
{% endcomment %}
This example configures [Amazon Cloudfront](http://aws.amazon.com/cloudfront/)
as the storage middleware in a registry. Middleware allows the registry to serve
layers via a content delivery network (CDN). This reduces requests to the
storage layer.
@z

@x
Cloudfront requires the S3 storage driver.
@y
{% comment %}
{% endcomment %}
Cloudfront requires the S3 storage driver.
@z

@x
This is the configuration expressed in YAML:
@y
{% comment %}
{% endcomment %}
This is the configuration expressed in YAML:
@z

@x
```none
middleware:
  storage:
  - name: cloudfront
    disabled: false
    options:
      baseurl: http://d111111abcdef8.cloudfront.net
      privatekey: /path/to/asecret.pem
      keypairid: asecret
      duration: 60s
```
@y
```none
middleware:
  storage:
  - name: cloudfront
    disabled: false
    options:
      baseurl: http://d111111abcdef8.cloudfront.net
      privatekey: /path/to/asecret.pem
      keypairid: asecret
      duration: 60s
```
@z

@x
See the configuration reference for [Cloudfront](#cloudfront) for more
information about configuration options.
@y
{% comment %}
{% endcomment %}
See the configuration reference for [Cloudfront](#cloudfront) for more
information about configuration options.
@z

@x
> **Note**: Cloudfront keys exist separately from other AWS keys.  See
> [the documentation on AWS credentials](http://docs.aws.amazon.com/general/latest/gr/aws-security-credentials.html)
> for more information.
@y
{% comment %}
{% endcomment %}
> **Note**: Cloudfront keys exist separately from other AWS keys.  See
> [the documentation on AWS credentials](http://docs.aws.amazon.com/general/latest/gr/aws-security-credentials.html)
> for more information.
@z
