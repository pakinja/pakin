#!/bin/sh

clear
echo "Inicia descarga de base de datos Melate\n"

until
wget -O /home/pakin/Documents/desarrolloWeb/PakinV5/me/Melate.csv  https://www.pronosticos.gob.mx/Documentos/Historicos/Melate.csv;
do echo Falla, retirando en 10 seg...
sleep 10
done 

echo "Termina descarga\n"
