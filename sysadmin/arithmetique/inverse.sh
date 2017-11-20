#!/bin/bash

tab=$@

for ((i=${#tab};i>0;i--));do
	if [ "$(expr substr "${tab[0]}" $i 1)" == " " ];then
		echo -n ' '
	else
		echo -n $(expr substr "${tab[0]}" $i 1)
	fi
done

echo

exit 0
