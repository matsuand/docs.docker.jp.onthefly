thisdir    = _includes/landing-page
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

htmlbases = \
	community-banner        \
	develop-with-docker     \
	dev-environments        \
	docker-pricing          \
	dockercon-banner        \
	dockercon-wrapup-banner \
	docker-hub-signup       \
	popular-videos          \
	volume-management

ch_htmls = $(htmlbases:=.htmlch)
tr_htmls = $(htmlbases:=.html)
EXTRA_DIST = $(ch_htmls)
#DISTCLEANFILES = 

srcs = $(tr_htmls)
srcs_with_prefix = ${addprefix $(publishdir)/,$(srcs)}

.PHONY: tgtdir
tgtdir:
	$(MKDIR_P) $(publishdir)

-include ./Makefile.sub
Makefile.sub: $(top_srcdir)/bin/ctiemake.sh $(top_builddir)/config.log
	@$(top_srcdir)/bin/ctiemake.sh $(publishdir) $(srcs)

@MAINT@.PHONY: chbuild
@MAINT@chbuild: $(addprefix $(mysrcdir)/, $(ch_htmls))
@MAINT@$(addprefix $(mysrcdir)/, $(ch_htmls)):
@MAINT@	@if test ! -f $@; then $(top_srcdir)/bin/buildch.perl `echo $@ | sed -e "s|^$(mysrcdir)|$(origdir)|" -e "s|\.htmlch$$|.html|"` $@; fi

include $(top_srcdir)/rewriteurls.mk

.PHONY: publishclean
publishclean:
	@for dir in $(SUBDIRS); do $(MAKE) -C $$dir $@; done
	@for f in $(srcs); do rm -f ${publishdir}/$$f; done
	@rm -fr $(thisdir)
