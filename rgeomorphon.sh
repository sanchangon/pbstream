#-------------------------------------------------------------------------------
# chingchai humhong (chingchai sanchangon)
# 15/07/2016
# chingchai.h@gmail.com, chingchaih@nu.ac.th
# GISTNU @ Naresuan University
# MIT@License
# github : https://github.com/sanchangon
#-------------------------------------------------------------------------------
# r.geomorphon - Calculates geomorphons (terrain forms) and associated geometry using machine vision approach.
# AUTHORS: Jarek Jasiewicz, Tomek Stepinski (merit contribution)
# Reference
https://grass.osgeo.org/grass70/manuals/addons/r.geomorphon.html
#-------------------------------------------------------------------------------
# Set region workspace
g.region rast=ref.moac.5m ras=5 -p

# Create hillshade/relief
r.relief input=ref.moac.5m@PERMANENT output=ref.moac.hshed                      

# geomorphon running
# trial 1 -> default value
(Fri Jul 15 09:08:34 2016)                                                      
r.geomorphon elevation=ref.moac.5m@PERMANENT forms=ref.moac.geomph search=3 skip=0 flat=1 dist=0
r.geomorphon complete.
(Fri Jul 15 09:12:44 2016) Command finished (4 min 10 sec)

# trial 2 -> increate window size = 50 and -m
(Fri Jul 15 09:30:42 2016)                                                      
r.geomorphon -m --overwrite elevation=ref.moac.5m@PERMANENT forms=ref.moac.geomph search=50 skip=0 flat=1 dist=0
r.geomorphon complete.
(Fri Jul 15 09:44:53 2016) Command finished (14 min 10 sec)  

# trial 3 -> increate window size = 30 not -m / use cell ใช้แบบ cell ช้ามาก
(Fri Jul 15 10:02:24 2016)                                                      
r.geomorphon --overwrite elevation=ref.moac.5m@PERMANENT forms=ref.moac.geomph search=30 skip=0 flat=1 dist=0
r.geomorphon complete.
(Fri Jul 15 10:43:10 2016) Command finished (40 min 45 sec)

# trial 4 -> increate window size = 70 and -m
(Fri Jul 15 10:48:14 2016)                                                      
r.geomorphon -m --overwrite elevation=ref.moac.5m@PERMANENT forms=ref.moac.geomph search=70 skip=0 flat=1 dist=0
r.geomorphon complete.
(Fri Jul 15 11:07:13 2016) Command finished (18 min 58 sec)

# trial 4 -> increate window size = 70 and -m and change to ref.moac.fill
r.geomorphon -m --overwrite elevation=ref.moac.fill@PERMANENT forms=ref.moac.geomph search=70 skip=0 flat=1 dist=0
