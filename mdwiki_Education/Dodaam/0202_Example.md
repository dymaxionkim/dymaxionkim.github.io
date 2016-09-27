# 0201 : Basic Example

## CAD

* 작업 디렉토리를 하나 만든다.
* 이때, 작업 디렉토리 경로는 모두 영문으로 구성되어야 한다.  한글이 있으면 안된다.
*
작업 디렉토리에 CAD 툴을 이용하여 해석 대상 부품을 STEP 파일로 저장한다.

### FreeCAD 실행
* 실행 직후, 빈 새 파일을 하나 만들고, Part Design 워크벤치로 들어간다.
![](https://cloud.githubusercontent.com/assets/12775748/16441806/cad13514-3e08-11e6-8358-d36cc2f57a40.png)

### 스케치
* 좌측에서 Create sketch를 눌러서 스케치할 평면을 정한다.
![](https://cloud.githubusercontent.com/assets/12775748/16441805/cad105d0-3e08-11e6-985f-754ccbf00094.png)

### 스케치
* 스케치 모드로 진입한다.
![](https://cloud.githubusercontent.com/assets/12775748/16441808/cad446aa-3e08-11e6-8b51-23e00fe8c67e.png)

### 스케치
* 여기에 원하는 형상을 그린다.
![](https://cloud.githubusercontent.com/assets/12775748/16441807/cad2f49e-3e08-11e6-8ec0-64fa5101aa7e.png)

### 스케치
* 구속조건, 치수 등을 부여하고, 스케치 모드를 빠져나온다.
![](https://cloud.githubusercontent.com/assets/12775748/16441809/cad6397e-3e08-11e6-9de0-07df46ec6ac8.png)

### Pad
* Pad를 눌러서 금방 스케치한 형상을 입체로 만든다.
![](https://cloud.githubusercontent.com/assets/12775748/16441810/cad61a52-3e08-11e6-97d7-bba30dd1cf60.png)

### 추가 스케치
* 새로 스케치하고 싶은 평면을 클릭해서 잡은 다음, 다시 스케치 모드로 들어간다.
![](https://cloud.githubusercontent.com/assets/12775748/16441811/caf3086a-3e08-11e6-949c-e81055932db6.png)

### 추가 스케치
* 전과 같은 방식으로 스케치한 후 구속조건을 주고 빠져나온다.
![](https://cloud.githubusercontent.com/assets/12775748/16441812/caf41f02-3e08-11e6-8f28-a133e5716621.png)

### 추가 Pad
* 금방 스케치한 것을 Pad 한다.
![](https://cloud.githubusercontent.com/assets/12775748/16441815/cafa576e-3e08-11e6-92a5-3a3a459076e7.png)

### 합치기 (Fusion : Boolean Operation)
* 만들어진 2개의 Pad를 모두 선택한 후, Fusion 아이콘을 클릭해서
합친다.
![](https://cloud.githubusercontent.com/assets/12775748/16441817/cb17cd4e-3e08-11e6-9cde-452ccb674fe8.png)

### 필렛
* 필렛하고자 하는 모서리를 마우스로 선택한다.
![](https://cloud.githubusercontent.com/assets/12775748/16441818/cb180d4a-3e08-11e6-9875-30b651f54c98.png)

### 필렛
* 모서리가 다 선택되었으면, 필렛 아이콘을 클릭하여 필렛을 한다.
![](https://cloud.githubusercontent.com/assets/12775748/16441820/cb1a0faa-3e08-11e6-83c8-4add73078929.png)

### 필렛
* 원하는 대로 필렛이 잘 되었는지 확인.
![](https://cloud.githubusercontent.com/assets/12775748/16441822/cb215e68-3e08-11e6-97bb-10dabcf261dd.png)

### Export STEP
* STEP 파일로 익스포트할 형상을 선택한다.
![](https://cloud.githubusercontent.com/assets/12775748/16441825/cb418ce2-3e08-11e6-97cd-
cc15acd04677.png)

### Export STEP
* Export 메뉴를 선택하고, 원하는 위치에 저장한다.
![](https://cloud.githubusercontent.com/assets/12775748/16441823/cb3c7a54-3e08-11e6-8a3c-aea169f0ca0d.png)

## Netgen

### 실행
* Netgen을 실행시킨다.
![](https://cloud.githubusercontent.com/assets/12775748/16441824/cb3d6e32-3e08-11e6-97a0-ff2b62cbbc71.png)

### STEP 파일 읽기
* 원하는 STEP 파일을 불러들인다.
![](https://cloud.githubusercontent.com/assets/12775748/16441826/cb42b89c-3e08-11e6-90b6-ba9ab1bc1571.png)

### STEP 파일 읽기
* 이상없이 잘 불러들여 졌는지 확인.
![](https://cloud.githubusercontent.com/assets/12775748/16441827/cb43318c-3e08-11e6-8c13-4c4a3bd2a9e5.png)

### Mesh 옵션
* 상단 Mesh 메뉴에서 Meshing Option 메뉴를 고른다.
![](https://cloud.githubusercontent.com/assets/12775748/16441828/cb48750c-3e08-11e6-83e3-bba2a4616901.png)

### Mesh 옵션
* Second Order Elements를 체크하고, Element Order는 2로 놓는다.
![](https://cloud.githubusercontent.com/assets/12775748/16441829/cb5dc4d4-3e08-11e6-8514-227eb05b0795.png)

### Mesh
* Generate Mesh 한다.
![](https://cloud.githubusercontent.com/assets/12775748/16441830/cb619f5a-3e08-11e6-9c98-70b9e0962213.png)

### Export Filetype
* File 메뉴 중 Ecport Filetype을 선택하고, Elmer Format을 고른다.
* 그리고
Export Mesh를 선택하고, 원하는 위치에 저장한다.
![](https://cloud.githubusercontent.com/assets/12775748/16441832/cb668bbe-3e08-11e6-9c86-62b92d2e6b72.png)

### 저장 확인
* 탐색기로 해당 위치에 이상없이 잘 저장되었는지 확인한다.
![](https://cloud.githubusercontent.com/assets/12775748/16441831/cb65e038-3e08-11e6-845f-87541ad480ef.png)

## Elmer

### 실행
* ElmerGUI를 실행시킨다.
![](https://cloud.githubusercontent.com/assets/12775748/16441833/cb67f972-3e08-11e6-84a6-818d57f89c70.png)

### Mesh 읽기
* File 메뉴 중 Load Mesh를 선택하고, 해당 위치에 가서 OK 해 주면 Mesh가 불러들여진다.
![](https://cloud.githubusercontent.com/assets/12775748/16441834/cb6c8ad2-3e08-11e6-96b0-e3e4b6344330.png)

### Model Setup
* 메뉴 Model - Setup 하고 뜨는 팝업창에서, 그림과 같은 위치에 `Coordinate Scaling =
Real 0.001`을 써 넣어준다.
* mm 단위로 모델링된 형상을, Elmer에서 m 단위로 바꾸어주는 것이다.
![](https://cloud.githubusercontent.com/assets/12775748/16441835/cb827040-3e08-11e6-9f0b-05ab77dc7936.png)

### Equation
* Model - Equation -Add 해서, `Linear Elasticity` 탭으로 들어간다.
* 그림과 같이,
Active 체크 해 주고 Stress 계산 옵션들도 체크해 준다.
* Body도 체크해 준다.
* 마지막으로, `Edit Solver
Setting` 버튼을 눌러준다.
![](https://cloud.githubusercontent.com/assets/12775748/16441836/cb8665e2-3e08-11e6-9076-2a335d53d56c.png)

### Linear Elasticity Solver
* Solver Specific Option에서 Calculate Loads,
Calculate Stesses 모두 체크해 준다.
![](https://cloud.githubusercontent.com/assets/12775748/16441837/cb87204a-3e08-11e6-942d-b02361d11c2d.png)

### Result Output Solver
* Result Output 탭으로 들어가서 Active 해 준다.
* 그 다음, Edit
Solver Setting 버튼을 눌러준다.
![](https://cloud.githubusercontent.com/assets/12775748/16441840/cb90b588-3e08-11e6-9fb0-5ae474452101.png)

### Result Output Solver
* 출력파일 형식이 vtu로 되어 있는지 확인한다.
![](https://cloud.githubusercontent.com/assets/12775748/16441841/cba6b3ba-3e08-11e6-8e9e-b90beafbd16c.png)

### Result Output Solver
* General 탭에서Execute를 `After Timestep`으로 바꾸어준다.
![](https://cloud.githubusercontent.com/assets/12775748/16441843/cbabdc46-3e08-11e6-92d9-6d332507cf85.png)

### Material
* Model - Material -Add 로 들어간다.
![](https://cloud.githubusercontent.com/assets/12775748/16441842/cbab0f78-3e08-11e6-9532-c1770a210cc1.png)

### Material
* Material Library에서 원하는 소재를 선택한다.
* Body도 체크해 준다.
![](https://cloud.githubusercontent.com/assets/12775748/16441844/cbad07b0-3e08-11e6-857b-725196f275f8.png)

### Boundary Condition : Fix
* Model - Boundary Condition - Add 해 주고, Linear
Elasticity 탭으로 들어간다.
* 이름은 `Fix`로 정해본다.
* Displacement는 1,2,3번축 모두 0으로 써넣어
고정시켜준다.
![](https://cloud.githubusercontent.com/assets/12775748/16441846/cbb6f004-3e08-11e6-97d6-c6bc2d62e78e.png)

### Boundary Condition : Force
* Model - Boundary Condition - Add 해 주고, Linear
Elasticity 탭으로 들어간다.
* 이름은 `Force`로 정해본다.
* Normal Force를 -100 정도로 넣어서 눌러주는 힘을
부여해 본다.
![](https://cloud.githubusercontent.com/assets/12775748/16441847/cbcb743e-3e08-11e6-9522-85e156bd563e.png)

### Boundary Condition : Fix
* Model - Set Boundary Properties 해서 체크 상태로 한다.
*
원하는 면을 더블클릭한다.
![](https://cloud.githubusercontent.com/assets/12775748/16441848/cbcdb4ce-3e08-11e6-81e9-de2dda12c87e.png)

### Boundary Condition : Fix
* 팝업창에서 원하는 경계조건을 골라준다.
![](https://cloud.githubusercontent.com/assets/12775748/16441849/cbcf2a5c-3e08-11e6-9e24-e8b820b7a799.png)

### Boundary Condition : Force
* 같은 방식으로, 이쪽 면에는 Force를 줘 본다.
![](https://cloud.githubusercontent.com/assets/12775748/16441851/cbd36ffe-3e08-11e6-83b0-62a8ebe3f8d8.png)

### Save Project
* Sif - Generate 해서 설정 파일을 생성한다.
* File - Save Project 해서 프로젝트를
저장한다.
* 탐색기를 통해서 이상없이 관련 파일들이 생성되었는지 확인.
![](https://cloud.githubusercontent.com/assets/12775748/16441852/cbd8ff5a-3e08-11e6-9119-49fd2bd88816.png)

### Run Solver
* Run - Start Solver 하고, 계산이 이상없이 수렴해서 완료되는지 확인한다.
* 최종적으로, 탐색기에
결과 파일인 vtu 파일이 생성되었는지 확인한다.
![](https://cloud.githubusercontent.com/assets/12775748/16441853/cbf1d3cc-3e08-11e6-98d7-f708b5fb0555.png)

## Paraview

### 실행 후 데이타 읽기
* Paraview를 실행한다.
* 결과 파일을 읽어들인다.
![](https://cloud.githubusercontent.com/assets/12775748/16441856/cbf6891c-3e08-11e6-9890-f4fe8c7fb940.png)

### Apply
* 좌측의 Apply 버튼을 눌러서 보이도록 한다.
![](https://cloud.githubusercontent.com/assets/12775748/16441857/cbf8eeaa-3e08-11e6-9a11-64cd7b883064.png)

### 그래픽 조정
* Von Mises 응력을 본다.
![](https://cloud.githubusercontent.com/assets/12775748/16441858/cbfa236a-3e08-11e6-9e56-15dd647a412c.png)

### 그래픽 조정
* Loads를 본다.
![](https://cloud.githubusercontent.com/assets/12775748/16441859/cc12f746-3e08-11e6-865d-eac041b38eb6.png)

### 그래픽 조정
* Displacement를 본다.
![](https://cloud.githubusercontent.com/assets/12775748/16441861/cc163794-3e08-11e6-982b-07277ef08a10.png)

# 끝!
