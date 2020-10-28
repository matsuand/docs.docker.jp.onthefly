%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Sharing data between 2 couchdb databases
keywords: docker, example, package installation, networking, couchdb,  data volumes
title: Dockerize a CouchDB service
---
@y
---
description: Sharing data between 2 couchdb databases
keywords: docker, example, package installation, networking, couchdb,  data volumes
title: Dockerize a CouchDB service
---
@z

@x
> **Note**
>
> **If you don't like sudo** then see [*Giving non-root access*](../install/linux-postinstall.md#manage-docker-as-a-non-root-user)
@y
> **Note**
>
> **If you don't like sudo** then see [*Giving non-root access*](../install/linux-postinstall.md#manage-docker-as-a-non-root-user)
@z

@x
Here's an example of using data volumes to share the same data between
two CouchDB containers. This could be used for hot upgrades, testing
different versions of CouchDB on the same data, etc.
@y
Here's an example of using data volumes to share the same data between
two CouchDB containers. This could be used for hot upgrades, testing
different versions of CouchDB on the same data, etc.
@z

@x
## Create first database
@y
## Create first database
@z

@x
We're marking `/var/lib/couchdb` as a data volume.
@y
We're marking `/var/lib/couchdb` as a data volume.
@z

@x
```bash
$ COUCH1=$(docker run -d -p 5984 -v /var/lib/couchdb shykes/couchdb:2013-05-03)
```
@y
```bash
$ COUCH1=$(docker run -d -p 5984 -v /var/lib/couchdb shykes/couchdb:2013-05-03)
```
@z

@x
## Add data to the first database
@y
## Add data to the first database
@z

@x
We're assuming your Docker host is reachable at `localhost`. If not,
replace `localhost` with the public IP of your Docker host.
@y
We're assuming your Docker host is reachable at `localhost`. If not,
replace `localhost` with the public IP of your Docker host.
@z

@x
```bash
$ HOST=localhost
$ URL="http://$HOST:$(docker port $COUCH1 5984 | grep -o '[1-9][0-9]*$')/_utils/"
$ echo "Navigate to $URL in your browser, and use the couch interface to add data"
```
@y
```bash
$ HOST=localhost
$ URL="http://$HOST:$(docker port $COUCH1 5984 | grep -o '[1-9][0-9]*$')/_utils/"
$ echo "Navigate to $URL in your browser, and use the couch interface to add data"
```
@z

@x
## Create second database
@y
## Create second database
@z

@x
This time, we're requesting shared access to `$COUCH1`'s volumes.
@y
This time, we're requesting shared access to `$COUCH1`'s volumes.
@z

@x
```bash
$ COUCH2=$(docker run -d -p 5984 --volumes-from $COUCH1 shykes/couchdb:2013-05-03)
```
@y
```bash
$ COUCH2=$(docker run -d -p 5984 --volumes-from $COUCH1 shykes/couchdb:2013-05-03)
```
@z

@x
## Browse data on the second database
@y
## Browse data on the second database
@z

@x
```bash
$ HOST=localhost
$ URL="http://$HOST:$(docker port $COUCH2 5984 | grep -o '[1-9][0-9]*$')/_utils/"
$ echo "Navigate to $URL in your browser. You should see the same data as in the first database"'!'
```
@y
```bash
$ HOST=localhost
$ URL="http://$HOST:$(docker port $COUCH2 5984 | grep -o '[1-9][0-9]*$')/_utils/"
$ echo "Navigate to $URL in your browser. You should see the same data as in the first database"'!'
```
@z

@x
Congratulations, you are now running two Couchdb containers, completely
isolated from each other *except* for their data.
@y
Congratulations, you are now running two Couchdb containers, completely
isolated from each other *except* for their data.
@z
