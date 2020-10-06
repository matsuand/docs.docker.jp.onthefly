SUBDIRS = ctie src

EXTRA_DIST=bin/buildch.perl bin/copymake.sh bin/ctiemake.sh \
	bin/ctiemake2.sh bin/copyinstall.sh bin/rewritelink.sh

%:
	(cd src && $(MAKE) $@)
