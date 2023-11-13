#!/bin/bash

# Vérifier si un fichier est passé en argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <chemin_vers_fichier>"
    exit 1
fi
cat "$1" | tr -d '[:punct:]' | tr '[:upper:]' '[:lower:]' | grep -oE '\w+'
