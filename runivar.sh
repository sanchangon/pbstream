#-------------------------------------------------------------------------------
# Chingchai Humhong
# Assoc Prof Dr Chada Narongrit
# 20/07/2016
# chada@nu.ac.th, chingchai.h@gmail.com, chingchaih@nu.ac.th
# GISTNU @ Naresuan University
# MIT@License
# github : https://github.com/sanchangon
#-------------------------------------------------------------------------------
# General Information of DEMs
# moac dem 5 meter
r.univar map=ref.moac.fill@PERMANENT
total null and non-null cells: 6736424
total null cells: 2348729
Of the non-null cells:
----------------------
n: 4387695
minimum: 111
maximum: 1755.78
range: 1644.78
mean: 465.981
mean of absolute values: 465.981
standard deviation: 303.394
variance: 92047.7
variation coefficient: 65.1085 %
sum: 2044583784.7811

# srtm dem 30 meter
r.univar map=fill.srtm@PERMANENT
total null and non-null cells: 6736424
total null cells: 2336464
Of the non-null cells:
----------------------
n: 4399960
minimum: 111.889
maximum: 1768
range: 1656.11
mean: 472.37
mean of absolute values: 472.37
standard deviation: 306.084
variance: 93687.1
variation coefficient: 64.7974 %
sum: 2078409710.98131

# aw3d dem 30 meter
r.univar map=fill.aw3d.2@PERMANENT
total null and non-null cells: 6736424
total null cells: 2336455
Of the non-null cells:
----------------------
n: 4399969
minimum: 113
maximum: 1770.44
range: 1657.44
mean: 474.104
mean of absolute values: 474.104
standard deviation: 307.543
variance: 94583
variation coefficient: 64.8684 %
sum: 2086042053.6362

# aster gdem 30 meter
r.univar map=fill.aster@PERMANENT
total null and non-null cells: 6736424
total null cells: 2335345
Of the non-null cells:
----------------------
n: 4401079
minimum: 75.1111
maximum: 1768.89
range: 1693.78
mean: 465.012
mean of absolute values: 465.012
standard deviation: 307.936
variance: 94824.6
variation coefficient: 66.2211 %
sum: 2046553349.75486
