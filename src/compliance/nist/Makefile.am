thisdir    = compliance/nist
origdir    = @abs_origdir@/$(thisdir)
srcdir     = @srcdir@
mysrcdir   = $(shell cd $(srcdir) && pwd)
targetdir  = @abs_targetdir@/_layouts
publishdir = @abs_publishdir@/$(thisdir)
uploaddir  = @UPLOADDIR@/$(thisdir)

.PHONY: all
all: ctie tgtdir $(srcs_with_prefix)

ctie:
	@$(MAKE) -C $(top_builddir)/$@ $@ >/dev/null

bases = \
	800_37 \
	800_53 \
	800_190 \
	fips140_2 \
	itl_october2017 \
	nistir_8176

ch_mds = $(bases:=.ch)
tr_mds = $(bases:=.md)
EXTRA_DIST = $(ch_mds)
#DISTCLEANFILES = 

srcs = $(tr_mds)
srcs_with_prefix = ${addprefix $(publishdir)/,$(srcs)}

.PHONY: tgtdir
tgtdir:
	$(MKDIR_P) $(publishdir)

-include Makefile.sub
Makefile.sub: $(top_srcdir)/bin/ctiemake.sh $(top_builddir)/config.log
	@$(top_srcdir)/bin/ctiemake.sh $(publishdir) $(srcs)

@MAINT@.PHONY: chbuild
@MAINT@chbuild: $(addprefix $(mysrcdir)/, $(ch_mds))
@MAINT@$(addprefix $(mysrcdir)/, $(ch_mds)):
@MAINT@	@if test ! -f $@; then $(top_srcdir)/bin/buildch.perl `echo $@ | sed -e "s|^$(mysrcdir)|$(origdir)|" -e "s|\.ch$$|.md|"` $@; fi

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

include $(top_srcdir)/rewriteurls.mk

.PHONY: publishclean
publishclean:
	@for f in $(srcs); do rm -f ${publishdir}/$$f; done
	@rm -fr $(thisdir)
