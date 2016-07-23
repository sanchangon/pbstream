#-------------------------------------------------------------------------------
# Mr Chingchai Humhong
# Assoc Prof Dr Chada Narongrit
# 22/07/2016
# chada@nu.ac.th, chingchai.h@gmail.com, chingchaih@nu.ac.th
# GISTNU @ Naresuan University
# MIT@License
# github : https://github.com/sanchangon
#-------------------------------------------------------------------------------
r.info map=ref.moac.fill@PERMANENT
g.region -p rast=ref.moac.fill@PERMANENT

# moac dems ref (note: ras=10)
r.watershed -f -m --overwrite elevation=ref.moac.fill@PERMANENT accumulation=rwsh.acc.moac500 drainage=rwsh.dir.moac500 basin=rwsh.bas.moac500 stream=rwsh.stm.moac500 threshold=500
r.watershed -f --overwrite elevation=ref.moac.fill@PERMANENT accumulation=rwsh.acc.moac100 drainage=rwsh.dir.moac100 basin=rwsh.bas.moac100 stream=rwsh.stm.moac100 threshold=100
r.watershed -f -m --overwrite elevation=ref.moac.fill@PERMANENT accumulation=rwsh.acc.moac drainage=rwsh.dir.moac basin=rwsh.bas.moac stream=rwsh.stm.moac threshold=10

# DEMs (note: ras=30)
r.watershed -f --overwrite elevation=fill.aster@PERMANENT accumulation=rwsh.acc.aster drainage=rwsh.dir.aster basin=rwsh.bas.aster stream=rwsh.stm.aster threshold=5
r.watershed -f --overwrite elevation=fill.aw3d.2@PERMANENT accumulation=rwsh.acc.aw3d drainage=rwsh.dir.aw3d basin=rwsh.bas.aw3d stream=rwsh.stm.aw3d threshold=5
r.watershed -f --overwrite elevation=fill.srtm@PERMANENT accumulation=rwsh.acc.srtm drainage=rwsh.dir.srtm basin=rwsh.bas.srtm stream=rwsh.stm.srtm threshold=5
r.watershed -f --overwrite elevation=fuse.f3@PERMANENT accumulation=rwsh.acc.fuse drainage=rwsh.dir.fuse basin=rwsh.bas.fuse stream=rwsh.stm.fuse threshold=5

r.watershed -f --overwrite elevation=fill.aster@PERMANENT accumulation=rwsh.acc.aster10 drainage=rwsh.dir.aster10 basin=rwsh.bas.aster10 stream=rwsh.stm.aster10 threshold=10
r.watershed -f --overwrite elevation=fill.aw3d.2@PERMANENT accumulation=rwsh.acc.aw3d10 drainage=rwsh.dir.aw3d10 basin=rwsh.bas.aw3d10 stream=rwsh.stm.aw3d10 threshold=10
r.watershed -f --overwrite elevation=fill.srtm@PERMANENT accumulation=rwsh.acc.srtm10 drainage=rwsh.dir.srtm10 basin=rwsh.bas.srtm10 stream=rwsh.stm.srtm10 threshold=10
r.watershed -f --overwrite elevation=fuse.f3@PERMANENT accumulation=rwsh.acc.fuse10 drainage=rwsh.dir.fuse10 basin=rwsh.bas.fuse10 stream=rwsh.stm.fuse10 threshold=10
