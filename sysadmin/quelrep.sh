#!/bin/bash

for arg;do
	for rep in $(echo $PATH | tr ':' ' ');do
		ls $rep 2>/dev/null | grep $arg >/dev/null && (echo "$arg present dans $rep") || echo "$arg n'est pas present dans $rep"
	done
done	
