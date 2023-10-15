#!/bin/bash
#le nombre de Location pour l'année 2016
echo "Pour l'année 2016" > sortie.txt 
cat ./2016/*/* | grep Location | wc -l >> sortie.txt 

#le nombre de Location pour l'année 2017
echo "Pour l'année 2017" >> sortie.txt 
cat ./2017/*/* | grep Location | wc -l >> sortie.txt 

#le nombre de Location pour l'année 2018
echo "Pour l'année 2018" >> sortie.txt 
cat ./2018/*/* | grep Location | wc -l >> sortie.txt 
