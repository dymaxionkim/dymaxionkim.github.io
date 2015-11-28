# Setup_Dev

## 서론

* 이제 기본적인 리눅스 환경을 구축하는데 성공했으므로, 여기에 실제 일을 할 수 있는 엔지니어링 환경을 올려줄 차례입니다.  본 문서에서는 소위 '과학기술용 파이썬(Scientific Python)' 환경을 구축하겠습니다.  그리고 여기에 더하여 과학기술용 언어인 쥴리아(Julia) 등을 더하여 구축해 보겠습니다.  그리고 이런 언어들을 편집하고 실행할 수 있는 통합개발환경(IDE)으로, LightTable이라는 에디터를 설치하고, 또 더욱 인터액티브하게 사용 가능한 Jupyter 서비스도 올려보겠습니다.  아울러, 이런 개발도구들을 사용하여 만들어진 결과물들을 체계적으로 관리하고 공유하며 오랫동안 유지할 수 있도록 Git 및 Github 서비스를 활용하는 방법에 대해서도 기술합니다.



## Python 환경 구축

* 보통 유닉스 계열 운영체제는, 배포판을 설치하면 이미 기본적인 개발환경은 어느정도 포함되어 설치가 됩니다.  C컴파일러나 기타 몇가지 다른 언어들, 그리고 라이브러리들이 그것입니다.

* 당연히 Python 역시 이미 설치되어 있습니다.  오픈소스 생태계에서 Python은 이미 지배적인 영향력을 가지는 메이저 언어가 되었기 때문입니다.  터미널에서 `python`이라고 쳐 보면 쉽게 확인할 수 있습니다.

* 그런데, Python 인터프리터 자체는 이미 설치되어 있지만, 수없이 방대한 Python의 모든 라이브러리들을 다 가지고 있지는 못합니다.  따라서 이것들을 설치해서 구축해 줄 필요가 있습니다.  우리는 과학기술용으로 필요한 것들을 중심으로 설치를 해 주려고 합니다.  이제 순서대로 따라가 봅시다.

* pip를 우선 설치합니다.  pip라는 것은, Python 전용 패키지 관리자입니다.  Python 라이브러리들을 패키지화하여 그것들을 관리할 수 있도록 해 주는 도구입니다.  apt-get 하고 거의 동작이 똑같습니다.  다만 Python에 관련된 것들만 관리한다는 것입니다.

```
sudo apt-get install python-pip
```

* 그리고 설치된 pip 패키지를 최신 버전으로 업그레이드 해 봅니다.  apt 보다는 pip 쪽이 더 최신 패키지가 빨리 올라오기 때문에 그렇습니다.

```
sudo pip install --upgrade pip
sudo pip install --upgrade distribute
```

* 그리고 pip를 도와주는 도구 패키지도 설치해 줍니다.

```
sudo pip install pip-tools
```

* 이제 pip를 설치했으므로, 이 명령어를 이용하여 Python 라이브러리들을 하나씩 올려볼 수 있습니다.  다만 중간에 어떤 패키지는 Python 외부의 다른 패키지를 필요로하는 의존성이 있을 수 있는데, 그때는 apt-get 명령으로 그것을 먼저 설치해 준 다음에 진행하는 식으로 순서를 맞춰줘야 합니다.

* 이제 sympy[심파이]를 설치합니다.  이것은 기호(Symbolic) 연산이 가능하도록 해 주는 도구입니다.  이게 있으면 해석적인 수학문제를 다룰 수 있겠죠.

```
sudo pip install sympy
```

* 이제 nose[노우즈] 패키지를 설치합니다.  이것은 Python 스크립트를 테스트(NoseTest라고 지칭함)하기 편리하도록 만든 패키지라고 합니다.  이걸 직접 사용할 일이 있을지는 잘 모르겠고, 다만 이후에 다른 패키지가 필요로 하기 때문에 미리 설치해 두는 것입니다.

```
sudo pip install nose
```

* 이제 sphinx[스핑크스]를 설치합니다.  이것은 사람이 작성한 *.rst 확장자로 된 '구조화된 텍스트파일'을 읽어서 자동적으로 깔끔한 웹 도큐먼트로 만들어주는 변환기 같은 것입니다.  보통 소프트웨어 개발자들은 코딩과 문서작업을 병행하기가 너무 힘들기 때문에, 코딩을 하면서 거의 동시에 문서화도 이루어지도록 도와주는 이런 툴을 중요시하는 것 같습니다.

```
sudo pip install sphinx
```

* 이제 pygments[피그먼츠]를 설치합니다.  이것은 '신텍스 하일라이터(Syntex highlighter)' 입니다.  즉 프로그램 소스코드를 읽어서 예쁘게 색깔을 입혀줘서 가독성을 높여주는 툴입니다.

```
sudo pip install pygments
```

* 이제 tornado[토네이도]를 설치합니다.  이것은 Python으로 만들어진 웹 프레임웤입니다.  간단히말해 이걸로 웹서버를 만들수 있고, 다른 Python 계열 웹서비스의 근간이 되는 자재 같은 거라고 생각됩니다.

```
sudo pip install tornado
```

* 이제 jinja2[진자2]를 설치합니다.  이것은 템플릿 엔진이라고 합니다.  간단히 말해 Python 소스코드에 자동으로 여러가지 태그를 붙여서 html로 보기 좋도록 만들어주는 뭐 그런 기능을 해 준다고 합니다.  이걸 직접 다룰 일은 없으므로 아하 그렇구나 하고 넘어갑시다.

```
sudo pip install jinja2
```

* 이제 numpy[넘파이] 및 scipy[사이파이]를 설치합니다.  numpy는 간단히 말해 선형대수 행렬계산하기 편하게 해 주는 것입니다.  Matlab 처럼 사용하려면 이것이 필수적이므로 가장 중요한 핵심적인 도구라고 할 수 있습니다.  scipy는 numpy에 기능을 더 보강해 준 것이라고 보면 될 듯 합니다.  이것은 몇가지 의존성이 있는 외부 라이브러리들이 있기 때문에, apt-get으로 먼저 설치해줘야 할 것들이 있습니다.  python-dev는 일종의 빌드 도구 같은거라고 보면 되겠고, blas, lapack 같은 단어가 들어간 라이브러리는 포트란으로 만들어진 수치해석용 전문 라이브러리입니다.  퍼포먼스와 안정성이 확실하게 검증된 표준 라이브러리라고 보면 되겠습니다.  gfortran은 자유소프트웨어 진영에서 만든 포트란 컴파일러입니다.  고속 대용량 수치해석 분야에서는 포트란으로 만들어진 핵심 코드들이 여전히 많이 사용되고 있음을 알 수 있습니다.

```
sudo apt-get install python-dev libblas-dev libatlas-base-dev liblapack-dev gfortran
sudo pip install numpy scipy
```

* 이제 matplotlib[매트플랏라이브러리]를 설치합니다.  이것은 Python을 마치 Matlab처럼 사용하는 기분(?)이 나도록 해 주는 도구입니다.  예를들어 이 라이브러리가 제공해주는 plot 함수를 쓰면 마치 Matlab으로 plot해 준 것 처럼 예쁜 그래프를 그리거나 할 수 있습니다.  물론 여기서도 외부 라이브러리 의존성이 있기 때문에 먼저 apt-get으로 필요한 것들을 깔아주고 난 후에 설치하도록 합니다.  libpng는 그래프를 그려서 png 그림파일로 만들어내는데 관련된 것이구나 하는 식으로 대략 기능을 추측할 수 있습니다.

```
sudo apt-get install libpng-dev libfreetype6-dev libjpeg8-dev pkg-config
sudo pip install matplotlib
```

* 이제 readline[리드라인]을 설치합니다. Python 인터프리터가 소스코드 파일을 읽어들일 때 읽고 쓴 내역(history)을 기록하고 행수를 정의하는 등의 기능을 가지고 있다고 합니다.

```
sudo apt-get install libncurses5-dev
sudo pip install readline
```

* 이제 pandas[판다스]를 설치합니다.  이것은 자료를 테이블처럼 만들어서(DataFrame) 다루기 좋도록 해주는 도구입니다.  자료구조를 다루거나 DB와 관련된 데이타를 만들어주거나하는 등 여러가지로 쓸모가 많은가 봅니다.  특히 요즘 유행하는 분야인 빅데이터,데이터마이닝,데이터과학 같은 분야에서 이걸 많이 이용하는 것 같습니다.

```
sudo pip install pandas
```

* 이제 pyzmq[파이지엠큐]를 설치합니다.  이것은 zeromq[제로엠큐]라는 것을 Python에서 쓸 수 있도록 엮어준(binding) 것입니다.  zeromq(=ØMQ)는 libzmq라는 이름의 패키지로 되어 있는데, 하는 일은 경량/고속으로 컴퓨터 시스템 내부에서 동작하는 메시징 도구입니다.  소프트웨어 개발할 때 각 기능별로 모듈화해서 따로 만든 다음 각각의 모듈들 사이를 메시지로 연결해주면 버그 가능성을 줄일수 있고 개발효율이 좋아진다 뭐 이런 생각을 실현해 주는 하나의 수단이라고 볼 수 있습니다.  이것이 필요한 이유는 Jupyter가 이것에 기반해서 설계되어 있습니다.  pyzmq 덕분에, Jupyter는 UI 부분과 언어 커널 부분을 완전히 분리해서, 언어 커널 부분을 필요에 따라 마음대로 갈아치울 수 있는 구조가 되어 있습니다.  따라서 Jupyter는 하나의 사용자 환경 안에서 여러가지 언어들을 바꿔가면서 간단히 즉각 사용할 수 있는 편리성이 있습니다.

```
sudo pip install pyzmq
```

* 이제 scikit-learn[사이킷-모듈]을 설치합니다.  이것은 요즘 유행하는 머신러닝 기술을 교육하는데 쓰는 도구입니다.  이건 이쪽 분야에 관심이 없다면 굳이 설치 안해도 됩니다.

```
sudo pip install scikit-learn
```

* 이제 jupyter[주피터]를 설치합니다.  이 명칭의 유래는, 중의적인데 일단은 Julia+Python+R 입니다.  최소 3가지 언어를 다룰수 있는 환경이라는 뜻이죠.  실제로는 [수십가지 이상의 언어](https://github.com/ipython/ipython/wiki/IPython-kernels-for-other-languages)를 더 다룰 수 있습니다.  그리고, 이것의 이전 명칭은 ipython-notebook 이었는데, notebook이라는 것은 원래 Mathmatica 소프트웨어의 환경입니다.  그걸 차용해서 가져온 것인데, 실제 이런 환경에 영감을 준 것은 갈릴레오가 목성의 위성을 자신이 만든 망원경으로 매일밤 관찰하면서 남긴 관측 노트의 기록 방식이라고 합니다.  노트북에 글도 쓰고, 계산식도 쓰고, 또 그림도 그리고 하면서 작업한 순서대로 주루룩 내려서 쓴 아주 교과서적인 기록방식인데요.  이렇게 진짜 노트북에 자유롭게 실험기록을 남기는 것 처럼, 코딩을 중간에 섞어 가면서 도큐먼트 작업도 하고, 또 코드를 실행한 결과 그림도 중간에 자동으로 삽입해 주고, 코드로 사용하는 언어도 마음대로 바꿔가면서 작업하고, 그걸 그대로 웹에 게시하거나 할 수 있는 환경이 된 것입니다.  아무튼 이것은 상당히 놀라운 환경이라고 생각됩니다.  개인적으로 완전히 그 매력에 빠졌습니다.  나중에 이걸로 실제 뭔가 재미있는 작업을 해 봅시다.

```
sudo pip install jupyter
```

* 이제 시험삼아 jupyter를 실행해 봅시다.  다음 명령을 치면 됩니다.

```
jupyter notebook
```

* 그럼 웹브라우저가 자동으로 실행되면서, `localhost:8888/tree`라는 주소로 로컬 웹서비스가 시작됩니다.  일반적인 GUI 어플리케이션이 아니고 이렇게 웹서비스로 만든 것이 특히 매력적입니다.

* 이제 실행된다는 걸 확인했으면, Jupyter 웹서비스를 종료해 봅시다.  실행시킨 터미널 상에서 Ctrl-c 키를 누른 후, 확실히 끝내겠냐는 질문에 y라고 대답해 주면 됩니다.

* 현재 설치된 Jupyter는 Python 2.7 기반입니다.  그런데 혹시 Python 3 버전을 사용해야 할 수도 있습니다.  따라서 Python 3 커널을 추가로 Jupyter에 올려줘 봅시다.



## Jupyter에 Python3 커널 추가

* 현재의 Jupyter에는 Python2 커널만 올라가 있는데, 여기에 Python3 커널도 선택할 수 있도록 셋팅해 봅시다.  Ubuntu Server OS 자체에 이미 Python3 자체는 설치되어 있으므로, 셋팅만 연결해 주면 됩니다.

* 일단 먼저







## [Atom](https://atom.io/) 텍스트 에디터 설치

* Atom 에디터에 관해서는 구글 검색해서 알아보면 됩니다.  이것을 설치해서 사용해 보는 이유는 Github에서 제공하니까 당연히 Github와의 직접 연계성이 아주 좋을 것이기 때문입니다.  또, 발표된지 시간이 좀 지나서 정식버전이 배포되는 상태이므로 안정성도 믿을만한 단계에 접어들었다고 생각됩니다.  설치 방법은 아래의 2가지 방법 중에서 골라서 하면 됩니다.

* Github에서 직접 제공하는 공식 설치 방법
```
wget -O atom.deb http://atom.io/download/deb
sudo apt-get install gir1.2-gnomekeyring-1.0 gvfs-bin
sudo dpkg -i atom.deb
```

* 비공식 온라인 저장소를 등록해서 설치 ([WebUPD8제공](http://www.webupd8.org/2014/05/atom-text-editor-ubuntu-ppa-update.html))
```
sudo add-apt-repository ppa:webupd8team/atom
sudo apt-get update
sudo apt-get install atom
```
* Atom의 입문용 간단한 설명서로는 이곳( http://dovetail.tistory.com/62 )을 참조하니까 도움이 됩니다.


## [Juno](http://junolab.org/) 텍스트 에디터 설치

* 이것을 설치해 보는 이유는 Julia 언어를 위한 환경이 완비되어 있기 때문입니다.  이것은 [LightTable](http://lighttable.com/) 에디터에 Julia 관련 환경을 셋팅해 놓은 것입니다.  LightTable을 설치한 후, 관련 플러그인들을 붙여주면 Juno와 동일하게 됩니다만 아무래도 실패 확률이 있으므로, 그냥 환경설정 다 해 놓은 Juno를 직접 설치하는게 낫습니다.  아무튼 Julia를 로컬에서 코딩할 때는 Juno가 가장 적합하다고 볼 수 있습니다.

* 설치 방법은 아래와 같이 따라 하면 됩니다.
```
wget https://junolab.s3.amazonaws.com/release/1.0.2/juno-linux-x64.zip
sudo unzip juno*.zip -d /opt
sudo mv /opt/juno-linux64 /opt/juno
sudo ln -s /opt/juno/Juno /usr/bin/Juno
```

* 위의 설치 순서는, 간단히 말해 Juno를 다운로드 받은 다음에 압축을 /opt에 풀어서 설치하고, 설치된 디렉토리 이름을 /opt/juno로 간단하게 바꿔주고, 에디터 실행 명령인 `Juno`를 어느 곳에서나 실행시킬 수 있도록 심볼릭 링크를 걸어준 것입니다.

* Juno 즉 LightTable 에디터는 Atom 에디터와 느낌이 비슷한데, 이는 둘 다 Node.js 기반의 웹앱이기 때문입니다.  사상적으로 비슷하다고 볼 수 있을텐데, 다만 LightTable은 Clojure라는 신형 리스프 언어를 기반으로 개발되어서 좀 더 매니악하고 실험적입니다.





