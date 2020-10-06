#!/bin/sh

# The first arg:		$1		subMakefile name（ex. jsnons, others）
# The second arg:		$2		directory where the merge files will be created in
# The third and later args:	${@:2:($#-1)}	target filename list

name=$1
dirname=$2
list=${@:3:($#-2)}

rm -f $name.sub
echo "# $name.sub">$name.sub

for f in $list; do
target=`grep "^$f:" $name.sub`
# if test "x${target}"="x"; then
    echo "$dirname/$f: \$(origdir)/$f" >> $name.sub
    echo "	@echo Copying $f..." >> $name.sub
    echo "	@cp -p \$^ \$@" >> $name.sub
# fi
done
