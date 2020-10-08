#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.69])
AC_INIT([dockerWithCtie], [0.0.0], [matsuand AT osdn DOT me])
AC_CONFIG_SRCDIR([ctie/ctie-k.c])
AC_CONFIG_HEADERS([config.h])
AM_INIT_AUTOMAKE([-Wno-portability])
AM_MAINTAINER_MODE

m4_include([m4/progs.m4])

# Checks for programs.
AC_PROG_CC

# Checks for libraries.

# Checks for header files.
AC_CHECK_HEADERS([malloc.h stdlib.h])

# Checks for typedefs, structures, and compiler characteristics.
AC_CHECK_HEADER_STDBOOL

# Checks for library functions.
AC_FUNC_MALLOC
AC_CHECK_FUNCS([strerror])

AC_CONFIG_FILES([Makefile
		 ctie/Makefile
		 src/Makefile
		 src/_data/Makefile
		 src/_data/buildx/Makefile
		 src/_data/cluster/Makefile
		 src/_data/docker-app/Makefile
		 src/_data/docsarchive/Makefile
		 src/_data/engine-cli/Makefile
		 src/_data/registry-cli/Makefile
		 src/_includes/Makefile
		 src/_includes/analytics/Makefile
		 src/_includes/content/Makefile
		 src/_includes/content/ssh/Makefile
		 src/_includes/landing-page/Makefile
		 src/_layouts/Makefile
		 src/_samples/Makefile
		 src/_samples/library/Makefile
		 src/_scss/Makefile
		 src/app/Makefile
		 src/buildx/Makefile
		 src/compliance/Makefile
		 src/compliance/cis/Makefile
		 src/compliance/images/Makefile
		 src/compliance/nist/Makefile
		 src/compliance/reference/Makefile
		 src/compliance/reference/800-53/Makefile
		 src/compose/Makefile
		 src/compose/compose-file/Makefile
		 src/compose/images/Makefile
		 src/compose/reference/Makefile
		 src/config/Makefile
		 src/config/containers/Makefile
		 src/config/containers/logging/Makefile
		 src/config/daemon/Makefile
		 src/config/daemon/images/Makefile
		 src/css/Makefile
		 src/css/pygments/Makefile
		 src/datacenter/Makefile
		 src/datacenter/dtr/Makefile
		 src/datacenter/dtr/2.0/Makefile
		 src/datacenter/dtr/2.0/configure/Makefile
		 src/datacenter/dtr/2.0/high-availability/Makefile
		 src/datacenter/dtr/2.0/install/Makefile
		 src/datacenter/dtr/2.0/install/upgrade/Makefile
		 src/datacenter/dtr/2.0/monitor-troubleshoot/Makefile
		 src/datacenter/dtr/2.0/release-notes/Makefile
		 src/datacenter/dtr/2.0/repos-and-images/Makefile
		 src/datacenter/dtr/2.0/user-management/Makefile
		 src/datacenter/dtr/2.1/Makefile
		 src/datacenter/dtr/2.1/guides/Makefile
		 src/datacenter/dtr/2.4/Makefile
		 src/datacenter/dtr/2.4/guides/Makefile
		 src/datacenter/dtr/2.4/guides/admin/Makefile
		 src/datacenter/dtr/2.4/guides/admin/configure/Makefile
		 src/datacenter/dtr/2.5/Makefile
		 src/datacenter/dtr/2.5/guides/Makefile
		 src/datacenter/dtr/2.5/reference/Makefile
		 src/datacenter/dtr/2.5/reference/cli/Makefile
		 src/datacenter/ucp/Makefile
		 src/datacenter/ucp/3.0/Makefile
		 src/datacenter/ucp/3.0/reference/Makefile
		 src/datacenter/ucp/3.0/reference/api/Makefile
		 src/datacenter/ucp/3.0/reference/cli/Makefile
		 src/datacenter/ucp/3.1/Makefile
		 src/datacenter/ucp/3.1/guides/Makefile
		 src/datacenter/ucp/3.1/guides/admin/Makefile
		 src/datacenter/ucp/3.1/guides/admin/install/Makefile
		 src/desktop/Makefile
		 src/desktop/enterprise/Makefile
		 src/desktop/enterprise/admin/Makefile
		 src/desktop/enterprise/admin/configure/Makefile
		 src/desktop/enterprise/admin/install/Makefile
		 src/desktop/enterprise/images/Makefile
		 src/desktop/enterprise/troubleshoot/Makefile
		 src/desktop/enterprise/user/Makefile
		 src/desktop/images/Makefile
		 src/develop/Makefile
		 src/develop/develop-images/Makefile
		 src/develop/sdk/Makefile
		 src/docker-for-mac/Makefile
		 src/docker-for-mac/images/Makefile
		 src/docker-for-mac/images/kubernetes/Makefile
		 src/docker-for-mac/images/menu/Makefile
		 src/docker-for-windows/Makefile
		 src/docker-for-windows/images/Makefile
		 src/docker-hub/Makefile
		 src/docker-hub/2fa/Makefile
		 src/docker-hub/billing/Makefile
		 src/docker-hub/builds/Makefile
		 src/docker-hub/builds/images/Makefile
		 src/docker-hub/images/Makefile
		 src/docker-hub/publish/Makefile
		 src/docker-hub/publish/images/Makefile
		 src/docker-id/Makefile
		 src/docker-id/images/Makefile
		 src/ee/Makefile
		 src/ee/admin/Makefile
		 src/ee/admin/backup/Makefile
		 src/ee/docker-ee/Makefile
		 src/ee/docker-ee/windows/Makefile
		 src/ee/ucp/Makefile
		 src/ee/ucp/admin/Makefile
		 src/ee/ucp/admin/monitor-and-troubleshoot/Makefile
		 src/engine/Makefile
		 src/engine/api/Makefile
		 src/engine/api/latest/Makefile
		 src/engine/api/sdk/Makefile
		 src/engine/api/v1.25/Makefile
		 src/engine/api/v1.26/Makefile
		 src/engine/api/v1.27/Makefile
		 src/engine/api/v1.28/Makefile
		 src/engine/api/v1.29/Makefile
		 src/engine/api/v1.30/Makefile
		 src/engine/api/v1.31/Makefile
		 src/engine/api/v1.32/Makefile
		 src/engine/api/v1.33/Makefile
		 src/engine/api/v1.34/Makefile
		 src/engine/api/v1.35/Makefile
		 src/engine/api/v1.36/Makefile
		 src/engine/api/v1.37/Makefile
		 src/engine/api/v1.38/Makefile
		 src/engine/api/v1.39/Makefile
		 src/engine/api/v1.40/Makefile
		 src/engine/context/Makefile
		 src/engine/examples/Makefile
		 src/engine/extend/Makefile
		 src/engine/extend/images/Makefile
		 src/engine/images/Makefile
		 src/engine/install/Makefile
		 src/engine/reference/Makefile
		 src/engine/reference/commandline/Makefile
		 src/engine/release-notes/Makefile
		 src/engine/security/Makefile
		 src/engine/security/https/Makefile
		 src/engine/security/trust/Makefile
		 src/engine/security/trust/images/Makefile
		 src/engine/scan/Makefile
		 src/engine/swarm/Makefile
		 src/engine/swarm/how-swarm-mode-works/Makefile
		 src/engine/swarm/images/Makefile
		 src/engine/swarm/swarm-tutorial/Makefile
		 src/engine/tutorials/Makefile
		 src/get-started/Makefile
		 src/get-started/images/Makefile
		 src/get-started/nodejs/Makefile
		 src/get-started/nodejs/images/Makefile
		 src/images/Makefile
		 src/js/Makefile
		 src/kitematic/Makefile
		 src/kitematic/images/Makefile
		 src/machine/Makefile
		 src/machine/drivers/Makefile
		 src/machine/examples/Makefile
		 src/machine/img/Makefile
		 src/machine/reference/Makefile
		 src/network/Makefile
		 src/notary/Makefile
		 src/notary/images/Makefile
		 src/notary/reference/Makefile
		 src/opensource/Makefile
		 src/opensource/images/Makefile
		 src/reference/Makefile
		 src/registry/Makefile
		 src/registry/images/Makefile
		 src/registry/recipes/Makefile
		 src/registry/recipes/osx/Makefile
		 src/registry/spec/Makefile
		 src/registry/spec/auth/Makefile
		 src/registry/spec/images/Makefile
		 src/registry/storage-drivers/Makefile
		 src/release-notes/Makefile
		 src/samples/Makefile
		 src/storage/Makefile
		 src/storage/images/Makefile
		 src/storage/storagedriver/Makefile
		 src/storage/storagedriver/images/Makefile
		 src/toolbox/Makefile
		 src/toolbox/faqs/Makefile
		 src/toolbox/images/Makefile])
AC_OUTPUT

#                 src/_samples/library/aerospike/Makefile
#                 src/_samples/library/alpine/Makefile
#                 src/_samples/library/alt/Makefile
#                 src/_samples/library/amazoncorretto/Makefile
#                 src/_samples/library/amazonlinux/Makefile
#                 src/_samples/library/arangodb/Makefile
#                 src/_samples/library/backdrop/Makefile
#                 src/_samples/library/bash/Makefile
#                 src/_samples/library/bonita/Makefile
#                 src/_samples/library/buildpack-deps/Makefile
#                 src/_samples/library/busybox/Makefile
#                 src/_samples/library/cassandra/Makefile
#                 src/_samples/library/centos/Makefile
#                 src/_samples/library/chronograf/Makefile
#                 src/_samples/library/cirros/Makefile
#                 src/_samples/library/clearlinux/Makefile
#                 src/_samples/library/clefos/Makefile
#                 src/_samples/library/clojure/Makefile
#                 src/_samples/library/composer/Makefile
#                 src/_samples/library/consul/Makefile
#                 src/_samples/library/convertigo/Makefile
#                 src/_samples/library/couchbase/Makefile
#                 src/_samples/library/couchdb/Makefile
#                 src/_samples/library/crate/Makefile
#                 src/_samples/library/crux/Makefile
#                 src/_samples/library/debian/Makefile
#                 src/_samples/library/docker/Makefile
#                 src/_samples/library/drupal/Makefile
#                 src/_samples/library/eclipse-mosquitto/Makefile
#                 src/_samples/library/eggdrop/Makefile
#                 src/_samples/library/elasticsearch/Makefile
#                 src/_samples/library/elixir/Makefile
#                 src/_samples/library/erlang/Makefile
#                 src/_samples/library/euleros/Makefile
#                 src/_samples/library/express-gateway/Makefile
#                 src/_samples/library/fedora/Makefile
#                 src/_samples/library/flink/Makefile
#                 src/_samples/library/fluentd/Makefile
#                 src/_samples/library/fsharp/Makefile
#                 src/_samples/library/gazebo/Makefile
#                 src/_samples/library/gcc/Makefile
#                 src/_samples/library/geonetwork/Makefile
#                 src/_samples/library/ghost/Makefile
#                 src/_samples/library/golang/Makefile
#                 src/_samples/library/gradle/Makefile
#                 src/_samples/library/groovy/Makefile
#                 src/_samples/library/haproxy/Makefile
#                 src/_samples/library/haskell/Makefile
#                 src/_samples/library/haxe/Makefile
#                 src/_samples/library/hello-world/Makefile
#                 src/_samples/library/httpd/Makefile
#                 src/_samples/library/hylang/Makefile
#                 src/_samples/library/ibmjava/Makefile
#                 src/_samples/library/influxdb/Makefile
#                 src/_samples/library/irssi/Makefile
#                 src/_samples/library/jetty/Makefile
#                 src/_samples/library/joomla/Makefile
#                 src/_samples/library/jruby/Makefile
#                 src/_samples/library/julia/Makefile
#                 src/_samples/library/kaazing-gateway/Makefile
#                 src/_samples/library/kapacitor/Makefile
#                 src/_samples/library/kibana/Makefile
#                 src/_samples/library/known/Makefile
#                 src/_samples/library/kong/Makefile
#                 src/_samples/library/lightstreamer/Makefile
#                 src/_samples/library/logstash/Makefile
#                 src/_samples/library/mageia/Makefile
#                 src/_samples/library/mariadb/Makefile
#                 src/_samples/library/matomo/Makefile
#                 src/_samples/library/maven/Makefile
#                 src/_samples/library/mediawiki/Makefile
#                 src/_samples/library/memcached/Makefile
#                 src/_samples/library/mongo/Makefile
#                 src/_samples/library/mongo-express/Makefile
#                 src/_samples/library/mono/Makefile
#                 src/_samples/library/mysql/Makefile
#                 src/_samples/library/nats/Makefile
#                 src/_samples/library/nats-streaming/Makefile
#                 src/_samples/library/neo4j/Makefile
#                 src/_samples/library/neurodebian/Makefile
#                 src/_samples/library/nextcloud/Makefile
#                 src/_samples/library/nginx/Makefile
#                 src/_samples/library/node/Makefile
#                 src/_samples/library/notary/Makefile
#                 src/_samples/library/nuxeo/Makefile
#                 src/_samples/library/odoo/Makefile
#                 src/_samples/library/open-liberty/Makefile
#                 src/_samples/library/openjdk/Makefile
#                 src/_samples/library/opensuse/Makefile
#                 src/_samples/library/oraclelinux/Makefile
#                 src/_samples/library/orientdb/Makefile
#                 src/_samples/library/percona/Makefile
#                 src/_samples/library/perl/Makefile
#                 src/_samples/library/photon/Makefile
#                 src/_samples/library/php/Makefile
#                 src/_samples/library/php-zendserver/Makefile
#                 src/_samples/library/plone/Makefile
#                 src/_samples/library/postfixadmin/Makefile
#                 src/_samples/library/postgres/Makefile
#                 src/_samples/library/pypy/Makefile
#                 src/_samples/library/python/Makefile
#                 src/_samples/library/r-base/Makefile
#                 src/_samples/library/rabbitmq/Makefile
#                 src/_samples/library/rakudo-star/Makefile
#                 src/_samples/library/rapidoid/Makefile
#                 src/_samples/library/redis/Makefile
#                 src/_samples/library/redmine/Makefile
#                 src/_samples/library/registry/Makefile
#                 src/_samples/library/rethinkdb/Makefile
#                 src/_samples/library/rocket.chat/Makefile
#                 src/_samples/library/ros/Makefile
#                 src/_samples/library/ruby/Makefile
#                 src/_samples/library/rust/Makefile
#                 src/_samples/library/scratch/Makefile
#                 src/_samples/library/sentry/Makefile
#                 src/_samples/library/silverpeas/Makefile
#                 src/_samples/library/sl/Makefile
#                 src/_samples/library/solr/Makefile
#                 src/_samples/library/sonarqube/Makefile
#                 src/_samples/library/sourcemage/Makefile
#                 src/_samples/library/spiped/Makefile
#                 src/_samples/library/storm/Makefile
#                 src/_samples/library/swarm/Makefile
#                 src/_samples/library/swift/Makefile
#                 src/_samples/library/swipl/Makefile
#                 src/_samples/library/teamspeak/Makefile
#                 src/_samples/library/telegraf/Makefile
#                 src/_samples/library/thrift/Makefile
#                 src/_samples/library/tomcat/Makefile
#                 src/_samples/library/tomee/Makefile
#                 src/_samples/library/traefik/Makefile
#                 src/_samples/library/ubuntu/Makefile
#                 src/_samples/library/vault/Makefile
#                 src/_samples/library/websphere-liberty/Makefile
#                 src/_samples/library/wordpress/Makefile
#                 src/_samples/library/xwiki/Makefile
#                 src/_samples/library/yourls/Makefile
#                 src/_samples/library/znc/Makefile
#                 src/_samples/library/zookeeper/Makefile
