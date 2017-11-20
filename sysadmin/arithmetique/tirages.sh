#!/bin/bash

all=($(getent passwd | cut -d ':' -f 1 | tr "\n" " "))

echo "il y a ${#all[*]} utilisateurs"

for ((i=0;i<11;i++));do
	index=$[$RANDOM%${#all[*]}+1]
	tab=(${all[$index]} ${tab[*]})
done

echo "${tab[*]}"
