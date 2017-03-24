#-------------------------------------------------------------------------------
# Mr Chingchai Humhong
# Assoc Prof Dr Chada Narongrit
# Fri Mar 24 02:05:56 2017
# chada@nu.ac.th, chingchai.h@gmail.com, chingchaih@nu.ac.th
# GISTNU @ Naresuan University
# MIT@License
# github : https://github.com/sanchangon
#-------------------------------------------------------------------------------
# Import DEMs into workspace
r.import input=D:\14-DEM_fusion\3-DEM-SiteSelection\aw3d_ave.tif output=aw3d_ave --overwrite
r.import input=D:\14-DEM_fusion\3-DEM-SiteSelection\aw3d_med.tif output=aw3d_med --overwrite
r.import input=D:\14-DEM_fusion\3-DEM-SiteSelection\gdem.tif output=gdem --overwrite
r.import input=D:\14-DEM_fusion\3-DEM-SiteSelection\srtm.tif output=srtm --overwrite
r.import input=D:\14-DEM_fusion\3-DEM-SiteSelection\dem5.tif output=dem5 --overwrite

# r.geomorphon - Calculates geomorphons (terrain forms) and associated geometry using machine vision approach.
# SRTM DEM
g.region -p raster=srtm@PERMANENT
r.relief input=srtm@PERMANENT output=srtm.hshed
r.geomorphon --overwrite elevation=srtm@PERMANENT forms=srtm.geomph search=6 skip=0 flat=1 dist=0
d.shade shade=srtm.hshed@PERMANENT color=srtm.geomph@PERMANENT brighten=30

# AW3D DEM
g.region -p raster=aw3d_ave@PERMANENT
r.relief input=aw3d_ave@PERMANENT output=aw3d_ave.hshed
r.geomorphon --overwrite elevation=aw3d_ave@PERMANENT forms=aw3d_ave.geomph search=6 skip=0 flat=1 dist=0
d.shade shade=aw3d_ave.hshed@PERMANENT color=aw3d_ave.geomph@PERMANENT brighten=30

# ASTER GDEM
g.region -p raster=gdem@PERMANENT
r.relief input=gdem@PERMANENT output=gdem.hshed
r.geomorphon --overwrite elevation=gdem@PERMANENT forms=gdem.geomph search=6 skip=0 flat=1 dist=0
d.shade shade=gdem.hshed@PERMANENT color=gdem.geomph@PERMANENT brighten=30

# r.slope.aspect - Generates raster maps of slope, aspect, curvatures and partial derivatives from an elevation raster map. Aspect is calculated counterclockwise from east
# SRTM DEM (degrees , FCELL)
g.region -p raster=srtm@PERMANENT
r.slope.aspect --overwrite elevation=srtm@PERMANENT slope=srtm.slope aspect=srtm.aspect

# AW3D DEM
g.region -p raster=aw3d_ave@PERMANENT
r.slope.aspect --overwrite elevation=aw3d_ave@PERMANENT slope=aw3d_ave.slope aspect=aw3d_ave.aspect

# ASTER GDEM
g.region -p raster=gdem@PERMANENT
r.slope.aspect --overwrite elevation=gdem@PERMANENT slope=gdem.slope aspect=gdem.aspect

# r.roughness.vector 
# SRTM DEM
g.region -p raster=srtm@PERMANENT
r.roughness.vector elevation=srtm@PERMANENT slope=srtm.slope@PERMANENT aspect=srtm.aspect@PERMANENT strength=srtm.strength fisher=srtm.fisher

# AW3D DEM
g.region -p raster=aw3d_ave@PERMANENT
r.roughness.vector elevation=aw3d_ave@PERMANENT slope=aw3d_ave.slope@PERMANENT aspect=aw3d_ave.aspect@PERMANENT strength=aw3d_ave.strength fisher=aw3d_ave.fisher

# ASTER GDEM
g.region -p raster=gdem@PERMANENT
r.roughness.vector elevation=gdem@PERMANENT slope=gdem.slope@PERMANENT aspect=gdem.aspect@PERMANENT strength=gdem.strength fisher=gdem.fisher

r.scatterplot input=srtm,srtm.geomph output=scatterplot_res_120
d.correlate map=srtm.slope,srtm