#!/bin/bash
for shapefile in *.shp; do
    name=${shapefile%.*}
    kml="$name.kml"
	echo item: $kml
	ogr2ogr -f KML -s_srs EPSG:3857 -t_srs EPSG:3857 $kml $shapefile	
done
