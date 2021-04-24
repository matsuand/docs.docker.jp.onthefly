thisdir   = network/images
origdir   = @abs_origdir@/$(thisdir)
srcdir    = @srcdir@
mysrcdir  = $(shell cd $(srcdir) && pwd)
targetdir = @abs_targetdir@/$(thisdir)
publishdir = @abs_publishdir@/$(thisdir)
uploaddir  = @UPLOADDIR@/$(thisdir)

.PHONY: all
all: tgtdir $(srcs_with_prefix)

images = \
	ipvlan-l3.gliffy                \
	ipvlan-l3.png                   \
	ipvlan-l3.svg                   \
	ipvlan_l2_simple.gliffy         \
	ipvlan_l2_simple.png            \
	ipvlan_l2_simple.svg            \
	macvlan-bridge-ipvlan-l2.gliffy \
	macvlan-bridge-ipvlan-l2.png    \
	macvlan-bridge-ipvlan-l2.svg    \
	multi_tenant_8021q_vlans.gliffy \
	multi_tenant_8021q_vlans.png    \
	multi_tenant_8021q_vlans.svg    \
	vlans-deeper-look.gliffy        \
	vlans-deeper-look.png           \
	vlans-deeper-look.svg

srcs = $(images)
srcs_with_prefix = ${addprefix $(publishdir)/,$(srcs)}

.PHONY: tgtdir
tgtdir:
	$(MKDIR_P) $(publishdir)

-include copyimages.sub
copyimages.sub: $(top_srcdir)/bin/copymake.sh $(top_builddir)/config.log
	@$(top_srcdir)/bin/copymake.sh copyimages $(publishdir) $(srcs)
