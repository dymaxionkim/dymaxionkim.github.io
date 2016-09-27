# 5교시 : FreeCAD로 부품 모델링하고 간단하게 구조해석 해 보기

## 5.1. FreeCAD 파악

### FreeCAD의 능력

* 기본적인 Part 모델링은 문제가 없다. (전형적인 Sketch-Extrude 작업 형태)
* STEP 파일
형상을 읽어들이는 능력은 상당히 좋다.  다만 다단계 어셈블리 스트럭쳐는 제대로 해석하지 못하여, 전부 1단계 어셈블리 구조로 만들어 버린다.
* Macro 기능이 강력하다.  자체 Python 스크립트를 이용하여 다양한 Macro를 손쉽게 만들어낼 수 있다.  또 GUI 없이 커맨드
상태에서 Macro 실행이 가능하기 때문에, FreeCAD를 백엔드로 삼은 서비스 개발에 유리하다.
* 어셈블리 기능이 아직 미약하다.
어셈블리 조립을 하려면 추가 애드온을 설치해야 하고, 아직 충분히 완성도가 올라간 상태는 아니다.
* Calculix-ccx 및 Netgen이
기본으로 설정되어 있어 곧바로 간단한 FEM은 가능하다.  다만 아직은 기본적인 기능만 구현되어 있다.
* 2D 도면 그리기 기능도 아직
미약하다.  실무에서 사용할 수 있는 수준은 아니다.

### FreeCAD의 활용

* 주력 모델러로 사용하는데는 아직 부족하므로, 보조적인 용도로 사용 가능하다.
* STEP 파일을 중심으로 한
읽기, 쓰기 기능으로 파일교환 매개 용도로 사용 가능하다.
* 해석 용도의 간단한 솔리드 모델러로 사용하기에 좋다.
* 하드웨어 요구 사양이
낮은 편이기 때문에, 가볍게 3D 솔리드 모델을 읽어들이기에 좋다.

### FreeCAD의 기능 확장

* 애드온 설치 및 매크로 설치의 2가지 방법으로 확장 가능하다.
* 여러가지 매크로를 묶어서 한꺼번에
설치할 수 있도록 제공 : https://github.com/FreeCAD/FreeCAD-addons
* 어셈블리 기능 애드온 :
https://github.com/hamish2014/FreeCAD_assembly2
* 기타 추천 :
http://www.freecadweb.org/wiki/?title=Download#Ubuntu_PPA_packages

### FreeCAD 전망

* 개발 로드맵 :
http://www.freecadweb.org/wiki/index.php?title=Development_roadmap
* 오픈소스 3D CAD
중에서 가장 완성도가 높고, 발전 속도가 빠르고, 커뮤니티가 안정적임.
* 따라서 오랜 기간동안 꾸준히 발전하여 수 년 정도에 걸쳐 괄목할
만하게 활용도가 올라갈 것으로 예상됨.
* 교육용, 개인용, 과학연구용 등의 틈새 사용처가 많기 때문에 프로젝트가 갑자기 죽을 확률은 낮음.
*
한국에서는 활발하지 못함.
* 그러나 3D프린터와 연계된 STEAM교육 등 저예산-합법성 조건에서 유일하게 조건을 충족 가능한 솔루션이기 때문에
전망이 밝다고 볼 수 있음.
* 한국 학교에서는 CAD 업체들이 한시적으로 무료 배포한 시험판 등을 사용하는 것이 현재 주류이나, CAD
사용처가 초중등 수준까지 내려갈 경우에는 FreeCAD를 채택하게 될 것임.

## 5.2. 예제

* http://dymaxionkim.blogspot.kr/2015/05/open-source-cae-
toolchain-14-fem-with.html
* 결과 동영상 : https://youtu.be/Iq7eq4UJdyE

## 5.3. FreeCAD로 부품 모델링

![](http://3.bp.blogspot.com/-Dc47vJ-
Kjkk/VVDXnABAUlI/AAAAAAAAb_Q/5lYxm93ncZc/s1600/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7%2C%2B2015-05-12%2B00%3A26%3A07.png)

## 5.4. FreeCAD FEM

![](http://2.bp.blogspot.com/-4V3Iw-
bTGGo/VVDXnfp3VrI/AAAAAAAAb_U/Hv_x0kmN54c/s1600/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7%2C%2B2015-05-12%2B00%3A28%3A18.png)
* 원하는 솔리드가 연두색으로 빛나도록(?) 선택된 상태가 되도록 해 준다.
* 선택된 솔리드에 대한 해석 케이스를 새로 생성.
* "A"자
모양의 아이콘을 눌러주거나 또는 메뉴에서  FEM > New Mechanical Analysis 을 선택.

![](http://4.bp.blogspot.com/-XMPT6PHHxgc/VVDXmy-
kjJI/AAAAAAAAb_Y/Ow0EZAkm0J4/s1600/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7%2C%2B2015-05-12%2B00%3A28%3A47.png)
* 솔리드가 사라진 이유는, 해당 솔리드의 Visability가 False로 자동 변경되기 때문이다.
* 컴퓨터의 낮은 사양을 고려하여 매쉬가
약간 성글게 형성되도록  Fineness를 Moderate로 놔 둔다.

![](http://2.bp.blogspot.com/-1SqaDg6-bGE/VVDXotWT3PI/AAAAAAAAb_g/xbwTbnmBYG8/s1600/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7%2C%2B2015-05-12%2B00%3A29%3A04.png)
* Mesh 생성 완료.

![](http://1.bp.blogspot.com/-SriF1RYQhHQ/VVDXpCCewmI/AAAAAAAAb_k/AWQ7_V7iZig/s1600/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7%2C%2B2015-05-12%2B00%3A29%3A42.png)
* 노란 공 모양 아이콘으로 재질 선택.

![](http://4.bp.blogspot.com/-tYVHDFl3144/VVDXpm0cyvI/AAAAAAAAb_o/ehmwVH5FQK0/s1600/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7%2C%2B2015-05-12%2B00%3A30%3A23.png)
* 바운더리 컨디션 설정을 위해 Geometry가 보이도록 설정.

![](http://4.bp.blogspot.com/-_TUu3CXWi-4/VVDYJFfI4SI/AAAAAAAAcBU/_xAp4r1jW-g/s1600/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7%2C%2B2015-05-12%2B00%3A30%3A55.png)
* 매쉬는 안 보이도록 설정.

![](http://3.bp.blogspot.com/-fCpXEvL-
RTQ/VVDXqqh0zHI/AAAAAAAAb_0/Axw4F42M2V8/s1600/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7%2C%2B2015-05-12%2B00%3A31%3A16.png)
* Fixed Surface 설정.

![](http://4.bp.blogspot.com/-lum01q-mAIQ/VVDXrJjn-
DI/AAAAAAAAb_4/o8J0mqtHVKo/s1600/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7%2C%2B2015-05-12%2B00%3A32%3A10.png)
* Forced Surface 설정.

![](http://3.bp.blogspot.com/-_MfWA9Die4k/VVDXsUn0sGI/AAAAAAAAcAE/qR7URWYW0vQ/s1600/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7%2C%2B2015-05-12%2B00%3A33%3A18.png)
* 이제 솔버를 시작하기 위해 위 그림에서 표시한 아이콘을 누르면, 솔버 툴이 나타난다.
* 맨 처음 버튼인 Write Caculix Input
File을 누른다.
* 그러면 혼자 꿍얼꿍얼 하면서 잠깐 작업을 한다.

![](http://3.bp.blogspot.com/-DfqHwesbqJQ/VVDXs-6xQAI/AAAAAAAAcAI/hm-y5NJ4LxQ/s1600/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7%2C%2B2015-05-12%2B00%3A33%3A56.png)
* 무슨일을 했는지 확인하기 위해 그 밑의 버튼을 누르면, 탐색기가 뜨면서 만들어진 *.inp 파일이 나온다.  칼큘릭스 솔버 인풋 파일이다.

![](http://2.bp.blogspot.com/-j9cuQzxYwOE/VVDXuFrDSPI/AAAAAAAAcAY/2ReNU8ry2JM/s1600/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7%2C%2B2015-05-12%2B00%3A34%3A26.png)
* inp 파일이 보여지는 예.

![](http://4.bp.blogspot.com/-5_e6WFxtUc0/VVDXuvjO1kI/AAAAAAAAcAc/wssxZH6virk/s1600/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7%2C%2B2015-05-12%2B00%3A34%3A56.png)
* CalculX 솔버 구동.

![](http://2.bp.blogspot.com/-mKjCe4R_sNo/VVDXwHU8P9I/AAAAAAAAcAk/6UHBSTEtWE4/s1600/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7%2C%2B2015-05-12%2B00%3A35%3A06.png)
* 결과의 가시화.

![](http://2.bp.blogspot.com/-RhCZTQ2c8Mc/VVDXwtUh50I/AAAAAAAAcAo/yi0yrOWAOZY/s1600/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7%2C%2B2015-05-12%2B00%3A35%3A27.png)
* 응력 분포 확인 선택.

![](http://4.bp.blogspot.com/-NvfIQ1qBzx0/VVDXxxge1dI/AAAAAAAAcA8/lkS2wZL-w6I/s1600/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7%2C%2B2015-05-12%2B00%3A35%3A50.png)
* Mesh가 보이도록 설정.

![](http://2.bp.blogspot.com/-KbcaAv8rYmY/VVDXyfctmOI/AAAAAAAAcBA/XXtzcgAUZXM/s1600/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7%2C%2B2015-05-12%2B00%3A36%3A38.png)
* Solid Geometry와 겹쳐서 확인.

![](http://2.bp.blogspot.com/-2tjCv0_PRtA/VVDX0OqrycI/AAAAAAAAcBM/iswoJBgPIMA/s1600/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7%2C%2B2015-05-12%2B00%3A36%3A57.png)
* 보기 상태 손보기.
