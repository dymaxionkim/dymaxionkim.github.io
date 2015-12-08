
# Jupyter
* Jupyter가 뭔지는 인터넷 검색 요망!


## Jupyter Notebook을 외부에서 접속 가능하도록 설정하기

* http://jupyter-notebook.readthedocs.org/en/latest/public_server.html#running-a-public-notebook-server
* http://jupyter-notebook.readthedocs.org/en/latest/public_server.html#securing-a-notebook-server

* Jupyter Notebook을 로컬컴퓨터에서만 이용하기에는 아까우므로, 외부에서 어디서나 접속 가능하도록 해서 활용도를 높여 봅시다.
* 새로운 Jupyter Notebook 설정 프로파일을 생성합니다.
```
jupyter notebook --generate-config
```
* 그러면 `/home/dong/.jupyter/jupyter_notebook_config.py` 파일이 새로 생겨난 것을 확인할 수 있습니다.  이 파일을 편집기로 열어 봅시다.  대략 500줄을 좀 넘어가는 코드가 나옵니다.  그런데 대부분 주석이죠.  필요한 부분을 수정하면 됩니다.

* 먼저 패스워드 관련 부분.  일단 패스워드를 해쉬코드로 생성해 내야 합니다.  이와 관련된 기본적인 파이썬 함수가 있으므로, 파이썬 상태에서 이 함수를 이용해서 원하는걸 얻어내야 합니다.  터미널에 `python` 쳐서 파이썬 REPL로 들어간 다음,
```
from notebook.auth import passwd
passwd()
```
* 위와 같이 명령을 때려주면 비밀번호를 치라고 나오는데 확인차 2번 쳐 주면 해쉬코드로 된 비밀번호 코드가 나옵니다.  이걸 긁어다가, 'jupyter_notebook_config.py' 파일을 편집기로 열어서 다음과 같이 패스워드 아규먼트값을 할당해 줍니다.  물론 이 값 앞에 있는 '#' 주석 기호는 삭제해서 해제해 주는 것을 잊지 말구요.
```
c.NotebookApp.password = u'sha1:67c9e60bb8b6:9ffede0825894254b2e042ea597d771089e11aed'
```
* 그리고 SSL을 설정해서 쓰도록 해 주는 것도 보안상 좋은데, 여기서는 일단 생략합니다.  필요하다면 [도큐먼트](http://jupyter-notebook.readthedocs.org/en/latest/public_server.html#securing-a-notebook-server)를 참고하면 됩니다.

* 이제, 'jupyter_notebook_config.py' 파일에서 다음 부분을 더 적용해 줍니다.  이중에서 포트 번호는 원하는걸로 넣고요.
```
# Set ip to '*' to bind on all interfaces (ips) for the public server
c.NotebookApp.ip = '*'
# The port the notebook server will listen on.
c.NotebookApp.port = 8100
# Whether to open in a browser after starting. The specific browser used is
# platform dependent and determined by the python standard library `webbrowser`
# module, unless it is overridden using the --browser (NotebookApp.browser)
# configuration option.
c.NotebookApp.open_browser = False
```
* 이제 설정파일 편집은 됐고, 지정해 준 포트로 외부 접속이 되도록 방화벽 설정이 되어 있는지 확인해서 풀어줄 필요가 있습니다.  현재 사용중인 UbuntuBang은 방화벽이 없으므로 생략.  또 프록시 관련된 것도 생략.
* 이제 남은 건, 집에서 보통 공유기를 사용하게 되는데 공유기 부분의 설정을 건드려주면 좀 더 편리해 질 것입니다.  ipTime 공유기의 경우, 포트포워드 설정 부분을 건드려서 외부에서 접속할 때, 예를 들어 여기서 지정된 8100 포트를 80 포트로 포워딩되록 바꿔서 편리하게 해 준다던가...  또 ipTime의 특수기능으로 DDNS 설정에 들어가서 호스트 이름을 '지정한이름.iptime.org'로 등록해 줘서 가정용 유동ip 상황일때도 도메인 네임으로 편하게 접속할 수 있도록 해 준다던가 하는 것들을 건드려주면 되겠습니다.
* 현재의 Jupyter Notebook은 싱글유저만 되는데, 멀티유저로 서비스하려면 JupyterHub를 설치해서 운용해야 합니다.  다만 이런식으로 퍼블릭하게 나가려면 좀 더 제대로 된 서버를 구축하고, JupyterHub는 Docker 컨테이너로 운용을 한다던가 하는 등의 관리 전략을 세우면 될 것 같습니다만...  여기서의 목표는 서버 관리자가 되는게 아니므로 이정도까지만 하겠습니다.  다만 외부 인터넷 연결되는 서버 운용시 외부 해커 침입에는 유의해 주는 것이 좋겠습니다.


## Jupyter Notebook Extensions
* **gist.js** (Github Gist에 현재의 .ipynb 파일을 업로드하는 버튼 추가) ::: http://nbviewer.ipython.org/d9a2ab620303982df1af
