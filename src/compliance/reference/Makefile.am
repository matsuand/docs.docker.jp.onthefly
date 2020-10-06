SUBDIRS = 800-53

#.PHONY: publishinstall
#publishinstall:
#	@for dir in $(SUBDIRS); do $(MAKE) -C $$dir $@; done

.PHONY: rewriteurls
rewriteurls:
	@for dir in $(SUBDIRS); do $(MAKE) -C $$dir $@; done

.PHONY: publishclean
publishclean:
	@for f in $(srcs); do rm -f ${publishdir}/$$f; done
	@rm -fr $(thisdir)
