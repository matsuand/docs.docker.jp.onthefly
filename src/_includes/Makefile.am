SUBDIRS = analytics content guides landing-page

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
	api-version-matrix      \
	cli                     \
	configure-registry-json \
	deploy                  \
	desktop-license-update  \
	desktop-update          \
	eula                    \
	experimental            \
	experimental-feature    \
	github-pr               \
	install-script          \
	registry
htmlbases = \
	breadcrumbs            \
	eula-modal             \
	footer                 \
	head                   \
	header                 \
	navigation             \
	read_time              \
	sign-up-cta            \
	theme-switch           \
	toc_pure_liquid        \
	upgrade-cta

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
