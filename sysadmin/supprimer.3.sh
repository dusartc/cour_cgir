#!/bin/bash

###########################################
# rm                                      # 
# code 1 : pas assez d'arguments          #
# code 2 : fichier inexistant en argument #
# code 3 : refus                          #
# code 4 : aucune confirmation            #
# code 5 : rm s'est mal exécuté           #
###########################################

test $# -lt 1 && echo "pas assez d'arguments" && exit 1
! test -f $1 && echo "$1 n'est pas un fichier" && exit 1

for ligne in $(cat $1);do
	! test -f $ligne && echo "$ligne n'est pas un fichier, passage au suivant" && continue
	echo "supprimer $ligne ?"
	select ans in "Oui" "Non";do
		[[ $REPLY -eq 1 ]] && rm $ligne && break
		[[ $REPLY -eq 2 ]] && exit 3
	done
done
