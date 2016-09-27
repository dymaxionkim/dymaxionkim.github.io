# 4교시 : Salome Meca, OpenFOAM 소개 및 설치하기

## 4.1. Salome Meca
![](http://2.bp.blogspot.com/-we6J-yhsO9E/VNVGKGba3uI/AAAAAAAALb0/V_xtAVFvmVI/s1600/salome-
meca1.png)
![](http://www.code-aster.org/V2/IMG/siteon0.png?1447161666)
![](http://tfel.sourceforge.net/img/SalomeMeca2015.png)

### Salome Meca?

* Salome Platform : Pre,Post-Processor 환경.  오픈소스 중에서 가장 기능이
풍부함.
* Code_aster : 구조해석 솔버.  오픈소스 중에서 가장 강력함.
* Salome-Meca = Salome +
Code_aster
* EDF에서 만든 도구들의 소개 :
http://researchers.edf.com/fichiers/fckeditor/Commun/Innovation/logiciels/posters/BS_OpenSource-
HD.pdf

### Salome-meca 설치

#### 배포판에서 권장하는 설치 방법
* 참고 : http://www.code-
aster.org/spip.php?article303

```
cd ~
wget http://www.code-
aster.org/FICHIERS/SALOME-MECA-2015.2-LGPL-2.tgz
tar xvf SALOME-
MECA-2015.2-LGPL-2.tgz &&./SALOME-MECA-2015.2-LGPL.run
./SALOME-
MECA-2015.2-LGPL.run
```

#### 우분투 APT로 설치하는 방법
* 참고 :
http://installion.co.uk/ubuntu/trusty/autopkgtest/c/code-aster-
gui/install/index.html
* Ubuntu 14.04의 기본 저장소에서 apt-get 명령으로 직접 설치하는 것은 아직 성공해
보지 못했으므로 좋지 않아 보인다.

### Salome-meca 실행

#### 방법1 : 직접 실행 명령을 준다.
```
cd salome_meca/appli_V2015_2
./salome
```

#### 방법2 : 자동으로 등록된 실행 아이콘으로 실행하면 된다.

* 다음 경로에 데스크탑 파일이 있고, 데스크탑 메뉴에 이미 등록되어
있다.
```
/home/dong/salome_meca/V2015_2/salome_meca_V2015_2.desktop
```

### Code_aster 활용 사례

* Salome-meca 도입기 (일본) : http://salome-meca.cocolog-
nifty.com/
* Code_aster 기반 엔지니어링 서비스 사업 (독일) : http://www.code-aster.de/

## 4.2. OpenFOAM

![](http://www.simularia.it/common/modelli/openfoam_logo.png)

### OpenFOAM?

* http://openfoam.org/
* 범용 유체동역학 해석 플랫폼.
* C++로 개발.  객체지향적 아키텍쳐로
기존의 Fortran 기반 솔버들과는 사용개념에 차이가 있음.
* 비교적 손쉽게 커스텀 솔버 지배방정식을 적용할 수 있으므로 학계에서 관심이
많은 편.

### OpenFOAM 사용 감각

* 자체 GUI는 없으므로, 외부 소프트웨어와 연계하여 사용하거나 별도 GUI 수트 프로그램을 설치.
*
실무 설계자가 유체역학 이론을 연구할 일은 없으므로, 기본 제공되는 솔버 프레임웤을 그대로 이용하여 사용하는 방식이 좋음.
* 실무에서의 해석
생산성을 위하여, 몇가지 레시피를 정해두고 기계적으로 작업하는 방식을 권장.
* 좀 더 심도깊게 다루기 위해서는 1~2년 정도의 연구 기간을
두고 끈기있게 접근.

### OpenFOAM 설치

* http://openfoam.org/version/3-0-1/
```
sudo add-apt-
repository http://www.openfoam.org/download/ubuntu
sudo apt-get update
sudo apt-
get install openfoam30 paraviewopenfoam44
```

### OpenFOAM 입문

* 일본 자료 번역본 있는 개인 사이트 : http://kickflipin.github.io/

### OpenFOAM 사례

* 현대중공업 선박연구소 : http://www.oss.kr/oss_repository10/73709
* 한국
사용자 커뮤니티 : http://okuc.snu.ac.kr/
* 경원이엔씨 : http://www.kwenc.kr/
* 넥스트폼 :
http://www.nextfoam.co.kr/
* 넥스트이엔에스 : http://www.nens.co.kr/
*
[공개소스코드(OpenFOAM)를 이용한 국부 열유동 해석기술
개발](https://www.google.co.kr/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&cad=rja&uact=8&ved=0ahUKEwigtYOiyZHNAhUleaYKHUgcDOUQFgghMAA&url=http%3A%2F%2Fwww.kins.re.kr%2Fjsp%2Ffiledown.jsp%3FfileNm%3D%25EB%25B3%25B4%25EA%25B3%25A0%25EC%2584%259CHR1274.pdf%26edmsFileId%3D1367979787000000240&usg=AFQjCNENKAqPmvRnHozVa1snmMQjRqNevw&sig2=STHjpm6cwMlbzB2KABYnCA)

### OpenFOAM GUI

* https://www.simscale.com/
*
https://sourceforge.net/projects/baramonweb/
*
https://openfoamwiki.net/index.php/GUI

### HelyX-OS

* http://engys.github.io/HELYX-OS/
* 예시 :
https://youtu.be/Ae3buNuHZPQ

![](http://engys.com/products/helyx-
os-v231-meshtab.png)

### Baram

*
http://nextfoam.co.kr/sub/data1_view.php?board_code=reference2&idx=277
* 설명서 :
http://nextfoam.co.kr/lib/download.php?idx=135127&sid=dd8fb94101beb1aab796d1365b294b64
![](http://nextfoam.co.kr/upload/board/baramimage.png)
