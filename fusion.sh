#-------------------------------------------------------------------------------
# Mr Chingchai Humhong
# Assoc Prof Dr Chada Narongrit
# 20/07/2016
# chada@nu.ac.th, chingchai.h@gmail.com, chingchaih@nu.ac.th
# GISTNU @ Naresuan University
# MIT@License
# github : https://github.com/sanchangon
#-------------------------------------------------------------------------------
# fusion DEMs 30 meter
# set region
g.region -p rast=fill.srtm@PERMANENT

# r.mapcalc fusion DEMs 3 method
# min error method
r.mapcalc 'fuse.f1 = if( ref.moac.geomph@PERMANENT <=4, fill.aw3d.2@PERMANENT, if(ref.moac.geomph@PERMANENT <=7, fill.srtm@PERMANENT,if(ref.moac.geomph@PERMANENT == 8, fill.aw3d.2@PERMANENT, fill.aster@PERMANENT)))'

# weight average by power2
r.mapcalc 'fuse.f2 = if( ref.moac.geomph<=4, (fill.srtm+ (fill.aw3d.2*2) + fill.aster)/4, if(ref.moac.geomph==5,((fill.srtm*2) + fill.aw3d.2+ fill.aster)/4, if( ref.moac.geomph <=7,(fill.srtm + fill.aw3d.2+ fill.aster)/3,  if(ref.moac.geomph==8, (fill.srtm +  (fill.aw3d.2 *2) + fill.aster)/4, (fill.srtm +  fill.aw3d.2 + fill.aster)/3 ))))'

# weight average all DEMs
r.mapcalc 'fuse.f3 = if(ref.moac.geomph==1,((fill.aw3d.2*37)+(fill.aster*2)+(fill.srtm*17))/56, if(ref.moac.geomph==2,((fill.aw3d.2*13)+(fill.aster*2)+(fill.srtm*6))/21, if(ref.moac.geomph==3,((fill.aw3d.2*8)+(fill.aster*2)+(fill.srtm*6))/16, if(ref.moac.geomph==4,((fill.aw3d.2*24)+(fill.aster*2)+(fill.srtm*11))/37, if(ref.moac.geomph==5,((fill.srtm*3)+(fill.aw3d.2*3)+(fill.aster*2))/8, if(ref.moac.geomph==6,((fill.srtm*3)+(fill.aw3d.2*2)+(fill.aster*2))/7, if(ref.moac.geomph==7,((fill.srtm*2)+(fill.aw3d.2*2)+(fill.aster*2))/6, if(ref.moac.geomph==8,((fill.aw3d.2*12)+(fill.aster*2)+(fill.srtm*7))/21, if(ref.moac.geomph==9,((fill.srtm*2)+(fill.aw3d.2*2)+(fill.aster*2))/6, if(ref.moac.geomph==10,((fill.srtm*2)+(fill.aw3d.2*2)+(fill.aster*2))/6))))))))))'

# Comparrision DEMs
# Calculate Absolute BIAS
g.region -p rast=ref.moac.fill@PERMANENT
r.mapcalc 'abs.bias.fusef1 = abs( ( fuse.f1@PERMANENT -  ref.moac.fill@PERMANENT ) )'
r.mapcalc 'abs.bias.fusef2 = abs( ( fuse.f2@PERMANENT -  ref.moac.fill@PERMANENT ) )'
r.mapcalc 'abs.bias.fusef3 = abs( ( fuse.f3@PERMANENT -  ref.moac.fill@PERMANENT ) )'

# recode abs bias 3 DEMs from DCELL to CELL (integer)
r.info map=abs.bias.fusef1@PERMANENT
r.recode input=abs.bias.fusef1@PERMANENT output=abs.bias.fusef1.int rules=/home/user/grassdata/acrs_demfuse/PERMANENT/.tmp/osgeolive/3201.0 #0:159.666666666667:0:160

r.info map=abs.bias.fusef2@PERMANENT
r.recode input=abs.bias.fusef2@PERMANENT output=abs.bias.fusef2.int rules=/home/user/grassdata/acrs_demfuse/PERMANENT/.tmp/osgeolive/3201.0 #0:157.740740740741:0:158

r.info map=abs.bias.fusef3@PERMANENT
r.recode input=abs.bias.fusef3@PERMANENT output=abs.bias.fusef3.int rules=/home/user/grassdata/acrs_demfuse/PERMANENT/.tmp/osgeolive/3201.0 #0:165.833333333333:0:166

# r.statistics dems
# fusef1
r.statistics base=ref.moac.geomph@PERMANENT cover=abs.bias.fusef1.int@PERMANENT method=average output=stats.abs.bias.fusef1
r.category map=stats.abs.bias.fusef1@PERMANENT
1	1.7123529959
2	4.1297008465
3	4.4371142433
4	2.0787598573
5	6.6142890281
6	8.5979739416
7	10.6398470013
8	2.9675559279
9	11.4262486734
10	11.3827056269

# fusef2
r.statistics base=ref.moac.geomph@PERMANENT cover=abs.bias.fusef2.int@PERMANENT method=average output=stats.abs.bias.fusef2
r.category map=stats.abs.bias.fusef2@PERMANENT
1	1.2163288622
2	5.2894433869
3	4.5188414936
4	1.375719685
5	6.1686774997
6	7.7749170554
7	9.7967471883
8	1.3341229338
9	10.5821060819
10	10.8748035649

# fusef3
r.statistics base=ref.moac.geomph@PERMANENT cover=abs.bias.fusef3.int@PERMANENT method=average output=stats.abs.bias.fusef3
r.category map=stats.abs.bias.fusef3@PERMANENT
1	1.3904120755
2	4.5912345033
3	4.2222351857
4	1.4806700792
5	6.0941610587
6	7.7521082336
7	9.8095863093
8	1.743395743
9	10.6216517399
10	10.9183818635
