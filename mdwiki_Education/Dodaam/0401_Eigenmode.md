# Ex0401 : 고유진동수 해석

## 개요

### 고유진동수 해석의 필요성
* 액츄에이터에 의해 가진되는 시스템의 안정성을 위해. (고유진동수와 가진 주파수를 피해준다.)
*
선형 버클링 현상 예측. (시스템이 충격을 받을 때 좌굴되는 양상의 예측 및 취약 지점 파악)
* 어쿠스틱 특성이 중요한 시스템. (악기,
스피커 등)

### 순서
* 우선 단일 파트 3D 모델을 준비한다.
* Mesh를 생성한다.
* 물성치, 경계조건 등을 정의한다.
* 해석
수행.
* 결과 가시화.

## 통기타 상판의 고유진동수 해석해 보기

* 본 예제에서는, 통기타 상판 부품의 고유진동수를 파악해서 물리적 의미를 찾아본다.
* 통기타
모델링 데이타는 GrabCad.com에 공개된 것을 사용하였다. ( https://grabcad.com/library/acoustic-
guitar-step-file-1 )
* 이와 같은 종류의 해석을 수행한 좋은 참고 (바이올린 해석 사례) : http://violin-
analysis.com/index.html

## CAD

* https://grabcad.com/library/acoustic-guitar-step-file-1 : 이곳에서 데이타를
내려받는다.
* 내려받은 .step 파일을 CAD로 열어보면 전체 통기타의 자세한 어셈블리가 모두 구성되어 있음을 알 수 있다.
* 그러나
통째로 해석하기에는 너무 부담이 크기 때문에, 상판 부품만 따로 떼어서 해석해 보자.

### FreeCAD로 .step 파일을 불러들인 모습.
![](https://cloud.githubusercontent.com/assets/12775748/16987810/11c65c80-4ec9-11e6-9878-c47651f90520.png)

### 상판 부품만 따로 떼어내서 별도로 저장하자.
![](https://cloud.githubusercontent.com/assets/12775748/16987812/120a66be-4ec9-11e6-8729-f029baee29bb.png)

### CATIA에서 불러들이기
* 이번에는 Mesh 작업을 CATIA에서 수행해 본다.
![](https://cloud.githubusercontent.com/assets/12775748/16987821/1236853c-4ec9-11e6-8c55-1485299fc416.png)

### CATIA Generative Structural Analysis에서 Mesh 생성.
* CATIA의 Mesh 생성 기능은 잘 튜닝되어
있어, 세밀한 까다로운 형태의 모델도 잘 뭉개서(?) Mesh를 에러없이 만들어내 준다.
![](https://cloud.githubusercontent.com/assets/12775748/16987822/1237426a-4ec9-11e6-86b9-a238b185dc3c.png)

### Export Mesh
* CATIA에서는 Mesh를 별도 파일로 저장(Export)할 수 있다.
* Export Mesh 버튼은
Advanced Meshing Tools에 있기 때문에, 전환해서 Export Mesh 버튼을 눌러준다.
* 포멧은 .dat로 선택한다.

### Gmsh에서 .dat 파일 읽어들이기
* Gmsh에서 곧바로 .dat 파일을 읽어들일 수 있다.
![](https://cloud.githubusercontent.com/assets/12775748/16987820/12330bc8-4ec9-11e6-8c03-0fa7b1a8c3e2.png)

### Mesh 관찰 및 .msh 파일로 저장
* 2nd Order Edge로 잘 형성되어 있음을 확인한다.
* File - Save Mesh
메뉴를 선택해서 .msh 파일을 생성한다.
![](https://cloud.githubusercontent.com/assets/12775748/16987817/1225b9dc-4ec9-11e6-93b4-4987c0ae692e.png)

## ElmerGUI에서 읽어들이기
* Elmer를 실행시키고, File - Open 해서 .msh 파일을 불러들인다.
![](https://cloud.githubusercontent.com/assets/12775748/16987819/12329d5a-4ec9-11e6-81e9-647dba3a1caf.png)

### Surface 분할하기
* 읽어들인 Mesh는 Surface가 전혀 분할되어 있지 않기 때문에, ElmerGUI 상에서 수동으로 작업해
준다.
* Mesh 메뉴 안의 Divide Surface, Unify Surface 메뉴를 활용해서 작업한다.
* 여기서는 아래와 같이
분할하였다.

#### 상면
![](https://cloud.githubusercontent.com/assets/12775748/16988101/42bbcf04-4eca-11e6-9d56-051bcf4eb1bd.png)

#### 하면
![](https://cloud.githubusercontent.com/assets/12775748/16988099/429888dc-4eca-11e6-9d85-deedd8ddabf8.png)

#### 내측면
![](https://cloud.githubusercontent.com/assets/12775748/16988102/42bbe9b2-4eca-11e6-9f23-df26dd8cfc2d.png)

#### 외측면
* 실제 변위구속으로 경계조건을 줄곳은 바로 이곳이다.
![](https://cloud.githubusercontent.com/assets/12775748/16988111/42cc929e-4eca-11e6-8f9b-bea6df74be0d.png)

#### 기타
![](https://cloud.githubusercontent.com/assets/12775748/16988105/42bd01bc-4eca-11e6-83a1-147fe3789dc9.png)

### Model 메뉴에서 셋팅하기

* 우선 Setup에서 Coordinate Scaling을 해 준다. (mm 에서 m 단위로 변환)
![](https://cloud.githubusercontent.com/assets/12775748/16988103/42bc1482-4eca-11e6-9c08-b0eacec4c647.png)

### Equation - Linear Elasticity
* 그림과 같이 체크해 준다.
![](https://cloud.githubusercontent.com/assets/12775748/16988104/42bd0428-4eca-11e6-8e23-c16685beb50d.png)

### Equation - Linear Elasticity - Edit Solver Settin
* 반드시 Eigen Analysis를 체크해
주고, 몇차 모드를 해석할 것인지 적어준다.
* Load 및 Stress는 체크해 줘도 되고 안해도 된다.  데이타를 굳이 얻어내고 싶다면
체크해 주면 된다.
![](https://cloud.githubusercontent.com/assets/12775748/16988109/42cb09e2-4eca-11e6-9696-609581187867.png)

* 그리고, Linear System 탭에 들어가서 Solver Method를 바꿔본다.
* 디폴트로 Iterative Method가 체크되어
있는데, 고유진동수 해석할 때는 이런 반복법이 시간이 너무 많이 소요되기 때문에 Direct Method로 변경하는 것이 낫다.  여기서는
Umfpack을 선택한다.  (MUMPS의 경우에는 별도로 설치를 해 줘야 한다.)
![](https://cloud.githubusercontent.com/assets/12775748/16988110/42cb2396-4eca-11e6-8a7a-34890433068c.png)

### Equation - Result Output
* 체크해서 Paraview로 결과 데이타를 읽어들일 수 있도록 해 준다.
![](https://cloud.githubusercontent.com/assets/12775748/16988107/42ca838c-4eca-11e6-94f1-8777dd4bfd8e.png)

### Material
* 제대로 하려면, 비등방성의 목재 재질로 물성치를 정확히 주는 것이 좋겠으나, 여기서는 간단히 하기 위해 제공되는 재질
중에서 PC 플라스틱을 적용해 보았다.
![](https://cloud.githubusercontent.com/assets/12775748/16988108/42cae14c-4eca-11e6-81ee-17d65719f1b1.png)

### Boundary Condition
* 여기서는 경계조건을 딱 1가지만 주었다.  외측면의 변위를 고정시키는 것이다.
![](https://cloud.githubusercontent.com/assets/12775748/16988106/42c01564-4eca-11e6-9e12-b84f19a9c275.png)

## Run Solver
* 셋팅이 다 되었으면, sif - Generation 해 주고, File - Save Project 해 준다.
*
이후에 Run - Start Solver를 실행한다.

## Paraview에서 결과 데이타 보기
* Paraview에서 결과 데이타를 불러들여 볼 수 있다.
* 여기서는 10차 모드까지 해석해서
나열해 본다.
(10개의 모드를 모두 해석하기 위해 간단히 배치 작업을 통해 해석을 수행하였다.  배치 작업 요령은 나중에 별도로 다루기로
한다.)
* 각 모드별 주파수 수치는, 결과 텍스트에 뜬다.  이것을 텍스트 파일로 저장해서 보관하도록 한다.
* 모드별 주파수 수치는,
0.001을 곱해서 스케일링을 해 주면 Hz 단위의 주파수를 얻을 수 있다.

#### 1차 모드 :  2.212950E+02 Hz
![](https://cloud.githubusercontent.com/assets/12775748/16987860/3c7bf05c-4ec9-11e6-88bf-973229c88b02.png)
![](https://cloud.githubusercontent.com/assets/12775748/16987869/3ced42e8-4ec9-11e6-8d84-6deb13a890f0.png)

#### 2차 모드 :  8.593697E+02 Hz
![](https://cloud.githubusercontent.com/assets/12775748/16987862/3cc5f972-4ec9-11e6-927b-f46d9034d708.png)
![](https://cloud.githubusercontent.com/assets/12775748/16987871/3cf33f72-4ec9-11e6-9d26-ddc396b53350.png)

#### 3차 모드 :  9.416432E+02 Hz
![](https://cloud.githubusercontent.com/assets/12775748/16987863/3cc8a7f8-4ec9-11e6-9a51-8fc24fbd0913.png)
![](https://cloud.githubusercontent.com/assets/12775748/16987870/3cf275c4-4ec9-11e6-9025-9069d1957ea2.png)

#### 4차 모드 :  1.604854E+03 Hz
![](https://cloud.githubusercontent.com/assets/12775748/16987861/3ca335f4-4ec9-11e6-8e7f-cdae94e3d99f.png)
![](https://cloud.githubusercontent.com/assets/12775748/16987872/3cf3a958-4ec9-11e6-8278-eb1620dd1f82.png)

#### 5차 모드 :  2.912714E+03 Hz
![](https://cloud.githubusercontent.com/assets/12775748/16987864/3ccaf6ca-4ec9-11e6-9db3-d6ee24494a78.png)
![](https://cloud.githubusercontent.com/assets/12775748/16987875/3d03d0a8-4ec9-11e6-8e09-5890b079c072.png)

#### 6차 모드 :  3.116455E+03 Hz
![](https://cloud.githubusercontent.com/assets/12775748/16987867/3cd5baba-4ec9-11e6-8969-fe7ecc1296c5.png)
![](https://cloud.githubusercontent.com/assets/12775748/16987876/3d1674e2-4ec9-11e6-857d-e16acaa21f47.png)

#### 7차 모드 :  4.055115E+03 Hz
![](https://cloud.githubusercontent.com/assets/12775748/16987868/3cd64b60-4ec9-11e6-822f-8ae3fb4ec812.png)
![](https://cloud.githubusercontent.com/assets/12775748/16987877/3d196184-4ec9-11e6-98ef-78093e3357dc.png)

#### 8차 모드 :  5.807159E+03 Hz
![](https://cloud.githubusercontent.com/assets/12775748/16987873/3cf3d676-4ec9-11e6-8b5e-adff8a6c08be.png)
![](https://cloud.githubusercontent.com/assets/12775748/16987880/3d200ade-4ec9-11e6-8a86-596370eefe52.png)

#### 9차 모드 :  7.130481E+03 Hz
![](https://cloud.githubusercontent.com/assets/12775748/16987865/3ccc9282-4ec9-11e6-98be-f61ba41333e3.png)
![](https://cloud.githubusercontent.com/assets/12775748/16987879/3d1fadd2-4ec9-11e6-9df1-5b7ceac0650b.png)

#### 10차 모드 :  9.574717E+03 Hz
![](https://cloud.githubusercontent.com/assets/12775748/16987874/3cfb6260-4ec9-11e6-89c4-fb7edf987eb6.png)
![](https://cloud.githubusercontent.com/assets/12775748/16987878/3d1ac3e4-4ec9-11e6-9c48-9e0251f43b20.png)

### 결과 강평

* 대략 1,2,3,4,5차 모드까지가 가청주파수 대역에 해당한다.
* 각 음계별 주파수를 검색해 보고 비교해 볼 수 있다.
( 예 : http://thomson.tistory.com/638 )

|모드|주파수 |비슷한 음계|
|----|-------|-----------|
|1차 |220Hz  |4옥타브 도 (260Hz)|
|2차 |860Hz  |5옥타브 라
(880Hz)|
|3차 |940Hz  |5옥타브 라# (932Hz)|
|4차 |1600Hz |6옥타브 솔 (1568Hz)|
|5차 |2900Hz
|7옥타브 파# (2960Hz)|

## 추가 테크닉

* Salome-Meca를 설치한 경우, 내장된 Paraview 변형판인 Paravis를 이용하여 Animation을 간단히
만들 수 있다.
* 다만 Salome-meca는 윈도우용으로는 존재하지 않고, Salome Platform의 윈도우 버전을 구해서 설치 시도해
볼 수는 있다. 다만 안정성은 상당히 떨어질 것이다.

### Animation 편집본
* https://youtu.be/IcbD2ZhThq4
[![](https://i.ytimg.com/vi/IcbD2ZhThq4/hqdefault.jpg?custom=true&w=196&h=110&stc=true&jpg444=true&jpgq=90&sp=68&sigh=ss5vhxLQ_3uCp-P9642X5j2IyYY)](https://youtu.be/IcbD2ZhThq4)

# 끝!
