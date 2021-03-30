SUBDIRS = latest sdk v1.25 v1.26 v1.27 v1.28 v1.29 v1.30 \
	v1.30 v1.31 v1.32 v1.33 v1.34 v1.35 v1.36 v1.37 v1.38 v1.39 v1.40

thisdir    = engine/api
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
	index \
	v1.18 \
	v1.19 \
	v1.20 \
	v1.21 \
	v1.22 \
	v1.23 \
	v1.24 \
	v1.25 \
	v1.26 \
	v1.27 \
	v1.28 \
	v1.29 \
	v1.30 \
	v1.31 \
	v1.32 \
	v1.33 \
	v1.34 \
	v1.35 \
	v1.36 \
	v1.37 \
	v1.38 \
	v1.39 \
	v1.40 \
	v1.41 \
	version-history
yamlbases = \
	v1.41

ch_mds = $(bases:=.ch) # ch means change files
tr_mds = $(bases:=.md) # tr means translated files
ch_yamls = $(yamlbases:=.yamlch)
tr_yamls = $(yamlbases:=.yaml)
EXTRA_DIST = $(ch_mds) $(ch_yamls)
#DISTCLEANFILES = 

srcs = $(tr_mds) $(tr_yamls)
srcs_with_prefix = ${addprefix $(publishdir)/,$(srcs)}

.PHONY: tgtdir
tgtdir:
	$(MKDIR_P) $(publishdir)

-include Makefile.sub
# Call ctiemake2.sh in this case because of the dependency for its yaml file
# Be care ctiemake2.sh has three arguments!
Makefile.sub: $(top_srcdir)/bin/ctiemake2.sh $(top_builddir)/config.log
	@$(top_srcdir)/bin/ctiemake2.sh $(abs_publishdir) $(publishdir) $(srcs)
	for f in $(yamlbases); do \
	  sed -i -e "/$$f.yamlch >\/dev\/null/a \\\tsed -i -e \"s|__HOSTURL__|${HOSTURL}|g\" ${publishdir}\/$$f.yaml" $@; \
	done

@MAINT@.PHONY: chbuild
@MAINT@chbuild: $(addprefix $(mysrcdir)/, $(ch_mds)) $(addprefix $(mysrcdir)/, $(ch_yamls))
@MAINT@$(addprefix $(mysrcdir)/, $(ch_mds)):
@MAINT@	@if test ! -f $@; then $(top_srcdir)/bin/buildch.perl `echo $@ | sed -e "s|^$(mysrcdir)|$(origdir)|" -e "s|\.ch$$|.md|"` $@; fi
@MAINT@$(addprefix $(mysrcdir)/, $(ch_yamls)):
@MAINT@	@if test ! -f $@; then $(top_srcdir)/bin/buildch.perl `echo $@ | sed -e "s|^$(mysrcdir)|$(origdir)|" -e "s|\.yamlch$$|.yaml|"` $@; fi
