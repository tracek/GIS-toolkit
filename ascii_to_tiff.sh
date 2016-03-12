#!/bin/bash

for ascfile in *.asc; do
	 echo "Processing " $ascfile
     name=${ascfile%.*}
     newname="${name}.tif"
     gdalwarp -s_srs '+proj=moll +lon_0=0 +x_0=0 +y_0=0 +ellps=WGS84 +datum=WGS84 +units=m no_defs' -t_srs EPSG:4326 -co NBITS=1 -co COMPRESS=CCITTRLE -co PHOTOMETRIC=MINISWHITE -ot Byte $ascfile $newname
done
