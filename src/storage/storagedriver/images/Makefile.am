thisdir   = storage/storagedriver/images
origdir   = @abs_origdir@/$(thisdir)
srcdir    = @srcdir@
mysrcdir  = $(shell cd $(srcdir) && pwd)
targetdir = @abs_targetdir@/$(thisdir)
publishdir = @abs_publishdir@/$(thisdir)
uploaddir  = @UPLOADDIR@/$(thisdir)

.PHONY: all
all: tgtdir $(srcs_with_prefix)

images = \
	aufs_delete.jpg \
	aufs_layers.jpg \
	aufs_metadata.jpg \
	base_device.jpg \
	btfs_constructs.jpg \
	btfs_container_layer.jpg \
	btfs_layers.png \
	btfs_pool.jpg \
	btfs_snapshots.jpg \
	btfs_subvolume.jpg \
	container-layers-cas.jpg \
	container-layers.jpg \
	dm_container.jpg \
	driver-pros-cons.png \
	image-layers.jpg \
	lsblk-diagram.jpg \
	overlay_constructs.jpg \
	overlay_constructs2.jpg \
	saving-space.jpg \
	shared-uuid.jpg \
	sharing-layers.jpg \
	two_dm_container.jpg \
	zfs_clones.jpg \
	zfs_zpool.jpg \
	zpool_blocks.jpg

srcs = $(images)
srcs_with_prefix = ${addprefix $(publishdir)/,$(srcs)}

.PHONY: tgtdir
tgtdir:
	$(MKDIR_P) $(publishdir)

-include copyimages.sub
copyimages.sub: $(top_srcdir)/bin/copymake.sh $(top_builddir)/config.log
	@$(top_srcdir)/bin/copymake.sh copyimages $(publishdir) $(srcs)

#.PHONY: install
#install: all install.sub $(addprefix $(targetdir)/,$(srcs))

#-include install.sub
#install.sub: $(top_srcdir)/bin/copyinstall.sh $(top_builddir)/config.log
#	@$(top_srcdir)/bin/copyinstall.sh install $(targetdir) $(srcs)

#.PHONY: publishinstall
#publishinstall: all publishinstall.sub $(addprefix $(publishdir)/,$(srcs))

#-include publishinstall.sub
#publishinstall.sub: $(top_srcdir)/bin/copyinstall.sh $(top_builddir)/config.log
#	@$(top_srcdir)/bin/copyinstall.sh publishinstall $(publishdir) $(srcs)

.PHONY: rewriteurls
rewriteurls:

.PHONY: publishclean
publishclean:
