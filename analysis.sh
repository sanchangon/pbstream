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
r.mapcalc 'bias.srtm = ( fill.srtm@PERMANENT -  ref.moac.fill@PERMANENT )'
r.mapcalc 'bias.srtm = ( fill.srtm@PERMANENT -  ref.moac.fill@PERMANENT ) / 2'

# bias aw3d
r.mapcalc 'bias.aw3d = ( fill.aw3d.2@PERMANENT -  ref.moac.fill@PERMANENT )'
r.mapcalc 'bias.aw3d = ( fill.aw3d.2@PERMANENT -  ref.moac.fill@PERMANENT ) / 2'

# bias aster
r.mapcalc 'bias.aster = ( fill.aster@PERMANENT -  ref.moac.fill@PERMANENT )'
r.mapcalc 'bias.aster = ( fill.aster@PERMANENT -  ref.moac.fill@PERMANENT ) / 2'

# moac dem reference
r.mapcalc 'bias.moac = ( ref.moac.fill@PERMANENT -  ref.moac.fill@PERMANENT )'
r.mapcalc 'bias.moac = ( ref.moac.fill@PERMANENT -  ref.moac.fill@PERMANENT ) / 2'


#Calculate Absolute BIAS = |[DEM(i) - DEM(ref)]| form H.I.Reuter et al. แบบไใ้ใช้ค่า avg
# abs bias 3 DEMs (3 สูตรนี้มีค่าเท่ากัน)
r.mapcalc 'abs.bias.srtm = abs(bias.srtm@PERMANENT)'
r.mapcalc 'abs.bias.srtm2 = abs( ( fill.srtm@PERMANENT -  ref.moac.fill@PERMANENT ) )'
r.mapcalc 'abs.bias.srtm3 = sqrt( ( fill.srtm@PERMANENT -  ref.moac.fill@PERMANENT )^2 )'

r.mapcalc 'abs.bias.aw3d = abs(bias.aw3d@PERMANENT)'
r.mapcalc 'abs.bias.aw3d2 = abs( ( fill.aw3d.2@PERMANENT -  ref.moac.fill@PERMANENT ) )'
r.mapcalc 'abs.bias.aw3d3 = sqrt( ( fill.aw3d.2@PERMANENT -  ref.moac.fill@PERMANENT )^2 )'

r.mapcalc 'abs.bias.aster = abs(bias.aster@PERMANENT)'
r.mapcalc 'abs.bias.aster2 = abs( ( fill.aster@PERMANENT -  ref.moac.fill@PERMANENT ) )'
r.mapcalc 'abs.bias.aster3 = sqrt( ( fill.aster@PERMANENT -  ref.moac.fill@PERMANENT )^2 )'

# MOAC Reference
r.mapcalc 'abs.bias.moac = abs(bias.moac@PERMANENT)'
r.mapcalc 'abs.bias.moac2 = abs( ( ref.moac.fill@PERMANENT -  ref.moac.fill@PERMANENT ) )'
r.mapcalc 'abs.bias.moac3 = sqrt( ( ref.moac.fill@PERMANENT -  ref.moac.fill@PERMANENT )^2 )'

# r.statistics - Calculates category or object oriented statistics.
r.category map=ref.moac.geomph@PERMANENT
1	flat
2	summit
3	ridge
4	shoulder
5	spur
6	slope
7	hollow
8	footslope
9	valley
10 depression

# recode abs bias 3 DEMs from DCELL to CELL (integer)
r.info map=abs.bias.srtm@PERMANENT
r.recode input=abs.bias.srtm@PERMANENT output=abs.bias.srtm.int rules=/home/user/grassdata/acrs_demfuse/PERMANENT/.tmp/osgeolive/2153.0 #0:134.555555555555:0:135

r.info map=abs.bias.aw3d@PERMANENT
r.recode input=abs.bias.aw3d@PERMANENT output=abs.bias.aw3d.int rules=/home/user/grassdata/acrs_demfuse/PERMANENT/.tmp/osgeolive/2153.0 #0:400.111111111111:0:400

r.info map=abs.bias.aster@PERMANENT
r.recode input=abs.bias.aster@PERMANENT output=abs.bias.aster.int rules=/home/user/grassdata/acrs_demfuse/PERMANENT/.tmp/osgeolive/2153.0 #0:189.111111111111:0:189

# r.statistics
r.statistics -c base=ref.moac.geomph@PERMANENT cover=abs.bias.srtm.int@PERMANENT method=average output=stats.abs.bias.srtm
