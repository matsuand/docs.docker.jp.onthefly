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
	not_edited_here \
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

@MAINT@.PHONY: chbuild
@MAINT@chbuild: $(addprefix $(mysrcdir)/, $(ch_yamls))
@MAINT@$(addprefix $(mysrcdir)/, $(ch_yamls)):
@MAINT@	@if test ! -f $@; then $(top_srcdir)/bin/buildch.perl `echo $@ | sed -e "s|^$(mysrcdir)|$(origdir)|" -e "s|\.yamlch$$|.yaml|"` $@ yaml; fi

csvcopy:
	@if test ! -f redirects.csv; then cp -p $(origdir)/redirects.csv .; fi

#.PHONY: install
#install: all install.sub $(addprefix $(publishdir)/,$(srcs))
#	@for dir in $(SUBDIRS); do $(MAKE) -C $$dir $@; done
#	@if test ! -f $(publishdir)/redirects.csv; then cp -p $(origdir)/redirects.csv .; fi

#-include install.sub
#install.sub: $(top_srcdir)/bin/copyinstall.sh $(top_builddir)/config.log
#	@$(top_srcdir)/bin/copyinstall.sh install $(publishdir) $(srcs)

#.PHONY: publishinstall
#publishinstall: all publishinstall.sub $(addprefix $(publishdir)/,$(srcs))
#	@for dir in $(SUBDIRS); do $(MAKE) -C $$dir $@; done
#	@if test ! -f $(publishdir)/redirects.csv; then cp -p $(origdir)/redirects.csv .; fi

#-include publishinstall.sub
#publishinstall.sub: $(top_srcdir)/bin/copyinstall.sh $(top_builddir)/config.log
#	@$(top_srcdir)/bin/copyinstall.sh publishinstall $(publishdir) $(srcs)

.PHONY: rewriteurls
rewriteurls:

.PHONY: publishclean
publishclean:
	@for dir in $(SUBDIRS); do $(MAKE) -C $$dir $@; done
	@for f in $(srcs); do rm -f ${publishdir}/$$f; done
	@for d in $(SUBDIRS); do rm -fr ${publishdir}/$$d; done
	@rm -f $(publishdir)/redirects.csv
