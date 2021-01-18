
#!/bin/sh

dbname="sorteos"
username="pakin"
psql $dbname $username << EOF

CREATE TEMP TABLE tmp_x AS SELECT * FROM h_chispazo LIMIT 0;

COPY tmp_x FROM '/home/pakin/Documents/desarrolloWeb/PakinV3o2/Chispazo.csv' DELIMITER ',' CSV HEADER;

UPDATE h_chispazo

SET "R1" = tmp_x."R1",
    "R2" = tmp_x."R2",
    "R3" = tmp_x."R3",
    "R4" = tmp_x."R4",
    "R5" = tmp_x."R5",
    "FECHA" = tmp_x."FECHA

FROM tmp_x
WHERE h_chispazo."CONCURSO" = tmp_x."CONCURSO";

DROP TABLE tmp_x;

EOF

