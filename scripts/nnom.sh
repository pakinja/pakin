#!/bin/sh

clear

echo "Inicia ejecución y exportación de nombres-us notebook a desarrollo\n"

/home/pakin/anaconda3/bin/jupyter nbconvert --execute --to html /home/pakin/Documents/desarrolloWeb/PakinV4/nombres-us.ipynb --output /home/pakin/Documents/desarrolloWeb/PakinV5/me/nombres-us.html &&

echo "Termina proceso nombres-us en desarrollo\n"

echo "Inicia incersión en <head> de scripts y metas en desarrollo\n"

sed -i '5i\	<link rel="stylesheet" type="text/css" href="../styles/estilos.css">\n	<script type="application/ld+json">\n{\n  "@context": "https://schema.org",\n  "@type": "Article",\n  "mainEntityOfPage":{\n    "@type": "WebPage",\n    "@id": "https://www.pakin.lat/lab-r/nombres-us.html"\n  },\n  "headline": "Análisis en R de los Nombres Más Populares en US Cada Año",\n  "image": [\n    "https://www.pakin.lat/images/pakin-logo2.png"\n   ],\n  "datePublished": "2019-04-03 00:35",\n  "dateModified": "2019-04-03 00:35",\n  "author": {\n    "@type": "Person",\n    "name": "Francisco Jaramillo A."\n  },\n   "publisher": {\n    "@type": "Organization",\n    "name": "Pakin Ciencia de Datos",\n    "logo": {\n      "@type": "ImageObject",\n      "url": "https://www.pakin.lat/images/pakin-logo2.png"\n    }\n  },\n  "description": "Análisis en lenguaje R de los Nombres Más Usados en US Cada Año"\n}\n</script>\n	<meta name="author" content="Francisco Jaramillo A.">\n	<!--script async src = "//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>\n	<script>\n		(adsbygoogle = window.adsbygoogle || []).push({\n		google_ad_client: "ca-pub-1379506914303333",\n		enable_page_level_ads: true\n		});\n	</script-->\n	<!-- Global site tag (gtag.js) - Google Analytics -->\n	<script async src="https://www.googletagmanager.com/gtag/js?id=UA-71562711-10"></script>\n	<script>\n		window.dataLayer = window.dataLayer || [];\n		function gtag(){dataLayer.push(arguments);}\n		gtag("js", new Date());\n		gtag("config", "UA-71562711-10");\n	</script>\n	<link rel = "icon" type = "image/gif" href = "../images/cat.png">\n		<meta property = "og:title" content = "Análisis en R de los Nombres Más Populares en US Cada Año."/>\n	<meta property = "og:type" content = "article"/>\n	<meta property = "og:url" content = "https://www.pakin.lat/lab-r/nombres-us.html/"/>\n	<meta property = "og:image" content = "https://www.pakin.lat/images/nombres-us.png"/>\n	<meta property = "og:description" content = "Inspiración y Conocimiento para Cambiar el Mundo."/>' /home/pakin/Documents/desarrolloWeb/PakinV5/me/nombres-us.html &&

d="`date '+%Y-%m-%d %H:%M'`";sed -Ei "s/(.*\"dateModified\": ).*/\1\"$d\",/i" /home/pakin/Documents/desarrolloWeb/PakinV5/me/nombres-us.html &&

echo "Termina incersión en <head> de scripts y metas en desarrollo\n"

echo "Inicia reemplazo de estilos\n"

sed -Ei '/^\s*pre\s*\{\s*$/,/^\s*}\s*$/ {/^\s*font-size:\s*inherit\s*;\s*$/ s#^(.*)$#	font-size: 18px;#; /^\s*line-height:\s*inherit\s*;\s*$/ s#^(.*)$#/*&*/#;}' /home/pakin/Documents/desarrolloWeb/PakinV5/me/nombres-us.html &&

sed -i 's/<title>nombres-us<\/title>/<title>Análisis en R de los Nombres Más Populares en US Cada Año<\/title>/g' /home/pakin/Documents/desarrolloWeb/PakinV5/me/nombres-us.html &&

echo "Termina reemplazo de estilos\n"

echo "Inicia copia de nombres-us.html de desarollo a producción\n"

cp /home/pakin/Documents/desarrolloWeb/PakinV5/me/nombres-us.html  /home/pakin/Documents/pakin/nombres-us.html  

echo "Termina copia de nombres-us.html a producción\n"
