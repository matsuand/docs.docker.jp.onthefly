SUBDIRS = analytics content landing-page

thisdir = _includes
origdir  = @abs_origdir@/$(thisdir)
srcdir   = @srcdir@
mysrcdir = $(shell cd $(srcdir) && pwd)
targetdir = @abs_targetdir@/$(thisdir)
publishdir = @abs_publishdir@/$(thisdir)
uploaddir  = @UPLOADDIR@/$(thisdir)

.PHONY: all
all: ctie tgtdir $(publishdir)/jatrans.md $(srcs_with_prefix)

ctie:
	@$(MAKE) -C $(top_builddir)/$@ $@ >/dev/null

bases = \
	api-version-matrix   \
	cli                  \
	experimental         \
	experimental-feature \
	github-pr            \
	install-script       \
	kubernetes-mac-win   \
	registry
htmlbases = \
	body             \
	body-landing     \
	footer           \
	head             \
	header           \
	navigation       \
	read_time        \
	side-menu        \
	theme-switch     \
	toc_pure_liquid

ch_mds = $(bases:=.ch) # ch means change files
tr_mds = $(bases:=.md) # tr means translated files
ch_htmls = $(htmlbases:=.htmlch)
tr_htmls = $(htmlbases:=.html)
EXTRA_DIST = $(ch_mds)
#DISTCLEANFILES = 

srcs = $(tr_mds) $(tr_htmls)
srcs_with_prefix = ${addprefix $(publishdir)/,$(srcs)}

.PHONY: tgtdir
tgtdir:
	$(MKDIR_P) $(publishdir)

-include Makefile.sub
Makefile.sub: $(top_srcdir)/bin/ctiemake.sh $(top_builddir)/config.log
	@$(top_srcdir)/bin/ctiemake.sh $(publishdir) $(srcs)

@MAINT@.PHONY: chbuild
@MAINT@chbuild: $(addprefix $(mysrcdir)/, $(ch_mds)) $(addprefix $(mysrcdir)/, $(ch_htmls))
@MAINT@$(addprefix $(mysrcdir)/, $(ch_mds)):
@MAINT@	@if test ! -f $@; then $(top_srcdir)/bin/buildch.perl `echo $@ | sed -e "s|^$(mysrcdir)|$(origdir)|" -e "s|\.ch$$|.md|"` $@; fi
@MAINT@$(addprefix $(mysrcdir)/, $(ch_htmls)):
@MAINT@	@if test ! -f $@; then $(top_srcdir)/bin/buildch.perl `echo $@ | sed -e "s|^$(mysrcdir)|$(origdir)|" -e "s|\.htmlch$$|.html|"` $@; fi

$(publishdir)/jatrans.md: $(srcdir)/jatrans.md.in
	@cp -p $^ $@

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
	@for dir in $(SUBDIRS); do $(MAKE) -C $$dir $@; done
	@for f in $(srcs); do rm -f ${publishdir}/$$f; done
	@rm -fr $(thisdir)
