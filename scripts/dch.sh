#!/bin/sh

clear
echo "Inicia descarga de base de datos Chispazo\n"

until
wget -O /home/pakin/Documents/desarrolloWeb/PakinV5/Chispazo.csv  https://www.pronosticos.gob.mx/Documentos/Historicos/Chispazo.csv;
do echo Falla, retirando en 10 seg...
sleep 10
done  

echo "Termina descarga\n"
