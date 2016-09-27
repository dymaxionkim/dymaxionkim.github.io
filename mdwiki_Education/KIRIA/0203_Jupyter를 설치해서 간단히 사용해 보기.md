# 3교시 : Jupyter를 설치해서 간단히 사용해 보기

## 3.1. Jupyter?

![](http://jupyter.org/assets/main-logo.svg)

### Jupyter 개념

* http://jupyter.org/
* Interactive IDE의 일종.
* REPL (Read-
Evaluation-Print Loop)의 실현.
* Code와 Document를 한꺼번에 담아서 프로그램 실행도 되는 문서가 되도록 하자.
*
웹서버 형태로 구현됨.

### Jupyter의 야망

* 죽은 문서가 아니라, 코드를 실행시킬 수 있는 살아있는 신개념 문서. (Active Essay)
* 전 세계의
학술논문을 전부 이걸로 쓰도록 하자!

### Jupyter 소개자료

* http://scisoftdays.org/pdf/2016_slides/perez.pdf
*
http://blog.nacyot.com/presentations/rorlab_jupyter/

### Jupyter로 작업을 하면...

* 작업한 흔적 그대로 훌륭한 문서가 된다.
* 일일 연구노트 역할도 할 수 있다.
* 그대로 출판도
된다.
* 그대로 프리젠테이션도 된다.
* 그대로 웹페이지도 된다.
* 안에 들어있는 코드는 그대로 실행할 수 있다.
* 다른 포멧으로 변환도
된다.

### Jupyter Demo

* https://try.jupyter.org/
* https://juliabox.org/
*
https://hub.docker.com/r/jupyter/demo/

## 3.2. Jupyter 설치

### Jupyter 설치

* 터미널 명령

```
sudo pip install jupyter
```

### Jupyter 실행 확인

* 터미널 명령
```
jupyter notebook
```

### Jupyter Notebook 서비스 종료

* Jupyter Notebook을 실행시킨 터미널에서, `Ctrl+c` 단축키를 누르고
`y`를 쳐 준다.

## 3.3. Jupyter 추가 커널 설치

### Jupyter Kernel?

* Jupyter 환경에 여러가지 언어를 연결해서 사용하도록 할 수 있다.
* 연결해 주는 역할을 하는
패키지를 Jupyter Kernel이라고 부른다.
* 현재까지 가능한 언어들의 커널 목록 :
https://github.com/ipython/ipython/wiki/IPython-kernels-for-other-languages

### Python3 커널 추가

* 현재의 리눅스 시스템의 기본 Python은 버전 2.7이다.
* Python 버전 3과는 상호 호환이 되지
않으므로, 마치 별개의 언어인 것 처럼 따로 커널을 설치해서 사용하는 것이 좋다.
* 우선 Python3 패키지 관리자를 설치하고 나서, 이것을
이용하여 Python3 커널을 설치해 준다.
```
sudo apt-get install python3-pip
sudo pip3 install
ipykernel
```

* Jupyter를 다중커널로 운용하기 위해, 커널 설정을 명시적으로 만들어 준다. 이를 위해 다음 명령을 쳐 준다.
```
sudo jupyter kernelspec install-self
```

* 그러면, 다음과 같은 식으로 메시지가 나오는 것을 확인할
수 있다. 즉 생성된 커널 설정 정보들이 어디에 있는지 위치를 파악 하는 것이다.
```
[InstallNativeKernelSpec]
Installed kernelspec python2 in /usr/local/share/jupyter/kernels/python2
```

*
실제로 `/usr/local/share/jupyter/kernels` 디렉토리로 가 보면, `python2` 디렉토리 하나만 있다. 현재 커널이
이거 하나밖에 없다는 의미. 그럼 여기에 python3 커널도 만들어 추가해 본다. 일단 아래의 명령을 쳐서 설정을 복사해 준다.
```
sudo cp -r /usr/local/share/jupyter/kernels/python2
/usr/local/share/jupyter/kernels/python3
```

* 그리고, 설정 파일을 편집기로 수정해 준다.

```
sudo l3afpad /usr/local/share/jupyter/kernels/python3/kernel.json
```

* 위 명령을 준
다음에 뜨는 편집기 내용을 전부 삭제하고 아래의 내용으로 대체한다.
```
{
"display_name": "Python 3",
"language": "python",
"argv": [
"/usr/bin/python3",
"-m",
"ipykernel",
"-f",
"{connection_file}"
]
}
```

* 이제 커널이 python2 및 python3 모두 인식되는지 확인해 본다. 아래의 명령을
쳐 넣고 나오는 목록을 보면 된다.
```
jupyter kernelspec list
```

* Python3 커널이 잘 Notebook에서도
잘 뜨는지 확인해 본다.
```
jupyter notebook
```

* 이제 여기서 python3 커널을 선택해서 되는지 확인.

* 이제
우리는 python2 및 python3로 2개의 커널을 마음대로 쓸 수 있게 되었다.

### Julia 커널 추가

* Python3 커널을 추가하는 것은 수동으로 좀 복잡하게 했지만, Julia의 경우는 `IJulia` 패키지만
설치하면 자동으로 잡히도록 편하게 되어 있다.
* 설치하기 전에, 커널이 설치되는 디렉토리의 소유권 및 퍼미션(권한)을 풀어줄 필요가 있다.
```
sudo chown -R dong:dong /home/dong/.local/share/jupyter
sudo chmod -R 777
/home/dong/.local/share/jupyter
```
* 그리고 터미널에서,
```
julia
```
* 를 쳐서 Julia를 실행한
후에, 패키지를 설치한다.
```
Pkg.add("IJulia")
```
* 이제 Jupyter Notebook을 다시 실행해서 커널이 잘
뜨는지 확인한다.
```
jupyter notebook
```

### GNU Octave 커널 추가

* Octave는 이미 시스템에 설치되어 있는 상태이다.
* 여기에 Octave 커널을 추가 설치해서
셋팅해 주면 된다.
* Octave 커널은 Python 패키지로 만들어져 있으므로 아래와 같이 명령을 줘서 설치한다.
```
sudo pip
install octave_kernel
```

* Octave 커널이 다 설치되었으면, 다음과 같이 실행해서, Jupyter에 연결시켜 준다.
```
python -m octave_kernel.install
```

### Scilab 커널 추가

* Scilab은 이미 시스템에 설치되어 있는 상태이다.
* 여기에 Scilab 커널을 추가 설치해서 셋팅해
주면 된다.

* Octave 커널은 Python 패키지로 만들어져 있으므로 아래와 같이 명령을 줘서 설치한다.
```
sudo pip
install scilab_kernel
```

* Octave 커널이 다 설치되었으면, 다음과 같이 실행해서, Jupyter에 연결시켜 준다.
```
python -m scilab_kernel.install
```

### 이제 기본적인 환경은 구성 완료!

* 다른 언어 커널도 설치해 보자.
* 기타 추가적인 것들은 사용하면서...

## 3.5. Markdown

![](https://github.com/dcurtis/markdown-
mark/blob/master/png/208x128.png?raw=true)

### Markdown?

* 여러 다양한 마크업(Markup) 스키마 중에서 가장 쉬운 것.
* 텍스트로 그냥 줄줄 쓰면 된다.
* 오픈소스
세계에서 이미 Di Facto Standard 위치까지 올라갔다.

### Markdown의 필요성


#### 한컴오피스로 워드작업을 해서 문서를 만들면...

* 버전관리 안됨
* 한컴오피스가 없으면 문서를 열어 볼 수 없음
* 문서 작성의
자동화 같은 작업들이 안됨
* 다른 포멧 및 공유 등에서 한계가 뚜렷

#### 다른 마크업 스키마를 쓰면...

* HTML, XML을 날코딩해서 문서를 작성하는 사람은 설마 없겠지!
* LaTeX은 지나치게
전문적이고 어렵다.
* Media Wiki는 범용성이 너무 떨어진다.

#### 이런게 필요하다.

* 매우 쉬울 것.  설명서 볼 필요도 없이 즉시 그냥 가볍게 사용 가능해야 한다.
* 타이핑 분량이 많아지면
안된다.  대괄호,각괄호,특수문자로 가득한 문서는 지옥같다.
* 그냥 텍스트 상태로 소스를 봐도 자연스럽고 편하게 문서를 읽을 수 있어야 한다.
* 다양한 포멧으로 자유자재로 변환이 가능해야 한다.
* 많은 사람들이 일반적으로 사용하고 있어야 한다.

> Markdown은 위의 모든
조건을 충족한다.

### Markdown in Jupyter Notebook

* Jupyter Notebook은 Markdown을 기본으로 한다.
*
Github 서비스도 Markdown을 기본으로 지원한다.

### Markdown 설명서

* http://www.slideshare.net/ihoneymon/ss-40575068
*
http://nolboo.kim/blog/2013/09/07/john-gruber-markdown.html
* http://jupyter-
notebook.readthedocs.io/en/latest/examples/Notebook/Working%20With%20Markdown%20Cells.html

## 3.6. Mathjax (LaTeX Math Schema)
![](https://upload.wikimedia.org/wikipedia/en/thumb/5/5f/MathJax.svg/128px-
MathJax.svg.png)

### 문서에 수식 입력하는 방법

* Markdown으로 문서 작성시, 기본적으로 수식 입력은 LaTeX 스키마를 차용해서 사용하는 경우가
일반적임
* 웹에서 수식 입력을 LaTeX 방식으로 가능하도록 하는 도구는 [MathJax](https://www.mathjax.org/)를
가장 많이 사용함
* Jupyter Notebook은  Markdown 안에 같은 식으로 수식 입력이 가능하도록 확장되어 있음

### 수식 입력 방법

* 설명서

> http://jupyter-
notebook.readthedocs.io/en/latest/examples/Notebook/Typesetting%20Equations.html
* 직접 소스를 써 넣는 것이 어렵다면, 온라인으로 제공되는 WISIWIG 수식 편집기를 사용해서 소스를 퍼오면 된다.

>
https://www.codecogs.com/latex/eqneditor.php

## 3.7. nbconvert

### nbconvert?

* Jupyter를 설치하면 딸려오는 유틸리티.
* 문서 포멧을 다양하게 변환해 준다.
* 설명서 :
http://nbconvert.readthedocs.io/en/latest/

### nbconvert로 슬라이드 프리젠테이션 하기

```
jupyter nbconvert 파일이름.ipynb --to slides
--post serve
```

* `--to slides` : html로 변환할 때 Reveal.js를 이용하여 슬라이드 형태로 만들라는
옵션.
* `--post serve` : html 파일이 만들어지면 자동으로 곧바로 자체 웹서버를 작동시켜 게시하라는 옵션.  자동으로
웹브라우저가 실행되면서 프리젠테이션 내용이 보여지게 된다.

```python
# Heart Curve
# http://mathworld.wolfram.com/HeartCurve.html

using PyPlot

t = linspace(0,2*pi,100);
x = 16*sin(t).^3;
y = 13*cos(t) - 5*cos(2*t) - 2*cos(3*t) - cos(4*t);

f=figure(figsize=(5,5))
grid("on")
title("Heart Curve")
axis("equal")
plot(x,y, color="orange", linestyle="-", linewidth=2)
```

```python
# http://www.walkingrandomly.com/?p=4030

using PyPlot

x=linspace(-2,2,1000);
y=(real(sqrt(complex(cos(x)))).*cos(50*x)+real(sqrt(complex(abs(x))))-0.7).*(4-x.*x).^0.01;

f=figure(figsize=(5,5))
grid("on")
title("Heart Curve 2")
axis("equal")
plot(x,y, color="orange", linestyle="-", linewidth=2)
```

```python

```
