# 2교시 : FreeCAD, Elmer, Z88 소개 및 설치하기

## 2.1. FreeCAD, Netgen, CalculiX
![](http://www.freecadweb.org/tracker/images/mantis_logo.png)
![](http://www.iue.tuwien.ac.at/cse/images/static_content/projects/netgen-
logo.jpg)
![](http://www.dhondt.de/GSStress.gif)

### FreeCAD?

* http://www.freecadweb.org/
* 3D CAD
* Based on Open Cascade,
Python

### CalculiX?

* http://www.dhondt.de/
* A Free Software Three-Dimensional
Structural Finite Element Program
* Abaqus와 비슷함 (.inp 형식의 설정 파일 사용)
* 자체
Pre.Post-Processor가 약하기 때문에 보통 다른 것들과 붙여서 사용함.
* 여기서는 FreeCAD에 붙여서 설치, 기본적인 사항만
해 보기로 함.

### CalculiX Native 예제

* http://dip28p.web.fc2.com/

### CalcuiX의 사업화 사례

* http://www.mtu.de/
* https://www.openaircraft.com/
*
http://www.calculixforwin.com/
* http://www.bconverged.com/
*
http://ameblo.jp/jishii/

### FreeCAD, CalculiX 설치

* Mesh Generator로는 Netgen이 함께 설치된다.

```
sudo add-apt-
repository ppa:freecad-maintainers/freecad-stable
sudo apt-get update
sudo apt-
get install freecad calculix-ccx netgen
```


### Netgen이 실행되지 않는 버그 수정

* 출처 : https://sourceforge.net/p/netgen-
mesher/discussion/905307/thread/946ccfc2/
* 현재 버전의 Netgen이 실행되지 않는 버그가 있다.
*
Netgen 실행 스크립트 중에 하나에 오기된 부분이 있어 그러하므로 수정해 주면 된다.
* 터미널로 편집기 열기
```
sudo l3afpad
/usr/share/netgen/drawing.tcl
```
* 다음 내용이 있는 부분 찾기
```
if {[catch {togl .ndraw
-width 400 -height 300 -rgba true -double true -depth true -privatecmap false
-stereo false -indirect true }] } { ....
```
* 여기서 `-indirect true`라고 되어 있는 부분을
`-indirect false`로 바꿔준다.

### FreeCAD, CaculiX 예제

* http://dymaxionkim.blogspot.kr/2015/05/open-source-
cae-toolchain-14-fem-with.html

## 2.2. Elmer
![](https://www.csc.fi/image/layout_set_logo?img_id=134053&t=1464500987499)

### Elmer?

* Multi-Physics, PDE
*
http://prace.it4i.cz/sites/prace.it4i.cz/files/pss14_elmer_intro.pdf
*
https://www.csc.fi/web/elmer
* http://www.elmerfem.org/
*
https://github.com/ElmerCSC/elmerfem
*
http://www.elmerfem.org/forum/viewforum.php?f=1&sid=134fb96c09be1a611c618c96e99b1fc9

### Elmer의 사업화 사례

* http://www.studiogarattoni.com/
*
http://digitalcreation-s.co.jp/
* http://www.fortissimo-project.eu/
*
http://www.idrasimulation.com/

### Elmer 설치

```
sudo apt-add-repository ppa:elmer-csc-ubuntu/elmer-csc-ppa
sudo apt-get update
sudo apt-get install elmerfem-csc
```

### Elmer 시작 방법

#### 방법1 : 터미널에서 다음 명령어 입력
```
ElmerGUI
```

#### 방법2 : 실행 아이콘을 수동으로 등록하기
  * 다음 명령을 터미널에 입력.
```
cd ~
wget
https://raw.githubusercontent.com/dankamongmen/sprezzos-
world/master/packaging/elmerfem/debian/ElmerGUI.desktop
sudo mv
~/ElmerGUI.desktop /usr/share/applications/
```

  * 아이콘 그림 파일을 받아서 연결.
  ```
  sudo mkdir /usr/share/ElmerGUI/icons
  cd ~
wget
https://raw.githubusercontent.com/tehnick/elmerfem/master/ElmerGUI/Application/icons/Mesh3D.png
sudo mv ~/Mesh3D.png /usr/share/ElmerGUI/icons
  ```

### Elmer 예제

* CFD : http://dymaxionkim.blogspot.com/2015/06/natural-
convection-cfd-with-elmer.html
* Contact :
http://dymaxionkim.blogspot.com/2015/06/mechanical-contact-analysis-with-
elmer.html
* Elastic in Transient : http://dymaxionkim.blogspot.kr/2015/04/open-
source-cae-toolchain-10-fem-with.html
* Elastic in Impicit Dynamics :
http://dymaxionkim.blogspot.com/2015/06/transient-linear-elastic-with-elmer.html

### Elmer 기타 참고자료

* Using Elmer with other pre- and post processors :
http://www.nic.funet.fi/index/elmer/course/may2010/ElmerWithOtherSoftware_May2010.pdf
* Beyond ElmerGUI :
http://web.csc.fi/english/csc/courses/archive/material/svali2011/0530Mon/BeyondElmerGUI
* Post-processing utilities :
http://www.nic.funet.fi/index/elmer/slides/ElmerCourseWarsaw2014October/ElmerPostProcessing_2014Oct.pdf
* Multi-physics simulations for electrical machine development :
http://www.vtt.fi/inf/julkaisut/muut/2015/VTT-R-04618-15.pdf
* Overview of Elmer
: http://www.arek.pajak.info.pl/wp-content/uploads/2013/09/ElmerOverview.pdf
*
Elmer Parallel Computations :
http://www.nic.funet.fi/index/elmer/course/may2010/Handsout_ElmerParallelComputations.pdf

## 2.3. Z88 Aurora
![](http://z88.de/wp-content/uploads/2014/08/Aurora_R1.png)

### Z88 Aurora?

* http://en.z88.de/
* Linear, Non-Linear, Thermal, Frequency
*
Opimization (Z88Arion)
* 1985~ (30년)간 독일 바이로이트 대학교 프랑크 리그 교수 (Dr.Frank Rieg) 팀이
개발.
* C Code Base
* Z88(Solver), Aurora(GUI for FEA), Arion(GUI for Opt.)

### Z88 Aurora 참고 사항

* 오랫동안 적절한 업그레이드 속도 유지중
* 비교적 안정적임
* UI가 우수한 편
* 멀티바디 해석
불가능 (접촉 등)

### Z88 Aurora 설치

* http://download.z88.de/z88aurora/V3/install_unix_en.pdf
```
cd ~/
wget http://download.z88.de/z88aurora/V3/Z88AuroraV3_en.tar.gz
gunzip
Z88AuroraV3_en.tar.gz
tar -xvf Z88AuroraV3_en.tar
cd Z88AuroraV3
chmod 777 *
cd
bin/ubuntu64 respectively cd bin/suse64
chmod 777 *
```

### Z88Aurora 시작 방법

#### 터미널에서 다음 명령어 입력
```
cd ~/Z88AuroraV3/bin/ubuntu64
./aurorastartv3
```
* 단축아이콘을 만드는 것은 어렵다.
* 실행파일이 불러오는 요소들이 상대경로로 설정되어 있어 일일이
해킹해야 하기 때문.

### Z88 Aurora 사용방법

* 실행파일 : ~/Z88AuroraV3/bin/ubuntu64/aurorastartv3
* 사용자 설명서
: http://download.z88.de/z88aurora/V3/userguide.pdf
* 이론 해설서 :
http://download.z88.de/z88aurora/V3/theoryguide.pdf
* 예제 따라하기 :
http://download.z88.de/z88aurora/V3/examplemanuals.zip
* 예제 파일 :
http://download.z88.de/z88aurora/V3/examples.zip
