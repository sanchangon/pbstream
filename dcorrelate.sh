#-------------------------------------------------------------------------------
# chingchai humhong (chingchai sanchangon)
# 15/07/2016
# chingchai.h@gmail.com, chingchaih@nu.ac.th
# GISTNU @ Naresuan University
# MIT@License
# github : https://github.com/sanchangon
#-------------------------------------------------------------------------------
# Examples Correlation in GRASS GIS 6.x and & 7.x
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
#-------------------------------------------------------------------------------
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

# set region before split geomorphon raster
g.region -p rast=ref.moac.geomph@PERMANENT

# split geomorphon raster
# 1. flat
r.mapcalc 'geomph.flat = if( ref.moac.geomph@PERMANENT == 1,1, null() )'
g.list type=rast
r.mask -o input=geomph.flat@PERMANENT
# moac vs srtm in flat area
d.correlate -t layer1=ref.moac.fill layer2=fill.srtm --verbose
ref.moac.fill vs. fill.srtm ...
y = 0.995624*x + -2.057316
R^2 = 0.9982
# moac vs aw3d in flat area
d.correlate -t layer1=ref.moac.fill layer2=fill.aw3d.2 --verbose
ref.moac.fill vs. fill.aw3d.2 ...
y = 0.992291*x + -0.955425
R^2 = 0.9988
# moac vs aster in flat area
d.correlate -t layer1=ref.moac.fill layer2=fill.aster --verbose
ref.moac.fill vs. fill.aster ...
y = 0.975508*x + 12.809822
R^2 = 0.9858
# remove mask flat area
r.mask -r input=geomph.flat@PERMANENT

# 2. summit
r.mapcalc 'geomph.summit = if( ref.moac.geomph@PERMANENT == 2,1, null() )'
g.list type=rast
r.mask -o input=geomph.summit@PERMANENT
# moac vs srtm in summit area
d.correlate -t layer1=ref.moac.fill layer2=fill.srtm --verbose
ref.moac.fill vs. fill.srtm ...
y = 1.002223*x + 1.888197
R^2 = 0.9994
# moac vs aw3d in summit area
d.correlate -t layer1=ref.moac.fill layer2=fill.aw3d.2 --verbose
ref.moac.fill vs. fill.aw3d.2 ...
y = 0.995570*x + 1.800926
R^2 = 0.9996
# moac vs aster in summit area
d.correlate -t layer1=ref.moac.fill layer2=fill.aster --verbose
ref.moac.fill vs. fill.aster ...
y = 0.999650*x + 11.836692
R^2 = 0.9988
# remove mask summit area
r.mask -r input=geomph.summit@PERMANENT

# 3.ridge
r.mapcalc 'geomph.ridge = if( ref.moac.geomph@PERMANENT == 3,1, null() )'
g.list type=rast
r.mask -o input=geomph.ridge@PERMANENT
# moac vs srtm in ridge area
d.correlate -t layer1=ref.moac.fill layer2=fill.srtm --verbose
ref.moac.fill vs. fill.srtm ...
y = 1.000774*x + 0.513694
R^2 = 0.9994
# moac vs aw3d in ridge area
d.correlate -t layer1=ref.moac.fill layer2=fill.aw3d.2 --verbose
ref.moac.fill vs. fill.aw3d.2 ...
y = 0.994215*x + 0.716029
R^2 = 0.9996
# moac vs aster in ridge area
d.correlate -t layer1=ref.moac.fill layer2=fill.aster --verbose
ref.moac.fill vs. fill.aster ...
y = 0.996939*x + 10.316393
R^2 = 0.9987
# remove mask ridge area
r.mask -r input=geomph.ridge@PERMANENT

# 4.shoulder
r.mapcalc 'geomph.shoulder = if( ref.moac.geomph@PERMANENT == 4,1, null() )'
g.list type=rast
r.mask -o input=geomph.shoulder@PERMANENT
# moac vs srtm in shoulder area
d.correlate -t layer1=ref.moac.fill layer2=fill.srtm --verbose
ref.moac.fill vs. fill.srtm ...
y = 0.995996*x + -2.273020
R^2 = 0.9993
# moac vs aw3d in shoulder area
d.correlate -t layer1=ref.moac.fill layer2=fill.aw3d.2 --verbose
ref.moac.fill vs. fill.aw3d.2 ...
y = 0.991442*x + -0.820885
R^2 = 0.9995
# moac vs aster in shoulder area
d.correlate -t layer1=ref.moac.fill layer2=fill.aster --verbose
ref.moac.fill vs. fill.aster ...
y = 0.983802*x + 10.766851
R^2 = 0.9955
# remove mask shoulder area
r.mask -r input=geomph.shoulder@PERMANENT

# 5.spur
r.mapcalc 'geomph.spur = if( ref.moac.geomph@PERMANENT == 5,1, null() )'
g.list type=rast
r.mask -o input=geomph.spur@PERMANENT
# moac vs srtm in spur area
d.correlate -t layer1=ref.moac.fill layer2=fill.srtm --verbose
ref.moac.fill vs. fill.srtm ...
y = 0.994515*x + 0.828669
R^2 = 0.9989
# moac vs aw3d in spur area
d.correlate -t layer1=ref.moac.fill layer2=fill.aw3d.2 --verbose
ref.moac.fill vs. fill.aw3d.2 ...
y = 0.990012*x + 0.197781
R^2 = 0.9991
# moac vs aster in spur area
d.correlate -t layer1=ref.moac.fill layer2=fill.aster --verbose
ref.moac.fill vs. fill.aster ...
y = 0.990803*x + 9.572100
R^2 = 0.998
# remove mask spur area
r.mask -r input=geomph.spur@PERMANENT

# 6.slope
r.mapcalc 'geomph.slope = if( ref.moac.geomph@PERMANENT == 6,1, null() )'
g.list type=rast
r.mask -o input=geomph.slope@PERMANENT
# moac vs srtm in slope area
d.correlate -t layer1=ref.moac.fill layer2=fill.srtm --verbose
ref.moac.fill vs. fill.srtm ...
y = 0.991114*x + -1.911971
R^2 = 0.9989
# moac vs aw3d in slope area
d.correlate -t layer1=ref.moac.fill layer2=fill.aw3d.2 --verbose
ref.moac.fill vs. fill.aw3d.2 ...
y = 0.987017*x + -1.745098
R^2 = 0.9989
# moac vs aster in slope area
d.correlate -t layer1=ref.moac.fill layer2=fill.aster --verbose
ref.moac.fill vs. fill.aster ...
y = 0.986098*x + 7.335755
R^2 = 0.998
# remove mask slope area
r.mask -r input=geomph.slope@PERMANENT

# 7.hollow
r.mapcalc 'geomph.hollow = if( ref.moac.geomph@PERMANENT == 7,1, null() )'
g.list type=rast
r.mask -o input=geomph.hollow@PERMANENT
# moac vs srtm in hollow area
d.correlate -t layer1=ref.moac.fill layer2=fill.srtm --verbose
ref.moac.fill vs. fill.srtm ...
y = 0.987677*x + -3.895778
R^2 = 0.9987
# moac vs aw3d in hollow area
d.correlate -t layer1=ref.moac.fill layer2=fill.aw3d.2 --verbose
ref.moac.fill vs. fill.aw3d.2 ...
y = 0.984352*x + -3.789072
R^2 = 0.9988
# moac vs aster in hollow area
d.correlate -t layer1=ref.moac.fill layer2=fill.aster --verbose
ref.moac.fill vs. fill.aster ...
y = 0.982470*x + 4.370333
R^2 = 0.9976
# remove mask hollow area
r.mask -r input=geomph.hollow@PERMANENT

# 8.footslope
r.mapcalc 'geomph.footslope = if( ref.moac.geomph@PERMANENT == 8,1, null() )'
g.list type=rast
r.mask -o input=geomph.footslope@PERMANENT
# moac vs srtm in footslope area
d.correlate -t layer1=ref.moac.fill layer2=fill.srtm --verbose
ref.moac.fill vs. fill.srtm ...
y = 0.989632*x + -1.990835
R^2 = 0.9993
# moac vs aw3d in footslope area
d.correlate -t layer1=ref.moac.fill layer2=fill.aw3d.2 --verbose
ref.moac.fill vs. fill.aw3d.2 ...
y = 0.986778*x + -0.798791
R^2 = 0.9994
# moac vs aster in footslope area
d.correlate -t layer1=ref.moac.fill layer2=fill.aster --verbose
ref.moac.fill vs. fill.aster ...
y = 0.979866*x + 10.832234
R^2 = 0.9967
# remove mask footslope area
r.mask -r input=geomph.footslope@PERMANENT

# 9.valley
r.mapcalc 'geomph.valley = if( ref.moac.geomph@PERMANENT == 9,1, null() )'
g.list type=rast
r.mask -o input=geomph.valley@PERMANENT
# moac vs srtm in valley area
d.correlate -t layer1=ref.moac.fill layer2=fill.srtm --verbose
ref.moac.fill vs. fill.srtm ...
y = 0.980474*x + -3.783775
R^2 = 0.999
# moac vs aw3d in valley area
d.correlate -t layer1=ref.moac.fill layer2=fill.aw3d.2 --verbose
ref.moac.fill vs. fill.aw3d.2 ...
y = 0.976831*x + -2.879760
R^2 = 0.999
# moac vs aster in valley area
d.correlate -t layer1=ref.moac.fill layer2=fill.aster --verbose
ref.moac.fill vs. fill.aster ...
y = 0.973118*x + 5.639704
R^2 = 0.9981
# remove mask valley area
r.mask -r input=geomph.valley@PERMANENT

# 10.depression
r.mapcalc 'geomph.depression = if( ref.moac.geomph@PERMANENT == 10,1, null() )'
g.list type=rast
r.mask -o input=geomph.depression@PERMANENT
# moac vs srtm in depression area
d.correlate -t layer1=ref.moac.fill layer2=fill.srtm --verbose
ref.moac.fill vs. fill.srtm ...
y = 0.979261*x + -4.654645
R^2 = 0.9992
# moac vs aw3d in depression area
d.correlate -t layer1=ref.moac.fill layer2=fill.aw3d.2 --verbose
ref.moac.fill vs. fill.aw3d.2 ...
y = 0.975779*x + -3.458951
R^2 = 0.9991
# moac vs aster in depression area
d.correlate -t layer1=ref.moac.fill layer2=fill.aster --verbose
ref.moac.fill vs. fill.aster ...
y = 0.972184*x + 4.900387
R^2 = 0.9983
# remove mask depression area
r.mask -r input=geomph.depression@PERMANENT
