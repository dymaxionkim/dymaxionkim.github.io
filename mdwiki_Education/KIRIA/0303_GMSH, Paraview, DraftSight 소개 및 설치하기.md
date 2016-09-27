# 3교시 : GMSH, Paraview, DraftSight 소개 및 설치하기

## 3.1. Gmsh

![](http://perso.ensta-paristech.fr/~kielbasi/images/gmsh.png)

### Gmsh?

* http://geuz.org/gmsh/
* Mesh 생성 툴.
* Open Cascade 및 Netgen 기반.
*
벨기에 [르마클레(Jean-François Remacle)](http://www.uclouvain.be/364863.html) 교수가 개발 (
[개인홈페이지](http://www.scorec.rpi.edu/~remacle/) ).

#### Trophées du Libre 2009 à Soissons en Picardie
[![](https://i.ytimg.com/vi/ofHl_sFORLU/hqdefault.jpg)](https://youtu.be/ofHl_sFORLU)

### Gmsh 장점

* 간단한 2D,3D Mesh를 직접 모델링하는데 적합.
* 외부 라이브러리를 불러다 쓰지 않고, 실행파일 달랑 하나만
있어 포터블함.
* 단순한 형상의 경우에는, 2D에서는 사각형 요소망 생성 가능. (3D에서는 육면체)
* Mesh 모델 생성을 위한 .geo
파일 스키마를 이용해 자동화 하기가 좋음.

### Gmsh 단점

* Multi-Body Mesh 작업에는 적합하지 않음.
* 복잡한 형상의 STEP File Import에는 적합하지
않음.
* UI가 좀 괴상망측함.
* 멀티코어 지원 못함. (Netgen의 문제에서 기인함)

### Gmsh 설치

* 첫번째 방법은 Ubuntu의 기본 저장소에 이미 있는 것을 그냥 설치하는 것이다. 터미널에서 아래의 명령을 주면 끝.
```
sudo apt-get install gmsh
```

* 첫번째 방법의 단점은 조금 뒤쳐진 버전이 설치된다는 것이다. 최신버전을
사용하고 싶다면 직접 다운로드 받는 두번째 방법을 사용하면 된다. 가급적 최신버전을 사용하는 두번째 방법을 추천한다.
```
cd ~
wget
http://geuz.org/gmsh/bin/Linux/gmsh-2.11.0-Linux64.tgz
sudo tar -xzvf gmsh*.tgz
rm gmsh*.tgz
mv gmsh* gmsh
sudo ln -s ~/gmsh/bin/gmsh /usr/bin/gmsh
```

* 그럼 아무
데서나 gmsh 명령을 주면 그 자리에서 실행된다.

### Gmsh 시작하기

#### 방법1 : 터미널에서 다음 명령 입력
```
gmsh
```

#### 방법2 : 실행 아이콘을 수동으로 등록하기
* 다음 명령을 터미널에 입력.
```
cd ~
wget
https://raw.githubusercontent.com/feelpp/debian-gmsh/master/debian/gmsh.desktop
sudo mv ~/gmsh.desktop /usr/share/applications/
```

* 다음 명령으로 데스크탑 파일을 열고...
```
sudo l3afpad /usr/share/applications/gmsh.desktop
```

* 다음 내용으로 대체한 후에 저장하고 완료. (아이콘 그림 파일의 경로를 수정)
```
[Desktop Entry]
Version=1.0
Name=Gmsh Mesh Generator
GenericName=Gmsh
Comment=3-D finite element
mesh generator
Exec=gmsh
Icon=/home/dong/gmsh/share/doc/gmsh/tutorial/image.png
Type=Application
Terminal=false
Categories=Education;Math;Science;
```

### Gmsh 예제

* 튜토리얼 : http://gmsh.info/doc/texinfo/gmsh.html#Tutorial
* 스크린캐스트 :
http://gmsh.info/screencasts/
* Gmsh + OpenFOAM Tutorials :
https://www.youtube.com/channel/UCHXaKLlZRQxkSG6dD6ZWvSg

## 3.2. Paraview

![](http://www.paraview.org/wp-
content/uploads/2016/01/paraview_logo.png)

### ParaView?

* http://www.paraview.org/
* 미 국립 Sandia 연구소 부설 Kitware사에서 개발.
*
Post-Processing 담당.
* 개발 목적
   1. 대용량 과학 데이타의 가시화
   2. 웹 환경에서의 과학 데이타의 가시화

### ParaView 장점

* VTK 기반.
* 상용 소프트웨어보다 오픈소스가 더 우수한 사례.
* 내부적으로 데이타서버 + 렌더링서버 +
클라이언트 부분으로 철저히 구분되어 있음.
* 따라서 실제 물리적으로 분리가 가능하므로, 대규모 연산이 필요한 부분은 서버단에서 처리하고,
최종적인 가시화 부분만 PC에서 처리 가능함.
* 클라이언트 부분은 PC용 어플리케이션 및 웹서버 어플리케이션 중 선택 가능.
* 결국 물리적인
컴퓨팅 자원만 받쳐주면, 다룰 수 있는 데이타의 규모는 무제한.

### ParaView 설치

* 첫번째 방법은 Ubuntu의 기본 저장소에 이미 있는 것을 그냥 설치하는 것이다. 터미널에서 아래의 명령을
주면 끝.
```
sudo apt-get install paraview
```

* 첫번째 방법의 단점은 조금 뒤쳐진 버전이 설치된다는 것이다.
대신 어떤 장소에서도 paraview 명령으로 실행 가능하고, 또 ElmerGUI상에서 지원하는 paraview 메뉴에 의해 연계 실행도 된다는
장점이 있다.

* 최신버전을 사용하고 싶다면, 공식 홈페이지에서 패키지를 직접 다운로드 받아 압축을 풀고 실행시키는 방법을 사용한다.
* 또는
OpenFOAM을 설치할때 함께 설치될 수도 있다.
* 여기서는 일단 첫번째 방법으로 설치했다고 상정.

### ParaView 예제

* 기초데모 : https://youtu.be/Y1RATo2swM8
* 입문(일본) :
http://www.geocities.jp/penguinitis2002/study/OpenFOAM/ParaView/ParaView.html
*
튜토리얼 : http://www.paraview.org/Wiki/The_ParaView_Tutorial
* 튜토리얼(일본어) :
http://www.paraview.org/Wiki/images/a/a2/ParaViewTutorial42-jp.pdf

## 3.3. DraftSight

![](http://www.javelin-tech.com/blog/wp-
content/uploads/2010/10/DraftSight-MasterLogoTM.png)

### DraftSight?

* http://www.3ds.com/ko/products-services/draftsight-cad-
software/
* 오픈소스가 아니고 상업용 2D CAD 소프트웨어.
* 그러나 무료버전도 제공하므로 그것을 사용할 수 있다.
* 무료 버전은
AutoLisp 실행이 불가능한 등 몇가지 제한이 있다.
* 보통 실무에서는 2D CAD는 보조적인 용도로 사용하므로, 실제로는 사용하는데 별
장애가 되지 않는다.
* 최신 DWG 파일을 제대로 지원하고, 리눅스에서도 사용 가능한 유일한 무료 소프트웨어.
* Ubuntu14.04에서
마우스 응답이 느려지는 문제가 있어 좀 불편하다.

### DraftSight 설치

* 설치패키지 다운로드 : http://www.3ds.com/ko/products-
services/draftsight-cad-software/free-download/
* 우분투 버전을 다운로드 받는다.
* 파일매니저에서
더블클릭하고 설치한다. (GDebi 패키지 설치 프로그램이 실행됨)

### DraftSight 예제

* 그냥 AutoCAD 쓰듯이 사용하면 된다.
* 심지어 AutoCAD용 탬플릿, 설정파일들도 그대로
호환된다.


