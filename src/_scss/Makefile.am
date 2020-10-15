thisdir     = _scss
origdir     = @abs_origdir@/$(thisdir)
srcdir      = @srcdir@
mysrcdir    = $(shell cd $(srcdir) && pwd)
targetdir   = @abs_targetdir@/$(thisdir)
publishdir  = @abs_publishdir@/$(thisdir)
publishbase = @PUBLISHBASE@
uploaddir   = @UPLOADDIR@/$(thisdir)

.PHONY: all
all: tgtdir $(srcs_with_prefix)

scsss = \
	_base.scss          \
	_breakpoint.scss    \
	_buttons.scss       \
	_content.scss       \
	_github.scss        \
	_global-header.scss \
	_layout.scss        \
	_mobile.scss        \
	_navigation.scss    \
	_night-mode.scss    \
	_notes.scss         \
	_overrides.scss     \
	_perldoc.scss       \
	_variables.scss
scss_mods = \
	_landing    \
	_typography \
	_utilities
ch_scsss = $(scss_mods:=.scssch) # ch means change files
tr_scsss = $(scss_mods:=.scss)   # tr means translated files
EXTRA_DIST = $(ch_scsss)
#DISTCLEANFILES = 

srcs = $(scsss) $(scss_mods)
srcs_with_prefix = ${addprefix $(publishdir)/,$(scsss)} ${addprefix $(publishdir)/,$(tr_scsss)}

.PHONY: tgtdir
tgtdir:
	$(MKDIR_P) $(publishdir)

#-include ./Makefile.sub
#Makefile.sub: $(top_srcdir)/bin/ctiemake.sh $(top_builddir)/config.log
#	@$(top_srcdir)/bin/ctiemake.sh $(publishdir) $(tr_scsss)

$(publishdir)/_landing.scss: $(origdir)/_landing.scss _landing.scssch
	@echo Processing _landing.scss...
	@$(top_builddir)/$(CTIE) -m $@ $(origdir)/_landing.scss _landing.scssch >/dev/null
_landing.scssch: $(srcdir)/_landing.scssch.in
	@sed -e "s|__BASEURL__|$(publishbase)|g" $(srcdir)/_landing.scssch.in > $@

$(publishdir)/_typography.scss: $(origdir)/_typography.scss $(srcdir)/_typography.scssch
	@echo Processing _typography.scss...
	@$(top_builddir)/$(CTIE) -m $@ $(origdir)/_typography.scss $(srcdir)/_typography.scssch >/dev/null

$(publishdir)/_utilities.scss: $(origdir)/_utilities.scss _utilities.scssch
	@echo Processing _utilities.scss...
	@$(top_builddir)/$(CTIE) -m $@ $(origdir)/_utilities.scss _utilities.scssch >/dev/null
_utilities.scssch: $(srcdir)/_utilities.scssch.in
	@sed -e "s|__BASEURL__|$(publishbase)|g" $(srcdir)/_utilities.scssch.in > $@

-include copyscsss.sub
copyscsss.sub: $(top_srcdir)/bin/copymake.sh $(top_builddir)/config.log
	@$(top_srcdir)/bin/copymake.sh copyscsss $(publishdir) $(scsss)

@MAINT@.PHONY: chbuild
@MAINT@chbuild: $(addprefix $(mysrcdir)/, $(ch_scsss))
@MAINT@$(addprefix $(mysrcdir)/, $(ch_scsss)):
@MAINT@	@if test ! -f $@; then $(top_srcdir)/bin/buildch.perl `echo $@ | sed -e "s|^$(mysrcdir)|$(origdir)|" -e "s|\.scssch$$|.scss|"` $@ yaml; fi
