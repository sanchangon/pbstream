#-------------------------------------------------------------------------------
# Mr Chingchai Humhong
# Assoc Prof Dr Chada Narongrit
# 29/07/2016
# chada@nu.ac.th, chingchai.h@gmail.com, chingchaih@nu.ac.th
# GISTNU @ Naresuan University
# MIT@License
# github : https://github.com/sanchangon
#-------------------------------------------------------------------------------
# fuse dem
g.region -p raster=fuse.f3@PERMANENT
r.watershed --overwrite elevation=fuse.f3@PERMANENT threshold=1111 accumulation=rwsh.acc.fuse_1sqkm drainage=rwsh.dir.fuse_1sqkm basin=rwsh.bas.fuse_1sqkm stream=rwsh.stm.fuse_1sqkm
r.watershed --overwrite elevation=fuse.f3@PERMANENT threshold=556 accumulation=rwsh.acc.fuse_0.5sqkm drainage=rwsh.dir.fuse_0.5sqkm basin=rwsh.bas.fuse_0.5sqkm stream=rwsh.stm.fuse_0.5sqkm
r.watershed --overwrite elevation=fuse.f3@PERMANENT threshold=111 accumulation=rwsh.acc.fuse_0.1sqkm drainage=rwsh.dir.fuse_0.1sqkm basin=rwsh.bas.fuse_0.1sqkm stream=rwsh.stm.fuse_0.1sqkm
r.watershed --overwrite elevation=fuse.f3@PERMANENT threshold=56 accumulation=rwsh.acc.fuse_0.05sqkm drainage=rwsh.dir.fuse_0.05sqkm basin=rwsh.bas.fuse_0.05sqkm stream=rwsh.stm.fuse_0.05sqkm
r.watershed --overwrite elevation=fuse.f3@PERMANENT threshold=11 accumulation=rwsh.acc.fuse_0.01sqkm drainage=rwsh.dir.fuse_0.01sqkm basin=rwsh.bas.fuse_0.01sqkm stream=rwsh.stm.fuse_0.01sqkm

# srtm
g.region -p raster=fill.srtm@PERMANENT
r.watershed --overwrite elevation=fill.srtm@PERMANENT threshold=1111 accumulation=rwsh.acc.srtm_1sqkm drainage=rwsh.dir.srtm_1sqkm basin=rwsh.bas.srtm_1sqkm stream=rwsh.stm.srtm_1sqkm
r.watershed --overwrite elevation=fill.srtm@PERMANENT threshold=556 accumulation=rwsh.acc.srtm_0.5sqkm drainage=rwsh.dir.srtm_0.5sqkm basin=rwsh.bas.srtm_0.5sqkm stream=rwsh.stm.srtm_0.5sqkm
r.watershed --overwrite elevation=fill.srtm@PERMANENT threshold=111 accumulation=rwsh.acc.srtm_0.1sqkm drainage=rwsh.dir.srtm_0.1sqkm basin=rwsh.bas.srtm_0.1sqkm stream=rwsh.stm.srtm_0.1sqkm
r.watershed --overwrite elevation=fill.srtm@PERMANENT threshold=56 accumulation=rwsh.acc.srtm_0.05sqkm drainage=rwsh.dir.srtm_0.05sqkm basin=rwsh.bas.srtm_0.05sqkm stream=rwsh.stm.srtm_0.05sqkm
r.watershed --overwrite elevation=fill.srtm@PERMANENT threshold=11 accumulation=rwsh.acc.srtm_0.01sqkm drainage=rwsh.dir.srtm_0.01sqkm basin=rwsh.bas.srtm_0.01sqkm stream=rwsh.stm.srtm_0.01sqkm

# aw3d
g.region -p raster=fill.aw3d.2@PERMANENT
r.watershed --overwrite elevation=fill.aw3d.2@PERMANENT threshold=1111 accumulation=rwsh.acc.aw3d_1sqkm drainage=rwsh.dir.aw3d_1sqkm basin=rwsh.bas.aw3d_1sqkm stream=rwsh.stm.aw3d_1sqkm
r.watershed --overwrite elevation=fill.aw3d.2@PERMANENT threshold=556 accumulation=rwsh.acc.aw3d_0.5sqkm drainage=rwsh.dir.aw3d_0.5sqkm basin=rwsh.bas.aw3d_0.5sqkm stream=rwsh.stm.aw3d_0.5sqkm
r.watershed --overwrite elevation=fill.aw3d.2@PERMANENT threshold=111 accumulation=rwsh.acc.aw3d_0.1sqkm drainage=rwsh.dir.aw3d_0.1sqkm basin=rwsh.bas.aw3d_0.1sqkm stream=rwsh.stm.aw3d_0.1sqkm
r.watershed --overwrite elevation=fill.aw3d.2@PERMANENT threshold=56 accumulation=rwsh.acc.aw3d_0.05sqkm drainage=rwsh.dir.aw3d_0.05sqkm basin=rwsh.bas.aw3d_0.05sqkm stream=rwsh.stm.aw3d_0.05sqkm
r.watershed --overwrite elevation=fill.aw3d.2@PERMANENT threshold=11 accumulation=rwsh.acc.aw3d_0.01sqkm drainage=rwsh.dir.aw3d_0.01sqkm basin=rwsh.bas.aw3d_0.01sqkm stream=rwsh.stm.aw3d_0.01sqkm

# gdem
g.region -p raster=fill.aster@PERMANENT
r.watershed --overwrite elevation=fill.aster@PERMANENT threshold=1111 accumulation=rwsh.acc.aster_1sqkm drainage=rwsh.dir.aster_1sqkm basin=rwsh.bas.aster_1sqkm stream=rwsh.stm.aster_1sqkm
r.watershed --overwrite elevation=fill.aster@PERMANENT threshold=556 accumulation=rwsh.acc.aster_0.5sqkm drainage=rwsh.dir.aster_0.5sqkm basin=rwsh.bas.aster_0.5sqkm stream=rwsh.stm.aster_0.5sqkm
r.watershed --overwrite elevation=fill.aster@PERMANENT threshold=111 accumulation=rwsh.acc.aster_0.1sqkm drainage=rwsh.dir.aster_0.1sqkm basin=rwsh.bas.aster_0.1sqkm stream=rwsh.stm.aster_0.1sqkm
r.watershed --overwrite elevation=fill.aster@PERMANENT threshold=56 accumulation=rwsh.acc.aster_0.05sqkm drainage=rwsh.dir.aster_0.05sqkm basin=rwsh.bas.aster_0.05sqkm stream=rwsh.stm.aster_0.05sqkm
r.watershed --overwrite elevation=fill.aster@PERMANENT threshold=11 accumulation=rwsh.acc.aster_0.01sqkm drainage=rwsh.dir.aster_0.01sqkm basin=rwsh.bas.aster_0.01sqkm stream=rwsh.stm.aster_0.01sqkm


# moac 5 meter
g.region -p raster=ref.moac.fill@PERMANENT
r.watershed --overwrite elevation=ref.moac.fill@PERMANENT threshold=40000 accumulation=rwsh.acc.moac_1sqkm drainage=rwsh.dir.moac_1sqkm basin=rwsh.bas.moac_1sqkm stream=rwsh.stm.moac_1sqkm
r.watershed --overwrite elevation=ref.moac.fill@PERMANENT threshold=20000 accumulation=rwsh.acc.moac_0.5sqkm drainage=rwsh.dir.moac_0.5sqkm basin=rwsh.bas.moac_0.5sqkm stream=rwsh.stm.moac_0.5sqkm
r.watershed --overwrite elevation=ref.moac.fill@PERMANENT threshold=4000 accumulation=rwsh.acc.moac_0.1sqkm drainage=rwsh.dir.moac_0.1sqkm basin=rwsh.bas.moac_0.1sqkm stream=rwsh.stm.moac_0.1sqkm
r.watershed --overwrite elevation=ref.moac.fill@PERMANENT threshold=2000 accumulation=rwsh.acc.moac_0.05sqkm drainage=rwsh.dir.moac_0.05sqkm basin=rwsh.bas.moac_0.05sqkm stream=rwsh.stm.moac_0.05sqkm
r.watershed --overwrite elevation=ref.moac.fill@PERMANENT threshold=400 accumulation=rwsh.acc.moac_0.01sqkm drainage=rwsh.dir.moac_0.01sqkm basin=rwsh.bas.moac_0.01sqkm stream=rwsh.stm.moac_0.01sqkm

# stream order moac
g.region -p raster=ref.moac.fill@PERMANENT
r.stream.order stream_rast=rwsh.stm.moac_1sqkm@PERMANENT direction=rwsh.dir.moac_1sqkm@PERMANENT elevation=ref.moac.fill@PERMANENT accumulation=rwsh.acc.moac_1sqkm@PERMANENT stream_vect=vstream_moac_1sqkm strahler=order.moac.strahler_1sqkm
r.stream.order stream_rast=rwsh.stm.moac_0.5sqkm@PERMANENT direction=rwsh.dir.moac_0.5sqkm@PERMANENT elevation=ref.moac.fill@PERMANENT accumulation=rwsh.acc.moac_0.5sqkm@PERMANENT stream_vect=vstream_moac_05sqkm strahler=order.moac.strahler_05sqkm
r.stream.order stream_rast=rwsh.stm.moac_0.1sqkm@PERMANENT direction=rwsh.dir.moac_0.1sqkm@PERMANENT elevation=ref.moac.fill@PERMANENT accumulation=rwsh.acc.moac_0.1sqkm@PERMANENT stream_vect=vstream_moac_01sqkm strahler=order.moac.strahler_01sqkm
r.stream.order stream_rast=rwsh.stm.moac_0.05sqkm@PERMANENT direction=rwsh.dir.moac_0.05sqkm@PERMANENT elevation=ref.moac.fill@PERMANENT accumulation=rwsh.acc.moac_0.05sqkm@PERMANENT stream_vect=vstream_moac_005sqkm strahler=order.moac.strahler_005sqkm
r.stream.order stream_rast=rwsh.stm.moac_0.01sqkm@PERMANENT direction=rwsh.dir.moac_0.01sqkm@PERMANENT elevation=ref.moac.fill@PERMANENT accumulation=rwsh.acc.moac_0.01sqkm@PERMANENT stream_vect=vstream_moac_001sqkm strahler=order.moac.strahler_001sqkm

# stream order fuse dem
g.region -p raster=fuse.f3@PERMANENT
r.stream.order stream_rast=rwsh.stm.fuse_1sqkm@PERMANENT direction=rwsh.dir.fuse_1sqkm@PERMANENT elevation=fuse.f3@PERMANENT accumulation=rwsh.acc.fuse_1sqkm@PERMANENT stream_vect=vstream_fuse_1sqkm strahler=order.fuse.strahler_1sqkm
r.stream.order stream_rast=rwsh.stm.fuse_0.5sqkm@PERMANENT direction=rwsh.dir.fuse_0.5sqkm@PERMANENT elevation=fuse.f3@PERMANENT accumulation=rwsh.acc.fuse_0.5sqkm@PERMANENT stream_vect=vstream_fuse_05sqkm strahler=order.fuse.strahler_05sqkm
r.stream.order stream_rast=rwsh.stm.fuse_0.1sqkm@PERMANENT direction=rwsh.dir.fuse_0.1sqkm@PERMANENT elevation=fuse.f3@PERMANENT accumulation=rwsh.acc.fuse_0.1sqkm@PERMANENT stream_vect=vstream_fuse_01sqkm strahler=order.fuse.strahler_01sqkm
r.stream.order stream_rast=rwsh.stm.fuse_0.05sqkm@PERMANENT direction=rwsh.dir.fuse_0.05sqkm@PERMANENT elevation=fuse.f3@PERMANENT accumulation=rwsh.acc.fuse_0.05sqkm@PERMANENT stream_vect=vstream_fuse_005sqkm strahler=order.fuse.strahler_005sqkm
r.stream.order stream_rast=rwsh.stm.fuse_0.01sqkm@PERMANENT direction=rwsh.dir.fuse_0.01sqkm@PERMANENT elevation=fuse.f3@PERMANENT accumulation=rwsh.acc.fuse_0.01sqkm@PERMANENT stream_vect=vstream_fuse_001sqkm strahler=order.fuse.strahler_001sqkm

# stream order srtm
g.region -p raster=fill.srtm@PERMANENT
r.stream.order stream_rast=rwsh.stm.srtm_1sqkm@PERMANENT direction=rwsh.dir.srtm_1sqkm@PERMANENT elevation=fill.srtm@PERMANENT accumulation=rwsh.acc.srtm_1sqkm@PERMANENT stream_vect=vstream_srtm_1sqkm strahler=order.srtm.strahler_1sqkm
r.stream.order stream_rast=rwsh.stm.srtm_0.5sqkm@PERMANENT direction=rwsh.dir.srtm_0.5sqkm@PERMANENT elevation=fill.srtm@PERMANENT accumulation=rwsh.acc.srtm_0.5sqkm@PERMANENT stream_vect=vstream_srtm_05sqkm strahler=order.srtm.strahler_05sqkm
r.stream.order stream_rast=rwsh.stm.srtm_0.1sqkm@PERMANENT direction=rwsh.dir.srtm_0.1sqkm@PERMANENT elevation=fill.srtm@PERMANENT accumulation=rwsh.acc.srtm_0.1sqkm@PERMANENT stream_vect=vstream_srtm_01sqkm strahler=order.srtm.strahler_01sqkm
r.stream.order stream_rast=rwsh.stm.srtm_0.05sqkm@PERMANENT direction=rwsh.dir.srtm_0.05sqkm@PERMANENT elevation=fill.srtm@PERMANENT accumulation=rwsh.acc.srtm_0.05sqkm@PERMANENT stream_vect=vstream_srtm_005sqkm strahler=order.srtm.strahler_005sqkm
r.stream.order stream_rast=rwsh.stm.srtm_0.01sqkm@PERMANENT direction=rwsh.dir.srtm_0.01sqkm@PERMANENT elevation=fill.srtm@PERMANENT accumulation=rwsh.acc.srtm_0.01sqkm@PERMANENT stream_vect=vstream_srtm_001sqkm strahler=order.srtm.strahler_001sqkm

# stream order aw3d
g.region -p raster=fill.aw3d.2@PERMANENT
r.stream.order stream_rast=rwsh.stm.aw3d_1sqkm@PERMANENT direction=rwsh.dir.aw3d_1sqkm@PERMANENT elevation=fill.aw3d.2@PERMANENT accumulation=rwsh.acc.aw3d_1sqkm@PERMANENT stream_vect=vstream_aw3d_1sqkm strahler=order.aw3d.strahler_1sqkm
r.stream.order stream_rast=rwsh.stm.aw3d_0.5sqkm@PERMANENT direction=rwsh.dir.aw3d_0.5sqkm@PERMANENT elevation=fill.aw3d.2@PERMANENT accumulation=rwsh.acc.aw3d_0.5sqkm@PERMANENT stream_vect=vstream_aw3d_05sqkm strahler=order.aw3d.strahler_05sqkm
r.stream.order stream_rast=rwsh.stm.aw3d_0.1sqkm@PERMANENT direction=rwsh.dir.aw3d_0.1sqkm@PERMANENT elevation=fill.aw3d.2@PERMANENT accumulation=rwsh.acc.aw3d_0.1sqkm@PERMANENT stream_vect=vstream_aw3d_01sqkm strahler=order.aw3d.strahler_01sqkm
r.stream.order stream_rast=rwsh.stm.aw3d_0.05sqkm@PERMANENT direction=rwsh.dir.aw3d_0.05sqkm@PERMANENT elevation=fill.aw3d.2@PERMANENT accumulation=rwsh.acc.aw3d_0.05sqkm@PERMANENT stream_vect=vstream_aw3d_005sqkm strahler=order.aw3d.strahler_005sqkm
r.stream.order stream_rast=rwsh.stm.aw3d_0.01sqkm@PERMANENT direction=rwsh.dir.aw3d_0.01sqkm@PERMANENT elevation=fill.aw3d.2@PERMANENT accumulation=rwsh.acc.aw3d_0.01sqkm@PERMANENT stream_vect=vstream_aw3d_001sqkm strahler=order.aw3d.strahler_001sqkm

# stream order gdem
g.region -p raster=fill.aster@PERMANENT
r.stream.order stream_rast=rwsh.stm.aster_1sqkm@PERMANENT direction=rwsh.dir.aster_1sqkm@PERMANENT elevation=fill.aster@PERMANENT accumulation=rwsh.acc.aster_1sqkm@PERMANENT stream_vect=vstream_aster_1sqkm strahler=order.aster.strahler_1sqkm
r.stream.order stream_rast=rwsh.stm.aster_0.5sqkm@PERMANENT direction=rwsh.dir.aster_0.5sqkm@PERMANENT elevation=fill.aster@PERMANENT accumulation=rwsh.acc.aster_0.5sqkm@PERMANENT stream_vect=vstream_aster_05sqkm strahler=order.aster.strahler_05sqkm
r.stream.order stream_rast=rwsh.stm.aster_0.1sqkm@PERMANENT direction=rwsh.dir.aster_0.1sqkm@PERMANENT elevation=fill.aster@PERMANENT accumulation=rwsh.acc.aster_0.1sqkm@PERMANENT stream_vect=vstream_aster_01sqkm strahler=order.aster.strahler_01sqkm
r.stream.order stream_rast=rwsh.stm.aster_0.05sqkm@PERMANENT direction=rwsh.dir.aster_0.05sqkm@PERMANENT elevation=fill.aster@PERMANENT accumulation=rwsh.acc.aster_0.05sqkm@PERMANENT stream_vect=vstream_aster_005sqkm strahler=order.aster.strahler_005sqkm
r.stream.order stream_rast=rwsh.stm.aster_0.01sqkm@PERMANENT direction=rwsh.dir.aster_0.01sqkm@PERMANENT elevation=fill.aster@PERMANENT accumulation=rwsh.acc.aster_0.01sqkm@PERMANENT stream_vect=vstream_aster_001sqkm strahler=order.aster.strahler_001sqkm

# Export to Shapefile
# gdem
v.out.ogr input=vstream_aster_001sqkm@PERMANENT type=line output=C:\Workspace\Stream_Network_ACRS2016\3-Result format=ESRI_Shapefile
v.out.ogr input=vstream_aster_01sqkm@PERMANENT type=line output=C:\Workspace\Stream_Network_ACRS2016\3-Result format=ESRI_Shapefile
v.out.ogr input=vstream_aster_1sqkm@PERMANENT type=line output=C:\Workspace\Stream_Network_ACRS2016\3-Result format=ESRI_Shapefile
v.out.ogr input=vstream_aster_005sqkm@PERMANENT type=line output=C:\Workspace\Stream_Network_ACRS2016\3-Result format=ESRI_Shapefile
v.out.ogr input=vstream_aster_05sqkm@PERMANENT type=line output=C:\Workspace\Stream_Network_ACRS2016\3-Result format=ESRI_Shapefile

# aw3d
v.out.ogr input=vstream_aw3d_001sqkm@PERMANENT type=line output=C:\Workspace\Stream_Network_ACRS2016\3-Result format=ESRI_Shapefile
v.out.ogr input=vstream_aw3d_01sqkm@PERMANENT type=line output=C:\Workspace\Stream_Network_ACRS2016\3-Result format=ESRI_Shapefile
v.out.ogr input=vstream_aw3d_1sqkm@PERMANENT type=line output=C:\Workspace\Stream_Network_ACRS2016\3-Result format=ESRI_Shapefile
v.out.ogr input=vstream_aw3d_005sqkm@PERMANENT type=line output=C:\Workspace\Stream_Network_ACRS2016\3-Result format=ESRI_Shapefile
v.out.ogr input=vstream_aw3d_05sqkm@PERMANENT type=line output=C:\Workspace\Stream_Network_ACRS2016\3-Result format=ESRI_Shapefile

# fuse
v.out.ogr input=vstream_fuse_001sqkm@PERMANENT type=line output=C:\Workspace\Stream_Network_ACRS2016\3-Result format=ESRI_Shapefile
v.out.ogr input=vstream_fuse_01sqkm@PERMANENT type=line output=C:\Workspace\Stream_Network_ACRS2016\3-Result format=ESRI_Shapefile
v.out.ogr input=vstream_fuse_1sqkm@PERMANENT type=line output=C:\Workspace\Stream_Network_ACRS2016\3-Result format=ESRI_Shapefile
v.out.ogr input=vstream_fuse_005sqkm@PERMANENT type=line output=C:\Workspace\Stream_Network_ACRS2016\3-Result format=ESRI_Shapefile
v.out.ogr input=vstream_fuse_05sqkm@PERMANENT type=line output=C:\Workspace\Stream_Network_ACRS2016\3-Result format=ESRI_Shapefile

# moac
v.out.ogr input=vstream_moac_001sqkm@PERMANENT type=line output=C:\Workspace\Stream_Network_ACRS2016\3-Result format=ESRI_Shapefile
v.out.ogr input=vstream_moac_01sqkm@PERMANENT type=line output=C:\Workspace\Stream_Network_ACRS2016\3-Result format=ESRI_Shapefile
v.out.ogr input=vstream_moac_1sqkm@PERMANENT type=line output=C:\Workspace\Stream_Network_ACRS2016\3-Result format=ESRI_Shapefile
v.out.ogr input=vstream_moac_005sqkm@PERMANENT type=line output=C:\Workspace\Stream_Network_ACRS2016\3-Result format=ESRI_Shapefile
v.out.ogr input=vstream_moac_05sqkm@PERMANENT type=line output=C:\Workspace\Stream_Network_ACRS2016\3-Result format=ESRI_Shapefile

# srtm
v.out.ogr input=vstream_srtm_001sqkm@PERMANENT type=line output=C:\Workspace\Stream_Network_ACRS2016\3-Result format=ESRI_Shapefile
v.out.ogr input=vstream_srtm_01sqkm@PERMANENT type=line output=C:\Workspace\Stream_Network_ACRS2016\3-Result format=ESRI_Shapefile
v.out.ogr input=vstream_srtm_1sqkm@PERMANENT type=line output=C:\Workspace\Stream_Network_ACRS2016\3-Result format=ESRI_Shapefile
v.out.ogr input=vstream_srtm_005sqkm@PERMANENT type=line output=C:\Workspace\Stream_Network_ACRS2016\3-Result format=ESRI_Shapefile
v.out.ogr input=vstream_srtm_05sqkm@PERMANENT type=line output=C:\Workspace\Stream_Network_ACRS2016\3-Result format=ESRI_Shapefile

# Converse raster to vector
r.to.vect input=ref.moac.geomph@PERMANENT output=vgeomph type=area


# slope and aspect form moac (degree)
r.slope.aspect elevation=ref.moac.fill@PERMANENT slope=ref.moac.slope aspect=ref.moac.aspect precision=CELL
r.statistics base=ref.moac.geomph@PERMANENT cover=ref.moac.slope@PERMANENT method=average output=stats.ref.moac.slope
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
10	depression
r.category map=stats.ref.moac.slope@PERMANENT (degree)
1	0.0100284433
2	4.6018693208
3	7.7847779417
4	0.3843775152
5	16.0682992517
6	17.6956772299
7	17.1825671208
8	0.3915032394
9	8.9174365618
10	4.5692791869

# slope and aspect form moac (percent)
r.slope.aspect elevation=ref.moac.fill@PERMANENT slope=ref.moac.slope.percent format=percent precision=CELL
r.statistics base=ref.moac.geomph@PERMANENT cover=ref.moac.slope.percent@PERMANENT method=average output=stats.ref.moac.slope.percent
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
10	depression
r.category map=stats.ref.moac.slope.percent@PERMANENT
1	0.0133206767
2	8.0858953448
3	13.9182917005
4	0.6095425198
5	29.8102490076
6	33.4623198457
7	32.2243429798
8	0.6212570761
9	16.0779025605
10	8.0368045848
