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
! test -f $1 && echo "$1 n'est pas un fichier" && exit 2

test $# -gt 1 && echo "plusieurs arguments fournis, seul le premier sera pris en compte"

echo -n "Supprimer $1 ? ";read
case $REPLY in
	O*|o*|Y*|y*) rm $1;;
	N*|n*) exit 3;;
	*) echo "ecrivez Oui ou Non";exit 4;;
esac

test $? -eq 0 && exit 0
exit 5
