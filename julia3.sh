#!/bin/bash

_FRACTAL_NAME_="Julia3"
_SIZE_=2048
_ITERATION_=200
_FOLDER_="julia3"

if [ "$#" -ge 1 ]; then
    if [ "$1" != "-p" ]; then
        echo "-p --palette-name <name>"
        echo "    Nom de la palette :"
        echo "        Red"
        echo "        Green"
        echo "        Blue"
        echo "        Gray"
    else
        if [ "$#" -ge 2 ]; then
            echo "Construction de la fractale en cours..."
            if [ -d $_FOLDER_ ]; then
                echo "Le dossier $_FOLDER_ existe déjà."
            else
                echo "Création du dossier $_FOLDER_..."
                mkdir $_FOLDER_
            fi
            if [ "$2" = "Red" -o "$2" = "Green" -o "$2" = "Blue" -o "$2" = "Gray" ]; then
                java -jar fractales-base.jar -f $_FRACTAL_NAME_ -h $_SIZE_ -n $_ITERATION_ -o $_FOLDER_/$_FOLDER_-0.png -p $2 -s 0.02048 -w $_SIZE_ -x 0 -y 0
                java -jar fractales-base.jar -f $_FRACTAL_NAME_ -h $_SIZE_ -n $_ITERATION_ -o $_FOLDER_/$_FOLDER_-1.png -p $2 -s 0.002048 -w $_SIZE_ -x 0 -y 0
                java -jar fractales-base.jar -f $_FRACTAL_NAME_ -h $_SIZE_ -n $_ITERATION_ -o $_FOLDER_/$_FOLDER_-2.png -p $2 -s 0.0002048 -w $_SIZE_ -x 0 -y 0
            else
                echo "[EREUR] Ce nom de palette n'existe pas."
            fi
        else
            echo "[ERREUR] Il faut mettre le nom de la palette."
        fi
    fi
else
    echo "-p --palette-name <name>"
    echo "    Nom de la palette :"
    echo "        Red"
    echo "        Green"
    echo "        Blue"
    echo "        Gray"
fi