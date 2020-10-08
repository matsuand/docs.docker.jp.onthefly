SUBDIRS = buildx cluster \
	docker-app docsarchive engine-cli registry-cli

thisdir = _data
origdir  = @abs_origdir@/$(thisdir)
srcdir   = @srcdir@
mysrcdir = $(shell cd $(srcdir) && pwd)
targetdir = @abs_targetdir@/$(thisdir)
publishdir = @abs_publishdir@/$(thisdir)
uploaddir  = @UPLOADDIR@/$(thisdir)

.PHONY: all csvcopy
all: ctie tgtdir $(srcs_with_prefix) csvcopy

ctie:
	@$(MAKE) -C $(top_builddir)/$@ $@ >/dev/null

bases = \
	advisories \
	glossary \
	toc

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
	@sed -i -e "/glossary.yamlch >\/dev\/null$$/a\\\tsed -i -e \"s|__HOSTURL__|${HOSTURL}|g\" ${publishdir}\/glossary.yaml" $@
	@sed -i -e "/glossary.yamlch >\/dev\/null$$/a\\\tcp -p $$\@ $$\(srcdir\)\/glossary\.yaml" $@

@MAINT@.PHONY: chbuild
@MAINT@chbuild: $(addprefix $(mysrcdir)/, $(ch_yamls))
@MAINT@$(addprefix $(mysrcdir)/, $(ch_yamls)):
@MAINT@	@if test ! -f $@; then $(top_srcdir)/bin/buildch.perl `echo $@ | sed -e "s|^$(mysrcdir)|$(origdir)|" -e "s|\.yamlch$$|.yaml|"` $@ yaml; fi

csvcopy:
	@if test ! -f redirects.csv; then cp -p $(origdir)/redirects.csv .; fi
