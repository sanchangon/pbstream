#-------------------------------------------------------------------------------
# Mr Chingchai Humhong
# Assoc Prof Dr Chada Narongrit
# 20/07/2016
# chada@nu.ac.th, chingchai.h@gmail.com, chingchaih@nu.ac.th
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
r.mapcalc 'bias.srtm = ( fill.srtm@PERMANENT -  ref.moac.fill@PERMANENT ) / 2'

# bias aw3d
r.mapcalc 'bias.aw3d = ( fill.aw3d.2@PERMANENT -  ref.moac.fill@PERMANENT ) / 2'

# bias aster
r.mapcalc 'bias.aster = ( fill.aster@PERMANENT -  ref.moac.fill@PERMANENT ) / 2'

#Calculate Absolute BIAS = |avg[DEM(i) - DEM(ref)]| form H.I.Reuter et al.
# abs bias 3 DEMs (สองสูตรนี้มีค่าเท่ากัน)
r.mapcalc 'abs.bias.srtm = abs(bias.srtm@PERMANENT)'
r.mapcalc 'abs2.bias.srtm = abs( ( fill.srtm@PERMANENT -  ref.moac.fill@PERMANENT ) /2)'

r.mapcalc 'abs.bias.aw3d = abs(bias.aw3d@PERMANENT)'
r.mapcalc 'abs2.bias.srtm = abs( ( fill.aw3d.2@PERMANENT -  ref.moac.fill@PERMANENT ) /2)'

r.mapcalc 'abs.bias.aster = abs(bias.aster@PERMANENT)'
r.mapcalc 'abs2.bias.srtm = abs( ( fill.aster@PERMANENT -  ref.moac.fill@PERMANENT ) /2)'
