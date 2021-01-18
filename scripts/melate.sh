#!/bin/sh

clear
echo "Inicia descarga de base de datos Melate\n"

until
wget -O /home/pakin/Documents/desarrolloWeb/PakinV5/me/Melate.csv  https://www.pronosticos.gob.mx/Documentos/Historicos/Melate.csv;
do echo Falla, retirando en 10 seg...
sleep 10
done 

echo "Termina descarga\n"

echo "Inicia copia de Melate.csv a producción"
cp /home/pakin/Documents/desarrolloWeb/PakinV5/me/Melate.csv  /home/pakin/Documents/pakin/Melate.csv &&

echo "Inicia ejecución y exportación de melate notebook a desarrollo\n"

/home/pakin/anaconda3/bin/jupyter nbconvert --ExecutePreprocessor.timeout=180 --execute --to html /home/pakin/Documents/desarrolloWeb/PakinV5/melate.ipynb --output /home/pakin/Documents/desarrolloWeb/PakinV5/me/melate.html &&

echo "Termina proceso melate en desarrollo\n"

echo "Inicia incersión en <head> de scripts y metas en desarrollo\n"

sed -i '5i\	<link rel="stylesheet" type="text/css" href="../styles/estilos.css">\n	<script type="application/ld+json">\n{\n  "@context": "https://schema.org",\n  "@type": "Article",\n  "mainEntityOfPage":{\n    "@type": "WebPage",\n    "@id": "https://www.pakin.lat/lab-python/melate.html"\n  },\n  "headline": "Minería de Datos Sobre Sorteo Melate",\n  "image": [\n    "https://www.pakin.lat/images/pakin-logo2.png"\n   ],\n  "datePublished": "2019-04-03 00:35",\n  "dateModified": "2019-04-03 00:35",\n  "author": {\n    "@type": "Person",\n    "name": "Francisco Jaramillo A."\n  },\n   "publisher": {\n    "@type": "Organization",\n    "name": "Pakin Ciencia de Datos",\n    "logo": {\n      "@type": "ImageObject",\n      "url": "https://www.pakin.lat/images/pakin-logo2.png"\n    }\n  },\n  "description": "La más completa información estadística sobre sorteo Melate"\n}\n</script>\n	<meta name="author" content="Francisco Jaramillo A.">\n	<script async src = "//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>\n	<script>\n		(adsbygoogle = window.adsbygoogle || []).push({\n		google_ad_client: "ca-pub-1379506914303333",\n		enable_page_level_ads: true\n		});\n	</script>\n	<!-- Global site tag (gtag.js) - Google Analytics -->\n	<script async src="https://www.googletagmanager.com/gtag/js?id=UA-71562711-10"></script>\n	<script>\n		window.dataLayer = window.dataLayer || [];\n		function gtag(){dataLayer.push(arguments);}\n		gtag("js", new Date());\n		gtag("config", "UA-71562711-10");\n	</script>\n	<link rel = "icon" type = "image/gif" href = "../images/cat.png">\n		<meta property = "og:title" content = "Minería de Datos Sobre Sorteo Melate."/>\n	<meta property = "og:type" content = "article"/>\n	<meta property = "og:url" content = "https://www.pakin.lat/lab-python/melate.html/"/>\n	<meta property = "og:image" content = "https://www.pakin.lat/images/melate-2.jpg"/>\n	<meta property = "og:description" content = "Inspiración y Conocimiento para Cambiar el Mundo."/>' /home/pakin/Documents/desarrolloWeb/PakinV5/me/melate.html &&

d="`date '+%Y-%m-%d %H:%M'`";sed -Ei "s/(.*\"dateModified\": ).*/\1\"$d\",/i" /home/pakin/Documents/desarrolloWeb/PakinV5/me/melate.html &&

echo "Termina inserción de scripts y metas en desarrollo\n"

echo "Inicia reemplazo de estilos\n"

sed -Ei '/^\s*pre\s*\{\s*$/,/^\s*}\s*$/ {/^\s*font-size:\s*inherit\s*;\s*$/ s#^(.*)$#	font-size: 18px;#; /^\s*line-height:\s*inherit\s*;\s*$/ s#^(.*)$#/*&*/#;}' /home/pakin/Documents/desarrolloWeb/PakinV5/me/melate.html &&

sed -i 's/<title>melate<\/title>/<title>Minería de Datos Sobre Sorteo Melate<\/title>/g' /home/pakin/Documents/desarrolloWeb/PakinV5/me/melate.html &&

echo "Termina reemplazo de estilos\n"

echo "Inicia copia de melate.html y duplicados_melate de desarollo a producción\n"

cp /home/pakin/Documents/desarrolloWeb/PakinV5/me/melate.html  /home/pakin/Documents/pakin/melate.html &&
cp /home/pakin/Documents/desarrolloWeb/PakinV5/me/repetidos_melate.csv  /home/pakin/Documents/pakin/repetidos_melate.csv &&    

echo "Termina copia de melate.html a producción\n"

echo "Inicia Actualización de base de datos h_melate (postgresql)\n"

dbname="sorteos"
username="pakin"
psql $dbname $username << EOF

CREATE TEMP TABLE tmp_x AS SELECT * FROM h_melate LIMIT 0;

COPY tmp_x FROM '/home/pakin/Documents/desarrolloWeb/PakinV5/me/Melate.csv' DELIMITER ',' CSV HEADER;
ANALYZE tmp_x;

INSERT INTO h_melate
SELECT DISTINCT tmp_x.*
FROM tmp_x
LEFT JOIN h_melate USING("NPRODUCTO","CONCURSO", "R1", "R2", "R3", "R4", "R5", "R6", "R7", "BOLSA", "FECHA")
WHERE h_melate."CONCURSO" IS NULL;


EOF

echo "Termina Actualización de base de datos h_melate (postgresql)\n"




