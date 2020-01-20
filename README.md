# ImageAnalytics-Tutorial
Examples that illustrate how to use the Image Analytics tools

This repository contains two scripts that illustrate how to use some of the functionality of the TASBEImageAnalytics repository.  The first script, `fceExp.sh` illustrates how to use the `cellStats.py` script to detect cells clusters and track them over time. The second script, `3dexp.sh`, illustrates how to use the `3DcellStats.py` script to create a 3D point cloud from the microscopy data.  This requires having built the C++ code in the TASBEImageAnalytics repository.

This repository includes the data and source code needed to execute the tutorial scripts as git submodules.  To ensure that all of the required files are present it is best to use
```
git clone --recurse-submodules git@github.com:TASBE/TASBEImageAnalytics-Tutorial.git
```
to checkout the repository.  Without using `--recurse-submodules` then you will need to execute
```
git submodule init
git submodule update
```

