# 2교시 : Scilab, GNU Octave, Scientific Python, Julia를 설치해서 간단히 사용해 보기

## 2.1. Scilab

![](http://cermics.enpc.fr/scilab_new/images/scilab_logo.gif)

### Scilab?

* http://www.scilab.org/scilab/about

### Scilab 설치

* Direct Download : http://www.scilab.org/download/latest
* APT
Install
```
sudo apt-get install scilab
```

### Scilab 실행

* 터미널에서 직접 명령 입력
```
scilab &
```

* OpenBox 메뉴에서 실행

>
Applications - 기타 - Scilab

### Scilab으로 타원형 그려보기

```python
a = 20;
b = 10;
theta = linspace(0,2*%pi,100);  // Scilab에서는 상수 pi를 %pi로 쓴다.

x = a*cos(theta);
y = b*sin(theta);

plot(x,y)
```

## 2.2. GNU Octave

![](https://www.gnu.org/software/octave/images//logo.png)

### GNU Octave?

* https://www.gnu.org/software/octave/

### GNU Octave 설치

* 최신 버전을 받기 위해 전용 저장소를 등록한 후에 설치.
```
sudo add-apt-repository
ppa:octave/stable
sudo apt-get update
sudo apt-get install octave
```

### GNU Octave 실행

* 터미널에서 직접 명령 입력
```
octave &
```

* OpenBox 메뉴에서 실행

>
Applications - 교육 - GNU Octave

### GNU Octave로 타원형 그려보기

```python
a = 20;
b = 10;
theta = linspace(0,2*pi,100);  # Jila Code와 완전히 같다.

x = a*cos(theta);
y = b*sin(theta);

plot(x,y)
```

## 2.3. Scientific Python

![](http://gracca.github.io/images/python-scipy.png)

### Python?

* https://www.python.org/

### Scientific Python?

* https://www.scipy.org/
![](http://image.slidesharecdn.com/efyzsva1r3p02eye5kaa-
signature-720d0ff5c16f9bab08252a49744ebb240fc18074dbcdd2bf87345a5cc83826c8-poli-150731173656-lva1-app6892/95/new-
capabilities-in-the-pydata-ecosystem-4-638.jpg?cb=1438963623)

### Scientific Python 설치

#### pip 설치

* pip = Python 전용 패키지 관리자.  APT와 사용법이 비슷.

```
sudo apt-get install
python-pip
```

#### 설치된 pip 패키지를 최신 버전으로 업그레이드

```
sudo pip install --upgrade pip
sudo pip
install --upgrade distribute
```

#### pip를 도와주는 도구 패키지도 설치

```
sudo pip install pip-tools
```

#### pip 파이썬 패키지 관리자 구성 완료!

* 이제 pip를 가지고 Python 스택을 하나씩 쌓아올려간다.

#### sympy 설치

* 기호(Symbolic) 연산이 가능하도록 해 주는 도구.

```
sudo pip install sympy
```

#### nose 설치

* Python 스크립트를 테스트(NoseTest라고 지칭함)하기 편리하도록 만든 패키지.  이걸 직접 사용할 일은
없으나, 다른 패키지가 의존하기 때문에 미리 설치해 둠.

```
sudo pip install nose
```

#### sphinx 설치

* 사람이 작성한 .rst 확장자로 된 '구조화된 텍스트파일'을 읽어서 자동적으로 깔끔한 웹 도큐먼트로 만들어주는
변환기.

```
sudo pip install sphinx
```

#### pygments 설치

* 신텍스 하일라이터(Syntex highlighter). 즉 프로그램 소스코드를 읽어서 예쁘게 색깔을 입혀줘서
가독성을 높여주는 툴.

```
sudo pip install pygments
```

#### tornado 설치

* Python으로 만들어진 웹 프레임웤. 간단히말해 이걸로 웹서버를 만들수 있고, 다른 Python 계열
웹서비스의 근간이 되는 기반.

```
sudo pip install tornado
```

#### jinja2 설치

* 템플릿 엔진. 간단히 말해 Python 소스코드에 자동으로 여러가지 태그를 붙여서 html로 보기 좋도록
만들어주는 기능.

```
sudo pip install jinja2
```

#### python-dev 설치

* Python 개발자용 라이브러리.

```
sudo apt-get install python-dev
```

#### 포트란 계산 라이브러리들 설치

* Python은 속도가 느리기 때문에, 해석할 때 사용하는 계산용 라이브러리들은 포트란으로 만든
것들을 가져다가 쓰게 됨.

```
sudo apt-get install libblas-dev libatlas-base-dev
liblapack-dev gfortran
```

> BLAS : Basic Linear Algebra Subprograms

> ATLAS :
Automatically Tuned Linear Algebra Software

> LAPACK : Linear Algebra PACKage
> gfortran : https://en.wikipedia.org/wiki/GNU_Fortran

#### numpy 및 scipy 설치

* http://www.numpy.org/

```
sudo pip install numpy scipy
```

#### matplotlib 설치

* Python을 마치 Matlab처럼 사용하는 기분(?)이 나도록 해 주는 플랏팅 도구..
* 의존하는
관련 라이브러리들을 먼저 설치해 준 후에 순차적으로 설치.

```
sudo apt-get install libpng-dev
libfreetype6-dev libjpeg8-dev pkg-config
sudo pip install matplotlib
```

#### readline 설치

* Python 인터프리터가 소스코드 파일을 읽어들일 때 읽고 쓴 내역(history)을 기록하고 행수를
정의하는 등의 기능.

```
sudo apt-get install libncurses5-dev
sudo pip install readline
```

#### pandas 설치

* 자료를 테이블처럼 만들어서(DataFrame) 다루기 좋도록 해주는 도구.
* 요즘 유행하는
빅데이터,데이터마이닝,데이터과학 분야에서 많이 이용.

```
sudo pip install pandas
```

#### pyzmq 설치

* zeromq를 Python에서 쓸 수 있도록 엮어준(binding) 것.
* zeromq(=ØMQ)는
libzmq라는 이름의 패키지로 되어 있음.
* 경량/고속으로 컴퓨터 시스템 내부에서 동작하는 메시징 도구.
* 소프트웨어 개발할 때 각
기능별로 모듈화해서 따로 만든 다음 각각의 모듈들 사이를 메시지로 연결해주면 버그 가능성을 줄일수 있고 개발효율이 좋아진다 뭐 이런 생각을
실현해 주는 하나의 수단.

```
sudo pip install pyzmq
```

## 2.4. Julia

![](http://docs.julialang.org/en/release-0.3/_static/julia-
logo.svg)

### Julia?

* http://julialang.org/
* 최신기술이 대거 적용된 신형 과학기술용 스크립트 언어
* 슈퍼컴퓨터급에서
돌아가는 대규모 프로그래밍에 적합
* 개인용 PC에서 돌아가는 소규모 프로그래밍에도 적합

### Julia 특징

* 매우 쉬운 문법 : MATLAB 코드를 거의 건드리지 않고도 그대로 실행됨
* JIT (Just in Time)
Compile : 실행 속도가 엄청나게 빠름
* LLVM 컴파일러 적용 : GCC보다 더 최신형
* 자체 패키지 매니저 보유 : 라이브러리들의
버전 관리가 간편함
* 최신 프로그래밍 패러다임 대거 적용 : 동적 타입 시스템, 함수형 언어 특성 등등
* 모든 Python 라이브러리를 그냥
가져다 쓸 수 있음
* 별도의 조치 없이 C로 구현된 함수를 그냥 불러올 수 있음
* 병렬연산, 분산 컴퓨팅에 적합하도록 처음부터 개발됨
*
변수 타입을 알아서 인식하는 능력이 뛰어남 : 편하다!
* 처음부터 유니코드 지원 : 변수,함수 명칭을 한글이나 특수한 문자를 사용해도 다 됨
* 오픈소스 : MIT 라이센스

### Julia 단점

* 너무 젊은 언어이기 때문에, 자체 라이브러리가 아직 좀 부실함
* 한국내 사용자가 별로 없음 :
https://www.facebook.com/groups/juliakorea

### Julia 설치

```
sudo add-apt-repository ppa:staticfloat/juliareleases
sudo
add-apt-repository ppa:staticfloat/julia-deps
sudo apt-get update
sudo apt-get
install julia
```

### Julia 최초 실행

* 터미널 명령으로,
```
julia
```

### Julia 기본적인 패키지 추가 설치해 주기

* Julia 콘솔 내에서,

```
Pkg.init()
Pkg.add("Jewel")
Pkg.add("Images")
Pkg.add("PyPlot")
Pkg.update()
quit()
```

### 아까 봤던 타원형 작도를 직접 해 보자!

```python
using PyPlot

a = 20;
b = 10;
theta = linspace(0,2*pi,100);

x = a*cos(theta);
y = b*sin(theta);

plot(x,y)
```
