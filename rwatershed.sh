#-------------------------------------------------------------------------------
# chingchai humhong (chingchai sanchangon)
# 13/07/2016
# chingchai.h@gmail.com, chingchaih@nu.ac.th
# GISTNU @ Naresuan University
# MIT@License
# github : https://github.com/sanchangon
#-------------------------------------------------------------------------------

# r.watershed for ref DEM
r.watershed --overwrite elevation=ref.moac@PERMANENT threshold=1000 accumulation=rwsh.acc.moac drainage=rwsh.dir.moac basin=rwsh.bas.moac stream=rwsh.stm.moac

# r.watershed for source DEMs
r.watershed --overwrite elevation=fill.srtm@PERMANENT threshold=1000 accumulation=rwsh.acc.strm drainage=rwsh.dir.srtm basin=rwsh.bas.srtm stream=rwsh.stm.srtm
r.watershed --overwrite elevation=fill.aw3d@PERMANENT threshold=1000 accumulation=rwsh.acc.aw3d drainage=rwsh.dir.aw3d basin=rwsh.bas.aw3d stream=rwsh.stm.aw3d
r.watershed --overwrite elevation=fill.aster@PERMANENT threshold=1000 accumulation=rwsh.acc.aster drainage=rwsh.dir.aster basin=rwsh.bas.aster stream=rwsh.stm.aster

# r.watershed for fusion DEM
r.watershed --overwrite elevation=test.fusion@PERMANENT threshold=1000 accumulation=rwsh.acc.fusion drainage=rwsh.dir.fusion basin=rwsh.bas.fusion stream=rwsh.stm.fusion

# r.stream.order for ref DEM
r.stream.order --overwrite stream_rast=rwsh.stm.moac@PERMANENT direction=rwsh.dir.moac@PERMANENT elevation=ref.moac@PERMANENT accumulation=rwsh.acc.moac@PERMANENT stream_vect=vriver_moac strahler=stream.order.moac

# r.stream.order for source DEMs
r.stream.order --overwrite stream_rast=rwsh.stm.srtm@PERMANENT direction=rwsh.dir.srtm@PERMANENT elevation=fill.srtm@PERMANENT accumulation=rwsh.acc.strm@PERMANENT stream_vect=vriver_srtm strahler=stream.order.srtm
r.stream.order --overwrite stream_rast=rwsh.stm.aw3d@PERMANENT direction=rwsh.dir.aw3d@PERMANENT elevation=fill.aw3d@PERMANENT accumulation=rwsh.acc.aw3d@PERMANENT stream_vect=vriver_aw3d strahler=stream.order.aw3d
r.stream.order --overwrite stream_rast=rwsh.stm.aster@PERMANENT direction=rwsh.dir.aster@PERMANENT elevation=fill.aster@PERMANENT accumulation=rwsh.acc.aster@PERMANENT stream_vect=vriver_aster strahler=stream.order.aster

# r.stream.order for fusion DEM
r.stream.order --overwrite stream_rast=rwsh.stm.fusion@PERMANENT direction=rwsh.dir.fusion@PERMANENT elevation=test.fusion@PERMANENT accumulation=rwsh.acc.fusion@PERMANENT stream_vect=vriver_fusion strahler=stream.order.fusion

# v.out.ogr
v.out.ogr input=vriver_aster@PERMANENT type=line output=C:\Workspace\Stream_Network_ACRS2016\New format=ESRI_Shapefile
v.out.ogr input=vriver_aw3d@PERMANENT type=line output=C:\Workspace\Stream_Network_ACRS2016\New format=ESRI_Shapefile
v.out.ogr input=vriver_fusion@PERMANENT type=line output=C:\Workspace\Stream_Network_ACRS2016\New format=ESRI_Shapefile
v.out.ogr input=vriver_moac@PERMANENT type=line output=C:\Workspace\Stream_Network_ACRS2016\New format=ESRI_Shapefile
v.out.ogr input=vriver_srtm@PERMANENT type=line output=C:\Workspace\Stream_Network_ACRS2016\New format=ESRI_Shapefile

# r.mapcalc fusion DEMs
if( ref.moac.geomorphons@PERMANENT <=2 , fill.aw3d@PERMANENT ,if( ref.moac.geomorphons@PERMANENT <=5, fill.srtm@PERMANENT ,if( ref.moac.geomorphons@PERMANENT ==8, fill.srtm@PERMANENT , fill.aster@PERMANENT ) ) )

# fill voids using moving windows method
r.neighbors input=raw.srtm@PERMANENT output=fill.srtm size=3 method=average
r.neighbors input=raw.aster@PERMANENT output=fill.aster size=3 method=average
r.neighbors input=raw.aw3d@PERMANENT output=fill.aw3d size=3 method=average

r.mapcalc --overwrite expression=voids.mask = if( fill.aw3d@PERMANENT < 1,1,null())
#r.mapcalc --overwrite expression=voids.mask = if( raw.aw3d@PERMANENT <= 0,1,null())
#r.mapcalc --overwrite expression=voids.mask = if( fill.aw3d@PERMANENT   <= 0,1,null())
#r.mapcalc --overwrite expression=voids.mask = if( raw.aw3d@PERMANENT > -1,1,0 )| if( raw.aw3d@PERMANENT < 0,1,null() )
#r.mapcalc --overwrite expression=voids.mask = if( fill.aw3d@PERMANENT > -1,1,0 )| if( fill.aw3d@PERMANENT < 0,1,null())

r.mask raster=voids.mask@PERMANENT
r.neighbors --overwrite input=fill.srtm@PERMANENT output=voids.focal size=3 method=average 
#r.neighbors --overwrite input=fill.srtm@PERMANENT output=voids.focal5 size=5 method=average
#Raster MASK removed
r.mask -r raster=voids.mask@PERMANENT

r.mapcalc --overwrite expression=voids.aw3d = if( fill.aw3d@PERMANENT <1, voids.focal@PERMANENT, fill.aw3d@PERMANENT )
r.fill.dir --overwrite input=voids.aw3d@PERMANENT output=voids.aw3d.fill direction=voids.aw3d.dir
r.mapcalc expression=fill.aw3d.2 = voids.aw3d.fill@PERMANENT
