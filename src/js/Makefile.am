thisdir    = js
origdir    = @abs_origdir@/$(thisdir)
srcdir     = @srcdir@
mysrcdir   = $(shell cd $(srcdir) && pwd)
targetdir  = @abs_targetdir@/$(thisdir)
publishdir = @abs_publishdir@/$(thisdir)
uploaddir  = @UPLOADDIR@/$(thisdir)
publishbas = @abs_publishdir@

.PHONY: all copyfiles
all: ctie tgtdir $(srcs_with_prefix) ${publishdir}/redoc.min.js

ctie:
	@$(MAKE) -C $(top_builddir)/$@ $@ >/dev/null

jsbases = \
	docs   \
	search

jsonbases = \
	metadata \
	toc

jsnonbases = \
	anchorlinks    \
	bootstrap.min  \
	jquery         \
	theme-switcher

others = \
	redoc.min.map

ch_jss = $(jsbases:=.jsch)
tr_jss = $(jsbases:=.js)
ch_jsons = $(jsonbases:=.jsonch)
tr_jsons = $(jsonbases:=.json)

tr_both = $(tr_jss) $(tr_jsons)

jsnons = $(jsnonbases:=.js)
EXTRA_DIST = $(ch_jss) redoc.min.sed
#DISTCLEANFILES = 

srcs = $(tr_jss) $(tr_jsons) $(jsnons) $(others)
srcs_with_prefix = ${addprefix $(publishdir)/,$(srcs)}

.PHONY: tgtdir
tgtdir:
	$(MKDIR_P) $(publishdir)

-include Makefile.sub
Makefile.sub: $(top_srcdir)/bin/ctiemake.sh $(top_builddir)/config.log
	@$(top_srcdir)/bin/ctiemake.sh $(publishdir) $(tr_both)

${publishdir}/glossary.js: $(publishbas)/_data/glossary.yaml
${publishdir}/metadata.js: $(publishbas)/_data/toc.yaml
${publishdir}/toc.json: $(publishbas)/_data/toc.yaml

-include jsnons.sub
./jsnons.sub: $(top_srcdir)/bin/copymake.sh $(top_builddir)/config.log
	@$(top_srcdir)/bin/copymake.sh jsnons $(publishdir) $(jsnons)
-include others.sub
./others.sub: $(top_srcdir)/bin/copymake.sh $(top_builddir)/config.log
	@$(top_srcdir)/bin/copymake.sh others $(publishdir) $(others)

${publishdir}/redoc.min.js: $(origdir)/redoc.min.js $(srcdir)/redoc.min.sed
	@sed -f $(srcdir)/redoc.min.sed $(origdir)/redoc.min.js > $@

@MAINT@.PHONY: chbuild
@MAINT@chbuild: $(addprefix $(mysrcdir)/, $(ch_jss)) $(addprefix $(mysrcdir)/, $(ch_jsons))
@MAINT@$(addprefix $(mysrcdir)/, $(ch_jss)):
@MAINT@	@if test ! -f $@; then $(top_srcdir)/bin/buildch.perl `echo $@ | sed -e "s|^$(mysrcdir)|$(origdir)|" -e "s|\.jsch$$|.js|"` $@; fi
@MAINT@$(addprefix $(mysrcdir)/, $(ch_jsons)):
@MAINT@	@if test ! -f $@; then $(top_srcdir)/bin/buildch.perl `echo $@ | sed -e "s|^$(mysrcdir)|$(origdir)|" -e "s|\.jsonch$$|.json|"` $@; fi

.PHONY: rewriteurls
rewriteurls:

.PHONY: publishclean
publishclean:
	@for f in $(srcs); do rm -f ${publishdir}/$$f; done
	@for f in $(jsnons); do rm -f ${publishdir}/$$f; done
	@for f in $(others); do rm -f ${publishdir}/$$f; done
	@rm -fr $(thisdir)
