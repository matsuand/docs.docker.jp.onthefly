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
	version-history

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
Makefile.sub: $(top_srcdir)/bin/ctiemake.sh $(top_builddir)/config.log
	@$(top_srcdir)/bin/ctiemake.sh $(publishdir) $(srcs)

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
	@for f in $(srcs); do rm -f ${publishdir}/$$f; done
