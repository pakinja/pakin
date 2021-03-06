#!/bin/sh

dbname="sorteos"
username="pakin"
psql $dbname $username << EOF

CREATE TEMP TABLE tmp_x AS SELECT * FROM h_chispazo LIMIT 0;

COPY tmp_x FROM '/home/pakin/Documents/desarrolloWeb/PakinV3o2/Chispazo.csv' DELIMITER ',' CSV HEADER;
ANALYZE tmp_x;

INSERT INTO h_chispazo
SELECT DISTINCT tmp_x.*
FROM tmp_x
LEFT JOIN h_chispazo USING("CONCURSO", "R1", "R2", "R3", "R4", "R5", "FECHA")
WHERE h_chispazo."CONCURSO" IS NULL;


EOF
