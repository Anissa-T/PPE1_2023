#!/usr/bin/env bash
# Écrire un script qui compte les entités pour une année un type d’entité donnés en argument du programme.

echo "le premier argument est: ($1)"
if [ -n "$1" ]
then
echo "le premier argument n'est pas vide"
	if [[ $1 =~ 201(6|7|8)]]
	then
		echo " Pour l'année $1 : " #>> sortie.txt 
		cat ./ann/$1/*/* | grep $2 | wc -l #>> sortie.txt
	fi
else
	echo "le premier argument est vide"
fi
echo "fin du programme"