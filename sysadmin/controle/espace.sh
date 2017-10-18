#!/bin/bash

dir=$*
test $# -eq 0 && echo "utilisation du repertoire courant $(pwd)" && dir=$(pwd)
pwd=$(pwd)

for f in $dir;do
	cd $pwd #on revient au depart pour gerer les autres arguments
	! test -e $f && echo "$f n'est pas un fichier qui existe" && continue
	! test -d $f && echo "$f n'est pas un repertoire" && continue
	! test -w $f && echo "ne possede pas de droit d'ecriture sur $f" && continue
	! test $# -eq 0 && cd $f	
	cd "$f" 2>/dev/null # affiche une erreur mais se deplace quand meme...
	for ff in *;do
		! echo $ff | grep " " > /dev/null && echo "$ff ne contient pas d'espace" && continue
		echo "fichier $ff renommé en $(echo $ff | tr " " "_")"
		mv "$(pwd)/$ff" "$(pwd)/$(echo $ff | tr " " "_")"
	done
done

exit 0
