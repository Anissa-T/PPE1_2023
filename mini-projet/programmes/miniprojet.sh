#!/usr/bin/env bash

if [ $# -ne 1 ]
then
    echo " Ce programme demande un argument"
    exit
fi

fichier_url=$1
tableau=$2 #le fichier de sortie en format HTML
lignes=1


#####

echo "<html><body>" > tableau.html
echo "<h2>Tableau $nom :</h2>" >> tableau.html
echo "<br/>" >> tableau.html
echo "<table>" >> tableau.html
echo "<tr><th>ligne</th><th>URL</th><th>code</th><th>encodage</th><th>aspiration</th><th>dump</th></tr>" >> tableau.html

#####



N=1

while read -r fichier_urls
do
    aspirations="/Users/anissa/Documents/master_TAL_2023_2024/aspirations/fich${N}.html"
    curl -L -o "$aspirations" $fichier_urls
    dumps="/Users/anissa/Documents/master_TAL_2023_2024/aspirations/dumps-text/fich${N}.txt"
    lynx --dump $fichier_urls >> $dumps
    N=$((N + 1))
    
done < "$fichier_url"


    while read -r line;
do
    #faire apparaitre le code des URLs
    html_code=$(curl -Ls -o /dev/null -w "%{http_code}" $line)
    #faire apparaitre l'encodage de chaques URLs
    encodage_html=$(curl -ILs -o /dev/null -w "%{content_type}" $line | grep -Eo "charset=(\w|-)+" | cut -d= -f2)
    echo -e "$lignes\t$line\t$html_code\t$encodage_html\t$aspirations\t$dumps";
    echo "<tr><td>$lignes</td><td>$line</td><td><a href=\"$html_code\">$html_code</a></td><td>$encodage_html</td><td><a href=\"$aspiration\">$aspirations</a></td><td><a href=\"$dumps\">$dumps</a></td>" >> tableau.html
    echo -e "\t--------------------------------"
    ((lignes++));
done < "$fichier_url"

# Fermeture fichier tableau URL

echo "</table>" >> tableau.html
echo "</body></html>" >> tableau.html
