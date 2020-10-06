#!/bin/sh

# The first arg:		$1		makefile name
# The second arg:		$2		directory name
# The third and later args:	${@:3:($#-2)}	target filename list

name=$1
dirname=$2
list=${@:3:($#-2)}

if test ! -d $dirname; then
  mkdir -p $dirname
fi

rm -f $name.sub
#if test ! -f $name.sub; then
  echo "# $name.sub">$name.sub
#fi

for f in $list; do
# target=`grep "^$dirname/$f:" $name.sub`
# if test "x${target}"="x"; then
    echo "$dirname/$f: $f" >> $name.sub
    echo "	@cp -p \$^ \$@" >> $name.sub
# fi
done
