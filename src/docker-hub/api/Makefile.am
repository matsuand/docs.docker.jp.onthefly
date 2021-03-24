SUBDIRS = latest

thisdir     = docker-hub/api
origdir     = @abs_origdir@/$(thisdir)
srcdir      = @srcdir@
mysrcdir    = $(shell cd $(srcdir) && pwd)
targetdir   = @abs_targetdir@/$(thisdir)
publishdir  = @abs_publishdir@/$(thisdir)
publishurl  = @PUBLISHURL@
publishbase = @PUBLISHBASE@
uploaddir   = @UPLOADDIR@/$(thisdir)

.PHONY: all
all: ctie tgtdir $(srcs_with_prefix)

ctie:
	@$(MAKE) -C $(top_builddir)/$@ $@ >/dev/null

bases = \
	latest

yamls = \
	latest

ch_mds = $(bases:=.ch) # ch means change files
tr_mds = $(bases:=.md) # tr means translated files
ch_yamls = $(yamls:=.yamlch) # ch means change files
tr_yamls = $(yamls:=.yaml)   # tr means translated files
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
	@sed -i -e "/latest.yamlch >\/dev\/null$$/a\\\t@sed -i -e \"s|__URL__|${publishurl}|g\" -e \"s|__BASEURL__|${publishbase}|g\" $$\\@" $@

@MAINT@.PHONY: chbuild
@MAINT@chbuild: $(addprefix $(mysrcdir)/, $(ch_mds)) $(addprefix $(mysrcdir)/, $(ch_yamls))
@MAINT@$(addprefix $(mysrcdir)/, $(ch_mds)):
@MAINT@	@if test ! -f $@; then $(top_srcdir)/bin/buildch.perl `echo $@ | sed -e "s|^$(mysrcdir)|$(origdir)|" -e "s|\.ch$$|.md|"` $@; fi
@MAINT@$(addprefix $(mysrcdir)/, $(ch_yamls)):
@MAINT@	@if test ! -f $@; then $(top_srcdir)/bin/buildch.perl `echo $@ | sed -e "s|^$(mysrcdir)|$(origdir)|" -e "s|\.yamlch$$|.yaml|"` $@ yaml; fi
