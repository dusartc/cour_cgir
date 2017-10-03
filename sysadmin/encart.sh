#!/bin/bash

echo "Bonjour $USER, nous sommes le $(date +%j)eme jour de l'année\nNumero d'utilisateur : $UID\nGroupe de connexion : $(groups $USER | cut -d " " f 1) $(id | cut -d ' ' -f 2 | cut -d = -f 2 | sed "s/(/ (/") \nGroupes secondaire : $(id -nG)\nAutres utilisateurs connectés :  
