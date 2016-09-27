# 6교시 : Z88 Aurora, ElmerFEM으로 구조해석 하고 Paraview로 결과 만들어 보기

## 6.1. Z88Aurora

### Z88Aurora의 능력

* 외부 소프트웨어와의 파일 교환시 약간의 제한
* 복잡한 STEP 파일 임포트시 실패 확률 있음
* 해석
계산 속도는 가장 빠른 수준
* 선형탄성, 비선형초탄성, 모드, 열전도 해석 가능
* 다물체 해석 불가능

### Z88의 사용법

* Spider를 통해 순차적으로 쉽게 작업 가능
* 신속하게 생산성 높게 빠른 결과를 얻는데 적합
![](http://3.bp.blogspot.com/-S-gujh_jRr0/VS-6F1SX7HI/AAAAAAAAa_Y/jcUCNj6FqP4/s1600/20150416_002.png)

### 해석 대상 부품 모델링하기

* 스퍼기어 하나를 그려보자.
* 기어 치형을 그리는 수단

> FreeCAD 내장 기어 생성기 사용
(저정밀도)

> GPG 프로그램(윈도우용)을 사용 :
http://dymaxionkim.blogspot.com/2012/11/gpg-v08.html

> 온라인 기어 작도 서비스 (저정밀) :
http://geargenerator.com

> 온라인 기어 작도 서비스 (고정밀) :
http://hessmer.org/gears/InvoluteSpurGearBuilder.html

> 무료 기어 작도 소프트웨어 사용 (저정밀)
: http://www.emachineshop.com/machine-shop/Free-Gear-Design-
Software/page506.html

> FGPG 스크립트 프로그램을 사용 (고정밀) :
https://github.com/dymaxionkim/FGPG

![](http://3.bp.blogspot.com/-bRQU6Ir5Hxg/VS-6F4fu3lI/AAAAAAAAa_c/AtQhOeI-
BaQ/s1600/20150416_001.png)

### 3D 데이타 불러올 때 유의점

* STEP 파일을 직접 불러올 때 형상이 깨지는 경우에는, 외부 3D 소프트웨어를 이용하여 직접 STL
파일을 생성한 후 그것을 불러들이는 것이 유리함.

![](http://4.bp.blogspot.com/-rnUErvBeauU/VS-6Gd95XjI/AAAAAAAAa_k/ldZ3AQYultY/s1600/20150416_004.png)

![](http://2.bp.blogspot.com/-aZIOr3ezxPA/VS-6GxPxDiI/AAAAAAAAa_o/RPbnATsPOPc/s1600/20150416_005.png)

### Mesh 생성

![](http://4.bp.blogspot.com/-XanN5CkjsNQ/VS-6HERiD7I/AAAAAAAAa_w/zxJdV6dIG5k/s1600/20150416_006.png)

### 경계조건 설정

* 가급적 Surface를 선택하지 말고, node로 선택할 것.

![](http://2.bp.blogspot.com/-b8m2t9k-J0U/VS-6HR8we9I/AAAAAAAAbAc/CyqVUdRkpEM/s1600/20150416_007.png)

### 재질 부여

![](http://4.bp.blogspot.com/-xzJ4Kn7g25M/VS-6HrhcYiI/AAAAAAAAa_0/fRdrebQdrmU/s1600/20150416_008.png)

### 경계조건 부여할 영역 지정

![](http://2.bp.blogspot.com/-siYlEHyAwpg/VS-6IB1bHmI/AAAAAAAAbAI/Mqq13U-6IEA/s1600/20150416_009.png)

### 솔버 지정 및 계산 시작

![](http://3.bp.blogspot.com/-n2CZa9K9IN0/VS-6IRf5bvI/AAAAAAAAbAA/zlcFmbXM7YU/s1600/20150416_010.png)

### 포스트 프로세싱

![](http://1.bp.blogspot.com/-eE4Jy_mEklw/VS-6JFw6UtI/AAAAAAAAbAQ/S5gGmV0wYJ8/s1600/20150416_011.png)

![](http://1.bp.blogspot.com/-QHXlDsMWguc/VS-6JlKlAhI/AAAAAAAAbAY/-kkJ7u7Q0eM/s1600/20150416_012.png)

![](http://1.bp.blogspot.com/-UHnWTIoHBWg/VS-6KCo1LsI/AAAAAAAAbAg/nrcEHOdMTx0/s1600/20150416_013.png)

### 결과 데이타

* 결과 데이타는 VTK로 만들어내지 못한다.
* STL 파일을 출력할 수 있을 뿐이므로 제한적임.

## 6.2. Elmer

### Elmer의 능력

* 몇 가지 프로그램들의 집합으로 구성되어 있으며, 유기적으로 연계됨.

> ElmerGUI, ElmerGrid,
ElmerSolver, MATC, ElmerPOST, ElmerVTK

* VTK 포멧으로 결과 출력이 가능해 Paraview와 연계 사용
가능.

* ElmerGUI
  1. 입력파일을 자동 생성하는데 편리.
  2. 단순한 사용방법으로 쉽게 적응 가능.

* ElmerGrid
  1. NetGen 기반으로 Mesh 생성.
  2. 터미널 명령으로 조건을 줘서 스크립트화하여 자동 Mesh 생성하는데
유리.

* ElmerSolver
  1. 유용한 솔버가 잘 셋팅되어 있음.
  2. 필요시 Fortran으로 직접 솔버를 만들어서 구동 가능.
  3.
Fortran 컴파일러는 Elmer 패키지에 자체 내장되어 있음.
  4. 터미널 명령으로 솔버만 구동 가능.

* MATC
  1. 입력파일에 들어가는 파라미터들을 다양한 조건, 함수로 통제 가능
  2. 문법이 간단함

* ElmerPOST
  1. 자체 포스트 프로세서.
  2. 현재는 업데이트가 중단됨.

* ElmerVTK
  1. VTK 기반으로 새로 만들어진 자체 포스트 프로세서.
  2. 단점은 물체의 변형된 상태를 보여주지 못함 (대신
Color 및 Glipe 로 파악 가능)

### Elmer로 기본적인 선형 탄성 해석해 보기

* http://dymaxionkim.blogspot.kr/2015/04/open-
source-cae-toolchain-3.html

![](http://3.bp.blogspot.com/-7Q4hY-
mM6e8/VSr988itROI/AAAAAAAAa6k/SiRorMgRLXY/s1600/20150413_001.png)

![](http://4.bp.blogspot.com/-mxqXiLjMuyg/VSr985UqU3I/AAAAAAAAa6g/Wf1MubwLazE/s1600/20150413_002.png)

![](http://4.bp.blogspot.com/-9jKafnHKDNQ/VSr981ACnqI/AAAAAAAAa6c/Y6iU6mZ-
QzQ/s1600/20150413_003.png)

![](http://4.bp.blogspot.com/-77FDbCgxUfw/VSr99oUUEkI/AAAAAAAAa64/HLJ7b8lxUeM/s1600/20150413_004.png)

![](http://4.bp.blogspot.com/-wsfkJFR5FAI/VSr992aJt5I/AAAAAAAAa6s/TqxpIDxaP5I/s1600/20150413_005.png)

![](http://1.bp.blogspot.com/-GoGWMfps7OQ/VSr9-Bnq5nI/AAAAAAAAa6w/CLXkVT4vR3o/s1600/20150413_006.png)

![](http://1.bp.blogspot.com/-BQfyb-
KmKn4/VSr9-j_5ucI/AAAAAAAAa7M/ILI2XLL7Hd0/s1600/20150413_007.png)

![](http://1.bp.blogspot.com/-zXlapsxo8M0/VSr9-5kcaKI/AAAAAAAAa7A/RmBcmcIUxtA/s1600/20150413_008.png)

![](http://1.bp.blogspot.com/-npoy6o1T-Xw/VSr9_RctA6I/AAAAAAAAa7I/jYa6yNtHmdM/s1600/20150413_009.png)

![](http://4.bp.blogspot.com/-CJu18pmERGE/VSr9_5AE17I/AAAAAAAAa7Q/6b691AK8zow/s1600/20150413_010.png)

![](http://3.bp.blogspot.com/-n54wxlSiGaE/VSr-
Aadfj4I/AAAAAAAAa7c/ooeS8JgvXxw/s1600/20150413_011.png)

![](http://3.bp.blogspot.com/-O-83v7jdt50/VSr-
Aqv_ZsI/AAAAAAAAa7o/-FVCopts5Cg/s1600/20150413_012.png)

![](http://4.bp.blogspot.com/-AlaN6yzL7Jw/VSr-A3VE7zI/AAAAAAAAa7k/3EXEx4UGgQ4/s1600/20150413_013.png)

![](http://4.bp.blogspot.com/-NEpCBW3acQM/VSsH9MKSI3I/AAAAAAAAa8c/wPDPbSZmV6Y/s1600/20150413_38.png)

![](http://4.bp.blogspot.com/-UvpZ5mj2Mjw/VSr-
BaeIJBI/AAAAAAAAa7s/5W_ruG58K_c/s1600/20150413_014.png)
