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

# GDEM
g.region -p raster=gdem@PERMANENT
r.relief input=gdem@PERMANENT output=gdem.hshed
r.geomorphon --overwrite elevation=gdem@PERMANENT forms=gdem.geomph search=6 skip=0 flat=1 dist=0
d.shade shade=gdem.hshed@PERMANENT color=gdem.geomph@PERMANENT brighten=30