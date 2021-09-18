thisdir = _data/compose-cli
origdir  = @abs_origdir@/$(thisdir)
srcdir   = @srcdir@
mysrcdir = $(shell cd $(srcdir) && pwd)
targetdir = @abs_targetdir@/$(thisdir)
publishdir = @abs_publishdir@/$(thisdir)
uploaddir  = @UPLOADDIR@/$(thisdir)

.PHONY: all
all: ctie tgtdir $(srcs_with_prefix)

ctie:
	@$(MAKE) -C $(top_builddir)/$@ $@ >/dev/null

bases = \
	docker_compose         \
	docker_compose_build   \
	docker_compose_convert \
	docker_compose_cp      \
	docker_compose_create  \
	docker_compose_down    \
	docker_compose_events  \
	docker_compose_exec    \
	docker_compose_images  \
	docker_compose_kill    \
	docker_compose_logs    \
	docker_compose_ls      \
	docker_compose_pause   \
	docker_compose_port    \
	docker_compose_ps      \
	docker_compose_pull    \
	docker_compose_push    \
	docker_compose_restart \
	docker_compose_rm      \
	docker_compose_run     \
	docker_compose_start   \
	docker_compose_stop    \
	docker_compose_top     \
	docker_compose_unpause \
	docker_compose_up      \
	docker_compose_version

ch_yamls = $(bases:=.yamlch) # ch means change files
tr_yamls = $(bases:=.yaml)   # tr means translated files
EXTRA_DIST = $(ch_yamls)
#DISTCLEANFILES = 

srcs = $(tr_yamls)
srcs_with_prefix = ${addprefix $(publishdir)/,$(srcs)}

.PHONY: tgtdir
tgtdir:
	$(MKDIR_P) $(publishdir)

-include ./Makefile.sub
Makefile.sub: $(top_srcdir)/bin/ctiemake.sh $(top_builddir)/config.log
	@$(top_srcdir)/bin/ctiemake.sh $(publishdir) $(srcs)
	sed -i -e "/docker_compose_events.yamlch >\/dev\/null/a \\\tsed -i -e \"s|__HOSTURL__|${HOSTURL}|g\" ${publishdir}\/docker_compose_events.yaml" $@

@MAINT@.PHONY: chbuild
@MAINT@chbuild: $(addprefix $(mysrcdir)/, $(ch_yamls))
@MAINT@$(addprefix $(mysrcdir)/, $(ch_yamls)):
@MAINT@	@if test ! -f $@; then $(top_srcdir)/bin/buildch.perl `echo $@ | sed -e "s|^$(mysrcdir)|$(origdir)|" -e "s|\.yamlch$$|.yaml|"` $@ yaml; fi
