#!/bin/bash

test $# -lt 1 && echo "pas assez d'arguments" && exit 1
! test -f $1 && echo "$1 n'est pas un fichier" && exit 1

function supprimer {
	! test -f $1 && echo "$1 n'est pas un fichier" && return 1
	echo "supprimer $1 ?"
	select ans in "Oui" "Non";do
		[[ $REPLY -eq 1 ]] && rm $1 && break
		[[ $REPLY -eq 2 ]] && exit 3
	done
	return 0
}


for ligne in $(cat $1);do
	supprimer $ligne
done
