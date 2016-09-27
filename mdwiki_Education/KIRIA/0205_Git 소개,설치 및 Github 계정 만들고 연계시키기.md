# 5교시 : Git 소개,설치 및 Github 계정 만들고 연계시키기

## 5.1. Git

![](https://git-scm.com/images/logo@2x.png)

### Git?

* [깃] : '재수 없는 놈' (네이버 어학사전)
* 분산형 형상관리 시스템 (Distributed Version
Control System)
* 간편안내서 : https://rogerdudler.github.io/git-guide/index.ko.html

### Git의 특징

* 가지치기(Branch), 다시 합치기(Merge) : 대규모, 커뮤니티 기반 프로젝트에서는 필수
* 가볍다 : 용량도
작고 엄청나게 빠르다.
* 분산형(Distributed) : 중앙 서버가 있긴 하지만, 중앙 서버에 전적으로 의존할 필요가 없다. 바이러스
같다고 보면 된다.
* 안정성(Data Assurance) : 철저하게 데이타의 무결성을 자동 검증한다.
* 단계적 절차 (Add,
Commit, Push) : 분산형 관리에 필수적인 기능.
* FOSS 라이센스.

> git에는 많은 기능과 전문적인 운용 방법이 있으나, 다
생략하고 가장 간단한 절차만 익혀서 쓰자.

### Git 설치

* Git은 기본적으로 터미널 명령으로 동작하는 프로그램이다.
* 우리는 Git 서버는 따로 만들지 않고, Github
서비스를 서버로 삼아서 사용할 것이다.
* 따라서 클라이언트 프로그램만 설치한다.
```
sudo apt-get install git
```

### Git 저장소 셋팅

* 내 PC에 디렉토리를 하나 만들고, 그곳을 저장소로 삼는다.
* 만든 디렉토리를 저장소로 삼기 위해 Git에
등록해 주는 절차를 밟는다.
```
mkdir ~/github
cd ~/github
git init
git config --global
user.email 구글이메일주소
git config --global user.name 내PC계정명
```

### 터미널 명령으로 Git을 사용하기가 너무 불편하면...

* GUI 형태로 쉽게 쓸 수 있는 git 클라이언트 소프트웨어들 중에 쓸만한
것을 골라서 설치.

> http://www.instantlift.kr/l/764553

* 여기서는 [Git-
cola](http://www.instantlift.kr/l/764553)를 선택해서 설치해 보자.
```
sudo apt-get install
git-cola
```

* 사실 설치하지 않고 터미널 명령으로 하는 것이 더 나을 수 있다.
* GUI 프로그램 보다는 그냥 Github에서
제공해주는 웹 서비스로 상황을 보는게 더 간단하기 때문이다.

## 5.2. Github

![](https://assets-
cdn.github.com/images/modules/logos_page/Octocat.png)

### Github 가입

* https://github.com
* Username, Email, Password 설정 필요
* 가급적
Username과 Email ID를 일치시킨다.
* Email은 가급적 Google Gmail 계정을 사용한다.

### Github에서 다른 사람들의 저장소 살펴보기

* 검색으로 키워드를 줘서 찾아볼 수 있다.
* `julia example` 검색어로
해서 나오는 저장소 중에서 다음으로 들어가 보자.
```
https://github.com/DataWookie/MonthOfJulia
```
*
Julia 언어를 1개월 일정으로 하루씩 따라해 보면서 익힐 수 있는 교재가 정리되어 있다.
* 연습삼아 이것을 Clone해서 나의 저장소로
가져와 보자.

### Clone

* Github MonthOfJulia 저장소 페이지에서 `Clone or download` 버튼을 누르고 HTTPS 주소를
복사한다.
```
https://github.com/DataWookie/MonthOfJulia.git
```

* 이제 터미널에서 다음 명령을
친다.
```
cd ~/github
git clone https://github.com/DataWookie/MonthOfJulia.git
```
* 그러면 자동으로 폴더가 생기면서 내 컴퓨터로 복제가 된다.

### Development

* 이제 복제된 곳에서 원하는 수단으로 문서,코드 등을 수정한다.
* 새로운 파일을 추가하거나, 기존에 있는
파일을 삭제하는 등의 작업도 무방하다.

### Commit

* 이제 수정이 다 되었으면, 수정된 사실을 Git에 알려주어야 한다.
* 이 과정을 커밋(Commit)이라고 부른다.
*
커밋 하기 전에 우선 변경 사항을 먼저 준비시켜 두는데 이것을 Add라고 한다.
```
git add --all
git commit -m
'최초로 수정했습니다!'
```

### Push

* 커밋이 잘 되었으면, 이것을 이제 Github의 내 저장소로 밀어넣는다(Push).
```
git push -u
origin master
```
* 명령을 치면, Email 및 Password를 차례대로 입력해 준다.
* 패스워드를 넣는 과정을 생략할 수
있도록 추가 설정해 주는 방법도 있기는 하지만, 인증 환경을 만들어주는 것이 좀 어렵고 또 보안상 매번 해 주는 것이 좋을 수도 있다.
*
Push가 잘 되는지 확인한다.
* 웹브라우저에서 Github의 내 저장소로 들어가서 수정사항이 반영되어 업로드 잘 되었는지 확인해 보자.

### Pull

* Github 사이트에서 웹으로 내용을 직접 수정할 수도 있고, 또는 지금 사용하는 컴퓨터가 아닌 다른 컴퓨터에서 따로
Clone 해서 수정을 해서 Commit/Push해서 Github로 올리는 상황이 있을 수 있다.
* 이 경우에는 아직 내 컴퓨터에는 수정사항이
반영되어 있지 않으므로, 그것을 땡겨올(Pull) 필요가 있다.
```
git pull
```

### 요약

* 내 컴퓨터에서 저장소 내용을 업데이트 한 후에는, 무조건 습관적으로 다음 과정을 암기해서 반복적으로 사용하자.
```
git
pull
git add --all
git commit -m '수정내용요약'
git push -u origin master
```

### 힌트

* 사실 Git과 같은 소프트웨어 형상관리나, 구조설계자들이 PDM 시스템을 통해 사용하는 도면 형상관리나 개념적으로 다를 것이
없다.
* 다만 구현방법이나, 세부 기능들에 차이가 있을 뿐이다.
* PDM을 이용해서 설계데이타 형상관리를 할 때 수행되는 과정을 생각해 보면
별로 어려운 개념이 아니라는 것을 알 수 있다.

* 다만 아직까지는 구조설계데이타를 위한 PDM/PLM 솔루션은 모두 서버에 모든 데이타를 집중해서 저장하고 관리하는 중앙집중형 시스템만
존재한다.
* Git 처럼 로컬 컴퓨터에 해당 프로젝트의 모든 것을 싹 다 Pull-Commit-Push 해 주는 시스템은 없다.
* 개념적으로
Git 같은 분산형 형상관리 시스템으로 PDM/PLM을 개발하면 어떤가 하는 시도가 연구 차원에서 시도되는 곳이 나타나기 시작하는 단계이다.
*
좋은 예로, FreeCAD를 위한 형상관리 시스템이 오픈소스 커뮤니티에서 연구중에 있는데, 개발 목적은 요즘 유행하는 3D Printer를 위한
설계데이타들을 오픈소스 커뮤니티 차원에서 제공하고자 하는데 있다.
* 오픈소스 커뮤니티 특성상, 많은 예산을 고정적으로 빨아먹는 대규모 서버를
안정적으로 유지할 수 없기 때문에, 분산형으로 개발해서 게릴라식으로 관리해 보자는 전략인 듯 하다.

## 5.3. 연습

### 본 강의자료를 Fork 하기

```
https://github.com/dymaxionkim/KIRIA_Education
```
*
이곳에 가서 저장소를 확인하고, Github 웹사이트 안에서 자신의 저장소로 포크(Fork)해 본다. (Fork 버튼을 누르면 됨)
*
Fork는 '포크로 꼭 찝어서 빵을 가져간다'는 그림을 연상하면 될 듯.
* 오픈소스 생태계에서는 남의 프로젝트를 Fork 해 와서 자기가
개작하는 경우가 많다.
* 내가 Fork해 와서 개작한 후에, 꽤 좋다 싶으면 원래 프로젝트 관리자에게 병합(Merge)을 요청하면, 관리자가
검토 후에 원래의 본 프로젝트에 병합해 주는 방식으로 업데이트 되어 가는 식이다.

### Fork해서 가져온 강의자료를 내 PC로 Clone 해 오기

* 이제 Fork한 내 저장소로 가서, 앞에서 해 본 과정 그대로
Clone을 한다.

### Clone한 강의자료를 Jupyter Notebook으로 열어보기

* 자기 PC에서 Jupyter Notebook을 실행시키고 금방
Clone한 강의자료를 열어보자.

### 내용수정해 보기

* 적당히 내용을 수정하고 저장해 본다.

### 수정된 내용을 Github에 Push 해서 반영하기

* 역시 Push 과정을 그대로 해서 수행한다.

### 더 배울 필요 없다!

* 이제 내 PC에서 작업한 Jupyter Notebook의 자료들을, Git을 이용하여 Github에
Push해서 형상관리가 가능해 졌다.
* Github에 자료 원본이 존재하므로, 내 PC가 갑자기 고장나도 걱정이 없다.
* 또한 Github를
중심으로 웹을 통해 자료를 공유하는 것이 매우 쉬워졌다.  주소만 전달하면 된다.
