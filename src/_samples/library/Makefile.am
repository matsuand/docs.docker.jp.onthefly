thisdir    = _samples/library
origdir    = @abs_origdir@/$(thisdir)
srcdir     = @srcdir@
mysrcdir   = $(shell cd $(srcdir) && pwd)
targetdir  = @abs_targetdir@/$(thisdir)
publishdir = @abs_publishdir@/$(thisdir)
uploaddir  = @UPLOADDIR@/$(thisdir)

bases = \
	adminer \
	adoptopenjdk \
	aerospike \
	alpine \
	alt \
	amazoncorretto \
	amazonlinux \
	arangodb \
	backdrop \
	bash \
	bonita \
	buildpack-deps \
	busybox \
	cassandra \
	centos \
	chronograf \
	cirros \
	clearlinux \
	clefos \
	clojure \
	composer \
	consul \
	convertigo \
	couchbase \
	couchdb \
	crate \
	crux \
	debian \
	docker \
	drupal \
	eclipse-mosquitto \
	eggdrop \
	elasticsearch \
	elixir \
	erlang \
	euleros \
	express-gateway \
	fedora \
	flink \
	fluentd \
	fsharp \
	gazebo \
	gcc \
	geonetwork \
	ghost \
	golang \
	gradle \
	groovy \
	haproxy \
	haskell \
	haxe \
	hello-world \
	httpd \
	hylang \
	ibmjava \
	influxdb \
	irssi \
	jetty \
	jobber \
	joomla \
	jruby \
	julia \
	kaazing-gateway \
	kapacitor \
	kibana \
	known \
	kong \
	lightstreamer \
	logstash \
	mageia \
	mariadb \
	matomo \
	maven \
	mediawiki \
	memcached \
	mongo-express \
	mongo \
	mono \
	mysql \
	nats-streaming \
	nats \
	neo4j \
	neurodebian \
	nextcloud \
	nginx \
	node \
	notary \
	nuxeo \
	odoo \
	open-liberty \
	openjdk \
	opensuse \
	oraclelinux \
	orientdb \
	percona \
	perl \
	photon \
	php-zendserver \
	php \
	plone \
	postfixadmin \
	postgres \
	pypy \
	python \
	r-base \
	rabbitmq \
	rakudo-star \
	rapidoid \
	redis \
	redmine \
	registry \
	rethinkdb \
	rocket.chat \
	ros \
	ruby \
	rust \
	sapmachine \
	scratch \
	sentry \
	silverpeas \
	sl \
	solr \
	sonarqube \
	sourcemage \
	spiped \
	storm \
	swarm \
	swift \
	swipl \
	teamspeak \
	telegraf \
	thrift \
	tomcat \
	tomee \
	traefik \
	ubuntu \
	varnish \
	vault \
	websphere-liberty \
	wordpress \
	xwiki \
	yourls \
	znc \
	zookeeper

.PHONY: all
all: ctie tgtdir $(srcs_with_prefix)

ctie:
	@$(MAKE) -C $(top_builddir)/$@ $@ >/dev/null

ch_mds = $(bases:=.ch) # ch means change files
tr_mds = $(bases:=.md) # tr means translated files
EXTRA_DIST = $(ch_mds)
#DISTCLEANFILES = 

srcs = $(tr_mds)
srcs_with_prefix = ${addprefix $(publishdir)/,$(srcs)}

.PHONY: tgtdir
tgtdir:
	@$(MKDIR_P) $(publishdir)

-include Makefile.sub
Makefile.sub: $(top_srcdir)/bin/ctiemake.sh $(top_builddir)/config.log
	@$(top_srcdir)/bin/ctiemake.sh $(publishdir) $(srcs)

@MAINT@.PHONY: chbuild
@MAINT@chbuild: $(addprefix $(mysrcdir)/, $(ch_mds)) $(addprefix $(mysrcdir)/, $(ch_htmls))
@MAINT@$(addprefix $(mysrcdir)/, $(ch_mds)):
@MAINT@	@if test ! -f $@; then $(top_srcdir)/bin/buildch.perl `echo $@ | sed -e "s|^$(mysrcdir)|$(origdir)|" -e "s|\.ch$$|.md|"` $@; fi
