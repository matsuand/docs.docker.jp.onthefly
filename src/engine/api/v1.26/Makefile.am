thisver    = v1.26
thisdir    = engine/api/$(thisver)
origdir    = @abs_origdir@/$(thisdir)
srcdir     = @srcdir@
mysrcdir   = $(shell cd $(srcdir) && pwd)
targetdir  = @abs_targetdir@/$(thisdir)
publishdir = @abs_publishdir@/$(thisdir)
publishurl = @PUBLISHURL@
publishbase = @PUBLISHBASE@
uploaddir  = @UPLOADDIR@/$(thisdir)

.PHONY: all
all: ctie tgtdir $(srcs_with_prefix) $(publishdir)/../$(thisver).yaml

ctie:
	@$(MAKE) -C $(top_builddir)/$@ $@ >/dev/null

yamlbases = \
	swagger

ch_yamls = $(yamlbases:=.yamlch)
tr_yamls = $(yamlbases:=.yaml)
EXTRA_DIST = $(ch_yamls)
#DISTCLEANFILES = 

srcs = $(tr_yamls)
srcs_with_prefix = ${addprefix $(publishdir)/,$(srcs)}

.PHONY: tgtdir
tgtdir:
	$(MKDIR_P) $(publishdir)

-include Makefile.sub
Makefile.sub: $(top_srcdir)/bin/ctiemake.sh $(top_builddir)/config.log
	@$(top_srcdir)/bin/ctiemake.sh $(publishdir) $(srcs)

$(publishdir)/../$(thisver).yaml: $(publishdir)/swagger.yaml
	@sed -e "s|__URL__|${publishurl}|g" \
	     -e "s|__BASEURL__|${publishbase}|g" $(publishdir)/swagger.yaml > $@
	@sed -i -e "s|__URL__||g" \
	        -e "s|__BASEURL__||g" $(publishdir)/swagger.yaml
	touch $@

@MAINT@.PHONY: chbuild
@MAINT@chbuild: $(addprefix $(mysrcdir)/, $(ch_yamls))
@MAINT@$(addprefix $(mysrcdir)/, $(ch_yamls)):
@MAINT@	@if test ! -f $@; then $(top_srcdir)/bin/buildch.perl `echo $@ | sed -e "s|^$(mysrcdir)|$(origdir)|" -e "s|\.yamlch$$|.yaml|"` $@; fi

include $(top_srcdir)/rewriteurls.mk

.PHONY: publishclean
publishclean:
	@for f in $(srcs); do rm -f ${publishdir}/$$f; done
