# 0301 : Gravity Condition

## FreeCAD

* 3D Solid Modeling

## Sketch
![](https://cloud.githubusercontent.com/assets/12775748/16608830/1e263d14-438a-11e6-9f2d-dfcb5d92ae61.png)

## Pad
![](https://cloud.githubusercontent.com/assets/12775748/16608835/1e33d140-438a-11e6-8319-16066010e03d.png)

## Export to STEP
![](https://cloud.githubusercontent.com/assets/12775748/16608834/1e3392e8-438a-11e6-84ce-67ed0a2b8e6a.png)

## Gmsh

* Mesh Generatoin

## Start Gmsh
![](https://cloud.githubusercontent.com/assets/12775748/16608836/1f489e1c-438a-11e6-8b2d-5dbd37c1aa3d.png)

## Open STEP file
![](https://cloud.githubusercontent.com/assets/12775748/16608837/1f4caa7a-438a-11e6-9316-87b62e4001bc.png)

## Check Geometry
![](https://cloud.githubusercontent.com/assets/12775748/16608838/1f55c9e8-438a-11e6-8751-e42b1750e9cb.png)

## Tools - Options
![](https://cloud.githubusercontent.com/assets/12775748/16608840/1f57bbc2-438a-11e6-9c59-a0840ef68b17.png)

## Check Geometry
![](https://cloud.githubusercontent.com/assets/12775748/16608839/1f55ebb2-438a-11e6-906b-e1399795b2ce.png)

## Generate Mesh
* Mesh - 3D - Optimize 3D - Set Order 2
![](https://cloud.githubusercontent.com/assets/12775748/16608841/1f5f3244-438a-11e6-8e6d-6a0c96fef131.png)

## Options
![](https://cloud.githubusercontent.com/assets/12775748/16608843/206e8c52-438a-11e6-94f6-31d95ad40152.png)

## Check & Export Mesh
![](https://cloud.githubusercontent.com/assets/12775748/16608844/20773de8-438a-11e6-862d-4b63807cff74.png)

## Elmer

* "StressSolver" has no gravity condition in default setting.

## Open Mesh
![](https://cloud.githubusercontent.com/assets/12775748/16608846/2089bedc-438a-11e6-857a-35253710ee62.png)

## Setup
* `Coordinate Scaling = Real 0.001`
![](https://cloud.githubusercontent.com/assets/12775748/16608847/208a1f26-438a-11e6-94f8-665c16ef8a4b.png)

## Equation - Liniear Elasticity
* Check `Active`, `Options`
* Check `Body 1`
*
Press `Edit Solver Setting`
![](https://cloud.githubusercontent.com/assets/12775748/16608845/20897e36-438a-11e6-9ba6-c0f89302df14.png)

## Solver
* Check `Miscellaneous Options`
![](https://cloud.githubusercontent.com/assets/12775748/16608848/20a739b2-438a-11e6-85e0-83296a1dfa9c.png)

## Equation - Result Output
* Check `Active`
* Press `Edit Solver Settings`
![](https://cloud.githubusercontent.com/assets/12775748/16608849/21dfe96e-438a-11e6-9124-bd65a1b50da2.png)

## Solver
* Tab `General` - Check `After Timestep`
![](https://cloud.githubusercontent.com/assets/12775748/16608850/21ed7cd2-438a-11e6-8689-fc1b4378fd90.png)

## Material
* Check `Body 1`
* Press `Material Library`
![](https://cloud.githubusercontent.com/assets/12775748/16608852/21fbc198-438a-11e6-9754-bce2f267e1bb.png)

## Material Library
* Choice
![](https://cloud.githubusercontent.com/assets/12775748/16608853/21fcc048-438a-11e6-8d24-bc949a43e87c.png)

## Apply Material
* Check
![](https://cloud.githubusercontent.com/assets/12775748/16608851/21fb7cf6-438a-11e6-8749-73f75a67d1a2.png)

## Body Force
* Check `Body 1`
![](https://cloud.githubusercontent.com/assets/12775748/16608854/220fa8fc-438a-11e6-8631-346e030071aa.png)

## Body Force - Linear Elasticity
* Tab `Linear Elasticity`
* Apply Gravitation
like that :
![](https://cloud.githubusercontent.com/assets/12775748/16608855/238e6d6c-438a-11e6-9a8d-77bec42672c9.png)

## Boundary Condition
* Apply Boundary Condition like that :
![](https://cloud.githubusercontent.com/assets/12775748/16608857/23920ec2-438a-11e6-9397-72b2bad19ce3.png)

## Boundary Condition
* Check `Model` - `Set Boundary Properties`
* Double Click
on desired Surface & Choice :
![](https://cloud.githubusercontent.com/assets/12775748/16608859/2393e33c-438a-11e6-8d5c-057d492d037d.png)

##  Check Models
* Check directions with `Compas`
![](https://cloud.githubusercontent.com/assets/12775748/16608856/238fb6c2-438a-11e6-941d-990e129fefdb.png)

## Run Solver
* `Run` - `Start Solver`
![](https://cloud.githubusercontent.com/assets/12775748/16608858/23930d04-438a-11e6-9ece-832d4678c6ae.png)

## Run Solvere - Convergence
![](https://cloud.githubusercontent.com/assets/12775748/16608860/239a8b24-438a-11e6-970d-fedbf95b0628.png)

## ParaView

* 해석 결과 데이타 보기

## VonMises Stress
![](https://cloud.githubusercontent.com/assets/12775748/16608862/24acf92a-438a-11e6-8c5b-75f5dd2f53a2.png)

## Displacement with Stress
![](https://cloud.githubusercontent.com/assets/12775748/16608863/24b2c81e-438a-11e6-970c-5c6ff948a9f9.png)

## Displacement
![](https://cloud.githubusercontent.com/assets/12775748/16608865/24b72ac6-438a-11e6-9a77-624365c998a4.png)

## Details
![](https://cloud.githubusercontent.com/assets/12775748/16608832/1e28b4ae-438a-11e6-9bc3-e524db1457ee.png)

## Details
![](https://cloud.githubusercontent.com/assets/12775748/16608831/1e268ce2-438a-11e6-8115-61b11c507e7e.png)

## Details
![](https://cloud.githubusercontent.com/assets/12775748/16608833/1e2a071e-438a-11e6-878a-8165333e6c3d.png)

# Thank you!
