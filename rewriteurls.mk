.PHONY: rewriteurls
rewriteurls:
	@for dir in $(SUBDIRS); do $(MAKE) -C $$dir $@; done
	@for d in $(bases); do \
	  if test "x$$d" = "xindex"; then \
	    b="" ; \
	  else \
	    b="$$d/" ; \
	  fi ; \
	  sed -i -e "s|a href=\"#|a href=\"$(uploadurl)/$$d.md#|g" $(uploaddir)/$${b}index.html ; \
	done
