#!/bin/bash

echo $* >/dev/null | grep [0-9] && echo "argument ne contenant aucun chiffre attendu" && exit 1
echo $* | tr [:upper:] [:lower:] |tr [a-y] [B-Z] | tr z A
