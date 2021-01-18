--COPY chispazo("R1", "R2", "R3", "R4", "R5", "MEDIA", "N_PRIMOS")
--FROM '/home/pakin/Documents/chispazo/ch_total.csv' DELIMITER ',' CSV HEADER;


--COPY melate("R1", "R2", "R3", "R4", "R5", "R6", "MEDIA", "N_PRIMOS")
--FROM '/home/pakin/Documents/chispazo/me_total.csv' DELIMITER ',' CSV HEADER;


--COPY h_chispazo("CONCURSO", "R1", "R2", "R3", "R4", "R5", "FECHA")
--FROM '/home/pakin/Documents/desarrolloWeb/PakinV3o2/Chispazo.csv' DELIMITER ',' CSV HEADER;


--COPY h_melate("NPRODUCTO", "CONCURSO", "R1", "R2", "R3", "R4", "R5", "R6", "R7", "BOLSA", "FECHA")
--FROM '/home/pakin/Documents/desarrolloWeb/PakinV3o2/Melate.csv' DELIMITER ',' CSV HEADER;


--SELECT *
--FROM chispazo;


--SELECT *
--FROM melate
--LIMIT 100;

--SELECT *
--FROM h_chispazo
--ORDER BY "CONCURSO" DESC;

--SELECT *
--FROM h_melate
--ORDER BY "CONCURSO" DESC;

--ALTER TABLE chispazo
--ADD COLUMN N_GAN int;

--SELECT "R1", "R2", "R3", "R4", "R5"
--From chispazo
--INTERSECT
--SELECT "R1", "R2", "R3", "R4", "R5"
--FROM h_chispazo;

--SELECT *
--FROM chispazo
--LEFT JOIN h_chispazo ON (chispazo."R1" = h_chispazo."R1" AND 
--			chispazo."R2" = h_chispazo."R2" AND
--			chispazo."R3" = h_chispazo."R3" AND
--			chispazo."R4" = h_chispazo."R4" AND
--			chispazo."R5" = h_chispazo."R5")

--SELECT id
--FROM chispazo
--RIGHT JOIN h_chispazo ON (chispazo."R1" = h_chispazo."R1" AND 
--			chispazo."R2" = h_chispazo."R2" AND
--			chispazo."R3" = h_chispazo."R3" AND
--			chispazo."R4" = h_chispazo."R4" AND
--			chispazo."R5" = h_chispazo."R5")




--SELECT *
--FROM chispazo
--WHERE id IN
--(SELECT id
--FROM chispazo
--EXCEPT
--SELECT id
--FROM chispazo
--RIGHT JOIN h_chispazo ON (chispazo."R1" = h_chispazo."R1" AND
--			chispazo."R2" = h_chispazo."R2" AND
--			chispazo."R3" = h_chispazo."R3" AND
--			chispazo."R4" = h_chispazo."R4" AND
--			chispazo."R5" = h_chispazo."R5")
--ORDER BY id);



SELECT ID, "R1" , "R2", "R3", "R4", "R5", "MEDIA", "N_PRIMOS"
FROM chispazo
WHERE id IN

	(SELECT id
	FROM chispazo
	EXCEPT

		SELECT id
		FROM chispazo
		RIGHT JOIN h_chispazo ON (chispazo."R1" = h_chispazo."R1" AND 
					chispazo."R2" = h_chispazo."R2" AND
					chispazo."R3" = h_chispazo."R3" AND
					chispazo."R4" = h_chispazo."R4" AND
					chispazo."R5" = h_chispazo."R5")
	ORDER BY id) AND

("N_PRIMOS" >= 1 AND "N_PRIMOS" <= 3) AND
("R1" >= 1 AND "R1" <= 11) AND
("R2" >= 2 AND "R2" <= 18) AND
("R3" >= 6 AND "R3" <= 23) AND
("R4" >= 11 AND "R4" <= 27) AND
("R5" >= 18 AND "R5" <= 28);



--DELETE FROM h_chispazo
--WHERE "CONCURSO" IN( 6993, 6994, 6995, 6996, 6997, 6998, 6999, 7000);



--SELECT id, "R1" , "R2", "R3", "R4", "R5", "R6", "MEDIA", "N_PRIMOS"
--FROM melate
--WHERE id IN

--	(SELECT id
--	FROM melate
--	EXCEPT

--		SELECT id
--		FROM melate
--		RIGHT JOIN h_melate ON (melate."R1" = h_melate."R1" AND 
--					melate."R2" = h_melate."R2" AND
--					melate."R3" = h_melate."R3" AND
--					melate."R4" = h_melate."R4" AND
--					melate."R5" = h_melate."R5" AND
--					melate."R6" = h_melate."R6")
--		ORDER BY id) AND

--("N_PRIMOS" >= 1 AND "N_PRIMOS" <= 3) AND
--("R1" >= 1 AND "R1" <= 12) AND
--("R2" >= 5 AND "R2" <= 22) AND
--("R3" >= 16 AND "R3" <= 32) AND
--("R4" >= 25 AND "R4" <= 42) AND
--("R5" >= 35 AND "R5" <= 52) AND
--("R6" >= 44 AND "R6" <= 56);

