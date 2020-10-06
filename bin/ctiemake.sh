#!/bin/sh

# The first arg:	$1	directory where the merge files will be created in
# The second arg:	$2	list for merge files

dirname=$1
list=${@:2:($#-1)}

rm -f Makefile.sub
echo "# Makefile.sub">Makefile.sub

for f in $list; do
    ext=`echo $f | sed 's/^.*\.\([^\.]*\)$/\1/'`
    base=`echo $f | sed "s/\.[^\.]*$//"`
    if test "x${ext}" = "xmd"; then
      change="ch"
    else
      change="${ext}ch"
    fi
    echo "$dirname/$f: \$(origdir)/$f \$(srcdir)/$base.$change">>Makefile.sub
    echo "	@echo Processing $f...">>Makefile.sub
    echo "	@\$(top_builddir)/\$(CTIE) -m \$@ \$(origdir)/$f \$(srcdir)/$base.$change >/dev/null">>Makefile.sub
done
