#!/bin/bash

test $# -eq 0 && echo "usage : $0 file" && exit 1
echo $*

fichiers="Fichiers :"
rep="Repertoires :"
autres="Autres :"
for f;do
	test -f $f && fichiers="$fichiers $f" && continue
	test -d $f && rep="$rep $f" && continue
	autres="$autres $f" && continue
done

echo $fichiers
echo $rep
echo $autres
