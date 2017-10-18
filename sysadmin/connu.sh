#!/bin/bash

user=$1
test $# -eq 0 && read -p "entrer un nom d'utilisateur : " user
test $# -gt 1 && echo "un seul argument attendu" && exit 1

cat /etc/passwd | grep "$user:" > /dev/null && echo "$user existe" && exit 0
