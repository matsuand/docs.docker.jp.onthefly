SUBDIRS = images

thisdir    = get-started
origdir    = @abs_origdir@/$(thisdir)
srcdir     = @srcdir@
mysrcdir   = $(shell cd $(srcdir) && pwd)
targetdir  = @abs_targetdir@/$(thisdir)
publishdir = @abs_publishdir@/$(thisdir)
uploaddir  = @UPLOADDIR@/$(thisdir)
uploadurl  = @UPLOADURL@/$(thisdir)

.PHONY: all
all: ctie tgtdir $(srcs_with_prefix)

ctie:
	@$(MAKE) -C $(top_builddir)/$@ $@ >/dev/null

bases = \
	02_our_app         \
	03_updating_app    \
	04_sharing_app     \
	05_persisting_data \
	06_bind_mounts     \
	07_multi_container \
	08_using_compose   \
	09_image_best      \
	11_what_next       \
	index              \
	kube-deploy        \
	orchestration      \
	overview           \
	resources          \
	swarm-deploy
htmlbases = \
	nav

ch_mds = $(bases:=.ch) # ch means change files
tr_mds = $(bases:=.md) # tr means translated files
ch_htmls = $(htmlbases:=.htmlch)
tr_htmls = $(htmlbases:=.html)
EXTRA_DIST = $(ch_mds) $(ch_htmls)
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
