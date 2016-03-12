#!/bin/bash

# to be run from within GRASSGIS

for sp in `cat /myfolder/myspecieslist.txt`
 do
 # extract one species vector map
 v.extract in=all_birds_polygons_vectormap out=$sp.vector where="species_id = $sp"

 # set the region based on extracted vector
 g.region -a vect=$sp.vector res=1000

 # convert the vector to raster
 v.to.rast in=$sp.vector out=$sp.raster use=val val=1

 # export ther aster to a file
 r.out.gdal input=$sp.raster format=AAIGrid type=Byte output=$sp.raster.asc nodata='99'
done
