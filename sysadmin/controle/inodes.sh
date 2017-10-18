#!/bin/bash

test $# -eq 0 && echo "pas assez d'arguments" && exit 1

for f;do
	test -f $f && echo -n "inode de $f : " && stat $f -c%i && continue
	test -h $f # && trouver l'inode du fichier cible && continue
	test -d $f && ./$0 $f/* # appel recursif ?
done

exit 0
