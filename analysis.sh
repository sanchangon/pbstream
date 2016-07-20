#-------------------------------------------------------------------------------
# chingchai humhong (chingchai sanchangon)
# 20/07/2016
# chingchai.h@gmail.com, chingchaih@nu.ac.th
# GISTNU @ Naresuan University
# MIT@License
# github : https://github.com/sanchangon
#-------------------------------------------------------------------------------
# set region
g.region -p rast=ref.moac.fill@PERMANENT
projection: 1 (UTM)
zone:       47
datum:      wgs84
ellipsoid:  wgs84
north:      1900841.61944092
south:      1815287.00776704
west:       702012.27905637
east:       772874.18092429
nsres:      4.99997731
ewres:      5.0001342
rows:       17111
cols:       14172
cells:      242497092

# Calculate BIAS = avg[DEM(i) - DEM(ref)] form H.I.Reuter et al.
# bias srtm
