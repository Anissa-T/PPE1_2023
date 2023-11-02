#!/usr/bin/env bash


if [ $# -ne 1 ]
then
    echo " Ce programme demande un argument"
    exit
fi
fichier_url=$1
lignes=1

while read -r line;
do
    #faire apparaitre le code des URLs
    html_code=$(curl -Ls -o /dev/null -w "%{http_code}" $line)
    encodage_html=$(curl -ILs -o /dev/null -w "%{content_type}" $line | grep -Eo "charset=(\w|-)+" | cut -d= -f2)
    echo -e "$lignes\t$line\t$html_code\t$encodage_html";
    ((lignes++));
done < "$fichier_url"
