#-------------------------------------------------------------------------------
# chingchai humhong (chingchai sanchangon)
# 15/07/2016
# chingchai.h@gmail.com, chingchaih@nu.ac.th
# GISTNU @ Naresuan University
# MIT@License
# github : https://github.com/sanchangon
#-------------------------------------------------------------------------------
# Using Correlation in GRASS GIS 6.x and & 7.x
# Reference
https://grass.osgeo.org/grass73/manuals/d.mon.html
https://grass.osgeo.org/grass70/manuals/d.correlate.html
https://grass.osgeo.org/grass64/manuals/d.correlate.html

# Set windows for display
d.mon start=x0   #--> grass 6
d.mon start=wx0  #--> grass 7

# Set region workspace
g.region rast=fill.srtm ras=30 -p

# d.correlate for version 6
g.region rast=lsat7_2002_20
d.correlate -t layer1=lsat7_2002_20 layer2=lsat7_2002_30 --verbose

# d.correlate for version 7
g.region raster=lsat7_2002_30 -p
d.correlate map=lsat7_2002_30,lsat7_2002_40

# correlation dems for ACRS-2016 Project
# set region
g.region rast=ref.moac.fill -p

# get raster layers
g.list type=rast
----------------------------------------------
raster files available in mapset <PERMANENT>:
fill.aster      fill.srtm       raw.srtm        ref.moac.geomph voids.aw3d.fill
fill.aw3d       raw.aster       ref.moac.5m     ref.moac.hshed  voids.focal
fill.aw3d.2     raw.aw3d        ref.moac.fill   voids.aw3d      voids.mask
----------------------------------------------

# ref.moac.fill vs. fill.srtm ...
d.correlate -t layer1=ref.moac.fill layer2=fill.srtm --verbose
y = 0.991434*x + -1.713652
R^2 = 0.999

# ref.moac.fill vs. fill.aw3d.2 ...
d.correlate -t layer1=ref.moac.fill layer2=fill.aw3d.2 --verbose
y = 0.986666*x + -1.213760
R^2 = 0.9991

# ref.moac.fill vs. fill.aster ...
d.correlate -t layer1=ref.moac.fill layer2=fill.aster --verbose
y = 0.984966*x + 8.555335
R^2 = 0.9981

# category geomorphon
r.category --verbose map=ref.moac.geomph@PERMANENT
1	flat
2	summit
3	ridge
4	shoulder
5	spur
6	slope
7	hollow
8	footslope
9	valley
10	depression
(Sat Jul 16 08:49:31 2016) Command finished (11 sec)

# r.what
r.what --v -f -n input=ref.moac.geomph@PERMANENT east_north=734167.785439,1868283.700603
easting|northing|site_name|ref.moac.geomph@PERMANENT|ref.moac.geomph@PERMANENT_label
734167.785439|1868283.700603||4|shoulder

r.what --v -f -n input=ref.moac.geomph@PERMANENT east_north=726568.754080,1857016.171348
easting|northing|site_name|ref.moac.geomph@PERMANENT|ref.moac.geomph@PERMANENT_label
726568.754080|1857016.171348||5|spur

r.what --v -f -n input=ref.moac.geomph@PERMANENT east_north=726027.020739,1854864.726897
easting|northing|site_name|ref.moac.geomph@PERMANENT|ref.moac.geomph@PERMANENT_label
726027.020739|1854864.726897||7|hollow

r.what --v -f -n input=ref.moac.geomph@PERMANENT east_north=725896.278929,1855191.581422
easting|northing|site_name|ref.moac.geomph@PERMANENT|ref.moac.geomph@PERMANENT_label
725896.278929|1855191.581422||6|slope
