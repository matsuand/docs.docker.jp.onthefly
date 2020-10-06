%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Restricting access to your registry using an apache proxy
keywords: registry, on-prem, images, tags, repository, distribution, authentication, proxy, apache, httpd, TLS, recipe, advanced
title: Authenticate proxy with apache
---
@y
---
description: Restricting access to your registry using an apache proxy
keywords: registry, on-prem, images, tags, repository, distribution, authentication, proxy, apache, httpd, TLS, recipe, advanced
title: Authenticate proxy with apache
---
@z

@x
{% include registry.md %}
@y
{% include registry.md %}
@z

@x
## Use-case
@y
## Use-case
@z

@x
People already relying on an apache proxy to authenticate their users to other services might want to leverage it and have Registry communications tunneled through the same pipeline.
@y
People already relying on an apache proxy to authenticate their users to other services might want to leverage it and have Registry communications tunneled through the same pipeline.
@z

@x
Usually, that includes enterprise setups using LDAP/AD on the backend and a SSO mechanism fronting their internal http portal.
@y
Usually, that includes enterprise setups using LDAP/AD on the backend and a SSO mechanism fronting their internal http portal.
@z

@x
### Alternatives
@y
### Alternatives
@z

@x
If you just want authentication for your registry, and are happy maintaining users access separately, you should really consider sticking with the native [basic auth registry feature](../deploying.md#native-basic-auth).
@y
If you just want authentication for your registry, and are happy maintaining users access separately, you should really consider sticking with the native [basic auth registry feature](../deploying.md#native-basic-auth).
@z

@x
### Solution
@y
### Solution
@z

@x
With the method presented here, you implement basic authentication for docker engines in a reverse proxy that sits in front of your registry.
@y
With the method presented here, you implement basic authentication for docker engines in a reverse proxy that sits in front of your registry.
@z

@x
While we use a simple htpasswd file as an example, any other apache authentication backend should be fairly easy to implement once you are done with the example.
@y
While we use a simple htpasswd file as an example, any other apache authentication backend should be fairly easy to implement once you are done with the example.
@z

@x
We also implement push restriction (to a limited user group) for the sake of the example. Again, you should modify this to fit your mileage.
@y
We also implement push restriction (to a limited user group) for the sake of the example. Again, you should modify this to fit your mileage.
@z

@x
### Gotchas
@y
### Gotchas
@z

@x
While this model gives you the ability to use whatever authentication backend you want through the secondary authentication mechanism implemented inside your proxy, it also requires that you move TLS termination from the Registry to the proxy itself.
@y
While this model gives you the ability to use whatever authentication backend you want through the secondary authentication mechanism implemented inside your proxy, it also requires that you move TLS termination from the Registry to the proxy itself.
@z

@x
Furthermore, introducing an extra http layer in your communication pipeline adds complexity when deploying, maintaining, and debugging.
@y
Furthermore, introducing an extra http layer in your communication pipeline adds complexity when deploying, maintaining, and debugging.
@z

@x
## Setting things up
@y
## Setting things up
@z

@x
Read again [the requirements](index.md#requirements).
@y
Read again [the requirements](index.md#requirements).
@z

@x
Ready?
@y
Ready?
@z

@x
Run the following script:
@y
Run the following script:
@z

@x
```
mkdir -p auth
mkdir -p data
@y
```
mkdir -p auth
mkdir -p data
@z

@x
# This is the main apache configuration
cat <<EOF > auth/httpd.conf
LoadModule headers_module modules/mod_headers.so
@y
# This is the main apache configuration
cat <<EOF > auth/httpd.conf
LoadModule headers_module modules/mod_headers.so
@z

@x
LoadModule authn_file_module modules/mod_authn_file.so
LoadModule authn_core_module modules/mod_authn_core.so
LoadModule authz_groupfile_module modules/mod_authz_groupfile.so
LoadModule authz_user_module modules/mod_authz_user.so
LoadModule authz_core_module modules/mod_authz_core.so
LoadModule auth_basic_module modules/mod_auth_basic.so
LoadModule access_compat_module modules/mod_access_compat.so
@y
LoadModule authn_file_module modules/mod_authn_file.so
LoadModule authn_core_module modules/mod_authn_core.so
LoadModule authz_groupfile_module modules/mod_authz_groupfile.so
LoadModule authz_user_module modules/mod_authz_user.so
LoadModule authz_core_module modules/mod_authz_core.so
LoadModule auth_basic_module modules/mod_auth_basic.so
LoadModule access_compat_module modules/mod_access_compat.so
@z

@x
LoadModule log_config_module modules/mod_log_config.so
@y
LoadModule log_config_module modules/mod_log_config.so
@z

@x
LoadModule ssl_module modules/mod_ssl.so
@y
LoadModule ssl_module modules/mod_ssl.so
@z

@x
LoadModule proxy_module modules/mod_proxy.so
LoadModule proxy_http_module modules/mod_proxy_http.so
@y
LoadModule proxy_module modules/mod_proxy.so
LoadModule proxy_http_module modules/mod_proxy_http.so
@z

@x
LoadModule unixd_module modules/mod_unixd.so
@y
LoadModule unixd_module modules/mod_unixd.so
@z

@x
<IfModule ssl_module>
    SSLRandomSeed startup builtin
    SSLRandomSeed connect builtin
</IfModule>
@y
<IfModule ssl_module>
    SSLRandomSeed startup builtin
    SSLRandomSeed connect builtin
</IfModule>
@z

@x
<IfModule unixd_module>
    User daemon
    Group daemon
</IfModule>
@y
<IfModule unixd_module>
    User daemon
    Group daemon
</IfModule>
@z

@x
ServerAdmin you@example.com
@y
ServerAdmin you@example.com
@z

@x
ErrorLog /proc/self/fd/2
@y
ErrorLog /proc/self/fd/2
@z

@x
LogLevel warn
@y
LogLevel warn
@z

@x
<IfModule log_config_module>
    LogFormat "%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\"" combined
    LogFormat "%h %l %u %t \"%r\" %>s %b" common
@y
<IfModule log_config_module>
    LogFormat "%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\"" combined
    LogFormat "%h %l %u %t \"%r\" %>s %b" common
@z

@x
    <IfModule logio_module>
      LogFormat "%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\" %I %O" combinedio
    </IfModule>
@y
    <IfModule logio_module>
      LogFormat "%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\" %I %O" combinedio
    </IfModule>
@z

@x
    CustomLog /proc/self/fd/1 common
</IfModule>
@y
    CustomLog /proc/self/fd/1 common
</IfModule>
@z

@x
ServerRoot "/usr/local/apache2"
@y
ServerRoot "/usr/local/apache2"
@z

@x
Listen 5043
@y
Listen 5043
@z

@x
<Directory />
    AllowOverride none
    Require all denied
</Directory>
@y
<Directory />
    AllowOverride none
    Require all denied
</Directory>
@z

@x
<VirtualHost *:5043>
@y
<VirtualHost *:5043>
@z

@x
  ServerName myregistrydomain.com
@y
  ServerName myregistrydomain.com
@z

@x
  SSLEngine on
  SSLCertificateFile /usr/local/apache2/conf/domain.crt
  SSLCertificateKeyFile /usr/local/apache2/conf/domain.key
@y
  SSLEngine on
  SSLCertificateFile /usr/local/apache2/conf/domain.crt
  SSLCertificateKeyFile /usr/local/apache2/conf/domain.key
@z

@x
  ## SSL settings recommendation from: https://raymii.org/s/tutorials/Strong_SSL_Security_On_Apache2.html
  # Anti CRIME
  SSLCompression off
@y
  ## SSL settings recommendation from: https://raymii.org/s/tutorials/Strong_SSL_Security_On_Apache2.html
  # Anti CRIME
  SSLCompression off
@z

@x
  # POODLE and other stuff
  SSLProtocol all -SSLv2 -SSLv3 -TLSv1
@y
  # POODLE and other stuff
  SSLProtocol all -SSLv2 -SSLv3 -TLSv1
@z

@x
  # Secure cypher suites
  SSLCipherSuite EECDH+AESGCM:EDH+AESGCM:AES256+EECDH:AES256+EDH
  SSLHonorCipherOrder on
@y
  # Secure cypher suites
  SSLCipherSuite EECDH+AESGCM:EDH+AESGCM:AES256+EECDH:AES256+EDH
  SSLHonorCipherOrder on
@z

@x
  Header always set "Docker-Distribution-Api-Version" "registry/2.0"
  Header onsuccess set "Docker-Distribution-Api-Version" "registry/2.0"
  RequestHeader set X-Forwarded-Proto "https"
@y
  Header always set "Docker-Distribution-Api-Version" "registry/2.0"
  Header onsuccess set "Docker-Distribution-Api-Version" "registry/2.0"
  RequestHeader set X-Forwarded-Proto "https"
@z

@x
  ProxyRequests     off
  ProxyPreserveHost on
@y
  ProxyRequests     off
  ProxyPreserveHost on
@z

@x
  # no proxy for /error/ (Apache HTTPd errors messages)
  ProxyPass /error/ !
@y
  # no proxy for /error/ (Apache HTTPd errors messages)
  ProxyPass /error/ !
@z

@x
  ProxyPass        /v2 http://registry:5000/v2
  ProxyPassReverse /v2 http://registry:5000/v2
@y
  ProxyPass        /v2 http://registry:5000/v2
  ProxyPassReverse /v2 http://registry:5000/v2
@z

@x
  <Location /v2>
    Order deny,allow
    Allow from all
    AuthName "Registry Authentication"
    AuthType basic
    AuthUserFile "/usr/local/apache2/conf/httpd.htpasswd"
    AuthGroupFile "/usr/local/apache2/conf/httpd.groups"
@y
  <Location /v2>
    Order deny,allow
    Allow from all
    AuthName "Registry Authentication"
    AuthType basic
    AuthUserFile "/usr/local/apache2/conf/httpd.htpasswd"
    AuthGroupFile "/usr/local/apache2/conf/httpd.groups"
@z

@x
    # Read access to authentified users
    <Limit GET HEAD>
      Require valid-user
    </Limit>
@y
    # Read access to authentified users
    <Limit GET HEAD>
      Require valid-user
    </Limit>
@z

@x
    # Write access to docker-deployer only
    <Limit POST PUT DELETE PATCH>
      Require group pusher
    </Limit>
@y
    # Write access to docker-deployer only
    <Limit POST PUT DELETE PATCH>
      Require group pusher
    </Limit>
@z

@x
  </Location>
@y
  </Location>
@z

@x
</VirtualHost>
EOF
@y
</VirtualHost>
EOF
@z

@x
# Now, create a password file for "testuser" and "testpassword"
docker run --entrypoint htpasswd httpd:2.4 -Bbn testuser testpassword > auth/httpd.htpasswd
# Create another one for "testuserpush" and "testpasswordpush"
docker run --entrypoint htpasswd httpd:2.4 -Bbn testuserpush testpasswordpush >> auth/httpd.htpasswd
@y
# Now, create a password file for "testuser" and "testpassword"
docker run --entrypoint htpasswd httpd:2.4 -Bbn testuser testpassword > auth/httpd.htpasswd
# Create another one for "testuserpush" and "testpasswordpush"
docker run --entrypoint htpasswd httpd:2.4 -Bbn testuserpush testpasswordpush >> auth/httpd.htpasswd
@z

@x
# Create your group file
echo "pusher: testuserpush" > auth/httpd.groups
@y
# Create your group file
echo "pusher: testuserpush" > auth/httpd.groups
@z

@x
# Copy over your certificate files
cp domain.crt auth
cp domain.key auth
@y
# Copy over your certificate files
cp domain.crt auth
cp domain.key auth
@z

@x
# Now create your compose file
@y
# Now create your compose file
@z

@x
cat <<EOF > docker-compose.yml
apache:
  image: "httpd:2.4"
  hostname: myregistrydomain.com
  ports:
    - 5043:5043
  links:
    - registry:registry
  volumes:
    - `pwd`/auth:/usr/local/apache2/conf
@y
cat <<EOF > docker-compose.yml
apache:
  image: "httpd:2.4"
  hostname: myregistrydomain.com
  ports:
    - 5043:5043
  links:
    - registry:registry
  volumes:
    - `pwd`/auth:/usr/local/apache2/conf
@z

@x
registry:
  image: registry:2
  ports:
    - 127.0.0.1:5000:5000
  volumes:
    - `pwd`/data:/var/lib/registry
@y
registry:
  image: registry:2
  ports:
    - 127.0.0.1:5000:5000
  volumes:
    - `pwd`/data:/var/lib/registry
@z

@x
EOF
```
@y
EOF
```
@z

@x
## Starting and stopping
@y
## Starting and stopping
@z

@x
Now, start your stack:
@y
Now, start your stack:
@z

@x
    docker-compose up -d
@y
    docker-compose up -d
@z

@x
Log in with a "push" authorized user (using `testuserpush` and `testpasswordpush`), then tag and push your first image:
@y
Log in with a "push" authorized user (using `testuserpush` and `testpasswordpush`), then tag and push your first image:
@z

@x
    docker login myregistrydomain.com:5043
    docker tag ubuntu myregistrydomain.com:5043/test
    docker push myregistrydomain.com:5043/test
@y
    docker login myregistrydomain.com:5043
    docker tag ubuntu myregistrydomain.com:5043/test
    docker push myregistrydomain.com:5043/test
@z

@x
Now, log in with a "pull-only" user (using `testuser` and `testpassword`), then pull back the image:
@y
Now, log in with a "pull-only" user (using `testuser` and `testpassword`), then pull back the image:
@z

@x
    docker login myregistrydomain.com:5043
    docker pull myregistrydomain.com:5043/test
@y
    docker login myregistrydomain.com:5043
    docker pull myregistrydomain.com:5043/test
@z

@x
Verify that the "pull-only" can NOT push:
@y
Verify that the "pull-only" can NOT push:
@z

@x
    docker push myregistrydomain.com:5043/test
@y
    docker push myregistrydomain.com:5043/test
@z
