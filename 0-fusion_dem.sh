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
