thisdir = _data/buildx
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
	docker_buildx                    \
	docker_buildx_bake               \
	docker_buildx_build              \
	docker_buildx_create             \
	docker_buildx_du                 \
	docker_buildx_imagetools         \
	docker_buildx_imagetools_create  \
	docker_buildx_imagetools_inspect \
	docker_buildx_inspect            \
	docker_buildx_install            \
	docker_buildx_ls                 \
	docker_buildx_prune              \
	docker_buildx_rm                 \
	docker_buildx_stop               \
	docker_buildx_uninstall          \
	docker_buildx_use                \
	docker_buildx_version

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
