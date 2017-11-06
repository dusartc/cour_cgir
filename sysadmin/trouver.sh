#!/bin/bash

function present {
	! test -r $2 && return 2
	cat $2 | grep $1 >/dev/null && return 0
	return 1
}

! test $# -lt 2 && echo "pas assez d'argument" && exit 1

what=$1
shift
for arg in $*;do
	present $what $arg
	retour=$?
	test $retour -eq 0 && echo "$1 present dans $2" && continue 
	test $retour -eq 1 && echo "$1 non present dans $2" && continue
	test $retour -eq 2 && echo "$2 non lisible" && exit 2
done
