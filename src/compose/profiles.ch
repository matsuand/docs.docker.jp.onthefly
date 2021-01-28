%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Using profiles with Compose
desription: Using profiles with Compose
keywords: cli, compose, profile, profiles reference
---
@y
---
title: Using profiles with Compose
desription: Using profiles with Compose
keywords: cli, compose, profile, profiles reference
---
@z

@x
Profiles allow adjusting the Compose application model for various usages and
environments by selectively enabling services.
This is achieved by assigning each service to zero or more profiles. If
unassigned, the service is _always_ started but if assigned, it is only started
if the profile is activated.
@y
Profiles allow adjusting the Compose application model for various usages and
environments by selectively enabling services.
This is achieved by assigning each service to zero or more profiles. If
unassigned, the service is _always_ started but if assigned, it is only started
if the profile is activated.
@z

@x
This allows one to define additional services in a single `docker-compose.yml` file
that should only be started in specific scenarios, e.g. for debugging or
development tasks.
@y
This allows one to define additional services in a single `docker-compose.yml` file
that should only be started in specific scenarios, e.g. for debugging or
development tasks.
@z

@x
## Assigning profiles to services
@y
## Assigning profiles to services
@z

@x
Services are associated with profiles through the
[`profiles` attribute](compose-file/compose-file-v3.md#profiles) which takes an
array of profile names:
@y
Services are associated with profiles through the
[`profiles` attribute](compose-file/compose-file-v3.md#profiles) which takes an
array of profile names:
@z

@x
```yaml
version: "{{ site.compose_file_v3 }}"
services:
  frontend:
    image: frontend
    profiles: ["frontend"]
@y
```yaml
version: "{{ site.compose_file_v3 }}"
services:
  frontend:
    image: frontend
    profiles: ["frontend"]
@z

@x
  phpmyadmin:
    image: phpmyadmin
    depends_on:
      - db
    profiles:
      - debug
@y
  phpmyadmin:
    image: phpmyadmin
    depends_on:
      - db
    profiles:
      - debug
@z

@x
  backend:
    image: backend
@y
  backend:
    image: backend
@z

@x
  db:
    image: mysql
```
@y
  db:
    image: mysql
```
@z

@x
Here the services `frontend` and `phpmyadmin` are assigned to the profiles
`frontend` and `debug` respectively and as such are only started when their
respective profiles are enabled.
@y
Here the services `frontend` and `phpmyadmin` are assigned to the profiles
`frontend` and `debug` respectively and as such are only started when their
respective profiles are enabled.
@z

@x
Services without a `profiles` attribute will _always_ be enabled, i.e. in this
case running `docker-compose up` would only start `backend` and `db`.
@y
Services without a `profiles` attribute will _always_ be enabled, i.e. in this
case running `docker-compose up` would only start `backend` and `db`.
@z

@x
Valid profile names follow the regex format of `[a-zA-Z0-9][a-zA-Z0-9_.-]+`.
@y
Valid profile names follow the regex format of `[a-zA-Z0-9][a-zA-Z0-9_.-]+`.
@z

@x
> **Note**
>
> The core services of your application should not be assigned `profiles` so
> they will always be enabled and automatically started.
@y
> **Note**
>
> The core services of your application should not be assigned `profiles` so
> they will always be enabled and automatically started.
@z

@x
## Enabling profiles
@y
## Enabling profiles
@z

@x
To enable a profile supply the `--profile` [command-line option](reference/overview.md) or
use the [`COMPOSE_PROFILES` environment variable](reference/envvars.md#compose_profiles):
@y
To enable a profile supply the `--profile` [command-line option](reference/overview.md) or
use the [`COMPOSE_PROFILES` environment variable](reference/envvars.md#compose_profiles):
@z

@x
```sh
$ docker-compose --profile debug up
$ COMPOSE_PROFILES=debug docker-compose up
```
@y
```sh
$ docker-compose --profile debug up
$ COMPOSE_PROFILES=debug docker-compose up
```
@z

@x
The above command would both start your application with the `debug` profile enabled.
Using the `docker-compose.yml` file above, this would start the services `backend`,
`db` and `phpmyadmin`.
@y
The above command would both start your application with the `debug` profile enabled.
Using the `docker-compose.yml` file above, this would start the services `backend`,
`db` and `phpmyadmin`.
@z

@x
Multiple profiles can be specified by passing multiple `--profile` flags or
a comma-separated list for the `COMPOSE_PROFILES` environment variable:
@y
Multiple profiles can be specified by passing multiple `--profile` flags or
a comma-separated list for the `COMPOSE_PROFILES` environment variable:
@z

@x
```sh
$ docker-compose --profile frontend --profile debug up
$ COMPOSE_PROFILES=frontend,debug docker-compose up
```
@y
```sh
$ docker-compose --profile frontend --profile debug up
$ COMPOSE_PROFILES=frontend,debug docker-compose up
```
@z

@x
## Auto-enabling profiles and dependency resolution
@y
## Auto-enabling profiles and dependency resolution
@z

@x
When a service with assigned `profiles` is explicitly targeted on the command
line its profiles will be enabled automatically so you don't need to enable them
manually. This can be used for one-off services and debugging tools.
As an example consider this configuration:
@y
When a service with assigned `profiles` is explicitly targeted on the command
line its profiles will be enabled automatically so you don't need to enable them
manually. This can be used for one-off services and debugging tools.
As an example consider this configuration:
@z

@x
```yaml
version: "{{ site.compose_file_v3 }}"
services:
  backend:
    image: backend
@y
```yaml
version: "{{ site.compose_file_v3 }}"
services:
  backend:
    image: backend
@z

@x
  db:
    image: mysql
@y
  db:
    image: mysql
@z

@x
  db-migrations:
    image: backend
    command: myapp migrate
    depends_on:
      - db
    profiles:
      - tools
```
@y
  db-migrations:
    image: backend
    command: myapp migrate
    depends_on:
      - db
    profiles:
      - tools
```
@z

@x
```sh
# will only start backend and db
$ docker-compose up -d
@y
```sh
# will only start backend and db
$ docker-compose up -d
@z

@x
# this will run db-migrations (and - if necessary - start db)
# by implicitly enabling profile `tools`
$ docker-compose run db-migrations
```
@y
# this will run db-migrations (and - if necessary - start db)
# by implicitly enabling profile `tools`
$ docker-compose run db-migrations
```
@z

@x
But keep in mind that `docker-compose` will only automatically enable the
profiles of the services on the command line and not of any dependencies. This
means that all services the targeted service `depends_on` must have a common
profile with it, be always enabled (by omitting `profiles`) or have a matching
profile enabled explicitly:
@y
But keep in mind that `docker-compose` will only automatically enable the
profiles of the services on the command line and not of any dependencies. This
means that all services the targeted service `depends_on` must have a common
profile with it, be always enabled (by omitting `profiles`) or have a matching
profile enabled explicitly:
@z

@x
```yaml
version: "{{ site.compose_file_v3 }}"
services:
  web:
    image: web
@y
```yaml
version: "{{ site.compose_file_v3 }}"
services:
  web:
    image: web
@z

@x
  mock-backend:
    image: backend
    profiles: ["dev"]
    depends_on:
      - db
@y
  mock-backend:
    image: backend
    profiles: ["dev"]
    depends_on:
      - db
@z

@x
  db:
    image: mysql
    profiles: ["dev"]
@y
  db:
    image: mysql
    profiles: ["dev"]
@z

@x
  phpmyadmin:
    image: phpmyadmin
    profiles: ["debug"]
    depends_on:
      - db
```
@y
  phpmyadmin:
    image: phpmyadmin
    profiles: ["debug"]
    depends_on:
      - db
```
@z

@x
```sh
# will only start "web"
$ docker-compose up -d
@y
```sh
# will only start "web"
$ docker-compose up -d
@z

@x
# this will start mock-backend (and - if necessary - db)
# by implicitly enabling profile `dev`
$ docker-compose up -d mock-backend
@y
# this will start mock-backend (and - if necessary - db)
# by implicitly enabling profile `dev`
$ docker-compose up -d mock-backend
@z

@x
# this will fail because profile "dev" is disabled
$ docker-compose up phpmyadmin
```
@y
# this will fail because profile "dev" is disabled
$ docker-compose up phpmyadmin
```
@z

@x
Although targeting `phpmyadmin` will automatically enable its profiles - i.e.
`debug` - it will not automatically enable the profile(s) required by `db` -
i.e. `dev`. To fix this you either have to add the `debug` profile to the `db` service:
@y
Although targeting `phpmyadmin` will automatically enable its profiles - i.e.
`debug` - it will not automatically enable the profile(s) required by `db` -
i.e. `dev`. To fix this you either have to add the `debug` profile to the `db` service:
@z

@x
```yaml
db:
  image: mysql
  profiles: ["debug", "dev"]
```
@y
```yaml
db:
  image: mysql
  profiles: ["debug", "dev"]
```
@z

@x
or enable a profile of `db` explicitly:
@y
or enable a profile of `db` explicitly:
@z

@x
```sh
# profile "debug" is enabled automatically by targeting phpmyadmin
$ docker-compose --profile dev up phpmyadmin
$ COMPOSE_PROFILES=dev docker-compose up phpmyadmin
```
@y
```sh
# profile "debug" is enabled automatically by targeting phpmyadmin
$ docker-compose --profile dev up phpmyadmin
$ COMPOSE_PROFILES=dev docker-compose up phpmyadmin
```
@z

@x
## Compose documentation
@y
## Compose documentation
@z

@x
- [User guide](index.md)
- [Installing Compose](install.md)
- [Getting Started](gettingstarted.md)
- [Command line reference](reference/index.md)
- [Compose file reference](compose-file/index.md)
- [Sample apps with Compose](samples-for-compose.md)
@y
- [User guide](index.md)
- [Installing Compose](install.md)
- [Getting Started](gettingstarted.md)
- [Command line reference](reference/index.md)
- [Compose file reference](compose-file/index.md)
- [Sample apps with Compose](samples-for-compose.md)
@z
