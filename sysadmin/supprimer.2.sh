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

for arg;do
	! test -f $arg && echo "$arg n'est pas un fichier, passage au suivant" && continue
	echo "supprimer $arg ?"
	select ans in "Oui" "Non";do
		[[ $REPLY -eq 1 ]] && rm $arg && break
		[[ $REPLY -eq 2 ]] && exit 3
	done
done
