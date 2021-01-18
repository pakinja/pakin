#!/bin/sh

clear
echo "Inicia Actualización de base de datos h_melate (postgresql)\n"

dbname="sorteos"
username="pakin"
psql $dbname $username << EOF

CREATE TEMP TABLE tmp_x AS SELECT * FROM h_melate LIMIT 0;

COPY tmp_x FROM '/home/pakin/Documents/desarrolloWeb/PakinV5/Melate.csv' DELIMITER ',' CSV HEADER;
ANALYZE tmp_x;

INSERT INTO h_melate
SELECT DISTINCT tmp_x.*
FROM tmp_x
LEFT JOIN h_melate USING("NPRODUCTO","CONCURSO", "R1", "R2", "R3", "R4", "R5", "R6", "R7", "BOLSA", "FECHA")
WHERE h_melate."CONCURSO" IS NULL;


EOF

echo "Termina Actualización de base de datos h_melate (postgresql)\n"

