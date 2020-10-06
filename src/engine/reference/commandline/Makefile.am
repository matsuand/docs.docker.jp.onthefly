thisdir    = engine/reference/commandline
origdir    = @abs_origdir@/$(thisdir)
srcdir     = @srcdir@
mysrcdir   = $(shell cd $(srcdir) && pwd)
targetdir  = @abs_targetdir@/$(thisdir)
publishdir = @abs_publishdir@/$(thisdir)
uploaddir  = @UPLOADDIR@/$(thisdir)

.PHONY: all
all: ctie tgtdir $(srcs_with_prefix)

ctie:
	@$(MAKE) -C $(top_builddir)/$@ $@ >/dev/null

bases = \
	README \
	app \
	app_bundle \
	app_completion \
	app_init \
	app_inspect \
	app_install \
	app_list \
	app_merge \
	app_pull \
	app_push \
	app_render \
	app_split \
	app_status \
	app_uninstall \
	app_upgrade \
	app_validate \
	app_version \
	attach \
	build \
	builder \
	builder_build \
	builder_prune \
	buildx \
	buildx_bake \
	buildx_build \
	buildx_create \
	buildx_du \
	buildx_imagetools \
	buildx_imagetools_create \
	buildx_imagetools_inspect \
	buildx_inspect \
	buildx_ls \
	buildx_prune \
	buildx_rm \
	buildx_stop \
	buildx_use \
	buildx_version \
	checkpoint \
	checkpoint_create \
	checkpoint_ls \
	checkpoint_rm \
	cli \
	cluster \
	cluster_backup \
	cluster_create \
	cluster_inspect \
	cluster_ls \
	cluster_restore \
	cluster_rm \
	cluster_update \
	cluster_version \
	commit \
	config \
	config_create \
	config_inspect \
	config_ls \
	config_rm \
	container \
	container_attach \
	container_commit \
	container_cp \
	container_create \
	container_diff \
	container_exec \
	container_export \
	container_inspect \
	container_kill \
	container_logs \
	container_ls \
	container_pause \
	container_port \
	container_prune \
	container_rename \
	container_restart \
	container_rm \
	container_run \
	container_start \
	container_stats \
	container_stop \
	container_top \
	container_unpause \
	container_update \
	container_wait \
	context \
	context_create \
	context_export \
	context_import \
	context_inspect \
	context_ls \
	context_rm \
	context_update \
	context_use \
	cp \
	create \
	diff \
	docker \
	dockerd \
	events \
	exec \
	export \
	history \
	image \
	image_build \
	image_history \
	image_import \
	image_inspect \
	image_load \
	image_ls \
	image_prune \
	image_pull \
	image_push \
	image_rm \
	image_save \
	image_tag \
	images \
	import \
	info \
	inspect \
	kill \
	load \
	login \
	logout \
	logs \
	manifest \
	manifest_annotate \
	manifest_create \
	manifest_inspect \
	manifest_push \
	network \
	network_connect \
	network_create \
	network_disconnect \
	network_inspect \
	network_ls \
	network_prune \
	network_rm \
	node \
	node_demote \
	node_inspect \
	node_ls \
	node_promote \
	node_ps \
	node_rm \
	node_update \
	pause \
	plugin \
	plugin_create \
	plugin_disable \
	plugin_enable \
	plugin_inspect \
	plugin_install \
	plugin_ls \
	plugin_push \
	plugin_rm \
	plugin_set \
	plugin_upgrade \
	port \
	ps \
	pull \
	push \
	registry \
	registry_events \
	registry_history \
	registry_info \
	registry_inspect \
	registry_joblogs \
	registry_jobs \
	registry_ls \
	registry_rmi \
	rename \
	restart \
	rm \
	rmi \
	run \
	save \
	search \
	secret \
	secret_create \
	secret_inspect \
	secret_ls \
	secret_rm \
	service \
	service_create \
	service_inspect \
	service_logs \
	service_ls \
	service_ps \
	service_rm \
	service_rollback \
	service_scale \
	service_update \
	stack \
	stack_deploy \
	stack_ls \
	stack_ps \
	stack_rm \
	stack_services \
	start \
	stats \
	stop \
	swarm \
	swarm_ca \
	swarm_init \
	swarm_join-token \
	swarm_join \
	swarm_leave \
	swarm_unlock-key \
	swarm_unlock \
	swarm_update \
	system \
	system_df \
	system_events \
	system_info \
	system_prune \
	tag \
	top \
	trust \
	trust_inspect \
	trust_key \
	trust_key_generate \
	trust_key_load \
	trust_revoke \
	trust_sign \
	trust_signer \
	trust_signer_add \
	trust_signer_remove \
	unpause \
	update \
	version \
	volume \
	volume_create \
	volume_inspect \
	volume_ls \
	volume_prune \
	volume_rm \
	wait

ch_mds = $(bases:=.ch) # ch means change files
tr_mds = $(bases:=.md) # tr means translated files
EXTRA_DIST = $(ch_mds)
#DISTCLEANFILES = 

srcs = $(tr_mds)
srcs_with_prefix = ${addprefix $(publishdir)/,$(srcs)}

.PHONY: tgtdir
tgtdir:
	$(MKDIR_P) $(publishdir)

-include Makefile.sub
# Call ctiemake2.sh in this case because of the dependency for its yaml file
# Be care ctiemake2.sh has three arguments!
Makefile.sub: $(top_srcdir)/bin/ctiemake2.sh $(top_builddir)/config.log
	@$(top_srcdir)/bin/ctiemake2.sh $(abs_publishdir) $(publishdir) $(srcs)

@MAINT@.PHONY: chbuild
@MAINT@chbuild: $(addprefix $(mysrcdir)/, $(ch_mds))
@MAINT@$(addprefix $(mysrcdir)/, $(ch_mds)):
@MAINT@	@if test ! -f $@; then $(top_srcdir)/bin/buildch.perl `echo $@ | sed -e "s|^$(mysrcdir)|$(origdir)|" -e "s|\.ch$$|.md|"` $@; fi

#.PHONY: install
#install: all install.sub $(addprefix $(targetdir)/,$(srcs))
#	@for dir in $(SUBDIRS); do $(MAKE) -C $$dir $@; done

#-include install.sub
#install.sub: $(top_srcdir)/bin/copyinstall.sh $(top_builddir)/config.log
#	@$(top_srcdir)/bin/copyinstall.sh install $(targetdir) $(srcs)

#.PHONY: publishinstall
#publishinstall: all publishinstall.sub $(addprefix $(publishdir)/,$(srcs))
#	@for dir in $(SUBDIRS); do $(MAKE) -C $$dir $@; done

#-include publishinstall.sub
#publishinstall.sub: $(top_srcdir)/bin/copyinstall.sh $(top_builddir)/config.log
#	@$(top_srcdir)/bin/copyinstall.sh publishinstall $(publishdir) $(srcs)

include $(top_srcdir)/rewriteurls.mk

.PHONY: publishclean
publishclean:
