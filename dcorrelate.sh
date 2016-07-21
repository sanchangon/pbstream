#-------------------------------------------------------------------------------
# Mr Chingchai Humhong
# Assoc Prof Dr Chada Narongrit
# 15/07/2016
# chada@nu.ac.th, chingchai.h@gmail.com, chingchaih@nu.ac.th
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
d.correlate -t layer1=fill.srtm layer2=ref.moac.fill --verbose
fill.srtm vs. ref.moac.fill ...
 100%
y = 1.007587*x + 2.219408
R^2 = 0.999

# ref.moac.fill vs. fill.aw3d.2 ...
d.correlate -t layer1=fill.aw3d.2 layer2=ref.moac.fill --verbose
fill.aw3d.2 vs. ref.moac.fill ...
 100%
y = 1.012558*x + 1.675751
R^2 = 0.9991

# ref.moac.fill vs. fill.aster ...
d.correlate -t layer1=fill.aster layer2=ref.moac.fill --verbose
fill.aster vs. ref.moac.fill ...
 100%
y = 1.013336*x + -7.788086
R^2 = 0.9981

# ref.moac.fill vs. fuse.f3 ...
d.correlate -t layer1=fuse.f3 layer2=ref.moac.fill --verbose
fuse.f3 vs. ref.moac.fill ...
 100%
y = 1.009715*x + 0.144217
R^2 = 0.999

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
#d.correlate -t layer1=ref.moac.fill layer2=fill.srtm --verbose
d.correlate -t layer1=fill.srtm layer2=ref.moac.fill --verbose
fill.srtm vs. ref.moac.fill ...
 100%
y = 1.002614*x + 2.323541
R^2 = 0.9982

# moac vs aw3d in flat area
d.correlate -t layer1=fill.aw3d.2 layer2=ref.moac.fill --verbose
fill.aw3d.2 vs. ref.moac.fill ...
 100%
y = 1.006579*x + 1.134612
R^2 = 0.9988

# moac vs aster in flat area
d.correlate -t layer1=fill.aster layer2=ref.moac.fill --verbose
fill.aster vs. ref.moac.fill ...
 100%
y = 1.010499*x + -11.022972
R^2 = 0.9858

# moac vs fuse in flat area
d.correlate -t layer1=fuse.f3 layer2=ref.moac.fill --verbose
fuse.f3 vs. ref.moac.fill ...
 100%
y = 1.005153*x + 1.038004
R^2 = 0.9988

# univar
r.univar map=ref.moac.fill
 100%
total null and non-null cells: 242497092
total null cells: 229656040

Of the non-null cells:
----------------------
n: 12841052
minimum: 111
maximum: 1073
range: 962
mean: 144.342
mean of absolute values: 144.342
standard deviation: 44.736
variance: 2001.31
variation coefficient: 30.993 %
sum: 1853505923.27773

# remove mask flat area
r.mask -r input=geomph.flat@PERMANENT

# 2. summit
r.mapcalc 'geomph.summit = if( ref.moac.geomph@PERMANENT == 2,1, null() )'
g.list type=rast
r.mask -o input=geomph.summit@PERMANENT
# moac vs srtm in summit area
d.correlate -t layer1=fill.srtm layer2=ref.moac.fill --verbose
fill.srtm vs. ref.moac.fill ...
 100%
y = 0.997232*x + -1.620482
R^2 = 0.9994

# moac vs aw3d in summit area
d.correlate -t layer1=fill.aw3d.2 layer2=ref.moac.fill --verbose
fill.aw3d.2 vs. ref.moac.fill ...
 100%
y = 1.004042*x + -1.613523
R^2 = 0.9996

# moac vs aster in summit area
d.correlate -t layer1=fill.aster layer2=ref.moac.fill --verbose
fill.aster vs. ref.moac.fill ...
 100%
y = 0.999167*x + -11.273721
R^2 = 0.9988

# moac vs fuse in summit area
d.correlate -t layer1=fuse.f3 layer2=ref.moac.fill --verbose
fuse.f3 vs. ref.moac.fill ...
 100%
y = 1.001319*x + -3.234218
R^2 = 0.9995

# remove mask summit area
r.mask -r input=geomph.summit@PERMANENT

# 3.ridge
r.mapcalc 'geomph.ridge = if( ref.moac.geomph@PERMANENT == 3,1, null() )'
g.list type=rast
r.mask -o input=geomph.ridge@PERMANENT
# moac vs srtm in ridge area
d.correlate -t layer1=fill.srtm layer2=ref.moac.fill --verbose
fill.srtm vs. ref.moac.fill ...
 100%
y = 0.998644*x + -0.240522
R^2 = 0.9994

# moac vs aw3d in ridge area
d.correlate -t layer1=fill.aw3d.2 layer2=ref.moac.fill --verbose
fill.aw3d.2 vs. ref.moac.fill ...
 100%
y = 1.005380*x + -0.514783
R^2 = 0.9996

# moac vs aster in ridge area
d.correlate -t layer1=fill.aster layer2=ref.moac.fill --verbose
fill.aster vs. ref.moac.fill ...
 100%
y = 1.001777*x + -9.742714
R^2 = 0.9987

# moac vs fuse in ridge area
d.correlate -t layer1=fuse.f3 layer2=ref.moac.fill --verbose
fuse.f3 vs. ref.moac.fill ...
 100%
y = 1.002218*x + -2.084309
R^2 = 0.9995

# remove mask ridge area
r.mask -r input=geomph.ridge@PERMANENT


# 4.shoulder
r.mapcalc 'geomph.shoulder = if( ref.moac.geomph@PERMANENT == 4,1, null() )'
g.list type=rast
r.mask -o input=geomph.shoulder@PERMANENT
# moac vs srtm in shoulder area
d.correlate -t layer1=fill.srtm layer2=ref.moac.fill --verbose
fill.srtm vs. ref.moac.fill ...
 100%
y = 1.003296*x + 2.400524
R^2 = 0.9993

# moac vs aw3d in shoulder area
d.correlate -t layer1=fill.aw3d.2 layer2=ref.moac.fill --verbose
fill.aw3d.2 vs. ref.moac.fill ...
 100%
y = 1.008112*x + 0.912976
R^2 = 0.9995

# moac vs aster in shoulder area
d.correlate -t layer1=fill.aster layer2=ref.moac.fill --verbose
fill.aster vs. ref.moac.fill ...
 100%
y = 1.011893*x + -10.196805
R^2 = 0.9955

# moac vs fuse in shoulder area
d.correlate -t layer1=fuse.f3 layer2=ref.moac.fill --verbose
fuse.f3 vs. ref.moac.fill ...
 100%
y = 1.005511*x + 0.399599
R^2 = 0.9992

# remove mask shoulder area
r.mask -r input=geomph.shoulder@PERMANENT

# 5.spur
r.mapcalc 'geomph.spur = if( ref.moac.geomph@PERMANENT == 5,1, null() )'
g.list type=rast
r.mask -o input=geomph.spur@PERMANENT
# moac vs srtm in spur area
d.correlate -t layer1=fill.srtm layer2=ref.moac.fill --verbose
fill.srtm vs. ref.moac.fill ...
 100%
y = 1.004443*x + -0.264995
R^2 = 0.9989

# moac vs aw3d in spur area
d.correlate -t layer1=fill.aw3d.2 layer2=ref.moac.fill --verbose
fill.aw3d.2 vs. ref.moac.fill ...
 100%
y = 1.009151*x + 0.297011
R^2 = 0.9991

# moac vs aster in spur area
d.correlate -t layer1=fill.aster layer2=ref.moac.fill --verbose
fill.aster vs. ref.moac.fill ...
 100%
y = 1.007219*x + -8.567815
R^2 = 0.998

# moac vs fuse in spur area
d.correlate -t layer1=fuse.f3 layer2=ref.moac.fill --verbose
fuse.f3 vs. ref.moac.fill ...
 100%
y = 1.006805*x + -2.072046
R^2 = 0.999

# remove mask spur area
r.mask -r input=geomph.spur@PERMANENT

# 6.slope
r.mapcalc 'geomph.slope = if( ref.moac.geomph@PERMANENT == 6,1, null() )'
g.list type=rast
r.mask -o input=geomph.slope@PERMANENT
# moac vs srtm in slope area
d.correlate -t layer1=fill.srtm layer2=ref.moac.fill --verbose
fill.srtm vs. ref.moac.fill ...
 100%
y = 1.007807*x + 2.537252
R^2 = 0.9989

# moac vs aw3d in slope area
d.correlate -t layer1=fill.aw3d.2 layer2=ref.moac.fill --verbose
fill.aw3d.2 vs. ref.moac.fill ...
 100%
y = 1.012056*x + 2.344627
R^2 = 0.9989

# moac vs aster in slope area
d.correlate -t layer1=fill.aster layer2=ref.moac.fill --verbose
fill.aster vs. ref.moac.fill ...
 100%
y = 1.012025*x + -6.351047
R^2 = 0.998

# moac vs fuse in slope area
d.correlate -t layer1=fuse.f3 layer2=ref.moac.fill --verbose
fuse.f3 vs. ref.moac.fill ...
 100%
y = 1.010087*x + 0.117168
R^2 = 0.9989

# remove mask slope area
r.mask -r input=geomph.slope@PERMANENT

# 7.hollow
r.mapcalc 'geomph.hollow = if( ref.moac.geomph@PERMANENT == 7,1, null() )'
g.list type=rast
r.mask -o input=geomph.hollow@PERMANENT
# moac vs srtm in hollow area
d.correlate -t layer1=fill.srtm layer2=ref.moac.fill --verbose
fill.srtm vs. ref.moac.fill ...
 100%
y = 1.011177*x + 4.615022
R^2 = 0.9987

# moac vs aw3d in hollow area
d.correlate -t layer1=fill.aw3d.2 layer2=ref.moac.fill --verbose
fill.aw3d.2 vs. ref.moac.fill ...
 100%
y = 1.014652*x + 4.491683
R^2 = 0.9988

# moac vs aster in hollow area
d.correlate -t layer1=fill.aster layer2=ref.moac.fill --verbose
fill.aster vs. ref.moac.fill ...
 100%
y = 1.015392*x + -3.183889
R^2 = 0.9976

# moac vs fuse in hollow area
d.correlate -t layer1=fuse.f3 layer2=ref.moac.fill --verbose
fuse.f3 vs. ref.moac.fill ...
 100%
y = 1.013429*x + 2.262103
R^2 = 0.9987

# remove mask hollow area
r.mask -r input=geomph.hollow@PERMANENT

# 8.footslope
r.mapcalc 'geomph.footslope = if( ref.moac.geomph@PERMANENT == 8,1, null() )'
g.list type=rast
r.mask -o input=geomph.footslope@PERMANENT
# moac vs srtm in footslope area
d.correlate -t layer1=fill.srtm layer2=ref.moac.fill --verbose
fill.srtm vs. ref.moac.fill ...
 100%
y = 1.009797*x + 2.125480
R^2 = 0.9993

# moac vs aw3d in footslope area
d.correlate -t layer1=fill.aw3d.2 layer2=ref.moac.fill --verbose
fill.aw3d.2 vs. ref.moac.fill ...
 100%
y = 1.012834*x + 0.904072
R^2 = 0.9994

# moac vs aster in footslope area
d.correlate -t layer1=fill.aster layer2=ref.moac.fill --verbose
fill.aster vs. ref.moac.fill ...
 100%
y = 1.017129*x + -10.482978
R^2 = 0.9967

# moac vs fuse in footslope area
d.correlate -t layer1=fuse.f3 layer2=ref.moac.fill --verbose
fuse.f3 vs. ref.moac.fill ...
 100%
y = 1.010332*x + 0.036815
R^2 = 0.9992

# remove mask footslope area
r.mask -r input=geomph.footslope@PERMANENT

# 9.valley
r.mapcalc 'geomph.valley = if( ref.moac.geomph@PERMANENT == 9,1, null() )'
g.list type=rast
r.mask -o input=geomph.valley@PERMANENT
# moac vs srtm in valley area
d.correlate -t layer1=fill.srtm layer2=ref.moac.fill --verbose
fill.srtm vs. ref.moac.fill ...
 100%
y = 1.018927*x + 4.287220
R^2 = 0.999

# moac vs aw3d in valley area
d.correlate -t layer1=fill.aw3d.2 layer2=ref.moac.fill --verbose
fill.aw3d.2 vs. ref.moac.fill ...
 100%
y = 1.022689*x + 3.393999
R^2 = 0.999

# moac vs aster in valley area
d.correlate -t layer1=fill.aster layer2=ref.moac.fill --verbose
fill.aster vs. ref.moac.fill ...
 100%
y = 1.025635*x + -4.933235
R^2 = 0.9981

# moac vs fuse in valley area
d.correlate -t layer1=fuse.f3 layer2=ref.moac.fill --verbose
fuse.f3 vs. ref.moac.fill ...
 100%
y = 1.022039*x + 1.219971
R^2 = 0.9989

# remove mask valley area
r.mask -r input=geomph.valley@PERMANENT

# 10.depression
r.mapcalc 'geomph.depression = if( ref.moac.geomph@PERMANENT == 10,1, null() )'
g.list type=rast
r.mask -o input=geomph.depression@PERMANENT
# moac vs srtm in depression area
d.correlate -t layer1=fill.srtm layer2=ref.moac.fill --verbose
fill.srtm vs. ref.moac.fill ...
 100%
y = 1.020317*x + 5.098120
R^2 = 0.9992

# moac vs aw3d in depression area
d.correlate -t layer1=fill.aw3d.2 layer2=ref.moac.fill --verbose
fill.aw3d.2 vs. ref.moac.fill ...
 100%
y = 1.023912*x + 3.909102
R^2 = 0.9991

# moac vs aster in depression area
d.correlate -t layer1=fill.aster layer2=ref.moac.fill --verbose
fill.aster vs. ref.moac.fill ...
 100%
y = 1.026876*x + -4.345930
R^2 = 0.9983

# moac vs fuse in depression area
d.correlate -t layer1=fuse.f3 layer2=ref.moac.fill --verbose
fuse.f3 vs. ref.moac.fill ...
 100%
y = 1.023444*x + 1.777951
R^2 = 0.9991

# remove mask depression area
r.mask -r input=geomph.depression@PERMANENT
----
