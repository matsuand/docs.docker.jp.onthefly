%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: "Token Authentication Implementation"
description: "Describe the reference implementation of the Docker Registry v2 authentication schema"
keywords: registry, on-prem, images, tags, repository, distribution, JWT authentication, advanced
---
@y
---
title: "Token Authentication Implementation"
description: "Describe the reference implementation of the Docker Registry v2 authentication schema"
keywords: registry, on-prem, images, tags, repository, distribution, JWT authentication, advanced
---
@z

@x
# Docker Registry v2 Bearer token specification
@y
# Docker Registry v2 Bearer token specification
@z

@x
This specification covers the `docker/distribution` implementation of the
v2 Registry's authentication schema.  Specifically, it describes the JSON
Web Token schema that `docker/distribution` has adopted to implement the
client-opaque Bearer token issued by an authentication service and
understood by the registry.
@y
This specification covers the `docker/distribution` implementation of the
v2 Registry's authentication schema.  Specifically, it describes the JSON
Web Token schema that `docker/distribution` has adopted to implement the
client-opaque Bearer token issued by an authentication service and
understood by the registry.
@z

@x
This document borrows heavily from the [JSON Web Token Draft Spec](https://tools.ietf.org/html/draft-ietf-oauth-json-web-token-32)
@y
This document borrows heavily from the [JSON Web Token Draft Spec](https://tools.ietf.org/html/draft-ietf-oauth-json-web-token-32)
@z

@x
## Getting a Bearer Token
@y
## Getting a Bearer Token
@z

@x
For this example, the client makes an HTTP GET request to the following URL:
@y
For this example, the client makes an HTTP GET request to the following URL:
@z

@x
```
https://auth.docker.io/token?service=registry.docker.io&scope=repository:samalba/my-app:pull,push
```
@y
```
https://auth.docker.io/token?service=registry.docker.io&scope=repository:samalba/my-app:pull,push
```
@z

@x
The token server should first attempt to authenticate the client using any
authentication credentials provided with the request. As of Docker 1.8, the
registry client in the Docker Engine only supports Basic Authentication to
these token servers. If an attempt to authenticate to the token server fails,
the token server should return a `401 Unauthorized` response indicating that
the provided credentials are invalid.
@y
The token server should first attempt to authenticate the client using any
authentication credentials provided with the request. As of Docker 1.8, the
registry client in the Docker Engine only supports Basic Authentication to
these token servers. If an attempt to authenticate to the token server fails,
the token server should return a `401 Unauthorized` response indicating that
the provided credentials are invalid.
@z

@x
Whether the token server requires authentication is up to the policy of that
access control provider. Some requests may require authentication to determine
access (such as pushing or pulling a private repository) while others may not
(such as pulling from a public repository).
@y
Whether the token server requires authentication is up to the policy of that
access control provider. Some requests may require authentication to determine
access (such as pushing or pulling a private repository) while others may not
(such as pulling from a public repository).
@z

@x
After authenticating the client (which may simply be an anonymous client if
no attempt was made to authenticate), the token server must next query its
access control list to determine whether the client has the requested scope. In
this example request, if I have authenticated as user `jlhawn`, the token
server will determine what access I have to the repository `samalba/my-app`
hosted by the entity `registry.docker.io`.
@y
After authenticating the client (which may simply be an anonymous client if
no attempt was made to authenticate), the token server must next query its
access control list to determine whether the client has the requested scope. In
this example request, if I have authenticated as user `jlhawn`, the token
server will determine what access I have to the repository `samalba/my-app`
hosted by the entity `registry.docker.io`.
@z

@x
Once the token server has determined what access the client has to the
resources requested in the `scope` parameter, it will take the intersection of
the set of requested actions on each resource and the set of actions that the
client has in fact been granted. If the client only has a subset of the
requested access **it must not be considered an error** as it is not the
responsibility of the token server to indicate authorization errors as part of
this workflow.
@y
Once the token server has determined what access the client has to the
resources requested in the `scope` parameter, it will take the intersection of
the set of requested actions on each resource and the set of actions that the
client has in fact been granted. If the client only has a subset of the
requested access **it must not be considered an error** as it is not the
responsibility of the token server to indicate authorization errors as part of
this workflow.
@z

@x
Continuing with the example request, the token server will find that the
client's set of granted access to the repository is `[pull, push]` which when
intersected with the requested access `[pull, push]` yields an equal set. If
the granted access set was found only to be `[pull]` then the intersected set
would only be `[pull]`. If the client has no access to the repository then the
intersected set would be empty, `[]`.
@y
Continuing with the example request, the token server will find that the
client's set of granted access to the repository is `[pull, push]` which when
intersected with the requested access `[pull, push]` yields an equal set. If
the granted access set was found only to be `[pull]` then the intersected set
would only be `[pull]`. If the client has no access to the repository then the
intersected set would be empty, `[]`.
@z

@x
It is this intersected set of access which is placed in the returned token.
@y
It is this intersected set of access which is placed in the returned token.
@z

@x
The server will now construct a JSON Web Token to sign and return. A JSON Web
Token has 3 main parts:
@y
The server will now construct a JSON Web Token to sign and return. A JSON Web
Token has 3 main parts:
@z

@x
1.  Headers
@y
1.  Headers
@z

@x
    The header of a JSON Web Token is a standard JOSE header. The "typ" field
    will be "JWT" and it will also contain the "alg" which identifies the
    signing algorithm used to produce the signature. It also must have a "kid"
    field, representing the ID of the key which was used to sign the token.
@y
    The header of a JSON Web Token is a standard JOSE header. The "typ" field
    will be "JWT" and it will also contain the "alg" which identifies the
    signing algorithm used to produce the signature. It also must have a "kid"
    field, representing the ID of the key which was used to sign the token.
@z

@x
    The "kid" field has to be in a libtrust fingerprint compatible format.
    Such a format can be generated by following steps:
@y
    The "kid" field has to be in a libtrust fingerprint compatible format.
    Such a format can be generated by following steps:
@z

@x
    1.  Take the DER encoded public key which the JWT token was signed against.
@y
    1.  Take the DER encoded public key which the JWT token was signed against.
@z

@x
    2.  Create a SHA256 hash out of it and truncate to 240bits.
@y
    2.  Create a SHA256 hash out of it and truncate to 240bits.
@z

@x
    3.  Split the result into 12 base32 encoded groups with `:` as delimiter.
@y
    3.  Split the result into 12 base32 encoded groups with `:` as delimiter.
@z

@x
    Here is an example JOSE Header for a JSON Web Token (formatted with
    whitespace for readability):
@y
    Here is an example JOSE Header for a JSON Web Token (formatted with
    whitespace for readability):
@z

@x
    ```
    {
        "typ": "JWT",
        "alg": "ES256",
        "kid": "PYYO:TEWU:V7JH:26JV:AQTZ:LJC3:SXVJ:XGHA:34F2:2LAQ:ZRMK:Z7Q6"
    }
    ```
@y
    ```
    {
        "typ": "JWT",
        "alg": "ES256",
        "kid": "PYYO:TEWU:V7JH:26JV:AQTZ:LJC3:SXVJ:XGHA:34F2:2LAQ:ZRMK:Z7Q6"
    }
    ```
@z

@x
    It specifies that this object is going to be a JSON Web token signed using
    the key with the given ID using the Elliptic Curve signature algorithm
    using a SHA256 hash.
@y
    It specifies that this object is going to be a JSON Web token signed using
    the key with the given ID using the Elliptic Curve signature algorithm
    using a SHA256 hash.
@z

@x
2.  Claim Set
@y
2.  Claim Set
@z

@x
    The Claim Set is a JSON struct containing these standard registered claim
    name fields:
@y
    The Claim Set is a JSON struct containing these standard registered claim
    name fields:
@z

@x
    <dl>
        <dt>
            <code>iss</code> (Issuer)
        </dt>
        <dd>
            The issuer of the token, typically the fqdn of the authorization
            server.
        </dd>
        <dt>
            <code>sub</code> (Subject)
        </dt>
        <dd>
            The subject of the token; the name or id of the client which
            requested it. This should be empty (`""`) if the client did not
            authenticate.
        </dd>
        <dt>
            <code>aud</code> (Audience)
        </dt>
        <dd>
            The intended audience of the token; the name or id of the service
            which will verify the token to authorize the client/subject.
        </dd>
        <dt>
            <code>exp</code> (Expiration)
        </dt>
        <dd>
            The token should only be considered valid up to this specified date
            and time.
        </dd>
        <dt>
            <code>nbf</code> (Not Before)
        </dt>
        <dd>
            The token should not be considered valid before this specified date
            and time.
        </dd>
        <dt>
            <code>iat</code> (Issued At)
        </dt>
        <dd>
            Specifies the date and time which the Authorization server
            generated this token.
        </dd>
        <dt>
            <code>jti</code> (JWT ID)
        </dt>
        <dd>
            A unique identifier for this token. Can be used by the intended
            audience to prevent replays of the token.
        </dd>
    </dl>
@y
    <dl>
        <dt>
            <code>iss</code> (Issuer)
        </dt>
        <dd>
            The issuer of the token, typically the fqdn of the authorization
            server.
        </dd>
        <dt>
            <code>sub</code> (Subject)
        </dt>
        <dd>
            The subject of the token; the name or id of the client which
            requested it. This should be empty (`""`) if the client did not
            authenticate.
        </dd>
        <dt>
            <code>aud</code> (Audience)
        </dt>
        <dd>
            The intended audience of the token; the name or id of the service
            which will verify the token to authorize the client/subject.
        </dd>
        <dt>
            <code>exp</code> (Expiration)
        </dt>
        <dd>
            The token should only be considered valid up to this specified date
            and time.
        </dd>
        <dt>
            <code>nbf</code> (Not Before)
        </dt>
        <dd>
            The token should not be considered valid before this specified date
            and time.
        </dd>
        <dt>
            <code>iat</code> (Issued At)
        </dt>
        <dd>
            Specifies the date and time which the Authorization server
            generated this token.
        </dd>
        <dt>
            <code>jti</code> (JWT ID)
        </dt>
        <dd>
            A unique identifier for this token. Can be used by the intended
            audience to prevent replays of the token.
        </dd>
    </dl>
@z

@x
    The Claim Set will also contain a private claim name unique to this
    authorization server specification:
@y
    The Claim Set will also contain a private claim name unique to this
    authorization server specification:
@z

@x
    <dl>
        <dt>
            <code>access</code>
        </dt>
        <dd>
            An array of access entry objects with the following fields:
@y
    <dl>
        <dt>
            <code>access</code>
        </dt>
        <dd>
            An array of access entry objects with the following fields:
@z

@x
            <dl>
                <dt>
                    <code>type</code>
                </dt>
                <dd>
                    The type of resource hosted by the service.
                </dd>
                <dt>
                    <code>name</code>
                </dt>
                <dd>
                    The name of the resource of the given type hosted by the
                    service.
                </dd>
                <dt>
                    <code>actions</code>
                </dt>
                <dd>
                    An array of strings which give the actions authorized on
                    this resource.
                </dd>
            </dl>
        </dd>
    </dl>
@y
            <dl>
                <dt>
                    <code>type</code>
                </dt>
                <dd>
                    The type of resource hosted by the service.
                </dd>
                <dt>
                    <code>name</code>
                </dt>
                <dd>
                    The name of the resource of the given type hosted by the
                    service.
                </dd>
                <dt>
                    <code>actions</code>
                </dt>
                <dd>
                    An array of strings which give the actions authorized on
                    this resource.
                </dd>
            </dl>
        </dd>
    </dl>
@z

@x
    Here is an example of such a JWT Claim Set (formatted with whitespace for
    readability):
@y
    Here is an example of such a JWT Claim Set (formatted with whitespace for
    readability):
@z

@x
    ```
    {
        "iss": "auth.docker.com",
        "sub": "jlhawn",
        "aud": "registry.docker.com",
        "exp": 1415387315,
        "nbf": 1415387015,
        "iat": 1415387015,
        "jti": "tYJCO1c6cnyy7kAn0c7rKPgbV1H1bFws",
        "access": [
            {
                "type": "repository",
                "name": "samalba/my-app",
                "actions": [
                    "pull",
                    "push"
                ]
            }
        ]
    }
    ```
@y
    ```
    {
        "iss": "auth.docker.com",
        "sub": "jlhawn",
        "aud": "registry.docker.com",
        "exp": 1415387315,
        "nbf": 1415387015,
        "iat": 1415387015,
        "jti": "tYJCO1c6cnyy7kAn0c7rKPgbV1H1bFws",
        "access": [
            {
                "type": "repository",
                "name": "samalba/my-app",
                "actions": [
                    "pull",
                    "push"
                ]
            }
        ]
    }
    ```
@z

@x
3.  Signature
@y
3.  Signature
@z

@x
    The authorization server will produce a JOSE header and Claim Set with no
    extraneous whitespace, i.e., the JOSE Header from above would be
@y
    The authorization server will produce a JOSE header and Claim Set with no
    extraneous whitespace, i.e., the JOSE Header from above would be
@z

@x
    ```
    {"typ":"JWT","alg":"ES256","kid":"PYYO:TEWU:V7JH:26JV:AQTZ:LJC3:SXVJ:XGHA:34F2:2LAQ:ZRMK:Z7Q6"}
    ```
@y
    ```
    {"typ":"JWT","alg":"ES256","kid":"PYYO:TEWU:V7JH:26JV:AQTZ:LJC3:SXVJ:XGHA:34F2:2LAQ:ZRMK:Z7Q6"}
    ```
@z

@x
    and the Claim Set from above would be
@y
    and the Claim Set from above would be
@z

@x
    ```
    {"iss":"auth.docker.com","sub":"jlhawn","aud":"registry.docker.com","exp":1415387315,"nbf":1415387015,"iat":1415387015,"jti":"tYJCO1c6cnyy7kAn0c7rKPgbV1H1bFws","access":[{"type":"repository","name":"samalba/my-app","actions":["push","pull"]}]}
    ```
@y
    ```
    {"iss":"auth.docker.com","sub":"jlhawn","aud":"registry.docker.com","exp":1415387315,"nbf":1415387015,"iat":1415387015,"jti":"tYJCO1c6cnyy7kAn0c7rKPgbV1H1bFws","access":[{"type":"repository","name":"samalba/my-app","actions":["push","pull"]}]}
    ```
@z

@x
    The utf-8 representation of this JOSE header and Claim Set are then
    url-safe base64 encoded (sans trailing '=' buffer), producing:
@y
    The utf-8 representation of this JOSE header and Claim Set are then
    url-safe base64 encoded (sans trailing '=' buffer), producing:
@z

@x
    ```
    eyJ0eXAiOiJKV1QiLCJhbGciOiJFUzI1NiIsImtpZCI6IlBZWU86VEVXVTpWN0pIOjI2SlY6QVFUWjpMSkMzOlNYVko6WEdIQTozNEYyOjJMQVE6WlJNSzpaN1E2In0
    ```
@y
    ```
    eyJ0eXAiOiJKV1QiLCJhbGciOiJFUzI1NiIsImtpZCI6IlBZWU86VEVXVTpWN0pIOjI2SlY6QVFUWjpMSkMzOlNYVko6WEdIQTozNEYyOjJMQVE6WlJNSzpaN1E2In0
    ```
@z

@x
    for the JOSE Header and
@y
    for the JOSE Header and
@z

@x
    ```
    eyJpc3MiOiJhdXRoLmRvY2tlci5jb20iLCJzdWIiOiJqbGhhd24iLCJhdWQiOiJyZWdpc3RyeS5kb2NrZXIuY29tIiwiZXhwIjoxNDE1Mzg3MzE1LCJuYmYiOjE0MTUzODcwMTUsImlhdCI6MTQxNTM4NzAxNSwianRpIjoidFlKQ08xYzZjbnl5N2tBbjBjN3JLUGdiVjFIMWJGd3MiLCJhY2Nlc3MiOlt7InR5cGUiOiJyZXBvc2l0b3J5IiwibmFtZSI6InNhbWFsYmEvbXktYXBwIiwiYWN0aW9ucyI6WyJwdXNoIl19XX0
    ```
@y
    ```
    eyJpc3MiOiJhdXRoLmRvY2tlci5jb20iLCJzdWIiOiJqbGhhd24iLCJhdWQiOiJyZWdpc3RyeS5kb2NrZXIuY29tIiwiZXhwIjoxNDE1Mzg3MzE1LCJuYmYiOjE0MTUzODcwMTUsImlhdCI6MTQxNTM4NzAxNSwianRpIjoidFlKQ08xYzZjbnl5N2tBbjBjN3JLUGdiVjFIMWJGd3MiLCJhY2Nlc3MiOlt7InR5cGUiOiJyZXBvc2l0b3J5IiwibmFtZSI6InNhbWFsYmEvbXktYXBwIiwiYWN0aW9ucyI6WyJwdXNoIl19XX0
    ```
@z

@x
    for the Claim Set. These two are concatenated using a '.' character,
    yielding the string:
@y
    for the Claim Set. These two are concatenated using a '.' character,
    yielding the string:
@z

@x
    ```
    eyJ0eXAiOiJKV1QiLCJhbGciOiJFUzI1NiIsImtpZCI6IlBZWU86VEVXVTpWN0pIOjI2SlY6QVFUWjpMSkMzOlNYVko6WEdIQTozNEYyOjJMQVE6WlJNSzpaN1E2In0.eyJpc3MiOiJhdXRoLmRvY2tlci5jb20iLCJzdWIiOiJqbGhhd24iLCJhdWQiOiJyZWdpc3RyeS5kb2NrZXIuY29tIiwiZXhwIjoxNDE1Mzg3MzE1LCJuYmYiOjE0MTUzODcwMTUsImlhdCI6MTQxNTM4NzAxNSwianRpIjoidFlKQ08xYzZjbnl5N2tBbjBjN3JLUGdiVjFIMWJGd3MiLCJhY2Nlc3MiOlt7InR5cGUiOiJyZXBvc2l0b3J5IiwibmFtZSI6InNhbWFsYmEvbXktYXBwIiwiYWN0aW9ucyI6WyJwdXNoIl19XX0
    ```
@y
    ```
    eyJ0eXAiOiJKV1QiLCJhbGciOiJFUzI1NiIsImtpZCI6IlBZWU86VEVXVTpWN0pIOjI2SlY6QVFUWjpMSkMzOlNYVko6WEdIQTozNEYyOjJMQVE6WlJNSzpaN1E2In0.eyJpc3MiOiJhdXRoLmRvY2tlci5jb20iLCJzdWIiOiJqbGhhd24iLCJhdWQiOiJyZWdpc3RyeS5kb2NrZXIuY29tIiwiZXhwIjoxNDE1Mzg3MzE1LCJuYmYiOjE0MTUzODcwMTUsImlhdCI6MTQxNTM4NzAxNSwianRpIjoidFlKQ08xYzZjbnl5N2tBbjBjN3JLUGdiVjFIMWJGd3MiLCJhY2Nlc3MiOlt7InR5cGUiOiJyZXBvc2l0b3J5IiwibmFtZSI6InNhbWFsYmEvbXktYXBwIiwiYWN0aW9ucyI6WyJwdXNoIl19XX0
    ```
@z

@x
    This is then used as the payload to a the `ES256` signature algorithm
    specified in the JOSE header and specified fully in [Section 3.4 of the JSON Web Algorithms (JWA)
    draft specification](https://tools.ietf.org/html/draft-ietf-jose-json-web-algorithms-38#section-3.4)
@y
    This is then used as the payload to a the `ES256` signature algorithm
    specified in the JOSE header and specified fully in [Section 3.4 of the JSON Web Algorithms (JWA)
    draft specification](https://tools.ietf.org/html/draft-ietf-jose-json-web-algorithms-38#section-3.4)
@z

@x
    This example signature will use the following ECDSA key for the server:
@y
    This example signature will use the following ECDSA key for the server:
@z

@x
    ```
    {
        "kty": "EC",
        "crv": "P-256",
        "kid": "PYYO:TEWU:V7JH:26JV:AQTZ:LJC3:SXVJ:XGHA:34F2:2LAQ:ZRMK:Z7Q6",
        "d": "R7OnbfMaD5J2jl7GeE8ESo7CnHSBm_1N2k9IXYFrKJA",
        "x": "m7zUpx3b-zmVE5cymSs64POG9QcyEpJaYCD82-549_Q",
        "y": "dU3biz8sZ_8GPB-odm8Wxz3lNDr1xcAQQPQaOcr1fmc"
    }
    ```
@y
    ```
    {
        "kty": "EC",
        "crv": "P-256",
        "kid": "PYYO:TEWU:V7JH:26JV:AQTZ:LJC3:SXVJ:XGHA:34F2:2LAQ:ZRMK:Z7Q6",
        "d": "R7OnbfMaD5J2jl7GeE8ESo7CnHSBm_1N2k9IXYFrKJA",
        "x": "m7zUpx3b-zmVE5cymSs64POG9QcyEpJaYCD82-549_Q",
        "y": "dU3biz8sZ_8GPB-odm8Wxz3lNDr1xcAQQPQaOcr1fmc"
    }
    ```
@z

@x
    A resulting signature of the above payload using this key is:
@y
    A resulting signature of the above payload using this key is:
@z

@x
    ```
    QhflHPfbd6eVF4lM9bwYpFZIV0PfikbyXuLx959ykRTBpe3CYnzs6YBK8FToVb5R47920PVLrh8zuLzdCr9t3w
    ```
@y
    ```
    QhflHPfbd6eVF4lM9bwYpFZIV0PfikbyXuLx959ykRTBpe3CYnzs6YBK8FToVb5R47920PVLrh8zuLzdCr9t3w
    ```
@z

@x
    Concatenating all of these together with a `.` character gives the
    resulting JWT:
@y
    Concatenating all of these together with a `.` character gives the
    resulting JWT:
@z

@x
    ```
    eyJ0eXAiOiJKV1QiLCJhbGciOiJFUzI1NiIsImtpZCI6IlBZWU86VEVXVTpWN0pIOjI2SlY6QVFUWjpMSkMzOlNYVko6WEdIQTozNEYyOjJMQVE6WlJNSzpaN1E2In0.eyJpc3MiOiJhdXRoLmRvY2tlci5jb20iLCJzdWIiOiJqbGhhd24iLCJhdWQiOiJyZWdpc3RyeS5kb2NrZXIuY29tIiwiZXhwIjoxNDE1Mzg3MzE1LCJuYmYiOjE0MTUzODcwMTUsImlhdCI6MTQxNTM4NzAxNSwianRpIjoidFlKQ08xYzZjbnl5N2tBbjBjN3JLUGdiVjFIMWJGd3MiLCJhY2Nlc3MiOlt7InR5cGUiOiJyZXBvc2l0b3J5IiwibmFtZSI6InNhbWFsYmEvbXktYXBwIiwiYWN0aW9ucyI6WyJwdXNoIl19XX0.QhflHPfbd6eVF4lM9bwYpFZIV0PfikbyXuLx959ykRTBpe3CYnzs6YBK8FToVb5R47920PVLrh8zuLzdCr9t3w
    ```
@y
    ```
    eyJ0eXAiOiJKV1QiLCJhbGciOiJFUzI1NiIsImtpZCI6IlBZWU86VEVXVTpWN0pIOjI2SlY6QVFUWjpMSkMzOlNYVko6WEdIQTozNEYyOjJMQVE6WlJNSzpaN1E2In0.eyJpc3MiOiJhdXRoLmRvY2tlci5jb20iLCJzdWIiOiJqbGhhd24iLCJhdWQiOiJyZWdpc3RyeS5kb2NrZXIuY29tIiwiZXhwIjoxNDE1Mzg3MzE1LCJuYmYiOjE0MTUzODcwMTUsImlhdCI6MTQxNTM4NzAxNSwianRpIjoidFlKQ08xYzZjbnl5N2tBbjBjN3JLUGdiVjFIMWJGd3MiLCJhY2Nlc3MiOlt7InR5cGUiOiJyZXBvc2l0b3J5IiwibmFtZSI6InNhbWFsYmEvbXktYXBwIiwiYWN0aW9ucyI6WyJwdXNoIl19XX0.QhflHPfbd6eVF4lM9bwYpFZIV0PfikbyXuLx959ykRTBpe3CYnzs6YBK8FToVb5R47920PVLrh8zuLzdCr9t3w
    ```
@z

@x
This can now be placed in an HTTP response and returned to the client to use to
authenticate to the audience service:
@y
This can now be placed in an HTTP response and returned to the client to use to
authenticate to the audience service:
@z

@x
```
HTTP/1.1 200 OK
Content-Type: application/json
@y
```
HTTP/1.1 200 OK
Content-Type: application/json
@z

@x
{"token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJFUzI1NiIsImtpZCI6IlBZWU86VEVXVTpWN0pIOjI2SlY6QVFUWjpMSkMzOlNYVko6WEdIQTozNEYyOjJMQVE6WlJNSzpaN1E2In0.eyJpc3MiOiJhdXRoLmRvY2tlci5jb20iLCJzdWIiOiJqbGhhd24iLCJhdWQiOiJyZWdpc3RyeS5kb2NrZXIuY29tIiwiZXhwIjoxNDE1Mzg3MzE1LCJuYmYiOjE0MTUzODcwMTUsImlhdCI6MTQxNTM4NzAxNSwianRpIjoidFlKQ08xYzZjbnl5N2tBbjBjN3JLUGdiVjFIMWJGd3MiLCJhY2Nlc3MiOlt7InR5cGUiOiJyZXBvc2l0b3J5IiwibmFtZSI6InNhbWFsYmEvbXktYXBwIiwiYWN0aW9ucyI6WyJwdXNoIl19XX0.QhflHPfbd6eVF4lM9bwYpFZIV0PfikbyXuLx959ykRTBpe3CYnzs6YBK8FToVb5R47920PVLrh8zuLzdCr9t3w"}
```
@y
{"token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJFUzI1NiIsImtpZCI6IlBZWU86VEVXVTpWN0pIOjI2SlY6QVFUWjpMSkMzOlNYVko6WEdIQTozNEYyOjJMQVE6WlJNSzpaN1E2In0.eyJpc3MiOiJhdXRoLmRvY2tlci5jb20iLCJzdWIiOiJqbGhhd24iLCJhdWQiOiJyZWdpc3RyeS5kb2NrZXIuY29tIiwiZXhwIjoxNDE1Mzg3MzE1LCJuYmYiOjE0MTUzODcwMTUsImlhdCI6MTQxNTM4NzAxNSwianRpIjoidFlKQ08xYzZjbnl5N2tBbjBjN3JLUGdiVjFIMWJGd3MiLCJhY2Nlc3MiOlt7InR5cGUiOiJyZXBvc2l0b3J5IiwibmFtZSI6InNhbWFsYmEvbXktYXBwIiwiYWN0aW9ucyI6WyJwdXNoIl19XX0.QhflHPfbd6eVF4lM9bwYpFZIV0PfikbyXuLx959ykRTBpe3CYnzs6YBK8FToVb5R47920PVLrh8zuLzdCr9t3w"}
```
@z

@x
## Using the signed token
@y
## Using the signed token
@z

@x
Once the client has a token, it will try the registry request again with the
token placed in the HTTP `Authorization` header like so:
@y
Once the client has a token, it will try the registry request again with the
token placed in the HTTP `Authorization` header like so:
@z

@x
```
Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJFUzI1NiIsImtpZCI6IkJWM0Q6MkFWWjpVQjVaOktJQVA6SU5QTDo1RU42Ok40SjQ6Nk1XTzpEUktFOkJWUUs6M0ZKTDpQT1RMIn0.eyJpc3MiOiJhdXRoLmRvY2tlci5jb20iLCJzdWIiOiJCQ0NZOk9VNlo6UUVKNTpXTjJDOjJBVkM6WTdZRDpBM0xZOjQ1VVc6NE9HRDpLQUxMOkNOSjU6NUlVTCIsImF1ZCI6InJlZ2lzdHJ5LmRvY2tlci5jb20iLCJleHAiOjE0MTUzODczMTUsIm5iZiI6MTQxNTM4NzAxNSwiaWF0IjoxNDE1Mzg3MDE1LCJqdGkiOiJ0WUpDTzFjNmNueXk3a0FuMGM3cktQZ2JWMUgxYkZ3cyIsInNjb3BlIjoiamxoYXduOnJlcG9zaXRvcnk6c2FtYWxiYS9teS1hcHA6cHVzaCxwdWxsIGpsaGF3bjpuYW1lc3BhY2U6c2FtYWxiYTpwdWxsIn0.Y3zZSwaZPqy4y9oRBVRImZyv3m_S9XDHF1tWwN7mL52C_IiA73SJkWVNsvNqpJIn5h7A2F8biv_S2ppQ1lgkbw
```
@y
```
Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJFUzI1NiIsImtpZCI6IkJWM0Q6MkFWWjpVQjVaOktJQVA6SU5QTDo1RU42Ok40SjQ6Nk1XTzpEUktFOkJWUUs6M0ZKTDpQT1RMIn0.eyJpc3MiOiJhdXRoLmRvY2tlci5jb20iLCJzdWIiOiJCQ0NZOk9VNlo6UUVKNTpXTjJDOjJBVkM6WTdZRDpBM0xZOjQ1VVc6NE9HRDpLQUxMOkNOSjU6NUlVTCIsImF1ZCI6InJlZ2lzdHJ5LmRvY2tlci5jb20iLCJleHAiOjE0MTUzODczMTUsIm5iZiI6MTQxNTM4NzAxNSwiaWF0IjoxNDE1Mzg3MDE1LCJqdGkiOiJ0WUpDTzFjNmNueXk3a0FuMGM3cktQZ2JWMUgxYkZ3cyIsInNjb3BlIjoiamxoYXduOnJlcG9zaXRvcnk6c2FtYWxiYS9teS1hcHA6cHVzaCxwdWxsIGpsaGF3bjpuYW1lc3BhY2U6c2FtYWxiYTpwdWxsIn0.Y3zZSwaZPqy4y9oRBVRImZyv3m_S9XDHF1tWwN7mL52C_IiA73SJkWVNsvNqpJIn5h7A2F8biv_S2ppQ1lgkbw
```
@z

@x
This is also described in [Section 2.1 of RFC 6750: The OAuth 2.0 Authorization Framework: Bearer Token Usage](https://tools.ietf.org/html/rfc6750#section-2.1)
@y
This is also described in [Section 2.1 of RFC 6750: The OAuth 2.0 Authorization Framework: Bearer Token Usage](https://tools.ietf.org/html/rfc6750#section-2.1)
@z

@x
## Verifying the token
@y
## Verifying the token
@z

@x
The registry must now verify the token presented by the user by inspecting the
claim set within. The registry will:
@y
The registry must now verify the token presented by the user by inspecting the
claim set within. The registry will:
@z

@x
- Ensure that the issuer (`iss` claim) is an authority it trusts.
- Ensure that the registry identifies as the audience (`aud` claim).
- Check that the current time is between the `nbf` and `exp` claim times.
- If enforcing single-use tokens, check that the JWT ID (`jti` claim) value has
  not been seen before.
  - To enforce this, the registry may keep a record of `jti`s it has seen for
    up to the `exp` time of the token to prevent token replays.
- Check the `access` claim value and use the identified resources and the list
  of actions authorized to determine whether the token grants the required
  level of access for the operation the client is attempting to perform.
- Verify that the signature of the token is valid.
@y
- Ensure that the issuer (`iss` claim) is an authority it trusts.
- Ensure that the registry identifies as the audience (`aud` claim).
- Check that the current time is between the `nbf` and `exp` claim times.
- If enforcing single-use tokens, check that the JWT ID (`jti` claim) value has
  not been seen before.
  - To enforce this, the registry may keep a record of `jti`s it has seen for
    up to the `exp` time of the token to prevent token replays.
- Check the `access` claim value and use the identified resources and the list
  of actions authorized to determine whether the token grants the required
  level of access for the operation the client is attempting to perform.
- Verify that the signature of the token is valid.
@z

@x
If any of these requirements are not met, the registry will return a
`403 Forbidden` response to indicate that the token is invalid.
@y
If any of these requirements are not met, the registry will return a
`403 Forbidden` response to indicate that the token is invalid.
@z

@x
**Note**: it is only at this point in the workflow that an authorization error
may occur. The token server should *not* return errors when the user does not
have the requested authorization. Instead, the returned token should indicate
whatever of the requested scope the client does have (the intersection of
requested and granted access). If the token does not supply proper
authorization then the registry will return the appropriate error.
@y
**Note**: it is only at this point in the workflow that an authorization error
may occur. The token server should *not* return errors when the user does not
have the requested authorization. Instead, the returned token should indicate
whatever of the requested scope the client does have (the intersection of
requested and granted access). If the token does not supply proper
authorization then the registry will return the appropriate error.
@z

@x
At no point in this process should the registry need to call back to the
authorization server. The registry only needs to be supplied with the trusted
public keys to verify the token signatures.
@y
At no point in this process should the registry need to call back to the
authorization server. The registry only needs to be supplied with the trusted
public keys to verify the token signatures.
@z
