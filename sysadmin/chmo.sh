#!/bin/bash

test $# -eq 0 && echo "usage : $0 file" && exit 1


for f;do
	i=0
	for u in utilisateur groupe autres;do
		echo "selectionner des droits pour $u"
		i=$(($i+1))
		select ans in "rwx" "rw-" "r-x" "-wx" "r--" "-w-";do
			[[ $i -eq 1 ]] && chmod u=$ans $f && break
			[[ $i -eq 2 ]] && chmod g=$ans $f && break
			chmod o=$ans $f && break
		done
	done
done
