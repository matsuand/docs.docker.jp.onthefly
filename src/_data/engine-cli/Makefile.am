thisdir = _data/engine-cli
origdir  = @abs_origdir@/$(thisdir)
srcdir   = @srcdir@
mysrcdir = $(shell cd $(srcdir) && pwd)
targetdir = @abs_targetdir@/$(thisdir)
publishdir = @abs_publishdir@/$(thisdir)
uploaddir  = @UPLOADDIR@/$(thisdir)
publishbase = @PUBLISHBASE@

.PHONY: all
all: ctie tgtdir $(srcs_with_prefix)

ctie:
	@$(MAKE) -C $(top_builddir)/$@ $@ >/dev/null

bases = \
	docker \
	docker_attach \
	docker_build \
	docker_builder \
	docker_builder_build \
	docker_builder_prune \
	docker_checkpoint \
	docker_checkpoint_create \
	docker_checkpoint_ls \
	docker_checkpoint_rm \
	docker_commit \
	docker_config \
	docker_config_create \
	docker_config_inspect \
	docker_config_ls \
	docker_config_rm \
	docker_container \
	docker_container_attach \
	docker_container_commit \
	docker_container_cp \
	docker_container_create \
	docker_container_diff \
	docker_container_exec \
	docker_container_export \
	docker_container_inspect \
	docker_container_kill \
	docker_container_logs \
	docker_container_ls \
	docker_container_pause \
	docker_container_port \
	docker_container_prune \
	docker_container_rename \
	docker_container_restart \
	docker_container_rm \
	docker_container_run \
	docker_container_start \
	docker_container_stats \
	docker_container_stop \
	docker_container_top \
	docker_container_unpause \
	docker_container_update \
	docker_container_wait \
	docker_context \
	docker_context_create \
	docker_context_export \
	docker_context_import \
	docker_context_inspect \
	docker_context_ls \
	docker_context_rm \
	docker_context_update \
	docker_context_use \
	docker_cp \
	docker_create \
	docker_diff \
	docker_events \
	docker_exec \
	docker_export \
	docker_history \
	docker_image \
	docker_image_build \
	docker_image_history \
	docker_image_import \
	docker_image_inspect \
	docker_image_load \
	docker_image_ls \
	docker_image_prune \
	docker_image_pull \
	docker_image_push \
	docker_image_rm \
	docker_image_save \
	docker_image_tag \
	docker_images \
	docker_import \
	docker_info \
	docker_inspect \
	docker_kill \
	docker_load \
	docker_login \
	docker_logout \
	docker_logs \
	docker_manifest \
	docker_manifest_annotate \
	docker_manifest_create \
	docker_manifest_inspect \
	docker_manifest_push \
	docker_network \
	docker_network_connect \
	docker_network_create \
	docker_network_disconnect \
	docker_network_inspect \
	docker_network_ls \
	docker_network_prune \
	docker_network_rm \
	docker_node \
	docker_node_demote \
	docker_node_inspect \
	docker_node_ls \
	docker_node_promote \
	docker_node_ps \
	docker_node_rm \
	docker_node_update \
	docker_pause \
	docker_plugin \
	docker_plugin_create \
	docker_plugin_disable \
	docker_plugin_enable \
	docker_plugin_inspect \
	docker_plugin_install \
	docker_plugin_ls \
	docker_plugin_push \
	docker_plugin_rm \
	docker_plugin_set \
	docker_plugin_upgrade \
	docker_port \
	docker_ps \
	docker_pull \
	docker_push \
	docker_rename \
	docker_restart \
	docker_rm \
	docker_rmi \
	docker_run \
	docker_save \
	docker_search \
	docker_secret \
	docker_secret_create \
	docker_secret_inspect \
	docker_secret_ls \
	docker_secret_rm \
	docker_service \
	docker_service_create \
	docker_service_inspect \
	docker_service_logs \
	docker_service_ls \
	docker_service_ps \
	docker_service_rm \
	docker_service_rollback \
	docker_service_scale \
	docker_service_update \
	docker_stack \
	docker_stack_deploy \
	docker_stack_ls \
	docker_stack_ps \
	docker_stack_rm \
	docker_stack_services \
	docker_start \
	docker_stats \
	docker_stop \
	docker_swarm \
	docker_swarm_ca \
	docker_swarm_init \
	docker_swarm_join-token \
	docker_swarm_join \
	docker_swarm_leave \
	docker_swarm_unlock-key \
	docker_swarm_unlock \
	docker_swarm_update \
	docker_system \
	docker_system_df \
	docker_system_events \
	docker_system_info \
	docker_system_prune \
	docker_tag \
	docker_top \
	docker_trust \
	docker_trust_inspect \
	docker_trust_key \
	docker_trust_key_generate \
	docker_trust_key_load \
	docker_trust_revoke \
	docker_trust_sign \
	docker_trust_signer \
	docker_trust_signer_add \
	docker_trust_signer_remove \
	docker_unpause \
	docker_update \
	docker_version \
	docker_volume \
	docker_volume_create \
	docker_volume_inspect \
	docker_volume_ls \
	docker_volume_prune \
	docker_volume_rm \
	docker_wait

ch_yamls = $(bases:=.yamlch) # ch means change files
tr_yamls = $(bases:=.yaml)   # tr means translated files
EXTRA_DIST = $(ch_yamls)
#DISTCLEANFILES = 

srcs = $(tr_yamls)
srcs_with_prefix = ${addprefix $(publishdir)/,$(srcs)}

.PHONY: tgtdir
tgtdir:
	@$(MKDIR_P) $(publishdir)

-include ./Makefile.sub
Makefile.sub: $(top_srcdir)/bin/ctiemake.sh $(top_builddir)/config.log
	@$(top_srcdir)/bin/ctiemake.sh $(publishdir) $(srcs)
	sed -i -e "/docker_build.yamlch >\/dev\/null/a \\\tsed -i -e \"s|__HOSTURL__|${HOSTURL}|g\" ${publishdir}\/docker_build.yaml" $@
	sed -i -e "/docker_network_create.yamlch >\/dev\/null/a \\\tsed -i -e \"s|__HOSTURL__|${HOSTURL}|g\" ${publishdir}\/docker_network_create.yaml" $@
	sed -i -e "/docker_node_demote.yamlch >\/dev\/null/a \\\tsed -i -e \"s|__HOSTURL__|${HOSTURL}|g\" ${publishdir}\/docker_node_demote.yaml" $@
	sed -i -e "/docker_node_promote.yamlch >\/dev\/null/a \\\tsed -i -e \"s|__HOSTURL__|${HOSTURL}|g\" ${publishdir}\/docker_node_promote.yaml" $@
	sed -i -e "/docker_node_ls.yamlch >\/dev\/null/a \\\tsed -i -e \"s|__HOSTURL__|${HOSTURL}|g\" ${publishdir}\/docker_node_ls.yaml" $@
	sed -i -e "/docker_node_ps.yamlch >\/dev\/null/a \\\tsed -i -e \"s|__HOSTURL__|${HOSTURL}|g\" ${publishdir}\/docker_node_ps.yaml" $@
	sed -i -e "/docker_node_rm.yamlch >\/dev\/null/a \\\tsed -i -e \"s|__HOSTURL__|${HOSTURL}|g\" ${publishdir}\/docker_node_rm.yaml" $@
	sed -i -e "/docker_node_update.yamlch >\/dev\/null/a \\\tsed -i -e \"s|__HOSTURL__|${HOSTURL}|g\" ${publishdir}\/docker_node_update.yaml" $@
	sed -i -e "/docker_run.yamlch >\/dev\/null/a \\\tsed -i -e \"s|__HOSTURL__|${HOSTURL}|g\" ${publishdir}\/docker_run.yaml" $@
	sed -i -e "/docker_service_ls.yamlch >\/dev\/null/a \\\tsed -i -e \"s|__HOSTURL__|${HOSTURL}|g\" ${publishdir}\/docker_service_ls.yaml" $@

@MAINT@.PHONY: chbuild
@MAINT@chbuild: $(addprefix $(mysrcdir)/, $(ch_yamls))
@MAINT@$(addprefix $(mysrcdir)/, $(ch_yamls)):
@MAINT@	@if test ! -f $@; then $(top_srcdir)/bin/buildch.perl `echo $@ | sed -e "s|^$(mysrcdir)|$(origdir)|" -e "s|\.yamlch$$|.yaml|"` $@ yaml; fi

#.PHONY: install
#install: all install.sub $(addprefix $(targetdir)/,$(srcs))

#-include install.sub
#install.sub: $(top_srcdir)/bin/copyinstall.sh $(top_builddir)/config.log
#	@$(top_srcdir)/bin/copyinstall.sh install $(targetdir) $(srcs)

#.PHONY: publishinstall
#publishinstall: all publishinstall.sub $(addprefix $(publishdir)/,$(srcs))

#-include publishinstall.sub
#publishinstall.sub: $(top_srcdir)/bin/copyinstall.sh $(top_builddir)/config.log
#	@$(top_srcdir)/bin/copyinstall.sh publishinstall $(publishdir) $(srcs)

.PHONY: rewriteurls
rewriteurls:

.PHONY: publishclean
publishclean:
	@for f in $(srcs); do rm -f ${publishdir}/$$f; done
